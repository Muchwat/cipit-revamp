<!DOCTYPE html>
<html <?php language_attributes(); ?>>

<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>

    <div class="container">
        <nav>
            <div class="main-header">
                <div class="logo">
                    <img src="<?php echo get_template_directory_uri(); ?>/assets/images/logo.png" alt="CIPIT Logo">
                </div>
                <div class="menu">
                    <button class="hamburger"><i class="fas fa-bars"></i></button>
                    <?php
                    // Use the registered menu location and the custom Walker class
                    wp_nav_menu(array(
                        'theme_location' => 'primary-menu',
                        'container' => false,
                        'menu_class' => '',
                        // Custom wrap to append the search icon LI dynamically
                        'items_wrap' => '<ul id="%1$s" class="%2$s">%3$s<li class="menu-item menu-item-search"><a href="#search" class="search-icon-link" aria-label="Search"><i class="fas fa-search"></i></a></li></ul>',
                        //'walker' => new Custom_Mega_Menu_Walker(), // <-- THIS MUST BE UNCOMMENTED
                        'depth' => 3,
                    ));
                    ?>
                </div>
            </div>
        </nav>