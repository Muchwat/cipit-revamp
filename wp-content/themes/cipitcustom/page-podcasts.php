<?php
/*
Template Name: Podcasts Page
*/
get_header();
?>

<div class="breadcrumbs">
    <div>
        <h3>Podcasts</h3>
        <a href="<?php echo esc_url(home_url('/')); ?>">Home</a> / <span>Podcasts</span>
    </div>
</div>

<section class="podcasts-header">
    <h1>CIPIT Podcasts</h1>
    <p>Listen to our latest discussions on digital policy, technology law, and innovation in Africa. Featuring expert
        insights and thought-provoking conversations.</p>

    <!-- ✅ Added Search Bar (Same Style as Blog Page) -->
    <div class="search-container">
        <form role="search" method="get" class="search-bar" action="<?php echo esc_url(home_url('/')); ?>">
            <input type="search" class="search-field" placeholder="Search podcast titles, topics, or speakers..."
                value="<?php echo get_search_query(); ?>" name="s">
            <input type="hidden" name="search_context" value="podcast">
            <button type="submit"><i class="fas fa-search"></i> Search</button>
        </form>
    </div>
</section>

<main class="site-main container">
    <div class="podcasts-grid">
        <?php
        // Featured podcast (sticky posts in podcast category)
        $featured_podcast_query = new WP_Query([
            'posts_per_page' => 1,
            'post__in' => get_option('sticky_posts'),
            'ignore_sticky_posts' => 1,
            'category_name' => 'podcast',
        ]);

        // Regular podcasts (non-sticky posts in podcast category)
        $podcasts_query = new WP_Query([
            'posts_per_page' => 10,
            'post__not_in' => get_option('sticky_posts'),
            'category_name' => 'podcast',
            'orderby' => 'date',
            'order' => 'DESC'
        ]);

        // Display featured podcast first if exists
        if ($featured_podcast_query->have_posts()):
            while ($featured_podcast_query->have_posts()):
                $featured_podcast_query->the_post();
                $thumbnail = get_the_post_thumbnail_url(get_the_ID(), 'medium');
                $authors = get_post_meta(get_the_ID(), 'podcast_authors', true);
                $audio_url = get_post_meta(get_the_ID(), 'podcast_audio', true);
                $excerpt = get_the_excerpt();
                ?>

                <div class="podcast-row featured-podcast">
                    <div class="podcast-thumbnail">
                        <?php if ($thumbnail): ?>
                            <img src="<?php echo esc_url($thumbnail); ?>" alt="<?php the_title_attribute(); ?>">
                        <?php else: ?>
                            <div class="thumbnail-placeholder">
                                <i class="fas fa-podcast"></i>
                            </div>
                        <?php endif; ?>
                        <div class="featured-badge">Featured</div>
                    </div>

                    <div class="podcast-content">
                        <div class="podcast-title">
                            <h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
                        </div>

                        <div class="podcast-description">
                            <p><?php echo esc_html($excerpt); ?></p>
                        </div>

                        <div class="podcast-meta">
                            <div class="podcast-date"><?php echo get_the_date(); ?></div>

                            <?php if ($authors): ?>
                                <div class="podcast-authors"><?php echo esc_html($authors); ?></div>
                            <?php endif; ?>

                            <div class="podcast-play-btn">
                                <?php if ($audio_url): ?>
                                    <a href="<?php echo esc_url($audio_url); ?>" class="play-btn" target="_blank">
                                        <i class="fas fa-play"></i> Listen Now
                                    </a>
                                <?php else: ?>
                                    <a href="<?php the_permalink(); ?>" class="play-btn">
                                        <i class="fas fa-info-circle"></i> Learn More
                                    </a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>

                <?php
            endwhile;
            wp_reset_postdata();
        endif;

        // Display regular podcasts
        if ($podcasts_query->have_posts()):
            while ($podcasts_query->have_posts()):
                $podcasts_query->the_post();
                $thumbnail = get_the_post_thumbnail_url(get_the_ID(), 'medium');
                $authors = get_post_meta(get_the_ID(), 'podcast_authors', true);
                $audio_url = get_post_meta(get_the_ID(), 'podcast_audio', true);
                $excerpt = get_the_excerpt();
                ?>

                <div class="podcast-row">
                    <div class="podcast-thumbnail">
                        <?php if ($thumbnail): ?>
                            <img src="<?php echo esc_url($thumbnail); ?>" alt="<?php the_title_attribute(); ?>">
                        <?php else: ?>
                            <div class="thumbnail-placeholder">
                                <i class="fas fa-podcast"></i>
                            </div>
                        <?php endif; ?>
                    </div>

                    <div class="podcast-content">
                        <div class="podcast-title">
                            <h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
                        </div>

                        <div class="podcast-description">
                            <p><?php echo esc_html($excerpt); ?></p>
                        </div>

                        <div class="podcast-meta">
                            <div class="podcast-date"><i class="far fa-calendar"></i> <?php echo get_the_date(); ?></div>

                            <?php if ($authors): ?>
                                <div class="podcast-authors"><?php echo esc_html($authors); ?></div>
                            <?php endif; ?>

                            <div class="podcast-play-btn">
                                <?php if ($audio_url): ?>
                                    <a href="<?php echo esc_url($audio_url); ?>" class="play-btn" target="_blank">
                                        <i class="fas fa-play"></i> Listen Now
                                    </a>
                                <?php else: ?>
                                    <a href="<?php the_permalink(); ?>" class="play-btn">
                                        <i class="fas fa-info-circle"></i> Learn More
                                    </a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>

                <?php
            endwhile;
            wp_reset_postdata();
        else:
            echo '<p class="text-center text-gray-600">No podcasts found.</p>';
        endif;
        ?>
    </div>
</main>

<?php get_footer(); ?>