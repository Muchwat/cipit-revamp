<?php
/**
 * 📁 functions.php
 * Registers menus, enqueues assets, and defines the custom Mega Menu Walker.
 */

// --- Menu Registration and Theme Support ---

function register_cipit_menus()
{
    register_nav_menus(
        array(
            'primary-menu' => __('Primary Navigation Menu', 'textdomain'),
        )
    );
}
add_action('init', 'register_cipit_menus');

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


// --- Custom Mega Menu Walker (The Fix) ---

/**
 * Custom_Mega_Menu_Walker
 * Translates WP's nested <ul>s into the required <li> > <div>.mega-menu > <div>.column structure.
 * This class is placed here to guarantee loading and uses array syntax to prevent PHP errors.
 */
class Custom_Mega_Menu_Walker extends Walker_Nav_Menu
{
    function start_lvl(&$output, $depth = 0, $args = null)
    {
        if ($depth === 0) {
            $output .= '<div class="mega-menu">';
        } elseif ($depth === 1) {
            $output .= '<div class="column">';
        } else {
            $output .= '<ul>';
        }
    }

    function end_lvl(&$output, $depth = 0, $args = null)
    {
        if ($depth === 0) {
            $output .= '</div>'; // Closes .mega-menu
        } elseif ($depth === 1) {
            $output .= '</div>'; // Closes .column
        } else {
            $output .= '</ul>';
        }
    }

    function start_el(&$output, $item, $depth = 0, $args = null, $id = 0)
    {
        $indent = ($depth) ? str_repeat("\t", $depth) : '';

        // Get and filter classes (includes the critical 'has-mega' class from WP Admin)
        $classes = empty($item->classes) ? array() : (array) $item->classes;
        $class_names = join(' ', apply_filters('nav_menu_css_class', array_filter($classes), $item, $args, $depth));
        $class_names = $class_names ? ' class="' . esc_attr($class_names) . '"' : '';

        // Only open the <li> element for Level 0 (Main Link) and Level 2+ (Final Links)
        if ($depth !== 1) {
            $output .= $indent . '<li' . $class_names . '>';
        }

        // Setup attributes
        $atts = array();
        $atts['title'] = !empty($item->attr_title) ? $item->attr_title : '';
        $atts['target'] = !empty($item->target) ? $item->target : '';
        $atts['rel'] = !empty($item->xfn) ? $item->xfn : '';
        $atts['href'] = !empty($item->url) ? $item->url : '';
        $atts = apply_filters('nav_menu_link_attributes', $atts, $item, $args, $depth);

        $attributes = '';
        foreach ($atts as $attr => $value) {
            if (!empty($value)) {
                $value = ('href' === $attr) ? esc_url($value) : esc_attr($value);
                $attributes .= ' ' . $attr . '="' . $value . '"';
            }
        }

        // --- Use Array Syntax for $args (e.g., $args['before']) ---
        $item_output = $args['before'];

        if ($depth === 1) {
            // Level 1 item (the column title) is rendered as a stylized heading (H4)
            $item_output .= '<h4 class="menu-title">' . apply_filters('the_title', $item->title, $item->ID) . '</h4>';
        } else {
            // Level 0 (Main link) and Level 2+ (Sub-links) are rendered as standard <a> tags
            $item_output .= '<a' . $attributes . '>';
            $item_output .= $args['link_before'] . apply_filters('the_title', $item->title, $item->ID) . $args['link_after'];
            $item_output .= '</a>';
        }

        $item_output .= $args['after'];

        $output .= apply_filters('walker_nav_menu_start_el', $item_output, $item, $depth, $args);
    }

    function end_el(&$output, $item, $depth = 0, $args = null)
    {
        if ($depth !== 1) {
            $output .= '</li>';
        }
    }
}