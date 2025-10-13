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
        <?php get_search_form(); ?>
    </div>
</section>

<?php
// Featured Post
get_template_part('template-parts/content', 'featured');
?>

<main class="site-main container mx-auto px-4 py-8">
    <?php
    $blog_query = new WP_Query([
        'category_name' => 'blog',
        'posts_per_page' => 6,
        'paged' => get_query_var('paged') ?: 1,
    ]);
    ?>

    <?php if ($blog_query->have_posts()): ?>
        <div class="blog-posts grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            <?php while ($blog_query->have_posts()):
                $blog_query->the_post(); ?>
                <div class="blog-card">
                    <?php if (has_post_thumbnail()): ?>
                        <div class="blog-card-image">
                            <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('large'); ?></a>
                        </div>
                    <?php endif; ?>

                    <div class="blog-card-content">
                        <div class="post-meta">
                            <span><i class="far fa-calendar"></i> <?php echo get_the_date(); ?></span>
                            <span><i class="far fa-user"></i> <?php the_author(); ?></span>
                        </div>
                        <h3><?php the_title(); ?></h3>
                        <p><?php echo wp_trim_words(get_the_excerpt(), 25); ?></p>
                        <a href="<?php the_permalink(); ?>" class="read-more-btn">Read More</a>
                    </div>
                </div>
            <?php endwhile; ?>
        </div>

        <div class="pagination mt-8">
            <?php echo paginate_links(['total' => $blog_query->max_num_pages]); ?>
        </div>

    <?php else: ?>
        <p>No blog posts yet.</p>
    <?php endif; ?>

    <?php wp_reset_postdata(); ?>
</main>

<?php get_footer(); ?>