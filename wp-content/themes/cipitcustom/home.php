<?php
/* Template Name: Front Page */
get_header(); ?>

<!-- ============================
     HERO / SLIDER SECTION
============================= -->
<div class="jumbotron-slider">
    <div class="slider-wrapper">
        <?php
        $slides = new WP_Query(array(
            'post_type' => 'slide',
            'posts_per_page' => -1,
            'orderby' => 'menu_order',
            'order' => 'ASC'
        ));

        if ($slides->have_posts()):
            while ($slides->have_posts()):
                $slides->the_post();
                $bg = get_the_post_thumbnail_url(get_the_ID(), 'full');
                $button_text = get_post_meta(get_the_ID(), 'button_text', true);
                $button_link = get_post_meta(get_the_ID(), 'button_link', true);
                ?>
                <div class="slide" data-bg="<?php echo esc_url($bg); ?>">
                    <div class="svg-overlay"></div>
                    <div class="slide-content">
                        <h2><?php the_title(); ?></h2>
                        <p><?php the_content(); ?></p>
                        <?php if ($button_text): ?>
                            <a href="<?php echo esc_url($button_link ?: '#'); ?>" class="read-more-button">
                                <?php echo esc_html($button_text); ?>
                            </a>
                        <?php endif; ?>
                    </div>
                </div>
            <?php endwhile;
            wp_reset_postdata();
        endif;
        ?>
    </div>

    <div class="slider-dots"></div>
</div>

<!-- ============================
     About CIPIT SECTION
============================= -->
<section class="focus-areas">
    <div class="container">
        <h2 class="section-title">About CIPIT</h2>
        <p>The Centre for Intellectual Property and Information Technology Law (CIPIT) is a research and training center
            based at Strathmore University Law School in Nairobi, Kenya. Our work focuses on the intersection of law,
            technology, and innovation across Africa.</p><br>
        <p>We provide evidence-based research, capacity building, and policy engagement on issues surrounding data
            protection, artificial intelligence, digital rights, and IP law.</p><br>
        <p>Our Focus Areas:</p>
        <br>
        <div class="focus-grid">
            <div class="focus-card">
                <h4>Intellectual Property</h4>
                <p>Researching IP law, innovation, and its role in development across Africa.</p>
            </div>
            <div class="focus-card">
                <h4>Digital Rights</h4>
                <p>Promoting online freedoms and human rights in the digital ecosystem.</p>
            </div>
            <div class="focus-card">
                <h4>Artificial Intelligence</h4>
                <p>Exploring AI policy, ethics, and regulation from an African context.</p>
            </div>
            <div class="focus-card">
                <h4>Data Protection</h4>
                <p>Guiding the adoption of data privacy laws and best practices in Kenya and beyond.</p>
            </div>
        </div>
    </div>
</section>

<!-- ============================
     LATEST REPORT
============================= -->
<section class="reports-section">
    <div class="container">
        <h2 class="section-title">Latest Report</h2>
        <div class="report-card">
            <div class="report-content">
                <h3>Government Resilience in the Digital Age</h3>
                <p class="report-authors"><i>By Andres Raieste, Andri Rebane, Madis Tapupere, Keegan McBride</i></p>
                <p class="report-description">
                    In a world increasingly defined by crises—from pandemics and climate
                    disasters to escalating wars—governments that fail to build digital resilience risk crumbling
                    under pressure.
                </p>
                <a href="#" class="read-more-button">Read More</a>
            </div>
            <div class="report-image-container">
                <img src="https://placehold.co/300x400/C4E0F4/000?text=Report+Cover" alt="Report Cover"
                    class="report-cover-image">
            </div>
        </div>
    </div>
</section>

<!-- ============================
     LATEST PUBLICATIONS (books-grid reused)
