<!DOCTYPE html>
<html <?php language_attributes(); ?>>

<head>
    <meta charset="<?php bloginfo('charset'); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>

    <div class="container">
        <div class="top-header">
            <div class="top-header-left">
                <a href="#opportunities">Opportunities</a>
                <a href="#contact-us">Contact Us</a>
            </div>
            <div class="top-header-right">
                <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                <a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
            </div>
        </div>

        <nav>
            <div class="main-header">
                <div class="logo">
                    <img src="<?php echo get_template_directory_uri(); ?>/assets/images/logo.png" alt="CIPIT Logo"
                        onerror="this.onerror=null;this.src='https://placehold.co/150x50/b50509/FFFFFF?text=CIPIT';">
                </div>
                <div class="menu">
                    <button class="hamburger"><i class="fas fa-bars"></i></button>
                    <ul>
                        <li class="has-mega">
                            <a href="#Research">Research</a>
                            <div class="mega-menu">
                                <div class="column">
                                    <h4 class="menu-title">Our Research Themes</h4>
                                    <a href="artificial-intelligence.html">Artificial Intelligence</a>
                                    <a href="data-governance-and-policy.html">Data Governance & Policy</a>
                                    <a href="digital-identity.html">Digital Identity</a>
                                    <a href="ip-and-innovation.html">IP and Innovation</a>
                                    <a href="cyber-law-and-policy.html">Cyber Law & Policy</a>
                                </div>
                                <div class="column">
                                    <h4 class="menu-title">Learning and Development</h4>
                                    <a href="trainings.html">Trainings</a>
                                    <a href="writing-prizes.html">Writing Prizes</a>
                                    <a href="fellowships.html">Fellowships</a>
                                    <a href="jipit.html">JIPIT</a>
                                </div>
                            </div>
                        </li>
                        <li class="has-mega">
                            <a href="#Publications">Publications</a>
                            <div class="mega-menu">
                                <div class="column">
                                    <h4 class="menu-title">Publications</h4>
                                    <a href="books-and-chapters.html">Books and Book Chapters</a>
                                    <a href="journal-articles.html">Journal Articles</a>
                                    <a href="conference-papers.html">Conference Papers</a>
                                    <a href="policy-briefs.html">Policy Briefs</a>
                                    <a href="manuals.html">Manuals</a>
                                </div>
                            </div>
                        </li>
                        <li class="has-mega">
                            <a href="#News&Events">News & Events</a>
                            <div class="mega-menu">
                                <div class="column">
                                    <h4 class="menu-title">News & Events</h4>
                                    <a href="blog.html">Blog</a>
                                    <a href="podcasts.html">Podcasts</a>
                                </div>
                            </div>
                        </li>

                        <li class="has-mega">
                            <a href="#About">About Us</a>
                            <div class="mega-menu">
                                <div class="column">
                                    <h4 class="menu-title">About Us</h4>
                                    <a href="about-us.html">Who We Are</a>
                                    <a href="team.html">Team</a>
                                    <a href="steering-committee.html">Steering Committee</a>
                                    <a href="our-work.html">Our Work</a>
                                </div>
                            </div>
                        </li>
                        <li><a href="#search" class="search-icon-link" aria-label="Search"><i
                                    class="fas fa-search"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>