<?php
class CIPIT_Mega_Menu_Walker extends Walker_Nav_Menu
{

    function start_lvl(&$output, $depth = 0, $args = null)
    {
        if ($depth === 0) {
            $output .= '<div class="mega-menu"><div class="mega-menu-inner">';
        } else {
            $output .= '<ul class="sub-menu">';
        }
    }

    function end_lvl(&$output, $depth = 0, $args = null)
    {
        if ($depth === 0) {
            $output .= '</div></div>';
        } else {
            $output .= '</ul>';
        }
    }

    function start_el(&$output, $item, $depth = 0, $args = null, $id = 0)
    {
        $classes = empty($item->classes) ? [] : (array) $item->classes;
        $class_names = join(' ', array_filter($classes));

        $output .= '<li class="' . esc_attr($class_names) . '">';

        $attributes = !empty($item->url) ? ' href="' . esc_attr($item->url) . '"' : '';
        $output .= '<a' . $attributes . '>' . esc_html($item->title) . '</a>';
    }

    function end_el(&$output, $item, $depth = 0, $args = null)
    {
        $output .= '</li>';
    }
}
