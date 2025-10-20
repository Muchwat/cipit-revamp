<?php
get_header();

// Determine search context
$context = isset($_GET['search_context']) ? sanitize_key($_GET['search_context']) : 'all';

// Configuration arrays
$content_labels = [
    'all' => 'all content',
    'books' => 'books & book chapters',
    'journal-articles' => 'journal articles',
    'policy-briefs' => 'policy briefs',
    'manuals' => 'manuals',
    'jipit' => 'JIPIT',
    'conference-papers' => 'conference papers',
    'blog' => 'blog posts',
    'podcast' => 'podcast episodes',
];

$book_related_contexts = ['books', 'journal-articles', 'policy-briefs', 'manuals', 'jipit', 'conference-papers'];

// Determine template configuration
$template_config = [
    'podcast' => ['template' => 'podcast-card', 'grid_class' => 'podcast-row'],
    'blog' => ['template' => 'blog-card', 'grid_class' => 'blog-posts'],
];

// Resolve template part and grid class
if (array_key_exists($context, $template_config)) {
    $template_part = $template_config[$context]['template'];
    $grid_class = $template_config[$context]['grid_class'];
} elseif (in_array($context, $book_related_contexts, true)) {
    $template_part = 'book-card';
    $grid_class = 'books-grid';
} else {
    $template_part = 'blog-card';
    $grid_class = 'blog-posts';
}

$content_type = $content_labels[$context] ?? 'content';
global $wp_query;

$search_query = get_search_query(); // already escaped by WP when echoing, but we'll esc_html when outputting
$trimmed_query = wp_trim_words($search_query, 3, '...');
?>

<div class="breadcrumbs">
    <div>
        <h3>Search Results</h3>
        <a href="<?php echo esc_url(home_url()); ?>">Home</a>
        <?php if ($context !== 'all' && isset($content_labels[$context])): ?>
            / <a href="<?php echo esc_url(home_url('/' . $context)); ?>">
                <?php echo ucwords(esc_html($content_labels[$context])); ?>
            </a>
        <?php endif; ?>
        / <span>Search</span>
    </div>
</div>


<section class="blog-header">
    <h1>Search Results for "<?php echo esc_html($trimmed_query); ?>"</h1>
    <p>Showing <?php echo esc_html($content_type); ?> that match your search.</p>
    <?php if (!empty($context) && !empty($content_labels[$context])): ?>
        <br>
        <div class="podcast-play-btn">
            <a class="play-btn"
                href="<?php echo esc_url($context === 'all' ? home_url('/') : home_url('/' . $context)); ?>">
                <i class="fas fa-arrow-left mr-2"></i>
                Back to
                <?php echo $context === 'all'
                    ? 'Home'
                    : esc_html($content_labels[$context] ?? 'Home'); ?>
            </a>
        </div>

    <?php endif; ?>

</section>

<main class="site-main container">
    <?php if ($wp_query->have_posts()): ?>
        <div class="<?php echo esc_attr($grid_class); ?>">
            <?php while ($wp_query->have_posts()):
                $wp_query->the_post(); ?>
                <?php get_template_part('template-parts/content', $template_part); ?>
            <?php endwhile; ?>
        </div>

        <div class="pagination">
            <?php
            echo paginate_links([
                'total' => $wp_query->max_num_pages,
                'current' => max(1, get_query_var('paged')),
                'prev_text' => '<i class="fas fa-chevron-left" aria-hidden="true"></i>',
                'next_text' => '<i class="fas fa-chevron-right" aria-hidden="true"></i>',
                'add_args' => ['search_context' => $context],
            ]);
            ?>
        </div>

        <?php wp_reset_postdata(); ?>
    <?php else: ?>
        <p class="no-results" style="text-align:center;padding:2.5rem 0;font-size:1.2rem;color:var(--secondary-color);">
            No <strong><?php echo esc_html($content_type); ?></strong> found for "<?php echo esc_html($search_query); ?>".
            Try another keyword.
        </p>
    <?php endif; ?>
</main>

<?php get_footer(); ?>