<?php get_header(); ?>

<main class="site-main container mx-auto px-4 py-8">
    <h1 class="text-3xl font-bold mb-6">Latest Posts</h1>

    <?php if (have_posts()): ?>
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <?php while (have_posts()):
                the_post(); ?>
                <article <?php post_class('p-4 border rounded-lg shadow-sm'); ?>>
                    <a href="<?php the_permalink(); ?>">
                        <?php if (has_post_thumbnail()): ?>
                            <?php the_post_thumbnail('medium', ['class' => 'rounded-md mb-3']); ?>
                        <?php endif; ?>
                        <h2 class="text-xl font-semibold mb-1"><?php the_title(); ?></h2>
                        <p class="text-gray-600 text-sm mb-2"><?php echo get_the_date(); ?></p>
                        <p class="text-gray-700 mb-2"><?php echo wp_trim_words(get_the_excerpt(), 20); ?></p>
                    </a>
                </article>
            <?php endwhile; ?>
        </div>
    <?php else: ?>
        <p>No content found.</p>
    <?php endif; ?>
</main>

<?php get_footer(); ?>