============================= -->
<?php
$target_categories = ['books', 'reports', 'journal-articles', 'manuals'];
?>
<section class="latest-publications">
    <div class="container">
        <h2 class="section-title">Latest Publications</h2>
        <div class="books-grid">
            <?php
            foreach ($target_categories as $cat_slug):
                $query = new WP_Query([
                    'category_name' => $cat_slug,
                    'posts_per_page' => 1,
                    'ignore_sticky_posts' => true,
                ]);
                if ($query->have_posts()):
                    while ($query->have_posts()):
                        $query->the_post();
                        $category = get_the_category();
                        $category_name = $category ? $category[0]->name : ucfirst($cat_slug);
                        $category_link = $category ? get_category_link($category[0]->term_id) : '#';
                        ?>
                        <div class="book-card group">
                            <div class="book-cover">
                                <a href="<?php the_permalink(); ?>">
                                    <?php if (has_post_thumbnail()): ?>
                                        <?php the_post_thumbnail('medium', ['class' => 'w-full h-full object-cover rounded-md']); ?>
                                    <?php else: ?>
                                        <img src="https://placehold.co/640x830/EEE/AAA?text=No+Cover" alt="<?php the_title(); ?>"
                                            class="w-full h-full object-cover rounded-md">
                                    <?php endif; ?>
                                </a>
                            </div>
                            <div class="book-content">
                                <h5>
                                    <a href="<?php the_permalink(); ?>" class="hover:text-red-500 transition-colors">
                                        <?php the_title(); ?>
                                    </a>
                                </h5>
                                <p class="category-label text-sm text-gray-500">
                                    <a href="<?php echo esc_url($category_link); ?>" class="hover:text-red-500 transition-colors">
                                        <?php echo esc_html($category_name); ?>
                                    </a>
                                </p>
                                <a href="<?php the_permalink(); ?>" class="view-more">Click to view</a>
                            </div>
                        </div>
                    <?php endwhile;
                    wp_reset_postdata();
                endif;
            endforeach;
            ?>
        </div>
    </div>
</section>

<!-- ============================
     Resources SECTION
============================= -->
<section class="afri-resources-section">
    <div class="afri-container">
        <h2 class="afri-section-title">Resources</h2>
        <p>
            Explore our curated resources on technology policies, intellectual property, and digital rights in Africa.
        </p>

        <!-- Category Tabs -->
        <div class="blog-tags">
            <button class="tag-btn active" data-tab="databases">Databases</button>
            <button class="tag-btn" data-tab="websites">Websites</button>
            <button class="tag-btn" data-tab="dashboards">Dashboards</button>
        </div>

        <!-- Resource Grids Container -->
        <div class="afri-resources-content">
            <!-- Databases -->
            <div class="afri-tab-content focus-grid active" id="databases">
                <div class="focus-card">
                    <h4>ICT Policy</h4>
                    <p>All the TechPolicies around Africa.</p>
                </div>
                <div class="focus-card">
                    <h4>Trademarks</h4>
                    <p>A record of registered marks in Kenya.</p>
                </div>
                <div class="focus-card">
                    <h4>Granted Patents</h4>
                    <p>For ARIPO and Kenya Patents.</p>
                </div>
                <div class="focus-card">
                    <h4>CYRILLA Collaborative</h4>
                    <p>Database on Tech Policies in Africa.</p>
                </div>
            </div>

            <!-- Websites -->
            <div class="afri-tab-content focus-grid" id="websites">
                <div class="focus-card">
                    <h4>Digital ID Africa</h4>
                    <p>Research hub for digital identification systems in Africa.</p>
                </div>
                <div class="focus-card">
                    <h4>IP Watch Africa</h4>
                    <p>Tracking the latest developments in intellectual property law.</p>
                </div>
                <div class="focus-card">
                    <h4>AI4Policy</h4>
                    <p>AI resources, projects, and policy papers in the African context.</p>
                </div>
            </div>

            <!-- Dashboards -->
            <div class="afri-tab-content focus-grid" id="dashboards">
                <div class="focus-card">
                    <h4>AI Regulation Tracker</h4>
                    <p>Visual map showing African AI governance initiatives.</p>
                </div>
                <div class="focus-card">
                    <h4>Patent Analytics Dashboard</h4>
                    <p>Interactive dashboard of patent filings and trends in Africa.</p>
                </div>
                <div class="focus-card">
                    <h4>Digital Rights Monitor</h4>
                    <p>Tracks legislation and enforcement around digital rights in Africa.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        const tabButtons = document.querySelectorAll('.tag-btn');
        const tabContents = document.querySelectorAll('.afri-tab-content');

        tabButtons.forEach(button => {
            button.addEventListener('click', () => {
                const tabId = button.getAttribute('data-tab');

                // 1. Deactivate current active button
                const activeButton = document.querySelector('.tag-btn.active');
                if (activeButton) {
                    activeButton.classList.remove('active');
                }

                // 2. Hide current active content
                const activeContent = document.querySelector('.afri-tab-content.active');
                if (activeContent) {
                    activeContent.classList.remove('active');
                }

                // 3. Activate the clicked button
                button.classList.add('active');

                // 4. Show the corresponding content
                const nextContent = document.getElementById(tabId);
                if (nextContent) {
                    nextContent.classList.add('active');
                }
            });
        });
    });
</script>
<?php get_footer(); ?>