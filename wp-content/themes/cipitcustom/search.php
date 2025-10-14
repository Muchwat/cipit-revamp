<?php
get_header();
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
    <p>Showing blog posts that match your search.</p>
    <div class="search-container">
        <?php get_search_form(); ?>
    </div>
</section>
<main class="site-main container">
    <?php
    // Custom search query restricted to "blog" category
    $paged = get_query_var('paged') ? get_query_var('paged') : 1;
    $search_query = new WP_Query([
        's' => get_search_query(),
        'category_name' => 'blog', // only show posts from Blog category
        'posts_per_page' => 6,
        'paged' => $paged,
    ]);
    ?>

    <?php if ($search_query->have_posts()): ?>
        <div class="blog-posts">
            <?php while ($search_query->have_posts()):
                $search_query->the_post();

                // Get the post tags for the image overlay text (consistent with blog page)
                $post_tags = get_the_tags();
                $overlay_text = !empty($post_tags) ? esc_html($post_tags[0]->name) : 'Read More';

                // Check for 'NEW' badge (optional, based on your blog logic)
                $post_age = (time() - get_the_time('U')) / (60 * 60 * 24);
                $is_new = $post_age < 7;
                ?>

                <div class="blog-card">
                    <div class="blog-card-image">
                        <a href="<?php the_permalink(); ?>">
                            <?php if (has_post_thumbnail()): ?>
                                <?php the_post_thumbnail('large'); ?>
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

        <div class="pagination">
            <?php
            echo paginate_links([
                'total' => $search_query->max_num_pages,
                'current' => max(1, get_query_var('paged')),
                'prev_text' => '<i class="fas fa-chevron-left"></i>',
                'next_text' => '<i class="fas fa-chevron-right"></i>',
            ]);
            ?>
        </div>
    <?php else: ?>
        <p class="no-results"
            style="text-align: center; padding: 2.5rem 0; font-size: 1.2rem; color: var(--secondary-color);">
            No blog results found for “<?php echo esc_html(get_search_query()); ?>”. Try another keyword.
        </p>
    <?php endif; ?>
    <?php wp_reset_postdata(); ?>
</main>
<?php get_footer(); ?>