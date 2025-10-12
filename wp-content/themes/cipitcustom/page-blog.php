<?php
/* Template Name: Blog Page */
get_header(); ?>

<main class="site-main container mx-auto px-4 py-8">

    <h1 class="text-3xl font-bold mb-8"><?php the_title(); ?></h1>

    <?php
    // Get posts in category 'Blog'
    $blog_query = new WP_Query([
        'category_name' => 'blog', // use the slug of your category
        'posts_per_page' => 6,       // how many per page
        'paged' => get_query_var('paged') ?: 1,
    ]);
    ?>

    <?php if ($blog_query->have_posts()): ?>
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <?php while ($blog_query->have_posts()):
                $blog_query->the_post(); ?>
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
                'total' => $blog_query->max_num_pages,
                'current' => max(1, get_query_var('paged')),
            ]);
            ?>
        </div>

    <?php else: ?>
        <p>No blog posts yet.</p>
    <?php endif; ?>

    <?php wp_reset_postdata(); ?>
</main>

<?php get_footer(); ?>