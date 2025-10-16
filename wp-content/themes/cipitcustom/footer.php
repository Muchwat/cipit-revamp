<div class="newsletter">
    <h2>Stay Updated</h2>
    <p>Subscribe to our newsletter to receive the latest research, publications, and blog posts directly in your
        inbox.</p>
    <form class="newsletter-form">
        <input type="email" placeholder="Your email address" required>
        <button type="submit">Subscribe</button>
    </form>
</div>
</div>
<footer class="site-footer">
    <div class="footer-container">
        <div class="footer-about">
            <?php
            // Try footer logo first
            $footer_logo = get_theme_mod('footer_logo');

            if ($footer_logo) {
                echo '<img src="' . esc_url($footer_logo) . '" alt="CIPIT Footer Logo" class="footer-logo">';
            } elseif (has_custom_logo()) {
                // fallback to site logo
                $logo_id = get_theme_mod('custom_logo');
                $logo_url = wp_get_attachment_image_src($logo_id, 'full')[0];
                echo '<img src="' . esc_url($logo_url) . '" alt="CIPIT Logo" class="footer-logo">';
            } else {
                // final fallback
                $fallback_logo = get_template_directory_uri() . '/assets/images/logow.png';
                echo '<img src="' . esc_url($fallback_logo) . '" alt="CIPIT Logo" class="footer-logo"
            onerror="this.onerror=null;this.src=\'https://placehold.co/150x50/FFFFFF/b50509?text=CIPIT\';">';
            }
            ?>
            <br><br>
            <p>The Centre for Intellectual Property and Information Technology Law (CIPIT) is an evidence-based
                research and training Centre based at Strathmore University, Nairobi, Kenya.</p>
        </div>

        <div class="footer-contact">
            <h4>CONTACT US</h4>
            <p>
                Student Center Building,<br>
                2nd Floor,<br>
                Madaraka Estate Ole Sangale Road<br>
                City Square , Nairobi<br>
                P.O Box 59857 - 00200<br>
                Nairobi, Kenya<br>
                (+254) (0)703-034612<br>
                <a href="mailto:cipit@strathmore.edu">cipit@strathmore.edu</a>
            </p>
        </div>
        <div class="footer-links">
            <h4>Quick Links</h4>
            <ul>
                <li><a href="#Research">Research</a></li>
                <li><a href="#Study">Study</a></li>
                <li><a href="#People">People</a></li>
                <li><a href="#News">News & Events</a></li>
                <li><a href="#Contact">About</a></li>
            </ul>
        </div>
        <div class="footer-social">
            <h4>Follow Us</h4>
            <div class="social-icons">
                <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                <a href="#" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; <span id="copyright-year"></span> CIPIT. Except where otherwise noted, content on this site is
            licensed under a Creative
            Commons Attribution 4.0 International license.</p>
    </div>
</footer>

<?php wp_footer(); ?>
</body>

</html>