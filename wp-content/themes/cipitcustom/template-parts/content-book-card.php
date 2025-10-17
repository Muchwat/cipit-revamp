<?php
/**
 * Template part for displaying a book card in search results
 * Uses the same cover-focused style as your books page
 */

// Check for 'NEW' badge
$post_age = (time() - get_the_time('U')) / (60 * 60 * 24);
$is_new = $post_age < 7;
?>

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
        <?php if ($is_new): ?>
            <div class="book-card-badge">NEW</div>
        <?php endif; ?>
    </div>

    <!-- Hidden title slides up on hover -->
    <div class="book-content">
        <h3 class="text-lg font-semibold text-center">
            <a href="<?php the_permalink(); ?>" class="hover:text-red-500 transition-colors">
                <?php the_title(); ?>
            </a>
        </h3>
    </div>
</div>