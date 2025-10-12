<?php

/**
 * Custom_Mega_Menu_Walker
 * Translates WP's nested <ul>s into the required <li> > <div>.mega-menu > <div>.column structure.
 * Requires a three-level menu structure in WordPress:
 * Level 0: Main Menu Link (e.g., "Research") - MUST have the 'has-mega' CSS Class.
 * Level 1: Column Title (e.g., "Our Research Themes") - MUST NOT be a link.
 * Level 2: Column Link Items (e.g., "Artificial Intelligence")
 */
class Custom_Mega_Menu_Walker extends Walker_Nav_Menu
{
    // Custom property to hold the current column's content while processing its children.
    private $current_column_content = '';

    /**
     * Start Level: Opens the container for child elements.
     * $depth=0: Opens <div class="mega-menu">
     * $depth=1: Opens <div class="column">
     */
    function start_lvl(&$output, $depth = 0, $args = null)
    {
        if ($depth === 0) {
            // Level 0: Container for the entire mega menu content
            $output .= '<div class="mega-menu">';
        } elseif ($depth === 1) {
            // Level 1: Container for a single column
            $output .= '<div class="column">';
            $this->current_column_content = ''; // Reset for the new column
        }
        // Higher depths are ignored, as only 3 levels are supported for this structure
    }

    /**
     * End Level: Closes the container.
     */
    function end_lvl(&$output, $depth = 0, $args = null)
    {
        if ($depth === 0) {
            $output .= '</div>'; // Closes .mega-menu
        } elseif ($depth === 1) {
            // Append the collected column content (h4 + a's) before closing the column div
            $output .= $this->current_column_content;
            $output .= '</div>'; // Closes .column
        }
    }

    /**
     * Start Element: Renders the individual menu item.
     */
    function start_el(&$output, $item, $depth = 0, $args = null, $id = 0)
    {
        // ------------------
        // Level 0: Main Nav Link (e.g., "Research")
        // Renders as: <li class="has-mega"><a href="#">Research</a>
        // ------------------
        if ($depth === 0) {
            $classes = empty($item->classes) ? array() : (array) $item->classes;
            $class_names = join(' ', apply_filters('nav_menu_css_class', array_filter($classes), $item, $args, $depth));
            $class_names = $class_names ? ' class="' . esc_attr($class_names) . '"' : '';

            $output .= '<li' . $class_names . '>';

            $atts = array(
                'href' => !empty($item->url) ? $item->url : '',
            );
            $attributes = '';
            foreach ($atts as $attr => $value) {
                if (!empty($value)) {
                    $value = ('href' === $attr) ? esc_url($value) : esc_attr($value);
                    $attributes .= ' ' . $attr . '="' . $value . '"';
                }
            }

            $item_output = $args->before;
            // Add search icon class if it is the search item
            if (in_array('search-icon-link', $classes)) {
                $item_output .= '<a' . $attributes . ' aria-label="Search"><i class="fas fa-search"></i></a>';
            } else {
                $item_output .= '<a' . $attributes . '>';
                $item_output .= $args->link_before . apply_filters('the_title', $item->title, $item->ID) . $args->link_after;
                $item_output .= '</a>';
            }

            $output .= apply_filters('walker_nav_menu_start_el', $item_output, $item, $depth, $args);

            // ------------------
            // Level 1: Column Title (e.g., "Our Research Themes")
            // Renders as: <h4 class="menu-title">Our Research Themes</h4>
            // ------------------
        } elseif ($depth === 1) {
            // This is the column title/header
            $item_output = '<h4 class="menu-title">' . apply_filters('the_title', $item->title, $item->ID) . '</h4>';
            // Collect this output to be printed *inside* the .column div (in end_lvl)
            $this->current_column_content .= $item_output;

            // ------------------
            // Level 2: Column Link Items (e.g., "Artificial Intelligence")
            // Renders as: <a href="artificial-intelligence.html">Artificial Intelligence</a>
            // ------------------
        } elseif ($depth === 2) {
            $atts = array(
                'href' => !empty($item->url) ? $item->url : '',
            );
            $attributes = '';
            foreach ($atts as $attr => $value) {
                if (!empty($value)) {
                    $value = ('href' === $attr) ? esc_url($value) : esc_attr($value);
                    $attributes .= ' ' . $attr . '="' . $value . '"';
                }
            }

            // Render as a standard mega menu link
            $item_output = '<a' . $attributes . '>';
            $item_output .= apply_filters('the_title', $item->title, $item->ID);
            $item_output .= '</a>';

            // Collect this output to be printed *inside* the .column div (in end_lvl)
            $this->current_column_content .= $item_output;
        }
        // Level 3+ is ignored
    }

    /**
     * End Element: Closes the individual menu item.
     */
    function end_el(&$output, $item, $depth = 0, $args = null)
    {
        if ($depth === 0) {
            $output .= '</li>'; // Closes Level 0 <li>
        }
        // Levels 1 and 2 do not require closing </li> tags
    }
}