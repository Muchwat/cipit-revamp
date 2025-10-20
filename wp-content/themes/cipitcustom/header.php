<!DOCTYPE html>
<html <?php language_attributes(); ?>>

<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <?php
    if (function_exists('has_site_icon') && has_site_icon()) {
        wp_site_icon();
    } else {
        ?>
        <link rel="icon" href="<?php echo esc_url(get_template_directory_uri()); ?>/assets/images/favicon.ico"
            sizes="32x32" />
        <link rel="apple-touch-icon"
            href="<?php echo esc_url(get_template_directory_uri()); ?>/assets/images/apple-touch-icon.png" />
        <meta name="msapplication-TileImage"
            content="<?php echo esc_url(get_template_directory_uri()); ?>/assets/images/ms-icon-144x144.png">
        <?php
    }
    ?>

    <?php wp_head(); ?>
</head>


<body <?php body_class(); ?>>

    <div class="container">
        <div class="top-header">
            <div class="top-header-left">
                <a href="<?php echo esc_url(home_url('/opportunities')); ?>">Opportunities</a>
                <a href="<?php echo esc_url(home_url('/contact-us')); ?>">Contact Us</a>
            </div>
            <div class="top-header-right">
                <a href="https://x.com/StrathCIPIT" target="_blank" aria-label="Twitter"><i
                        class="fab fa-twitter"></i></a>
                <a href="https://www.facebook.com/StrathmoreCIPIT?_rdc=1&_rdr#" target="_blank" aria-label="Facebook"><i
                        class="fab fa-facebook-f"></i></a>
                <a href="https://www.youtube.com/@centreforipitlawcipit2930" target="_blank" aria-label="YouTube"><i
                        class="fab fa-youtube"></i></a>
                <a href="https://www.linkedin.com/company/centre-for-intellectual-property-and-information-technology-law/"
                    target="_blank" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                <a href="https://www.instagram.com/strathmorecipit/" target="_blank" aria-label="Instagram"><i
                        class="fab fa-instagram"></i></a>
                <a href="mailto:cipit@strathmore.edu" target="_blank" aria-label="Email"><i
                        class="fas fa-envelope"></i></a>
            </div>
        </div>

        <nav>
            <div class="main-header">
                <div class="logo">
                    <a href="<?php echo esc_url(home_url('/')); ?>" class="flex items-center space-x-2">
                        <?php if (function_exists('the_custom_logo') && has_custom_logo()): ?>
                            <?php the_custom_logo(); ?>
                        <?php else: ?>
                            <a href="<?php echo esc_url(home_url('/')); ?>" class="site-logo">
                                <img src="<?php echo esc_url(get_template_directory_uri() . '/assets/images/logo.png'); ?>"
                                    alt="<?php bloginfo('name'); ?>">
                            </a>
                        <?php endif; ?>
                    </a>
                </div>

                <div class="menu">
                    <button class="hamburger"><i class="fas fa-bars"></i></button>
                    <ul>
                        <li class="has-mega">
                            <a href="#">Research</a>
                            <div class="mega-menu">
                                <div class="column">
                                    <h4 class="menu-title">Our Research Themes</h4>
                                    <a href="<?php echo esc_url(home_url('/artificial-intelligence')); ?>">Artificial
                                        Intelligence</a>
                                    <a href="<?php echo esc_url(home_url('/data-governance-and-policy')); ?>">Data
                                        Governance & Policy</a>
                                    <a href="<?php echo esc_url(home_url('/digital-identity')); ?>">Digital Identity</a>
                                    <a href="<?php echo esc_url(home_url('/ip-and-innovation')); ?>">IP and
                                        Innovation</a>
                                    <a href="<?php echo esc_url(home_url('/cyber-law-and-policy')); ?>">Cyber Law &
                                        Policy</a>
                                </div>
                                <div class="column">
                                    <h4 class="menu-title">Learning & Development</h4>
                                    <a href="<?php echo esc_url(home_url('/trainings')); ?>">Trainings</a>
                                    <a href="<?php echo esc_url(home_url('/writing-prizes')); ?>">Writing Prizes</a>
                                    <a href="<?php echo esc_url(home_url('/fellowships')); ?>">Fellowships</a>
                                </div>
                            </div>
                        </li>
                        <li class="has-mega">
                            <a href="#">Publications</a>
                            <div class="mega-menu">
                                <div class="column">
                                    <h4 class="menu-title">Publications</h4>
                                    <a href="<?php echo esc_url(home_url('/books')); ?>">Books and Book Chapters</a>
                                    <a href="<?php echo esc_url(home_url('/journal-articles')); ?>">Journal Articles</a>
                                    <a href="<?php echo esc_url(home_url('/policy-briefs')); ?>">Policy Briefs</a>
                                    <a href="<?php echo esc_url(home_url('/manuals')); ?>">Manuals</a>
                                    <a href="<?php echo esc_url(home_url('/conference-papers')); ?>">Conference
                                        Papers</a>
                                    <a href="<?php echo esc_url(home_url('/jipit')); ?>">JIPIT</a>
                                </div>
                            </div>
                        </li>
                        <li class="has-mega">
                            <a href="#">News & Events</a>
                            <div class="mega-menu">
                                <div class="column">
                                    <h4 class="menu-title">News & Events</h4>
                                    <a href="<?php echo esc_url(home_url('/blog')); ?>">Blog</a>
                                    <a href="<?php echo esc_url(home_url('/podcasts')); ?>">Podcasts</a>
                                    <a href="<?php echo esc_url(home_url('/events')); ?>">Events</a>
                                </div>
                            </div>
                        </li>
                        <li class="has-mega">
                            <a href="#">About Us</a>
                            <div class="mega-menu">
                                <div class="column">
                                    <h4 class="menu-title">About Us</h4>
                                    <a href="<?php echo esc_url(home_url('/about')); ?>">Who We Are</a>
                                    <a href="<?php echo esc_url(home_url('/team')); ?>">Team</a>
                                    <a href="<?php echo esc_url(home_url('/steering-committee')); ?>">Steering
                                        Committee</a>
                                    <a href="<?php echo esc_url(home_url('/our-work')); ?>">Our Work</a>
                                </div>
                            </div>
                        </li>

                        <!-- Search Icon and Box -->
                        <li><a href="#" class="search-icon-link" aria-label="Search"><i class="fas fa-search"></i></a>
                        </li>
                        <li class="search-box">
                            <form action="<?php echo esc_url(home_url('/')); ?>" method="get" class="search-form">
                                <input type="text" name="s" class="search-input" placeholder="Search..." />
                                <input type="hidden" name="search_context" value="all" />
                            </form>

                        </li>
                    </ul>
                </div>
            </div>
        </nav>