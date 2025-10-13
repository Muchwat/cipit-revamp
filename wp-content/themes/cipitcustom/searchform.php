<form role="search" method="get" class="search-bar" action="<?php echo esc_url(home_url('/')); ?>">
    <input type="search" class="search-field" placeholder="Search blog posts, topics, or authors..."
        value="<?php echo get_search_query(); ?>" name="s">
    <button type="submit"><i class="fas fa-search"></i> Search</button>
</form>