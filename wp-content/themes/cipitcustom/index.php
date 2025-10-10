<?php get_header(); ?>

<div class="jumbotron-slider">
    <div class="slider-wrapper">
        <div class="slide" data-bg="<?php echo get_template_directory_uri(); ?>/assets/images/slider1.png">
            <div class="svg-overlay"></div>
            <div class="slide-content">
                <h2>Artificial Intelligence</h2>
                <p>We are studying the development of AI tools and applications on the African continent.</p>
                <a href="#" class="read-more-button">Learn More</a>
            </div>
        </div>
        <div class="slide" data-bg="<?php echo get_template_directory_uri(); ?>/assets/images/slider2.png">
            <div class="svg-overlay"></div>
            <div class="slide-content">
                <h2>Innovative Projects</h2>
                <p>Discover our latest work in AI, Data, and Digital Rights.</p>
                <a href="#" class="read-more-button">View Projects</a>
            </div>
        </div>
        <div class="slide" data-bg="<?php echo get_template_directory_uri(); ?>/assets/images/slider3.png">
            <div class="svg-overlay"></div>
            <div class="slide-content">
                <h2>Join Our Community</h2>
                <p>Engage with us through events, workshops, and collaborations.</p>
                <a href="#" class="read-more-button">Get Involved</a>
            </div>
        </div>
    </div>
    <div class="slider-dots">
        <span class="dot active"></span>
        <span class="dot"></span>
        <span class="dot"></span>
    </div>
</div>

<section class="reports-section">
    <div class="container">
        <h2>Latest report</h2>
        <div class="report-card">
            <div class="report-content">
                <h3>Government Resilience in the Digital Age</h3>
                <p class="report-authors"><i>By Andres Raieste, Andri Rebane, Madis Tapupere, Keegan McBride</i></p>
                <p class="report-description">In a world increasingly defined by crises — from pandemics and climate
                    disasters to escalating wars — governments that fail to build digital resilience risk crumbling
                    under pressure.</p>
                <a href="#" class="read-more-button">Read More</a>
            </div>
            <div class="report-image-container">
                <img src="https://placehold.co/300x400/C4E0F4/000?text=Report+Cover" alt="Report Cover"
                    class="report-cover-image">
            </div>
        </div>
    </div>
</section>

<section class="publications-section">
    <div class="container">
        <h2>Recent Publications</h2>
        <div class="publications-grid">
            <!-- ... your publication cards ... -->
        </div>
    </div>
</section>

<section class="podcast-section">
    <div class="podcast-container">
        <h2 style="text-align:center; width: 100%;">Recent Podcasts</h2>
        <!-- ... podcast cards ... -->
    </div>
</section>

<?php get_footer(); ?>