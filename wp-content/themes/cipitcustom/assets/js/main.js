/**
 * main.js
 * Contains all shared and page-specific JavaScript functionality.
 * Logic executes conditionally based on the presence of elements on the current page.
 */

// -----------------------------------------------------------------------------
// GLOBAL UTILITIES (Navigation & Copyright)
// -----------------------------------------------------------------------------

/**
 * Initializes the header navigation, handling both mobile hamburger toggle
 * and desktop/mobile mega menu interaction.
 */
function initNavigation() {
    const hamburger = document.querySelector(".hamburger");
    const navMenu = document.querySelector(".menu ul");
    const hasMegaElements = document.querySelectorAll(".has-mega");

    // 1. Hamburger Menu Toggle (Mobile)
    if (hamburger && navMenu) {
        hamburger.addEventListener("click", () => {
            navMenu.classList.toggle("active");
            // Close any open mega-menus when the main menu is toggled
            hasMegaElements.forEach(item => item.classList.remove('open'));
        });
    } else {
        console.warn("Navigation elements (hamburger or navMenu) not found.");
    }

    // 2. Mega Menu Hover (Desktop) and Click Toggle (Mobile)
    hasMegaElements.forEach(hasMega => {
        // Target direct children for mega-menu and link (selectors are resilient to theme structure)
        const megaMenu = hasMega.querySelector(":scope > .mega-menu");
        const megaLink = hasMega.querySelector(":scope > a");

        if (megaMenu && megaLink) {

            // Desktop hover behavior (window width > 992px)
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

                    // Close all other open mega-menus for accordion effect
                    hasMegaElements.forEach(item => {
                        if (item !== hasMega) {
                            item.classList.remove('open');
                        }
                    });

                    // Toggle the current menu
                    hasMega.classList.toggle('open');
                }
            });
        }
    });
}

document.addEventListener('DOMContentLoaded', () => {
    const searchIcon = document.querySelector('.search-icon-link');
    const nav = document.querySelector('nav');
    const searchInput = document.querySelector('.search-input');

    if (!searchIcon || !nav || !searchInput) return;

    // Toggle search mode
    searchIcon.addEventListener('click', (e) => {
        e.preventDefault();
        nav.classList.toggle('nav-search-active');
        if (nav.classList.contains('nav-search-active')) {
            searchInput.focus();
        } else {
            searchInput.blur();
        }
    });

    // Close when clicking outside
    document.addEventListener('click', (e) => {
        if (!nav.contains(e.target) && nav.classList.contains('nav-search-active')) {
            nav.classList.remove('nav-search-active');
        }
    });

    // Optional: close on ESC key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && nav.classList.contains('nav-search-active')) {
            nav.classList.remove('nav-search-active');
        }
    });
});

// -----------------------------------------------------------------------------
// INDEX PAGE LOGIC (Jumbotron Slider & Podcast Player)
// -----------------------------------------------------------------------------

/**
 * Initializes the automatic, dot-controlled jumbotron slider.
 */
function initJumbotronSlider() {
    const sliderWrapper = document.querySelector('.slider-wrapper');
    const slides = document.querySelectorAll('.jumbotron-slider .slide');
    const dots = document.querySelectorAll('.jumbotron-slider .dot');
    const slideCount = slides.length;
    let currentIndex = 0;
    const autoAdvanceInterval = 5000;

    if (!sliderWrapper || slides.length === 0) return;

    // Set background images using data-bg attribute
    slides.forEach(slide => {
        const bgImage = slide.getAttribute('data-bg') || 'https://placehold.co/1200x500/b50509/FFFFFF?text=Slide';
        slide.style.backgroundImage = `url(${bgImage})`;
    });

    /**
     * Transitions to a specific slide index and manages active states.
     * @param {number} index - The index of the slide to show.
     */
    function goToSlide(index) {
        // Loop back to start/end
        if (index < 0) {
            index = slideCount - 1;
        } else if (index >= slideCount) {
            index = 0;
        }
        currentIndex = index;

        // Move slider
        sliderWrapper.style.transform = `translateX(-${index * 100}%)`;

        // Manage 'active' class for slides
        slides.forEach(slide => slide.classList.remove('active'));
        slides[currentIndex].classList.add('active');

        // Force reflow/repaint to restart CSS animation (for slide content)
        const activeContent = slides[currentIndex].querySelector('.slide-content');
        if (activeContent) {
            activeContent.style.opacity = '1';
            activeContent.style.zIndex = '10';
            void activeContent.offsetWidth; // Force repaint
        }

        // Update dots
        dots.forEach(dot => dot.classList.remove('active'));
        if (dots[currentIndex]) dots[currentIndex].classList.add('active');
    }

    // Initial setup
    goToSlide(0);

    // Dot click listeners
    dots.forEach((dot, index) => {
        dot.addEventListener('click', () => goToSlide(index));
    });

    // Auto-advance
    setInterval(() => goToSlide(currentIndex + 1), autoAdvanceInterval);
}

