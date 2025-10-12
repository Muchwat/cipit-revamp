<?php
/**
 * 📁 functions.php
 * Registers menus, enqueues assets, and defines the custom Mega Menu Walker.
 */



add_theme_support('title-tag');
add_theme_support('post-thumbnails');


// --- Asset Enqueue ---

function cipit_enqueue_assets()
{
    // Main stylesheet
    wp_enqueue_style('cipit-style', get_stylesheet_uri());
    wp_enqueue_style('cipit-main', get_template_directory_uri() . '/assets/css/main.css', [], '1.0');

    // Font Awesome 
    wp_enqueue_style('fontawesome', 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css', [], '5.15.3');

    // JS - Loaded in the footer (true)
    wp_enqueue_script('cipit-main', get_template_directory_uri() . '/assets/js/main.js', ['jquery'], '1.0', true);
}
add_action('wp_enqueue_scripts', 'cipit_enqueue_assets');


