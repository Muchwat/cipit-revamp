<?php get_header(); ?>

<main id="primary" class="site-main container mx-auto py-12">

    <?php
    if (have_posts()):
        while (have_posts()):
            the_post();
            // Check if post belongs to the 'Blog' category
            if (has_category('Blog')):
                ?>
                <article <?php post_class('prose lg:prose-xl max-w-3xl mx-auto'); ?>>
                    <header class="mb-8 text-center">
                        <h1 class="text-4xl font-bold mb-2"><?php the_title(); ?></h1>
                        <p class="text-gray-500 text-sm">
                            Posted on <?php echo get_the_date(); ?> by <?php the_author(); ?>
                        </p>
                        <?php if (has_post_thumbnail()): ?>
                            <div class="my-6">
                                <?php the_post_thumbnail('large', ['class' => 'rounded-xl shadow-lg mx-auto']); ?>
                            </div>
                        <?php endif; ?>
                    </header>

                    <div class="post-content">
                        <?php the_content(); ?>
                    </div>

                    <footer class="mt-8 border-t pt-6 text-center text-sm text-gray-500">
                        <?php the_category(', '); ?>
                        <?php the_tags('<br>Tags: ', ', '); ?>
                    </footer>
                </article>

                <?php
            else:
                // For non-blog posts (custom types, pages, etc.)
                ?>
                <article <?php post_class('max-w-3xl mx-auto prose'); ?>>
                    <h1 class="text-3xl font-semibold mb-4"><?php the_title(); ?></h1>
                    <div class="content">
                        <?php the_content(); ?>
                    </div>
                </article>

                <?php
            endif;

            // Post navigation
            the_post_navigation([
                'prev_text' => '← %title',
                'next_text' => '%title →',
            ]);

        endwhile;
    else:
        echo '<p>No post found.</p>';
    endif;
    ?>

</main>

<?php get_footer(); ?>