// -----------------------------------------------------------------------------
// DYNAMIC DOT GENERATION (non-intrusive pre-step)
// -----------------------------------------------------------------------------

document.addEventListener('DOMContentLoaded', () => {
    const jumbotron = document.querySelector('.jumbotron-slider');
    if (!jumbotron) return;

    const slides = jumbotron.querySelectorAll('.slide');
    const dotsContainer = jumbotron.querySelector('.slider-dots');

    if (!dotsContainer || slides.length === 0) return;

    // Clear existing dots (avoid duplicates)
    dotsContainer.innerHTML = '';

    // Dynamically generate dots to match slides
    slides.forEach((_, index) => {
        const dot = document.createElement('span');
        dot.classList.add('dot');
        if (index === 0) dot.classList.add('active');
        dotsContainer.appendChild(dot);
    });

    // Initialize slider AFTER dots exist
    initJumbotronSlider();
});



// -----------------------------------------------------------------------------
// BLOG PAGE LOGIC (AJAX Filtering)
// -----------------------------------------------------------------------------

jQuery(document).ready(function ($) {
    // This entire block runs only if jQuery is present (typical of WordPress environments)
    // Assumes my_ajax_object is localized in functions.php
    const ajaxurl = my_ajax_object.ajax_url;

    const $filterButtons = $('#blog-tag-filter .tag-btn');
    const $postsContainer = $('.blog-posts');
    const postsPerLoad = 6;

    /**
     * Fetches and replaces blog posts based on the selected tag and page number.
     * @param {string} tagSlug - The slug of the tag to filter by.
     * @param {number} page - The page number to load.
     */
    function filterPosts(tagSlug, page = 1) {
        // Show a loading indicator while fetching data
        $postsContainer.html('<div class="loading-indicator" style="text-align:center; padding: 50px;">Loading...</div>');

        $.ajax({
            url: ajaxurl,
            type: 'POST',
            data: {
                action: 'filter_blog_posts',
                tag: tagSlug,
                paged: page,
                posts_per_page: postsPerLoad
            },
            success: function (response) {
                $postsContainer.html(response);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error("AJAX Error: ", textStatus, errorThrown);
                $postsContainer.html('<p style="text-align:center;">Sorry, we could not load the posts. Check console for details.</p>');
            }
        });
    }

    // Event Listener for Tag Filter Buttons
    $filterButtons.on('click', function () {
        const $this = $(this);
        const tagSlug = $this.data('slug');

        // 1. Update active button state
        $filterButtons.removeClass('active');
        $this.addClass('active');

        // 2. Run the filter function (resetting to page 1)
        filterPosts(tagSlug, 1);
    });
});


/**
 * Initializes the play/pause button toggle for the podcast section on the index page.
 */
function initPodcastControls() {
    const playButtons = document.querySelectorAll('.listen-now');

    playButtons.forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            // In a real app, this would control audio playback.
            console.log(`Simulating playing podcast: ${this.closest('.podcast-card').querySelector('h3').textContent}`);

            const icon = this.querySelector('i');
            // Simple visual toggle
            if (icon.classList.contains('fa-play-circle')) {
                icon.classList.remove('fa-play-circle');
                icon.classList.add('fa-pause-circle');
            } else {
                icon.classList.remove('fa-pause-circle');
                icon.classList.add('fa-play-circle');
            }
        });
    });
}


// -----------------------------------------------------------------------------
// LISTING PAGES LOGIC (Blog, Books, etc.)
// -----------------------------------------------------------------------------

/**
 * Initializes category filtering logic for listing pages.
 */
