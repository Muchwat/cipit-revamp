<?php
/* Template Name: Blog Page */
get_header(); ?>

<div class="breadcrumbs">
    <div>
        <h3>Blog</h3>
        <a href="<?php echo esc_url(home_url('/')); ?>">Home</a> / <span>Blog</span>
    </div>
</div>

<section class="blog-header">
    <h1>CIPIT Blog</h1>
    <p>Insights, analysis, and commentary on intellectual property, information technology law, and digital
        policy in Africa</p>

    <div class="search-container">
        <?php get_search_form(); // This outputs the search form based on searchform.php ?>
    </div>
</section>

<?php
// Featured Post
get_template_part('template-parts/content', 'featured');
?>

<main class="site-main container mx-auto px-4 py-8">
    <?php
    // Blog Categories - You might want to make this dynamic later
    // For now, I'll keep the structure from the static HTML for reference
    ?>
    <div class="blog-categories">
        <button class="category-btn active">All Topics</button>
        <button class="category-btn">Artificial Intelligence</button>
        <button class="category-btn">Data Governance</button>
        <button class="category-btn">Digital Identity</button>
        <button class="category-btn">IP & Innovation</button>
        <button class="category-btn">Cyber Law</button>
        <button class="category-btn">Policy Analysis</button>
    </div>

    <?php
    $paged = (get_query_var('paged')) ? get_query_var('paged') : 1;
    $blog_query = new WP_Query([
        // Assuming your 'blog' category slug is 'blog'. You might adjust this.
        'category_name' => 'blog',
        'posts_per_page' => 6,
        'paged' => $paged,
    ]);
    ?>

    <?php if ($blog_query->have_posts()): ?>
        <div class="blog-posts">
            <?php while ($blog_query->have_posts()):
                $blog_query->the_post();

                // Get the first category's name for the 'Image Overlay Text'
                $categories = get_the_category();
                $overlay_text = !empty($categories) ? esc_html($categories[0]->name) : 'Read More';

                // Check if the post is recent (e.g., posted in the last 7 days) to show 'NEW' badge
                $post_age = (time() - get_the_time('U')) / (60 * 60 * 24);
                $is_new = $post_age < 7;
                ?>
                <div class="blog-card">
                    <div class="blog-card-image">
                        <a href="<?php the_permalink(); ?>">
                            <?php if (has_post_thumbnail()): ?>
                                <?php the_post_thumbnail('large'); // Output the image ?>
                            <?php endif; ?>
                            <?php echo $overlay_text; // The text on the image overlay ?>
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
            <?php endwhile; ?>
        </div>

        <div class="pagination mt-8">
            <?php
            echo paginate_links([
                'total' => $blog_query->max_num_pages,
                'prev_text' => '<i class="fas fa-chevron-left"></i>',
                'next_text' => '<i class="fas fa-chevron-right"></i>',
            ]);
            ?>
        </div>

    <?php else: ?>
        <p>No blog posts yet.</p>
    <?php endif; ?>

    <?php wp_reset_postdata(); ?>
</main>

<?php get_footer(); ?>