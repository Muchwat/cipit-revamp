<?php
/**
 * Template Name: Steering Committee
 */
get_header();
?>

<div class="breadcrumbs">
    <div>
        <h3>Steering Committee</h3>
        <a href="<?php echo esc_url(home_url('/')); ?>">Home</a> / <span>Steering Committee</span>
    </div>
</div>

<section class="team-header">
    <h1>Meet the Steering Committee</h1>
    <p>
        The CIPIT Steering Committee provides strategic guidance and oversight in advancing our mission
        of technology and innovation research across Africa.
    </p>
</section>

<main class="site-main container">
    <div class="team-grid">
        <?php
        $committee_query = new WP_Query([
            'post_type' => 'steering_committee',
            'posts_per_page' => -1,
            'orderby' => 'menu_order',
            'order' => 'ASC'
        ]);

        if ($committee_query->have_posts()):
            while ($committee_query->have_posts()):
                $committee_query->the_post();

                // Get bio (from meta or content)
                $bio = get_post_meta(get_the_ID(), 'bio', true);
                if (empty($bio)) {
                    $bio = get_the_content();
                }

                // Sanitize for modal
                $bio_clean = htmlspecialchars(wp_strip_all_tags($bio), ENT_QUOTES);

                // Get photo or initials
                $photo = get_the_post_thumbnail_url(get_the_ID(), 'large') ?: '';
                $title = get_the_title();

                // Build initials fallback
                $initials = '';
                if (!empty($title)) {
                    $words = explode(' ', $title);
                    foreach ($words as $word) {
                        $initials .= strtoupper(substr($word, 0, 1));
                        if (strlen($initials) >= 2)
                            break;
                    }
                }
                ?>

                <div class="team-card" data-name="<?php echo esc_attr($title); ?>" data-photo="<?php echo esc_url($photo); ?>"
                    data-bio="<?php echo esc_attr($bio_clean); ?>" data-position="" data-linkedin="" data-email=""
                    data-initials="<?php echo esc_attr($initials); ?>">

                    <div class="team-photo-container">
                        <?php if ($photo): ?>
                            <img src="<?php echo esc_url($photo); ?>" alt="<?php the_title_attribute(); ?>" class="team-photo">
                        <?php else: ?>
                            <div class="photo-placeholder"><?php echo esc_html($initials); ?></div>
                        <?php endif; ?>
                    </div>

                    <div class="team-card-content">
                        <h3><?php the_title(); ?></h3>
                    </div>
                </div>

                <?php
            endwhile;
            wp_reset_postdata();
        else:
            echo '<p class="text-center text-gray-600" style="grid-column: 1 / -1; padding: 2rem;">No committee members found.</p>';
        endif;
        ?>
    </div>
</main>

<!-- Modal (same structure used by the Team page) -->
<div class="modal-overlay" id="teamModal">
    <div class="modal">
        <button class="modal-close" id="closeModal" aria-label="Close Modal">&times;</button>

        <div class="modal-content">
            <div class="modal-photo-container">
                <img id="modalPhoto" class="modal-photo hidden" src="" alt="Profile Photo">
                <div id="modalInitials" class="modal-initials hidden"></div>
            </div>

            <h2 class="modal-name" id="modalName"></h2>
            <p class="modal-position" id="modalPosition"></p>

            <div class="modal-socials">
                <a id="modalLinkedin" href="#" target="_blank" class="hidden">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a id="modalEmail" href="#" class="hidden">
                    <i class="far fa-envelope"></i>
                </a>
            </div>

            <div class="modal-bio" id="modalBio"></div>
        </div>
    </div>
</div>

<?php get_footer(); ?>