function initCategoryFilters() {
    const categoryBtns = document.querySelectorAll('.category-btn');
    if (categoryBtns.length > 0) {
        categoryBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                categoryBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');

                // Placeholder for actual content filtering logic
                console.log(`Filtering content by category: ${btn.textContent}`);
            });
        });
    }
}

/**
 * Initializes search bar form submission logic.
 */
function initSearchBar() {
    const searchForm = document.querySelector('.search-bar');
    if (searchForm) {
        searchForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const searchTerm = searchForm.querySelector('input').value;
            if (searchTerm.trim() !== '') {
                console.log(`Searching for: "${searchTerm}". (Form submission prevented)`);
                // Add actual search handling here (e.g., redirect or AJAX)
            }
        });
    }
}


// -----------------------------------------------------------------------------
// TEAM PAGE LOGIC (Modal Display)
// -----------------------------------------------------------------------------

/**
 * Initializes the interactive team modal functionality.
 */
function initTeamModal() {
    const modal = document.getElementById("teamModal");
    const closeModal = document.getElementById("closeModal");

    // Modal content elements
    const modalName = document.getElementById("modalName");
    const modalPosition = document.getElementById("modalPosition");
    const modalBio = document.getElementById("modalBio");
    const modalPhoto = document.getElementById("modalPhoto");
    const modalInitials = document.getElementById("modalInitials");
    const modalLinkedin = document.getElementById("modalLinkedin");
    const modalEmail = document.getElementById("modalEmail");

    // Click handler for all team cards
    document.querySelectorAll(".team-card").forEach(card => {
        card.addEventListener("click", () => {
            // Retrieve data attributes
            const { name, position, photo, bio, linkedin, email, initials } = card.dataset;

            // Populate text fields
            modalName.textContent = name;
            modalPosition.textContent = position || '';

            // Handle bio content (supports line breaks from data attribute)
            if (bio && bio.trim() !== '') {
                modalBio.innerHTML = '<p>' + bio.replace(/\n/g, '</p><p>') + '</p>';
            } else {
                modalBio.innerHTML = '<p class="text-gray-500 italic">No detailed biography available.</p>';
            }

            // Handle photo/initials display
            if (photo) {
                modalPhoto.src = photo;
                modalPhoto.alt = name;
                modalPhoto.classList.remove('hidden');
                modalInitials.classList.add('hidden');
            } else {
                modalPhoto.classList.add('hidden');
                modalInitials.classList.remove('hidden');
                modalInitials.textContent = initials;
            }

            // Handle social links visibility
            if (linkedin) {
                modalLinkedin.href = linkedin;
                modalLinkedin.classList.remove("hidden");
            } else {
                modalLinkedin.classList.add("hidden");
            }

            if (email) {
                modalEmail.href = "mailto:" + email;
                modalEmail.classList.remove("hidden");
            } else {
                modalEmail.classList.add("hidden");
            }

            // Show modal and disable background scrolling
            modal.classList.add("active");
            document.body.style.overflow = 'hidden';
        });
    });

    // Close Modal Logic handler
    const closeHandler = () => {
        modal.classList.remove("active");
        document.body.style.overflow = '';
    };

    closeModal.addEventListener("click", closeHandler);

    // Close when clicking the overlay area
    modal.addEventListener("click", e => {
        if (e.target === modal) {
            closeHandler();
        }
    });

    // Close on ESC key press
    document.addEventListener('keydown', e => {
        if (e.key === 'Escape' && modal && modal.classList.contains('active')) {
            closeHandler();
        }
    });
}


// -----------------------------------------------------------------------------
// FEATURED CONTENT SLIDER (Books/Posts/Podcast)
// -----------------------------------------------------------------------------

/**
 * Initializes the featured content slider with navigation, controls, and indicators.
 */
