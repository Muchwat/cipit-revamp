<?php
/**
 * 📁 functions.php
 * Registers menus, enqueues assets, and defines the custom Mega Menu Walker.
 */



add_theme_support('title-tag');
add_theme_support('post-thumbnails');


// --- Asset Enqueue ---

function cipit_enqueue_assets()
{
    // Main stylesheet
    wp_enqueue_style('cipit-style', get_stylesheet_uri());
    wp_enqueue_style('cipit-main', get_template_directory_uri() . '/assets/css/main.css', [], '1.0');

    // Font Awesome 
    wp_enqueue_style('fontawesome', 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css', [], '5.15.3');

    // JS - Loaded in the footer (true)
    wp_enqueue_script('cipit-main', get_template_directory_uri() . '/assets/js/main.js', ['jquery'], '1.0', true);

    // CRITICAL FIX: Localize the AJAX URL for the JavaScript to access
    wp_localize_script('cipit-main', 'my_ajax_object', array(
        'ajax_url' => admin_url('admin-ajax.php')
    ));
}
add_action('wp_enqueue_scripts', 'cipit_enqueue_assets');


/**
 * AJAX handler for filtering blog posts by TAGS.
 * This function should be added to your theme's functions.php file.
 */
function filter_blog_posts_ajax_handler()
{
    // Sanitize and retrieve variables
    $tag_slug = sanitize_text_field($_POST['tag']);
    $paged = (isset($_POST['paged'])) ? (int) sanitize_text_field($_POST['paged']) : 1;
    $posts_per_page = (isset($_POST['posts_per_page'])) ? (int) sanitize_text_field($_POST['posts_per_page']) : 6;

    $args = array(
        'post_type' => 'post',
        'posts_per_page' => $posts_per_page,
        'paged' => $paged,
        'post_status' => 'publish',
        'tax_query' => array(),
        'category_name' => 'blog',
    );

    // Only filter if a specific tag is selected (not 'all')
    if ($tag_slug !== 'all' && $tag_slug) {
        $args['tax_query'][] = array(
            'taxonomy' => 'post_tag', // Filtering by tag taxonomy
            'field' => 'slug',
            'terms' => $tag_slug,
        );
    }

    $filter_query = new WP_Query($args);

    ob_start();

    if ($filter_query->have_posts()) {
        while ($filter_query->have_posts()) {
            $filter_query->the_post();

            $post_tags = get_the_tags();
            $overlay_text = !empty($post_tags) ? esc_html($post_tags[0]->name) : 'Read More';
            $post_age = (time() - get_the_time('U')) / (60 * 60 * 24);
            $is_new = $post_age < 7;
            ?>
            <div class="blog-card">
                <div class="blog-card-image">
                    <a href="<?php the_permalink(); ?>">
                        <?php if (has_post_thumbnail()): ?>
                            <?php the_post_thumbnail('large'); ?>
                        <?php endif; ?>
                        <?php echo $overlay_text; ?>
                    </a>
                    <?php if ($is_new): ?>
                        <div class="blog-card-badge">NEW</div>
                    <?php endif; ?>
                </div>
                <div class="blog-card-content">
                    <div class="post-meta">
                        <span><i class="far fa-calendar"></i> <?php echo get_the_date(); ?></span>
                        <span><i class="far fa-user"></i> <?php the_author(); ?></span>
                    </div>
                    <h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
                    <p><?php echo wp_trim_words(get_the_excerpt(), 25, '...'); ?></p>
                    <a href="<?php the_permalink(); ?>" class="read-more-btn">Read More</a>
                </div>
            </div>
            <?php
        }
    } else {
        echo '<p class="no-posts-found" style="text-align:center; padding: 50px;">No posts found with this tag.</p>';
    }


    wp_reset_postdata();

    echo ob_get_clean();
    wp_die();
}
// For logged-in users
add_action('wp_ajax_filter_blog_posts', 'filter_blog_posts_ajax_handler');
// For non-logged-in users
add_action('wp_ajax_nopriv_filter_blog_posts', 'filter_blog_posts_ajax_handler');

/**
 * Custom Search Handlers: Modifies the main query based on the 'search_context' URL parameter.
 */
function custom_multiple_search_handlers($query)
{
    // 1. Check if we're on the main search page query, not in the admin, and not a secondary query
    if ($query->is_search() && $query->is_main_query() && !is_admin()) {

        // Get and sanitize the context flag from the URL
        $context = isset($_GET['search_context']) ? sanitize_key($_GET['search_context']) : 'all';

        // 2. Route the Query based on the context flag
        switch ($context) {

            case 'books':
                // --- Books Search Handler ---
                $query->set('category_name', 'books');
                $query->set('posts_per_page', 8); // Example: 8 results for books
                break;

            case 'blog':
                // --- Blog Search Handler ---
                $query->set('category_name', 'blog');
                $query->set('posts_per_page', 6); // Example: 6 results for blog
                break;

            case 'all':
            default:
                // --- Default Handler (e.g., if no flag is set) ---
                // You can choose to show all results or just set a default category/post type
                // $query->set('post_type', array('post', 'page'));
                break;
        }
    }
}
add_action('pre_get_posts', 'custom_multiple_search_handlers');