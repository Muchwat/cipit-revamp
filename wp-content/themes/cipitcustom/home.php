<?php
/* Template: Front Page */
get_header(); ?>

<div class="jumbotron-slider">
    <div class="slider-wrapper">
        <!-- data-bg attributes used by main.js to load background images -->
        <div class="slide" data-bg="/slider1.png">
            <div class="svg-overlay"></div>
            <div class="slide-content">
                <h2>Artificial Intelligence</h2>
                <p>We are studying the development of AI tools and applications on the african continent.</p>
                <a href="#" class="read-more-button">Learn More</a>
            </div>
        </div>
        <div class="slide" data-bg="/slider2.png">
            <div class="svg-overlay"></div>
            <div class="slide-content">
                <h2>Innovative Projects</h2>
                <p>Discover our latest work in AI, Data, and Digital Rights.</p>
                <a href="#" class="read-more-button">View Projects</a>
            </div>
        </div>
        <div class="slide" data-bg="/slider3.png">
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
</div>

<section class="reports-section">
    <div class="container">
        <h2>Latest report</h2>
        <div class="report-card">
            <div class="report-content">
                <h3>Government Resilience in the Digital Age</h3>
                <p class="report-authors"><i>By Andres Raieste, Andri Rebane, Madis Tapupere, Keegan McBride</i></p>
                <p class="report-description">In a world increasingly defined by crises—from pandemics and climate
                    disasters to escalating wars—governments that fail to build digital resilience risk crumbling
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

<div class="container">
    <section class="publications-section">
        <h2>Recent Publications</h2>
        <div class="publications-grid">
            <div class="publication-card">
                <img src="https://placehold.co/600x400/b50509/FFFFFF?text=Publication+Image" alt="Publication Image">
                <div class="publication-card-content">
                    <h3>The Ethics of Artificial Intelligence in Governance</h3>
                    <p>An in-depth analysis of the challenges and opportunities of implementing AI in public sector
                        services.</p>
                    <a href="#" class="read-more">Read More &rarr;</a>
                </div>
            </div>
            <div class="publication-card">
                <img src="https://placehold.co/600x400/b50509/FFFFFF?text=Publication+Image" alt="Publication Image">
                <div class="publication-card-content">
                    <h3>Cross-Border Data Flows and Privacy Regulations</h3>
                    <p>This paper examines the legal frameworks governing data transfer between nations and its
                        impact on privacy.</p>
                    <a href="#" class="read-more">Read More &rarr;</a>
                </div>
            </div>
            <div class="publication-card">
                <img src="https://placehold.co/600x400/b50509/FFFFFF?text=Publication+Image" alt="Publication Image">
                <div class="publication-card-content">
                    <h3>Cybersecurity Threats in the IoT Era</h3>
                    <p>A comprehensive overview of emerging security vulnerabilities in Internet of Things devices
                        and networks.</p>
                    <a href="#" class="read-more">Read More &rarr;</a>
                </div>
            </div>
        </div>
    </section>
    <section class="podcast-section">
        <div class="podcast-container">
            <h2 style="text-align:center; width: 100%;">Recent Podcasts</h2>
            <div class="podcast-grid">
                <div class="podcast-card">
                    <img src="https://placehold.co/120x120/555/FFF?text=Podcast" alt="Podcast Cover Art">
                    <div class="podcast-info">
                        <h3>Episode 12: The Future of Digital Identity</h3>
                        <p>A conversation on self-sovereign identity, blockchain, and the next wave of digital
                            verification.</p>
                        <!-- Note: fa-play-circle is used here, main.js toggles this -->
                        <a href="#" class="listen-now">Listen Now <i class="fas fa-play-circle"></i></a>
                    </div>
                </div>
                <div class="podcast-card">
                    <img src="https://placehold.co/120x120/555/FFF?text=Podcast" alt="Podcast Cover Art">
                    <div class="podcast-info">
                        <h3>Episode 11: AI in Creative Industries</h3>
                        <p>Exploring how artificial intelligence is transforming art, music, and storytelling.</p>
                        <a href="#" class="listen-now">Listen Now <i class="fas fa-play-circle"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>



    <?php get_footer(); ?>