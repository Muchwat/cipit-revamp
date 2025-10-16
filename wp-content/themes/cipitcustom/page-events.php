<?php get_header(); ?>

<div class="breadcrumbs">
    <div>
        <h3>Events</h3>
        <a href="<?php echo esc_url(home_url('/')); ?>">Home</a> / <span>Events</span>
    </div>
</div>

<section class="events-header">
    <h1>CIPIT Events</h1>
    <p>Join us for workshops, conferences, webinars, and public lectures on intellectual property, information
        technology law, and digital policy in Africa</p>
</section>

<?php the_content(); ?>

<?php get_footer(); ?>