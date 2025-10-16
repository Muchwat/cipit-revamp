<?php
/*
Template Name: Team Page
*/
get_header();
?>

<div class="breadcrumbs">
    <div>
        <h3>Our Team</h3>
        <a href="<?php echo esc_url(home_url('/')); ?>">Home</a> / <span>Team</span>
    </div>
</div>

<section class="team-header">
    <h1>Meet the CIPIT Team</h1>
    <p>
        We are a multidisciplinary team of researchers, policy experts, and innovators shaping the future of digital
        policy and technology law in Africa.
    </p>
</section>

<main class="site-main container">
    <div class="team-grid">
        <?php
        $team_query = new WP_Query([
            'post_type' => 'team_member',
            'posts_per_page' => -1,
            'orderby' => 'menu_order',
            'order' => 'ASC'
        ]);

        if ($team_query->have_posts()):
            while ($team_query->have_posts()):
                $team_query->the_post();

                $position = get_post_meta(get_the_ID(), 'position', true);
                $linkedin = get_post_meta(get_the_ID(), 'linkedin', true);
                $email = get_post_meta(get_the_ID(), 'email', true);

                // Get the bio content - use custom field or post content
                $bio = get_post_meta(get_the_ID(), 'bio', true);
                if (empty($bio)) {
                    $bio = get_the_content();
                }

                // Clean the bio for data attribute
                $bio_clean = htmlspecialchars(wp_strip_all_tags($bio), ENT_QUOTES);

                // Use larger image size for 400x400 display
                $photo = get_the_post_thumbnail_url(get_the_ID(), 'large') ?: '';
                $title = get_the_title();
                $initials = '';
                if (!empty($title)) {
                    $words = explode(' ', $title);
                    $initials = '';
                    foreach ($words as $word) {
                        $initials .= strtoupper(substr($word, 0, 1));
                        if (strlen($initials) >= 2)
                            break;
                    }
                }
                ?>

                <div class="team-card" data-name="<?php echo esc_attr($title); ?>"
                    data-position="<?php echo esc_attr($position); ?>" data-photo="<?php echo esc_url($photo); ?>"
                    data-bio="<?php echo esc_attr($bio_clean); ?>" data-linkedin="<?php echo esc_url($linkedin); ?>"
                    data-email="<?php echo esc_attr($email); ?>" data-initials="<?php echo esc_attr($initials); ?>">

                    <div class="team-photo-container">
                        <?php if ($photo): ?>
                            <img src="<?php echo esc_url($photo); ?>" alt="<?php the_title_attribute(); ?>" class="team-photo">
                        <?php else: ?>
                            <div class="photo-placeholder">
                                <?php echo esc_html($initials); ?>
                            </div>
                        <?php endif; ?>
                    </div>

                    <div class="team-card-content">
                        <h3><?php the_title(); ?></h3>
                        <?php if ($position): ?>
                            <p class="team-position"><?php echo esc_html($position); ?></p>
                        <?php endif; ?>

                        <div class="team-socials">
                            <?php if ($linkedin): ?>
                                <a href="<?php echo esc_url($linkedin); ?>" target="_blank" class="team-social-link"
                                    onclick="event.stopPropagation();">
                                    <i class="fab fa-linkedin"></i>
                                </a>
                            <?php endif; ?>
                            <?php if ($email): ?>
                                <a href="mailto:<?php echo esc_attr($email); ?>" class="team-social-link"
                                    onclick="event.stopPropagation();">
                                    <i class="far fa-envelope"></i>
                                </a>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>

                <?php
            endwhile;
            wp_reset_postdata();
        else:
            echo '<p class="text-center text-gray-600" style="grid-column: 1 / -1; padding: 2rem;">No team members found.</p>';
        endif;
        ?>
    </div>
</main>

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