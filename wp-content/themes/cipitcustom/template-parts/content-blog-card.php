<?php
/**
 * Template part for displaying a blog post card in search results,
 * archives, or the main blog index.
 * * Assumes the WordPress loop (the_post()) is active.
 */

// Get the post tags for the image overlay text
$post_tags = get_the_tags();
$overlay_text = !empty($post_tags) ? esc_html($post_tags[0]->name) : 'Read More';

// Check for 'NEW' badge
$post_age = (time() - get_the_time('U')) / (60 * 60 * 24);
$is_new = $post_age < 7;
?>

<div class="blog-card">
    <div class="blog-card-image">
        <a href="<?php the_permalink(); ?>">
            <?php if (has_post_thumbnail()): ?>
                <?php the_post_thumbnail('large'); ?>
            <?php endif; ?>
            <?php echo $overlay_text; // The text on the image overlay ?>
        </a>
        <?php if ($is_new): ?>
            <div class="blog-card-badge">NEW</div>
        <?php endif; ?>
    </div>

    <div class="blog-card-content">
        <div class="post-meta">
            <span><i class="far fa-calendar"></i> <?php echo get_the_date(); ?></span>
            <span><i class="far fa-user"></i> <?php the_author(); ?></span>
        </div>
        <h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
        <p><?php echo wp_trim_words(get_the_excerpt(), 25, '...'); ?></p>
        <a href="<?php the_permalink(); ?>" class="read-more-btn">Read More</a>
    </div>
</div>