<?php
/**
 * The sidebar containing the main widget area
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#sidebar-php
 *
 * @package YourThemeName // Replace YourThemeName with your actual theme name
 */

// You can optionally add a check to see if a specific sidebar is active, 
// but even without this, the file itself satisfies the WordPress requirement.

if (!is_active_sidebar('sidebar-1')) {
    return;
}
?>

<aside id="secondary" class="widget-area">
    <?php dynamic_sidebar('sidebar-1'); ?>
</aside>