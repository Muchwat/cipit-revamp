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
            case 'journal-articles':
            case 'policy-briefs':
            case 'manuals':
            case 'jipit':
            case 'conference-papers':
                // --- Books, Journal Articles, Policy Briefs, Manuals, JIPIT, Conference Papers Search Handler ---
                $query->set('category_name', $context);
                $query->set('posts_per_page', 8); // Example: 8 results for books, journal articles, policy briefs, manuals, JIPIT, conference papers
                break;

            case 'blog':
                // --- Blog Search Handler ---
                $query->set('category_name', 'blog');
                $query->set('posts_per_page', 6); // Example: 6 results for blog
                break;

            case 'podcast':
                // --- Podcast Search Handler ---
                $query->set('category_name', 'podcast');
                $query->set('posts_per_page', 6); // Example: 6 results for podcast
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

/**
 * Register Custom Post Type: Team Members
 */
function cipit_register_team_member_cpt()
{
    $labels = array(
        'name' => 'Team Members',
        'singular_name' => 'Team Member',
        'menu_name' => 'Team',
        'name_admin_bar' => 'Team Member',
        'add_new' => 'Add New',
        'add_new_item' => 'Add New Team Member',
        'new_item' => 'New Team Member',
        'edit_item' => 'Edit Team Member',
        'view_item' => 'View Team Member',
        'all_items' => 'All Team Members',
        'search_items' => 'Search Team Members',
        'not_found' => 'No team members found.',
        'not_found_in_trash' => 'No team members found in Trash.'
    );

    $args = array(
        'labels' => $labels,
        'public' => true,
        'menu_icon' => 'dashicons-groups',
        'supports' => array('title', 'editor', 'thumbnail', 'custom-fields'),
        'has_archive' => false,
        'rewrite' => array('slug' => 'team'),
        'show_in_rest' => true, // Enables Gutenberg
    );

    register_post_type('team_member', $args);
}
add_action('init', 'cipit_register_team_member_cpt');


// Register Steering Committee post type
function cipit_register_steering_committee()
{
    $labels = array(
        'name' => __('Steering Committee', 'cipit'),
        'singular_name' => __('Committee Member', 'cipit'),
        'add_new' => __('Add New', 'cipit'),
        'add_new_item' => __('Add New Committee Member', 'cipit'),
        'edit_item' => __('Edit Committee Member', 'cipit'),
        'new_item' => __('New Committee Member', 'cipit'),
        'view_item' => __('View Committee Member', 'cipit'),
        'search_items' => __('Search Committee Members', 'cipit'),
        'not_found' => __('No committee members found', 'cipit'),
        'not_found_in_trash' => __('No committee members found in Trash', 'cipit'),
        'all_items' => __('All Committee Members', 'cipit'),
        'menu_name' => __('Steering Committee', 'cipit'),
        'name_admin_bar' => __('Committee Member', 'cipit'),
    );

    $args = array(
        'labels' => $labels,
        'public' => true,
        'has_archive' => false,
        'rewrite' => array('slug' => 'steering-committee'),
        'show_in_rest' => true, // Enable Gutenberg
        'supports' => array('title', 'editor', 'thumbnail'),
        'menu_icon' => 'dashicons-groups',
    );

    register_post_type('steering_committee', $args);
}
add_action('init', 'cipit_register_steering_committee');

// Optional: Register meta for internal use (e.g., category type or order)
function cipit_register_steering_committee_meta()
{
    register_post_meta('steering_committee', 'member_order', array(
        'show_in_rest' => true,
        'single' => true,
        'type' => 'integer',
        'sanitize_callback' => 'intval',
    ));
}
add_action('init', 'cipit_register_steering_committee_meta');


function cipit_theme_setup()
{
    add_theme_support('custom-logo', [
        'height' => 100,
        'width' => 400,
        'flex-height' => true,
        'flex-width' => true,
    ]);
}
add_action('after_setup_theme', 'cipit_theme_setup');


/**
 * Add footer logo setting to the Customizer
 */
function cipit_customize_register($wp_customize)
{
    // Add a new section under Site Identity
    $wp_customize->add_section('footer_logo_section', array(
        'title' => __('Footer Logo', 'cipit'),
        'priority' => 60,
        'description' => __('Upload a logo for the footer area.', 'cipit'),
        'panel' => '', // keep under "Site Identity"
    ));

    // Add the setting
    $wp_customize->add_setting('footer_logo', array(
        'default' => '',
        'sanitize_callback' => 'esc_url_raw',
    ));

    // Add the control (upload button)
    $wp_customize->add_control(new WP_Customize_Image_Control($wp_customize, 'footer_logo', array(
        'label' => __('Footer Logo', 'cipit'),
        'section' => 'footer_logo_section',
        'settings' => 'footer_logo',
        'description' => __('Upload a separate logo for the footer.'),
    )));
}
add_action('customize_register', 'cipit_customize_register');

function register_podcast_thumbnail_size()
{
    // Registers a custom image size named 'podcast-square'
    // Arguments: name, width, height, hard_crop (true = crop to exact dimensions)
    add_image_size('podcast-square', 200, 200, true);
}
add_action('after_setup_theme', 'register_podcast_thumbnail_size');

