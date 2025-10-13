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
    <h1>Search Results for “<?php echo esc_html(get_search_query()); ?>”</h1>
    <p>Showing posts that match your search.</p>

    <div class="search-container">
        <?php get_search_form(); ?>
    </div>
</section>

<main class="site-main container mx-auto px-4 py-8">
    <?php if (have_posts()): ?>
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <?php while (have_posts()):
                the_post(); ?>
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
                'total' => $wp_query->max_num_pages,
                'current' => max(1, get_query_var('paged')),
            ]);
            ?>
        </div>

    <?php else: ?>
        <p>No results found for your search. Try another keyword.</p>
    <?php endif; ?>
</main>

<?php get_footer(); ?>