function initFeaturedContentSlider() {
    const sliderContainer = document.getElementById('featured-slider-container');
    const slider = document.getElementById('featured-slider');
    const prevButton = document.getElementById('prev-slide');
    const nextButton = document.getElementById('next-slide');
    const indicatorsContainer = document.getElementById('slide-indicators');
    const slides = slider.querySelectorAll('.featured-post');
    const totalSlides = slides.length;
    let currentSlide = 0;
    let indicatorElements = [];

    // Hide controls if only one slide exists
    if (totalSlides <= 1) {
        if (prevButton) prevButton.style.display = 'none';
        if (nextButton) nextButton.style.display = 'none';
        if (indicatorsContainer) indicatorsContainer.style.display = 'none';
        return;
    }

    // 1. Create Indicators
    for (let i = 0; i < totalSlides; i++) {
        const indicator = document.createElement('span');
        indicator.classList.add('w-3', 'h-3', 'rounded-full', 'cursor-pointer', 'transition-all', 'duration-300', 'ease-in-out');
        indicator.style.backgroundColor = '#d1d5db'; // Inactive gray
        indicator.setAttribute('data-slide-index', i);
        indicatorsContainer.appendChild(indicator);
        indicatorElements.push(indicator);

        indicator.addEventListener('click', () => moveToSlide(i));
    }

    // 2. Transitions to a specific slide index
    function moveToSlide(index) {
        currentSlide = (index + totalSlides) % totalSlides; // Wrap around logic
        const offset = -currentSlide * 100;
        slider.style.transform = `translateX(${offset}%)`;
        updateIndicators();
    }

    // 3. Updates active indicator appearance
    function updateIndicators() {
        indicatorElements.forEach((indicator, index) => {
            if (index === currentSlide) {
                indicator.style.backgroundColor = '#b50509'; // Active red
                indicator.style.transform = 'scale(1.3)';
            } else {
                indicator.style.backgroundColor = '#d1d5db'; // Inactive gray
                indicator.style.transform = 'scale(1)';
            }
        });
    }

    // 4. Attach Button Listeners
    prevButton.addEventListener('click', () => moveToSlide(currentSlide - 1));
    nextButton.addEventListener('click', () => moveToSlide(currentSlide + 1));

    // 5. Intersection Observer fallback (to detect slide changes on swipe/drag)
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const visibleIndex = Array.from(slides).indexOf(entry.target);
                if (visibleIndex !== currentSlide) {
                    currentSlide = visibleIndex;
                    updateIndicators();
                }
            }
        });
    }, { threshold: 0.6 });

    slides.forEach(slide => observer.observe(slide));

    // 6. Initial Setup
    moveToSlide(0);
}

// -----------------------------------------------------------------------------
// MAIN INITIALIZATION ON DOCUMENT LOAD
// -----------------------------------------------------------------------------

document.addEventListener('DOMContentLoaded', () => {
    // 1. Initialize Common/Global Elements
    initNavigation();
    updateCopyrightYear();

    // 2. Initialize Page-Specific Scripts Conditionally

    // Index Page
    if (document.querySelector('.jumbotron-slider')) {
        initJumbotronSlider();
    }
    if (document.querySelector('.podcast-section')) {
        initPodcastControls();
    }

    // Listing Pages (Blog/Books)
    if (document.querySelector('.blog-categories') || document.querySelector('.book-categories')) {
        initCategoryFilters();
        initSearchBar();
    }

    // Team Page
    if (document.querySelector('.team-grid')) {
        initTeamModal();
    }

    // Featured Content Slider (e.g., on books.html)
    if (document.getElementById('featured-slider-container')) {
        initFeaturedContentSlider();
    }
});

/**
 * Updates the footer copyright year to the current year.
 */
function updateCopyrightYear() {
    const yearElement = document.getElementById('copyright-year');
    if (yearElement) {
        yearElement.textContent = new Date().getFullYear();
    }
}

document.addEventListener('DOMContentLoaded', () => {
    const categoryButtons = document.querySelectorAll('.category-btn');
    const resourceTabs = document.querySelectorAll('.resource-tab');

    if (!categoryButtons.length || !resourceTabs.length) return;

    // Show only active tab on load
    const activeButton = document.querySelector('.category-btn.active');
    const defaultTab = activeButton
        ? activeButton.getAttribute('data-tab')
        : categoryButtons[0].getAttribute('data-tab');

    resourceTabs.forEach(tab => {
        tab.classList.toggle('active', tab.id === defaultTab);
    });

    // Handle clicks
    categoryButtons.forEach(button => {
        button.addEventListener('click', () => {
            const targetTab = button.getAttribute('data-tab');

            // Update active button
            categoryButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');

            // Show corresponding tab
            resourceTabs.forEach(tab => {
                tab.classList.toggle('active', tab.id === targetTab);
            });
        });
    });
});
