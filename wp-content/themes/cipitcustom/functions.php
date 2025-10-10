<?php
require get_template_directory() . '/class-cipit-mega-menu-walker.php';

function cipit_register_menus()
{
    register_nav_menus([
        'primary' => __('Primary Menu', 'cipit'),
    ]);
}
add_action('init', 'cipit_register_menus');


function cipit_enqueue_assets()
{
    // Main stylesheet
    wp_enqueue_style('cipit-style', get_stylesheet_uri());
    wp_enqueue_style('cipit-main', get_template_directory_uri() . '/assets/css/main.css', [], '1.0');

    // Font Awesome
    wp_enqueue_style('fontawesome', 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css', [], '5.15.3');

    // JS
    wp_enqueue_script('cipit-main', get_template_directory_uri() . '/assets/js/main.js', [], '1.0', true);
}
add_action('wp_enqueue_scripts', 'cipit_enqueue_assets');

// Optional theme features
add_theme_support('title-tag');
add_theme_support('post-thumbnails');




