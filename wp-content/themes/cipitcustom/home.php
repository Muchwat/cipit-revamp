<?php
// Query only posts in the "blog" category
$blog_query = new WP_Query([
    'category_name' => 'blog',
    'posts_per_page' => 10,
    'paged' => get_query_var('paged') ?: 1,
]);
?>

<?php if ($blog_query->have_posts()): ?>
    <?php while ($blog_query->have_posts()):
        $blog_query->the_post(); ?>
        <article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
            <h2 class="entry-title"><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h2>
            <div class="entry-excerpt"><?php the_excerpt(); ?></div>
        </article>
    <?php endwhile; ?>

    <?php
    the_posts_pagination([
        'prev_text' => '« Prev',
        'next_text' => 'Next »',
    ]);
    ?>

<?php else: ?>
    <p>No blog posts yet.</p>
<?php endif; ?>

<?php wp_reset_postdata(); ?>