<?php get_header(); ?>

<main id="main-content" class="site-main">
    <?php if (have_posts()): ?>
        <?php while (have_posts()):
            the_post(); ?>

            <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
                <header class="entry-header">
                    <h1 class="entry-title"><?php the_title(); ?></h1>
                </header>

                <div class="entry-content">
                    <?php the_content(); ?>
                </div>
            </article>

        <?php endwhile; ?>

        <?php
        // Optional: pagination for posts
        the_posts_navigation();
        ?>

    <?php else: ?>

        <article class="no-results not-found">
            <h2><?php _e('Nothing Found', 'your-theme-textdomain'); ?></h2>
            <p><?php _e('Sorry, no content available here.', 'your-theme-textdomain'); ?></p>
        </article>

    <?php endif; ?>
</main>

<?php get_sidebar(); ?>
<?php get_footer(); ?>