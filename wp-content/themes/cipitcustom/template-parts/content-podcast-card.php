<?php
/**
 * Template part for displaying a podcast card in search results
 * Uses a simplified version of your podcast row layout
 */

// Get podcast metadata
$thumbnail = get_the_post_thumbnail_url(get_the_ID(), 'medium');
$authors = get_post_meta(get_the_ID(), 'podcast_authors', true);
$audio_url = get_post_meta(get_the_ID(), 'podcast_audio', true);
$excerpt = get_the_excerpt();

// Check for 'NEW' badge
$post_age = (time() - get_the_time('U')) / (60 * 60 * 24);
$is_new = $post_age < 7;
?>

<div class="podcast-thumbnail">
    <?php if ($thumbnail): ?>
        <img src="<?php echo esc_url($thumbnail); ?>" alt="<?php the_title_attribute(); ?>">
    <?php else: ?>
        <div class="thumbnail-placeholder">
            <i class="fas fa-podcast"></i>
        </div>
    <?php endif; ?>

    <?php if ($is_new): ?>
        <div class="podcast-badge">NEW</div>
    <?php endif; ?>
</div>

<div class="podcast-content">
    <div class="podcast-title">
        <h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
    </div>

    <div class="podcast-description">
        <p><?php echo esc_html(wp_trim_words($excerpt, 20, '...')); ?></p>
    </div>

    <div class="podcast-meta">
        <div class="podcast-date">
            <i class="far fa-calendar"></i> <?php echo get_the_date(); ?>
        </div>

        <?php if ($authors): ?>
            <div class="podcast-authors">
                <i class="far fa-user"></i> <?php echo esc_html($authors); ?>
            </div>
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