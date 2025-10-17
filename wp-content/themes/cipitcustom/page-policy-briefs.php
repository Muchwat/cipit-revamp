<?php
/* Template Name: Policy Briefs */
get_header();
?>

<div class="breadcrumbs">
    <div>
        <h3>Policy Briefs</h3>
        <a href="<?php echo esc_url(home_url('/')); ?>">Home</a> / <span>Publications</span> / <span>Policy
            Briefs</span>
    </div>
</div>

<section class="books-header">
    <h1>Policy Briefs</h1>

    <p>Our policy analysis and recommendations on intellectual property, information technology law, and digital policy
        in Africa</p>

    <div class="search-container">
        <form class="search-bar" method="get" action="<?php echo esc_url(home_url('/')); ?>">
            <input type="text" name="s" placeholder="Search policy briefs, topics, or authors..."
                value="<?php echo get_search_query(); ?>">
            <input type="hidden" name="search_context" value="policy-briefs">
            <button type="submit"><i class="fas fa-search"></i> Search</button>
        </form>
    </div>
</section>

<main class="container mx-auto px-4 py-8">

    <?php
    $paged = (get_query_var('paged')) ? get_query_var('paged') : 1;

    // 1. Featured Policy Briefs Query - Fetching up to 3 sticky posts
    $featured_query = new WP_Query([
        'posts_per_page' => 3, // Fetch up to 3 featured policy briefs
        'post__in' => get_option('sticky_posts'),
        'ignore_sticky_posts' => 1,
        'category_name' => 'policy-briefs',
    ]);

    // Logic to capture ALL featured post IDs for exclusion
    $exclude_post_ids = [];
    if ($featured_query->have_posts()) {
        while ($featured_query->have_posts()) {
            $featured_query->the_post();
            $exclude_post_ids[] = get_the_ID();
        }
        // Rewind the posts pointer back to the start before the display loop
        $featured_query->rewind_posts();
    }

    // 2. Main Policy Briefs Query - Exclude all featured posts
    $policy_query = new WP_Query([
        'category_name' => 'policy-briefs',
        'posts_per_page' => 8,
        'paged' => $paged,
        'orderby' => 'date',
        'order' => 'DESC',
        'post__not_in' => $exclude_post_ids, // Exclude all captured featured policy brief IDs
    ]);
    ?>

    <?php if ($featured_query->have_posts()): ?>

        <!-- Featured Slider Container -->
        <div class="featured-slider-wrapper relative mb-12">
            <div id="featured-slider-container" class="relative overflow-hidden">
                <!-- Slider Track -->
                <div id="featured-slider" class="featured-slider flex transition-transform duration-500 ease-in-out">
                    <?php while ($featured_query->have_posts()):
                        $featured_query->the_post(); ?>

                        <!-- Individual Featured Slide -->
                        <div class="featured-post">
                            <div class="featured-image">
                                <a href="<?php the_permalink(); ?>">
                                    <?php if (has_post_thumbnail()): ?>
                                        <?php the_post_thumbnail('full'); ?>
                                    <?php endif; ?>
                                </a>
                                <div class="featured-badge">
                                    FEATURED
                                </div>
                            </div>

                            <div class="featured-content">
                                <div class="post-meta">
                                    <span><i class="far fa-calendar"></i> <?php echo get_the_date(); ?></span>
                                    <span><i class="far fa-user"></i> <?php the_author(); ?></span>
                                    <?php
                                    $categories = get_the_category();
                                    if ($categories): ?>
                                        <span><i class="far fa-folder"></i> <?php echo esc_html($categories[0]->name); ?></span>
                                    <?php endif; ?>
                                </div>

                                <h2>
                                    <a href="<?php the_permalink(); ?>"><?php the_title(); ?></a>
                                </h2>

                                <p>
                                    <?php echo wp_trim_words(get_the_excerpt(), 40); ?>
                                </p>

                                <a href="<?php the_permalink(); ?>" class="read-more-btn">
                                    Read Policy Brief
                                </a>
                            </div>
                        </div>
                    <?php endwhile; ?>
                </div>
            </div>

            <!-- Slider Controls -->
            <div class="slider-controls flex justify-center items-center mt-4 space-x-4">
                <button id="prev-slide"
                    class="slider-btn bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded-full transition-colors">
                    <i class="fas fa-chevron-left"></i> Prev
                </button>
                <div id="slide-indicators" class="flex space-x-2">
                    <!-- Indicators will be generated by JavaScript -->
                </div>
                <button id="next-slide"
                    class="slider-btn bg-gray-200 hover:bg-gray-300 text-gray-800 font-bold py-2 px-4 rounded-full transition-colors">
                    Next <i class="fas fa-chevron-right"></i>
                </button>
            </div>
        </div>

        <?php wp_reset_postdata(); ?>

    <?php endif; ?>

    <?php if ($policy_query->have_posts()): ?>
        <div class="books-grid">
            <?php while ($policy_query->have_posts()):
                $policy_query->the_post(); ?>
                <div class="book-card group">
                    <div class="book-cover">
                        <a href="<?php the_permalink(); ?>">
                            <?php if (has_post_thumbnail()): ?>
                                <?php the_post_thumbnail('medium', ['class' => 'w-full h-full object-cover rounded-md']); ?>
                            <?php else: ?>
                                <img src="https://placehold.co/640x830/EEE/AAA?text=No+Cover" alt="<?php the_title(); ?>"
                                    class="w-full h-full object-cover rounded-md">
                            <?php endif; ?>
                        </a>
                    </div>

                    <!-- Hidden title slides up on hover -->
                    <div class="book-content">
                        <h5>
                            <a href="<?php the_permalink(); ?>" class="hover:text-red-500 transition-colors">
                                <?php the_title(); ?>
                            </a>
                        </h5>
                        <a href="<?php the_permalink(); ?>" class="view-more">
                            Click to view
                        </a>
                    </div>
                </div>

            <?php endwhile; ?>
        </div>

        <div class="pagination">
            <?php
            echo paginate_links([
                'total' => $policy_query->max_num_pages,
                'current' => max(1, get_query_var('paged')),
                'prev_text' => '<i class="fas fa-chevron-left"></i>',
                'next_text' => '<i class="fas fa-chevron-right"></i>',
            ]);
            ?>
        </div>

    <?php else: ?>
        <p class="text-gray-600 text-center">No policy briefs found yet.</p>
    <?php endif; ?>

    <?php wp_reset_postdata(); ?>
</main>

<?php get_footer(); ?>