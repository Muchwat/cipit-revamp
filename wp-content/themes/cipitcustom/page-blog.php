<?php
/* Template Name: Blog Page */
get_header(); ?>

<div class="breadcrumbs">
    <div>
        <h3>Blog</h3>
        <a href="index.html">Home</a> / <span>Blog</span>
    </div>
</div>

<!-- Blog Header -->
<section class="blog-header">
    <h1>CIPIT Blog</h1>
    <p>Insights, analysis, and commentary on intellectual property, information technology law, and digital
        policy in Africa</p>

    <!-- Search Bar -->
    <div class="search-container">
        <form class="search-bar">
            <input type="text" placeholder="Search blog posts, topics, or authors...">
            <button type="submit"><i class="fas fa-search"></i> Search</button>
        </form>
    </div>
</section>


<!-- Featured Post -->
<div class="featured-post">
    <div class="featured-image">
        The Future of AI Regulation in Africa
        <div class="featured-badge">FEATURED</div>
    </div>
    <div class="featured-content">
        <div class="post-meta">
            <span><i class="far fa-calendar"></i> May 15, 2023</span>
            <span><i class="far fa-user"></i> Dr. Jane Muthoni</span>
            <span><i class="far fa-folder"></i> Artificial Intelligence</span>
        </div>
        <h2>Navigating the Complex Landscape of AI Governance in African Jurisdictions</h2>
        <p>As artificial intelligence technologies become increasingly integrated into public and private sector
            operations across Africa, the need for robust regulatory frameworks has never been more urgent. This
            post examines the current state of AI regulation in key African countries, identifies gaps in
            existing approaches, and proposes a rights-based framework for future policy development.</p>
        <a href="#" class="read-more-btn">Read Full Article</a>
    </div>
</div>

<!-- Blog Categories -->
<div class="blog-categories">
    <button class="category-btn active">All Topics</button>
    <button class="category-btn">Artificial Intelligence</button>
    <button class="category-btn">Data Governance</button>
    <button class="category-btn">Digital Identity</button>
    <button class="category-btn">IP & Innovation</button>
    <button class="category-btn">Cyber Law</button>
    <button class="category-btn">Policy Analysis</button>
</div>


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