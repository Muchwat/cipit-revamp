<?php
get_header();

// Get the context to adjust the page title/description
$context = isset($_GET['search_context']) ? sanitize_key($_GET['search_context']) : 'all';

// Determine the content type for display text
$content_type = ($context === 'books') ? 'books & book chapters' : 'blog posts';

// Use the global $wp_query, which was modified by the hook
global $wp_query;
?>

<div class="breadcrumbs">
    <div>
        <h3>Search Results</h3>
        <a href="<?php echo home_url(); ?>">Home</a> / <span>Search</span>
    </div>
</div>
<section class="blog-header">
    <h1>
        Search Results for “<?php echo wp_trim_words(get_search_query(), 3, '...'); ?>”
    </h1>
    <p>Showing <?php echo esc_html($content_type); ?> that match your search.</p>
</section>
<main class="site-main container">

    <?php if ($wp_query->have_posts()): ?>
        <div class="<?php echo ($context === 'books') ? 'books-grid' : 'blog-posts'; ?>">
            <?php while ($wp_query->have_posts()):
                $wp_query->the_post();

                // You can include a partial template here to handle different post formats:
                if ($context === 'books') {
                    get_template_part('template-parts/content', 'book-card');
                } else {
                    get_template_part('template-parts/content', 'blog-card');
                }

                ?>
                <div class="blog-card">
                    <div class="blog-card-content">
                    </div>
                </div>
            <?php endwhile; ?>
        </div>

        <div class="pagination">
            <?php
            echo paginate_links([
                // Use the max_num_pages from the global query
                'total' => $wp_query->max_num_pages,
                'current' => max(1, get_query_var('paged')),
                'prev_text' => '<i class="fas fa-chevron-left"></i>',
                'next_text' => '<i class="fas fa-chevron-right"></i>',
                // Important: Add the 'search_context' to the pagination links!
                'add_args' => array('search_context' => $context),
            ]);
            ?>
        </div>
    <?php else: ?>
        <p class="no-results"
            style="text-align: center; padding: 2.5rem 0; font-size: 1.2rem; color: var(--secondary-color);">
            No **<?php echo esc_html($content_type); ?>** found for “<?php echo esc_html(get_search_query()); ?>”. Try
            another keyword.
        </p>
    <?php endif; ?>

    <?php wp_reset_postdata(); // Reset in case you run other queries later ?>
</main>
<?php get_footer(); ?>