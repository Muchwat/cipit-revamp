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

<main class="site-main container mx-auto px-4 py-8">
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
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <?php while ($search_query->have_posts()):
                $search_query->the_post(); ?>
                <article <?php post_class('p-4 border rounded-lg shadow-sm'); ?>>
                    <?php if (has_post_thumbnail()): ?>
                        <a href="<?php the_permalink(); ?>">
                            <?php the_post_thumbnail('medium', ['class' => 'rounded-md mb-3']); ?>
                        </a>
                    <?php endif; ?>

                    <h2 class="text-xl font-semibold mb-1">
                        <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
                    </h2>
                    <p class="text-gray-600 text-sm mb-2">
                        <?php echo get_the_date(); ?> • <?php the_author(); ?>
                    </p>
                    <div class="text-gray-700 mb-2">
                        <?php echo wp_trim_words(get_the_excerpt(), 25); ?>
                    </div>
                    <a href="<?php the_permalink(); ?>" class="text-red-600 font-medium hover:underline">Read More →</a>
                </article>
            <?php endwhile; ?>
        </div>

        <div class="mt-8">
            <?php
            echo paginate_links([
                'total' => $search_query->max_num_pages,
                'current' => max(1, get_query_var('paged')),
            ]);
            ?>
        </div>

    <?php else: ?>
        <p>No blog results found for “<?php echo esc_html(get_search_query()); ?>”. Try another keyword.</p>
    <?php endif; ?>

    <?php wp_reset_postdata(); ?>
</main>

<?php get_footer(); ?>