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
                <a href="#opportunities">Opportunities</a>
                <a href="#contact-us">Contact Us</a>
            </div>
            <div class="top-header-right">
                <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                <a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
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
                                    <a href="artificial-intelligence.html">Artificial Intelligence</a>
                                    <a href="data-governance-and-policy.html">Data Governance & Policy</a>
                                    <a href="digital-identity.html">Digital Identity</a>
                                    <a href="ip-and-innovation.html">IP and Innovation</a>
                                    <a href="cyber-law-and-policy.html">Cyber Law & Policy</a>
                                </div>
                                <div class="column">
                                    <h4 class="menu-title">Learning and Development</h4>
                                    <a href="trainings.html">Trainings</a>
                                    <a href="writing-prizes.html">Writing Prizes</a>
                                    <a href="fellowships.html">Fellowships</a>
                                    <a href="jipit.html">JIPIT</a>
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
                                    <a href="<?php echo esc_url(home_url('/conference-papers')); ?>">Conference
                                        Papers</a>
                                    <a href="<?php echo esc_url(home_url('/policy-briefs')); ?>">Policy Briefs</a>
                                    <a href="<?php echo esc_url(home_url('/manuals')); ?>">Manuals</a>
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
                        <li><a href="#" class="search-icon-link" aria-label="Search"><i class="fas fa-search"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>