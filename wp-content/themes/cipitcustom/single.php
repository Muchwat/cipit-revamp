<?php
// single.php - Single Post Template
get_header();

if (have_posts()):
    while (have_posts()):
        the_post();

        // Get post type and its archive link
        $post_type = get_post_type();
        $post_type_obj = get_post_type_object($post_type);
        $post_type_name = $post_type_obj ? $post_type_obj->labels->singular_name : 'Post';
        $archive_link = $post_type_obj && !empty($post_type_obj->has_archive) ? get_post_type_archive_link($post_type) : '';

        // Get first category if available
        $categories = get_the_category();
        ?>

        <div class="breadcrumbs">
            <div>
                <h3><?php the_title(); ?></h3>
                <a href="<?php echo esc_url(home_url('/')); ?>">Home</a>

                <?php
                $categories = get_the_category();

                if ($archive_link):
                    // Custom post type archive case
                    ?>
                    / <a href="<?php echo esc_url($archive_link); ?>">
                        <?php echo esc_html($post_type_name); ?>
                    </a>
                <?php elseif (!empty($categories)):
                    $cat_name = strtolower($categories[0]->slug);

                    // Handle specific categories manually
                    if ($cat_name === 'books') {
                        $custom_link = home_url('/books/');
                    } elseif ($cat_name === 'blog') {
                        $custom_link = home_url('/blog/');
                    } else {
                        $custom_link = get_category_link($categories[0]->term_id);
                    }
                    ?>
                    / <a href="<?php echo esc_url($custom_link); ?>">
                        <?php echo esc_html($categories[0]->name); ?>
                    </a>
                <?php endif; ?>

                / <span><?php echo wp_trim_words(get_the_title(), 5, '...'); ?></span>
            </div>
        </div>


        <main class="site-main container">
            <article id="post-<?php the_ID(); ?>" <?php post_class('single-post'); ?>>

                <header class="single-post-header">
                    <h1 class="post-title"><?php the_title(); ?></h1>
                    <div class="post-meta-full">
                        <span><i class="far fa-calendar"></i> <?php echo get_the_date(); ?></span>
                        <span><i class="far fa-user"></i> <?php the_author(); ?></span>

                        <?php if (!empty($categories)): ?>
                            <span><i class="far fa-folder"></i> <?php echo esc_html($categories[0]->name); ?></span>
                        <?php endif; ?>

                        <span class="reading-time">
                            <i class="fas fa-clock"></i>
                            <?php echo round(str_word_count(strip_tags(get_the_content())) / 200); ?> min read
                        </span>
                    </div>
                </header>

                <div class="post-content">
                    <?php the_content(); ?>
                </div>

                <div class="post-footer">
                    <div class="post-tags">
                        <?php the_tags('Tags: ', ', ', ''); ?>
                    </div>

                    <div class="author-box">
                        <div class="author-avatar">
                            <?php echo get_avatar(get_the_author_meta('ID'), 80); ?>
                        </div>
                        <div class="author-info">
                            <h4>About <?php the_author(); ?></h4>
                            <p><?php the_author_meta('description'); ?></p>
                        </div>
                    </div>
                </div>

            </article>
        </main>

        <?php
    endwhile;
endif;

get_footer();
?>