/**
 * main.js
 * * Contains all shared and page-specific JavaScript for the CIPIT website.
 * Logic is executed conditionally based on the presence of elements on the current page.
 */

// --- GLOBAL UTILITIES ---

/**
 * Initializes the common navigation features (hamburger menu and mega menu functionality).
 */
function initNavigation() {
    const hamburger = document.querySelector(".hamburger");
    const navMenu = document.querySelector(".menu ul");
    const hasMegaElements = document.querySelectorAll(".has-mega");

    // 1. Hamburger Menu Toggle
    if (hamburger && navMenu) {
        hamburger.addEventListener("click", () => {
            navMenu.classList.toggle("active");
        });
    } else {
        console.warn("Navigation elements (hamburger or navMenu) not found.");
    }

    // 2. Mega Menu Hover (Desktop) and Click Toggle (Mobile)
    hasMegaElements.forEach(hasMega => {
        const megaMenu = hasMega.querySelector(".mega-menu");
        const megaLink = hasMega.querySelector("a");

        if (megaMenu && megaLink) {
            // Desktop hover behavior
            hasMega.addEventListener("mouseenter", () => {
                if (window.innerWidth > 992) {
                    megaMenu.classList.add("active");
                    megaLink.classList.add("active-mega");
                }
            });

            hasMega.addEventListener("mouseleave", () => {
                if (window.innerWidth > 992) {
                    megaMenu.classList.remove("active");
                    megaLink.classList.remove("active-mega");
                }
            });

            // Mobile click behavior (toggles the mega menu open/close)
            megaLink.addEventListener('click', (e) => {
                if (window.innerWidth <= 992) {
                    e.preventDefault();
                    hasMega.classList.toggle('open');
                }
            });
        }
    });
}

/**
 * Updates the footer copyright year.
 */
function updateCopyrightYear() {
    const yearElement = document.getElementById('copyright-year');
    if (yearElement) {
        yearElement.textContent = new Date().getFullYear();
    }
}

// --- INDEX PAGE (SLIDER & PODCAST) LOGIC ---

function initJumbotronSlider() {
    const sliderWrapper = document.querySelector('.slider-wrapper');
    const slides = document.querySelectorAll('.jumbotron-slider .slide');
    const dots = document.querySelectorAll('.jumbotron-slider .dot');
    const slideCount = slides.length;
    let currentIndex = 0;

    if (!sliderWrapper || slides.length === 0) return;

    // Set background images (simulated data-bg loading)
    slides.forEach(slide => {
        const bgImage = slide.getAttribute('data-bg') || 'https://placehold.co/1200x500/b50509/FFFFFF?text=Slide';
        slide.style.backgroundImage = `url(${bgImage})`;
    });

    /**
     * Transitions to a specific slide index.
     * @param {number} index - The index of the slide to show.
     */
    function goToSlide(index) {
        if (index < 0) {
            index = slideCount - 1;
        } else if (index >= slideCount) {
            index = 0;
        }
        currentIndex = index;

        sliderWrapper.style.transform = `translateX(-${index * 100}%)`;

        slides.forEach(slide => {
            slide.classList.remove('active');
            // Reset content animation properties
            const content = slide.querySelector('.slide-content');
            if (content) {
                content.style.opacity = '0';
                content.style.zIndex = '1';
                content.querySelectorAll('h2, p, .btn').forEach(el => {
                    el.style.opacity = '0';
                    el.style.transform = 'translateY(20px)';
                });
            }
        });

        const activeSlide = slides[currentIndex];
        activeSlide.classList.add('active');

        // Force reflow/repaint to restart CSS animation
        const activeContent = activeSlide.querySelector('.slide-content');
        if (activeContent) {
            activeContent.style.opacity = '1';
            activeContent.style.zIndex = '10';
            void activeContent.offsetWidth;
        }

        dots.forEach(dot => dot.classList.remove('active'));
        dots[currentIndex].classList.add('active');
    }

    // Initialize: Set the first slide as active
    slides[0].classList.add('active');
    const firstContent = slides[0].querySelector('.slide-content');
    if (firstContent) {
        firstContent.style.opacity = '1';
        firstContent.style.zIndex = '10';
        void firstContent.offsetWidth;
    }
    dots[0].classList.add('active');

    // Dot click listeners
    dots.forEach((dot, index) => {
        dot.addEventListener('click', () => {
            goToSlide(index);
        });
    });

    // Auto-advance
    setInterval(() => {
        goToSlide(currentIndex + 1);
    }, 5000);
}

/**
 * Initializes the play/pause button toggle for the podcast section (index.html).
 */
function initPodcastControls() {
    const playButtons = document.querySelectorAll('.listen-now');

    playButtons.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            // In a real app, this would start/pause audio. Here we simulate the effect.
            console.log(`Simulating playing podcast: ${this.closest('.podcast-card').querySelector('h3').textContent}`);

            const icon = this.querySelector('i');
            // Simple visual toggle for demonstration
            if (icon.classList.contains('fa-play-circle')) {
                icon.classList.remove('fa-play-circle');
                icon.classList.add('fa-pause-circle');
                console.log("-> Paused/Stopped");
            } else {
                icon.classList.remove('fa-pause-circle');
                icon.classList.add('fa-play-circle');
                console.log("-> Playing...");
            }
        });
    });
}


// --- BLOG/BOOKS PAGE LOGIC ---

/**
 * Initializes category filtering logic for Blog and Books pages.
 */
function initCategoryFilters() {
    const categoryBtns = document.querySelectorAll('.category-btn');
    if (categoryBtns.length > 0) {
        categoryBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                categoryBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');

                // In a full application, this would trigger content filtering
                console.log(`Filtering content by category: ${btn.textContent}`);
            });
        });
    }
}

/**
 * Initializes search bar logic for Blog and Books pages.
 */
function initSearchBar() {
    const searchForm = document.querySelector('.search-bar');
    if (searchForm) {
        searchForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const searchTerm = searchForm.querySelector('input').value;
            if (searchTerm.trim() !== '') {
                // Replacing banned alert() with console.log
                console.log(`Searching for: "${searchTerm}". (Form submission prevented)`);
            }
        });
    }
}

// --- MAIN INITIALIZATION ON DOCUMENT LOAD ---
document.addEventListener('DOMContentLoaded', () => {
    // 1. Always initialize common elements
    initNavigation();
    updateCopyrightYear();

    // 2. Initialize page-specific scripts conditionally

    // Index.html (Slider and Podcast)
    if (document.querySelector('.jumbotron-slider')) {
        initJumbotronSlider();
    }
    if (document.querySelector('.podcast-section')) {
        // Font Awesome is assumed to be loaded for the icons
        initPodcastControls();
    }

    // Blog.html or books-and-chapters.html (Category and Search)
    if (document.querySelector('.blog-categories') || document.querySelector('.book-categories')) {
        initCategoryFilters();
        initSearchBar();
    }
});
