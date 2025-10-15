-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 15, 2025 at 10:38 AM
-- Server version: 9.3.0
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cipit_revamp`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `comment_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint UNSIGNED NOT NULL,
  `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2025-10-10 09:02:03', '2025-10-10 09:02:03', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com/\">Gravatar</a>.', 0, 'post-trashed', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'cron', 'a:11:{i:1760526122;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1760526129;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1760562132;a:1:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1760565722;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1760567522;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1760605329;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1760605332;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1760605336;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1760778129;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1760865865;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'on'),
(2, 'siteurl', 'https://cipit.revamp.org.test', 'on'),
(3, 'home', 'https://cipit.revamp.org.test', 'on'),
(4, 'blogname', 'CIPIT', 'on'),
(5, 'blogdescription', '', 'on'),
(6, 'users_can_register', '0', 'on'),
(7, 'admin_email', 'kevinmuchwat@gmail.com', 'on'),
(8, 'start_of_week', '1', 'on'),
(9, 'use_balanceTags', '0', 'on'),
(10, 'use_smilies', '1', 'on'),
(11, 'require_name_email', '1', 'on'),
(12, 'comments_notify', '1', 'on'),
(13, 'posts_per_rss', '10', 'on'),
(14, 'rss_use_excerpt', '0', 'on'),
(15, 'mailserver_url', 'mail.example.com', 'on'),
(16, 'mailserver_login', 'login@example.com', 'on'),
(17, 'mailserver_pass', '', 'on'),
(18, 'mailserver_port', '110', 'on'),
(19, 'default_category', '1', 'on'),
(20, 'default_comment_status', 'open', 'on'),
(21, 'default_ping_status', 'open', 'on'),
(22, 'default_pingback_flag', '1', 'on'),
(23, 'posts_per_page', '10', 'on'),
(24, 'date_format', 'F j, Y', 'on'),
(25, 'time_format', 'g:i a', 'on'),
(26, 'links_updated_date_format', 'F j, Y g:i a', 'on'),
(27, 'comment_moderation', '0', 'on'),
(28, 'moderation_notify', '1', 'on'),
(29, 'permalink_structure', '/%postname%/', 'on'),
(30, 'rewrite_rules', 'a:111:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:40:\"vc_grid_item/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"vc_grid_item/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"vc_grid_item/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"vc_grid_item/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"vc_grid_item/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:46:\"vc_grid_item/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:29:\"vc_grid_item/([^/]+)/embed/?$\";s:45:\"index.php?vc_grid_item=$matches[1]&embed=true\";s:33:\"vc_grid_item/([^/]+)/trackback/?$\";s:39:\"index.php?vc_grid_item=$matches[1]&tb=1\";s:41:\"vc_grid_item/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?vc_grid_item=$matches[1]&paged=$matches[2]\";s:48:\"vc_grid_item/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?vc_grid_item=$matches[1]&cpage=$matches[2]\";s:37:\"vc_grid_item/([^/]+)(?:/([0-9]+))?/?$\";s:51:\"index.php?vc_grid_item=$matches[1]&page=$matches[2]\";s:29:\"vc_grid_item/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"vc_grid_item/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"vc_grid_item/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"vc_grid_item/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"vc_grid_item/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:35:\"vc_grid_item/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:13:\"favicon\\.ico$\";s:19:\"index.php?favicon=1\";s:12:\"sitemap\\.xml\";s:24:\"index.php??sitemap=index\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'on'),
(31, 'hack_file', '0', 'on'),
(32, 'blog_charset', 'UTF-8', 'on'),
(33, 'moderation_keys', '', 'off'),
(34, 'active_plugins', 'a:3:{i:0;s:33:\"classic-editor/classic-editor.php\";i:1;s:32:\"duplicate-page/duplicatepage.php\";i:2;s:27:\"js_composer/js_composer.php\";}', 'on'),
(35, 'category_base', '', 'on'),
(36, 'ping_sites', 'https://rpc.pingomatic.com/', 'on'),
(37, 'comment_max_links', '2', 'on'),
(38, 'gmt_offset', '0', 'on'),
(39, 'default_email_category', '1', 'on'),
(40, 'recently_edited', 'a:3:{i:0;s:77:\"/Volumes/Work Space/cipit.revamp.org/wp-content/themes/cipitcustom/header.php\";i:1;s:76:\"/Volumes/Work Space/cipit.revamp.org/wp-content/themes/cipitcustom/style.css\";i:2;s:0:\"\";}', 'off'),
(41, 'template', 'cipitcustom', 'on'),
(42, 'stylesheet', 'cipitcustom', 'on'),
(43, 'comment_registration', '0', 'on'),
(44, 'html_type', 'text/html', 'on'),
(45, 'use_trackback', '0', 'on'),
(46, 'default_role', 'subscriber', 'on'),
(47, 'db_version', '60421', 'on'),
(48, 'uploads_use_yearmonth_folders', '1', 'on'),
(49, 'upload_path', '', 'on'),
(50, 'blog_public', '1', 'on'),
(51, 'default_link_category', '2', 'on'),
(52, 'show_on_front', 'posts', 'on'),
(53, 'tag_base', '', 'on'),
(54, 'show_avatars', '1', 'on'),
(55, 'avatar_rating', 'G', 'on'),
(56, 'upload_url_path', '', 'on'),
(57, 'thumbnail_size_w', '150', 'on'),
(58, 'thumbnail_size_h', '150', 'on'),
(59, 'thumbnail_crop', '1', 'on'),
(60, 'medium_size_w', '300', 'on'),
(61, 'medium_size_h', '300', 'on'),
(62, 'avatar_default', 'mystery', 'on'),
(63, 'large_size_w', '1024', 'on'),
(64, 'large_size_h', '1024', 'on'),
(65, 'image_default_link_type', 'none', 'on'),
(66, 'image_default_size', '', 'on'),
(67, 'image_default_align', '', 'on'),
(68, 'close_comments_for_old_posts', '0', 'on'),
(69, 'close_comments_days_old', '14', 'on'),
(70, 'thread_comments', '1', 'on'),
(71, 'thread_comments_depth', '5', 'on'),
(72, 'page_comments', '0', 'on'),
(73, 'comments_per_page', '50', 'on'),
(74, 'default_comments_page', 'newest', 'on'),
(75, 'comment_order', 'asc', 'on'),
(76, 'sticky_posts', 'a:3:{i:0;i:56;i:1;i:75;i:2;i:84;}', 'on'),
(77, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'auto'),
(78, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'auto'),
(79, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'auto'),
(80, 'uninstall_plugins', 'a:0:{}', 'off'),
(81, 'timezone_string', '', 'on'),
(82, 'page_for_posts', '0', 'on'),
(83, 'page_on_front', '0', 'on'),
(84, 'default_post_format', '0', 'on'),
(85, 'link_manager_enabled', '0', 'on'),
(86, 'finished_splitting_shared_terms', '1', 'on'),
(87, 'site_icon', '0', 'on'),
(88, 'medium_large_size_w', '768', 'on'),
(89, 'medium_large_size_h', '0', 'on'),
(90, 'wp_page_for_privacy_policy', '3', 'on'),
(91, 'show_comments_cookies_opt_in', '1', 'on'),
(92, 'admin_email_lifespan', '1775638922', 'on'),
(93, 'disallowed_keys', '', 'off'),
(94, 'comment_previously_approved', '1', 'on'),
(95, 'auto_plugin_theme_update_emails', 'a:0:{}', 'off'),
(96, 'auto_update_core_dev', 'enabled', 'on'),
(97, 'auto_update_core_minor', 'enabled', 'on'),
(98, 'auto_update_core_major', 'enabled', 'on'),
(99, 'wp_force_deactivated_plugins', 'a:0:{}', 'on'),
(100, 'wp_attachment_pages_enabled', '0', 'on'),
(101, 'initial_db_version', '60421', 'on'),
(102, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:63:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:23:\"manage_zip_ai_assistant\";b:1;s:26:\"manage_ast_block_templates\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:35:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:23:\"manage_zip_ai_assistant\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'on'),
(103, 'fresh_site', '0', 'off'),
(104, 'user_count', '1', 'off'),
(105, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'auto'),
(106, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'auto'),
(107, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(108, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(109, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(114, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(115, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(116, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(117, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(118, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(119, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(120, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(121, '_transient_wp_core_block_css_files', 'a:2:{s:7:\"version\";s:5:\"6.8.3\";s:5:\"files\";a:536:{i:0;s:23:\"archives/editor-rtl.css\";i:1;s:27:\"archives/editor-rtl.min.css\";i:2;s:19:\"archives/editor.css\";i:3;s:23:\"archives/editor.min.css\";i:4;s:22:\"archives/style-rtl.css\";i:5;s:26:\"archives/style-rtl.min.css\";i:6;s:18:\"archives/style.css\";i:7;s:22:\"archives/style.min.css\";i:8;s:20:\"audio/editor-rtl.css\";i:9;s:24:\"audio/editor-rtl.min.css\";i:10;s:16:\"audio/editor.css\";i:11;s:20:\"audio/editor.min.css\";i:12;s:19:\"audio/style-rtl.css\";i:13;s:23:\"audio/style-rtl.min.css\";i:14;s:15:\"audio/style.css\";i:15;s:19:\"audio/style.min.css\";i:16;s:19:\"audio/theme-rtl.css\";i:17;s:23:\"audio/theme-rtl.min.css\";i:18;s:15:\"audio/theme.css\";i:19;s:19:\"audio/theme.min.css\";i:20;s:21:\"avatar/editor-rtl.css\";i:21;s:25:\"avatar/editor-rtl.min.css\";i:22;s:17:\"avatar/editor.css\";i:23;s:21:\"avatar/editor.min.css\";i:24;s:20:\"avatar/style-rtl.css\";i:25;s:24:\"avatar/style-rtl.min.css\";i:26;s:16:\"avatar/style.css\";i:27;s:20:\"avatar/style.min.css\";i:28;s:21:\"button/editor-rtl.css\";i:29;s:25:\"button/editor-rtl.min.css\";i:30;s:17:\"button/editor.css\";i:31;s:21:\"button/editor.min.css\";i:32;s:20:\"button/style-rtl.css\";i:33;s:24:\"button/style-rtl.min.css\";i:34;s:16:\"button/style.css\";i:35;s:20:\"button/style.min.css\";i:36;s:22:\"buttons/editor-rtl.css\";i:37;s:26:\"buttons/editor-rtl.min.css\";i:38;s:18:\"buttons/editor.css\";i:39;s:22:\"buttons/editor.min.css\";i:40;s:21:\"buttons/style-rtl.css\";i:41;s:25:\"buttons/style-rtl.min.css\";i:42;s:17:\"buttons/style.css\";i:43;s:21:\"buttons/style.min.css\";i:44;s:22:\"calendar/style-rtl.css\";i:45;s:26:\"calendar/style-rtl.min.css\";i:46;s:18:\"calendar/style.css\";i:47;s:22:\"calendar/style.min.css\";i:48;s:25:\"categories/editor-rtl.css\";i:49;s:29:\"categories/editor-rtl.min.css\";i:50;s:21:\"categories/editor.css\";i:51;s:25:\"categories/editor.min.css\";i:52;s:24:\"categories/style-rtl.css\";i:53;s:28:\"categories/style-rtl.min.css\";i:54;s:20:\"categories/style.css\";i:55;s:24:\"categories/style.min.css\";i:56;s:19:\"code/editor-rtl.css\";i:57;s:23:\"code/editor-rtl.min.css\";i:58;s:15:\"code/editor.css\";i:59;s:19:\"code/editor.min.css\";i:60;s:18:\"code/style-rtl.css\";i:61;s:22:\"code/style-rtl.min.css\";i:62;s:14:\"code/style.css\";i:63;s:18:\"code/style.min.css\";i:64;s:18:\"code/theme-rtl.css\";i:65;s:22:\"code/theme-rtl.min.css\";i:66;s:14:\"code/theme.css\";i:67;s:18:\"code/theme.min.css\";i:68;s:22:\"columns/editor-rtl.css\";i:69;s:26:\"columns/editor-rtl.min.css\";i:70;s:18:\"columns/editor.css\";i:71;s:22:\"columns/editor.min.css\";i:72;s:21:\"columns/style-rtl.css\";i:73;s:25:\"columns/style-rtl.min.css\";i:74;s:17:\"columns/style.css\";i:75;s:21:\"columns/style.min.css\";i:76;s:33:\"comment-author-name/style-rtl.css\";i:77;s:37:\"comment-author-name/style-rtl.min.css\";i:78;s:29:\"comment-author-name/style.css\";i:79;s:33:\"comment-author-name/style.min.css\";i:80;s:29:\"comment-content/style-rtl.css\";i:81;s:33:\"comment-content/style-rtl.min.css\";i:82;s:25:\"comment-content/style.css\";i:83;s:29:\"comment-content/style.min.css\";i:84;s:26:\"comment-date/style-rtl.css\";i:85;s:30:\"comment-date/style-rtl.min.css\";i:86;s:22:\"comment-date/style.css\";i:87;s:26:\"comment-date/style.min.css\";i:88;s:31:\"comment-edit-link/style-rtl.css\";i:89;s:35:\"comment-edit-link/style-rtl.min.css\";i:90;s:27:\"comment-edit-link/style.css\";i:91;s:31:\"comment-edit-link/style.min.css\";i:92;s:32:\"comment-reply-link/style-rtl.css\";i:93;s:36:\"comment-reply-link/style-rtl.min.css\";i:94;s:28:\"comment-reply-link/style.css\";i:95;s:32:\"comment-reply-link/style.min.css\";i:96;s:30:\"comment-template/style-rtl.css\";i:97;s:34:\"comment-template/style-rtl.min.css\";i:98;s:26:\"comment-template/style.css\";i:99;s:30:\"comment-template/style.min.css\";i:100;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:101;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:102;s:38:\"comments-pagination-numbers/editor.css\";i:103;s:42:\"comments-pagination-numbers/editor.min.css\";i:104;s:34:\"comments-pagination/editor-rtl.css\";i:105;s:38:\"comments-pagination/editor-rtl.min.css\";i:106;s:30:\"comments-pagination/editor.css\";i:107;s:34:\"comments-pagination/editor.min.css\";i:108;s:33:\"comments-pagination/style-rtl.css\";i:109;s:37:\"comments-pagination/style-rtl.min.css\";i:110;s:29:\"comments-pagination/style.css\";i:111;s:33:\"comments-pagination/style.min.css\";i:112;s:29:\"comments-title/editor-rtl.css\";i:113;s:33:\"comments-title/editor-rtl.min.css\";i:114;s:25:\"comments-title/editor.css\";i:115;s:29:\"comments-title/editor.min.css\";i:116;s:23:\"comments/editor-rtl.css\";i:117;s:27:\"comments/editor-rtl.min.css\";i:118;s:19:\"comments/editor.css\";i:119;s:23:\"comments/editor.min.css\";i:120;s:22:\"comments/style-rtl.css\";i:121;s:26:\"comments/style-rtl.min.css\";i:122;s:18:\"comments/style.css\";i:123;s:22:\"comments/style.min.css\";i:124;s:20:\"cover/editor-rtl.css\";i:125;s:24:\"cover/editor-rtl.min.css\";i:126;s:16:\"cover/editor.css\";i:127;s:20:\"cover/editor.min.css\";i:128;s:19:\"cover/style-rtl.css\";i:129;s:23:\"cover/style-rtl.min.css\";i:130;s:15:\"cover/style.css\";i:131;s:19:\"cover/style.min.css\";i:132;s:22:\"details/editor-rtl.css\";i:133;s:26:\"details/editor-rtl.min.css\";i:134;s:18:\"details/editor.css\";i:135;s:22:\"details/editor.min.css\";i:136;s:21:\"details/style-rtl.css\";i:137;s:25:\"details/style-rtl.min.css\";i:138;s:17:\"details/style.css\";i:139;s:21:\"details/style.min.css\";i:140;s:20:\"embed/editor-rtl.css\";i:141;s:24:\"embed/editor-rtl.min.css\";i:142;s:16:\"embed/editor.css\";i:143;s:20:\"embed/editor.min.css\";i:144;s:19:\"embed/style-rtl.css\";i:145;s:23:\"embed/style-rtl.min.css\";i:146;s:15:\"embed/style.css\";i:147;s:19:\"embed/style.min.css\";i:148;s:19:\"embed/theme-rtl.css\";i:149;s:23:\"embed/theme-rtl.min.css\";i:150;s:15:\"embed/theme.css\";i:151;s:19:\"embed/theme.min.css\";i:152;s:19:\"file/editor-rtl.css\";i:153;s:23:\"file/editor-rtl.min.css\";i:154;s:15:\"file/editor.css\";i:155;s:19:\"file/editor.min.css\";i:156;s:18:\"file/style-rtl.css\";i:157;s:22:\"file/style-rtl.min.css\";i:158;s:14:\"file/style.css\";i:159;s:18:\"file/style.min.css\";i:160;s:23:\"footnotes/style-rtl.css\";i:161;s:27:\"footnotes/style-rtl.min.css\";i:162;s:19:\"footnotes/style.css\";i:163;s:23:\"footnotes/style.min.css\";i:164;s:23:\"freeform/editor-rtl.css\";i:165;s:27:\"freeform/editor-rtl.min.css\";i:166;s:19:\"freeform/editor.css\";i:167;s:23:\"freeform/editor.min.css\";i:168;s:22:\"gallery/editor-rtl.css\";i:169;s:26:\"gallery/editor-rtl.min.css\";i:170;s:18:\"gallery/editor.css\";i:171;s:22:\"gallery/editor.min.css\";i:172;s:21:\"gallery/style-rtl.css\";i:173;s:25:\"gallery/style-rtl.min.css\";i:174;s:17:\"gallery/style.css\";i:175;s:21:\"gallery/style.min.css\";i:176;s:21:\"gallery/theme-rtl.css\";i:177;s:25:\"gallery/theme-rtl.min.css\";i:178;s:17:\"gallery/theme.css\";i:179;s:21:\"gallery/theme.min.css\";i:180;s:20:\"group/editor-rtl.css\";i:181;s:24:\"group/editor-rtl.min.css\";i:182;s:16:\"group/editor.css\";i:183;s:20:\"group/editor.min.css\";i:184;s:19:\"group/style-rtl.css\";i:185;s:23:\"group/style-rtl.min.css\";i:186;s:15:\"group/style.css\";i:187;s:19:\"group/style.min.css\";i:188;s:19:\"group/theme-rtl.css\";i:189;s:23:\"group/theme-rtl.min.css\";i:190;s:15:\"group/theme.css\";i:191;s:19:\"group/theme.min.css\";i:192;s:21:\"heading/style-rtl.css\";i:193;s:25:\"heading/style-rtl.min.css\";i:194;s:17:\"heading/style.css\";i:195;s:21:\"heading/style.min.css\";i:196;s:19:\"html/editor-rtl.css\";i:197;s:23:\"html/editor-rtl.min.css\";i:198;s:15:\"html/editor.css\";i:199;s:19:\"html/editor.min.css\";i:200;s:20:\"image/editor-rtl.css\";i:201;s:24:\"image/editor-rtl.min.css\";i:202;s:16:\"image/editor.css\";i:203;s:20:\"image/editor.min.css\";i:204;s:19:\"image/style-rtl.css\";i:205;s:23:\"image/style-rtl.min.css\";i:206;s:15:\"image/style.css\";i:207;s:19:\"image/style.min.css\";i:208;s:19:\"image/theme-rtl.css\";i:209;s:23:\"image/theme-rtl.min.css\";i:210;s:15:\"image/theme.css\";i:211;s:19:\"image/theme.min.css\";i:212;s:29:\"latest-comments/style-rtl.css\";i:213;s:33:\"latest-comments/style-rtl.min.css\";i:214;s:25:\"latest-comments/style.css\";i:215;s:29:\"latest-comments/style.min.css\";i:216;s:27:\"latest-posts/editor-rtl.css\";i:217;s:31:\"latest-posts/editor-rtl.min.css\";i:218;s:23:\"latest-posts/editor.css\";i:219;s:27:\"latest-posts/editor.min.css\";i:220;s:26:\"latest-posts/style-rtl.css\";i:221;s:30:\"latest-posts/style-rtl.min.css\";i:222;s:22:\"latest-posts/style.css\";i:223;s:26:\"latest-posts/style.min.css\";i:224;s:18:\"list/style-rtl.css\";i:225;s:22:\"list/style-rtl.min.css\";i:226;s:14:\"list/style.css\";i:227;s:18:\"list/style.min.css\";i:228;s:22:\"loginout/style-rtl.css\";i:229;s:26:\"loginout/style-rtl.min.css\";i:230;s:18:\"loginout/style.css\";i:231;s:22:\"loginout/style.min.css\";i:232;s:25:\"media-text/editor-rtl.css\";i:233;s:29:\"media-text/editor-rtl.min.css\";i:234;s:21:\"media-text/editor.css\";i:235;s:25:\"media-text/editor.min.css\";i:236;s:24:\"media-text/style-rtl.css\";i:237;s:28:\"media-text/style-rtl.min.css\";i:238;s:20:\"media-text/style.css\";i:239;s:24:\"media-text/style.min.css\";i:240;s:19:\"more/editor-rtl.css\";i:241;s:23:\"more/editor-rtl.min.css\";i:242;s:15:\"more/editor.css\";i:243;s:19:\"more/editor.min.css\";i:244;s:30:\"navigation-link/editor-rtl.css\";i:245;s:34:\"navigation-link/editor-rtl.min.css\";i:246;s:26:\"navigation-link/editor.css\";i:247;s:30:\"navigation-link/editor.min.css\";i:248;s:29:\"navigation-link/style-rtl.css\";i:249;s:33:\"navigation-link/style-rtl.min.css\";i:250;s:25:\"navigation-link/style.css\";i:251;s:29:\"navigation-link/style.min.css\";i:252;s:33:\"navigation-submenu/editor-rtl.css\";i:253;s:37:\"navigation-submenu/editor-rtl.min.css\";i:254;s:29:\"navigation-submenu/editor.css\";i:255;s:33:\"navigation-submenu/editor.min.css\";i:256;s:25:\"navigation/editor-rtl.css\";i:257;s:29:\"navigation/editor-rtl.min.css\";i:258;s:21:\"navigation/editor.css\";i:259;s:25:\"navigation/editor.min.css\";i:260;s:24:\"navigation/style-rtl.css\";i:261;s:28:\"navigation/style-rtl.min.css\";i:262;s:20:\"navigation/style.css\";i:263;s:24:\"navigation/style.min.css\";i:264;s:23:\"nextpage/editor-rtl.css\";i:265;s:27:\"nextpage/editor-rtl.min.css\";i:266;s:19:\"nextpage/editor.css\";i:267;s:23:\"nextpage/editor.min.css\";i:268;s:24:\"page-list/editor-rtl.css\";i:269;s:28:\"page-list/editor-rtl.min.css\";i:270;s:20:\"page-list/editor.css\";i:271;s:24:\"page-list/editor.min.css\";i:272;s:23:\"page-list/style-rtl.css\";i:273;s:27:\"page-list/style-rtl.min.css\";i:274;s:19:\"page-list/style.css\";i:275;s:23:\"page-list/style.min.css\";i:276;s:24:\"paragraph/editor-rtl.css\";i:277;s:28:\"paragraph/editor-rtl.min.css\";i:278;s:20:\"paragraph/editor.css\";i:279;s:24:\"paragraph/editor.min.css\";i:280;s:23:\"paragraph/style-rtl.css\";i:281;s:27:\"paragraph/style-rtl.min.css\";i:282;s:19:\"paragraph/style.css\";i:283;s:23:\"paragraph/style.min.css\";i:284;s:35:\"post-author-biography/style-rtl.css\";i:285;s:39:\"post-author-biography/style-rtl.min.css\";i:286;s:31:\"post-author-biography/style.css\";i:287;s:35:\"post-author-biography/style.min.css\";i:288;s:30:\"post-author-name/style-rtl.css\";i:289;s:34:\"post-author-name/style-rtl.min.css\";i:290;s:26:\"post-author-name/style.css\";i:291;s:30:\"post-author-name/style.min.css\";i:292;s:26:\"post-author/editor-rtl.css\";i:293;s:30:\"post-author/editor-rtl.min.css\";i:294;s:22:\"post-author/editor.css\";i:295;s:26:\"post-author/editor.min.css\";i:296;s:25:\"post-author/style-rtl.css\";i:297;s:29:\"post-author/style-rtl.min.css\";i:298;s:21:\"post-author/style.css\";i:299;s:25:\"post-author/style.min.css\";i:300;s:33:\"post-comments-form/editor-rtl.css\";i:301;s:37:\"post-comments-form/editor-rtl.min.css\";i:302;s:29:\"post-comments-form/editor.css\";i:303;s:33:\"post-comments-form/editor.min.css\";i:304;s:32:\"post-comments-form/style-rtl.css\";i:305;s:36:\"post-comments-form/style-rtl.min.css\";i:306;s:28:\"post-comments-form/style.css\";i:307;s:32:\"post-comments-form/style.min.css\";i:308;s:26:\"post-content/style-rtl.css\";i:309;s:30:\"post-content/style-rtl.min.css\";i:310;s:22:\"post-content/style.css\";i:311;s:26:\"post-content/style.min.css\";i:312;s:23:\"post-date/style-rtl.css\";i:313;s:27:\"post-date/style-rtl.min.css\";i:314;s:19:\"post-date/style.css\";i:315;s:23:\"post-date/style.min.css\";i:316;s:27:\"post-excerpt/editor-rtl.css\";i:317;s:31:\"post-excerpt/editor-rtl.min.css\";i:318;s:23:\"post-excerpt/editor.css\";i:319;s:27:\"post-excerpt/editor.min.css\";i:320;s:26:\"post-excerpt/style-rtl.css\";i:321;s:30:\"post-excerpt/style-rtl.min.css\";i:322;s:22:\"post-excerpt/style.css\";i:323;s:26:\"post-excerpt/style.min.css\";i:324;s:34:\"post-featured-image/editor-rtl.css\";i:325;s:38:\"post-featured-image/editor-rtl.min.css\";i:326;s:30:\"post-featured-image/editor.css\";i:327;s:34:\"post-featured-image/editor.min.css\";i:328;s:33:\"post-featured-image/style-rtl.css\";i:329;s:37:\"post-featured-image/style-rtl.min.css\";i:330;s:29:\"post-featured-image/style.css\";i:331;s:33:\"post-featured-image/style.min.css\";i:332;s:34:\"post-navigation-link/style-rtl.css\";i:333;s:38:\"post-navigation-link/style-rtl.min.css\";i:334;s:30:\"post-navigation-link/style.css\";i:335;s:34:\"post-navigation-link/style.min.css\";i:336;s:27:\"post-template/style-rtl.css\";i:337;s:31:\"post-template/style-rtl.min.css\";i:338;s:23:\"post-template/style.css\";i:339;s:27:\"post-template/style.min.css\";i:340;s:24:\"post-terms/style-rtl.css\";i:341;s:28:\"post-terms/style-rtl.min.css\";i:342;s:20:\"post-terms/style.css\";i:343;s:24:\"post-terms/style.min.css\";i:344;s:24:\"post-title/style-rtl.css\";i:345;s:28:\"post-title/style-rtl.min.css\";i:346;s:20:\"post-title/style.css\";i:347;s:24:\"post-title/style.min.css\";i:348;s:26:\"preformatted/style-rtl.css\";i:349;s:30:\"preformatted/style-rtl.min.css\";i:350;s:22:\"preformatted/style.css\";i:351;s:26:\"preformatted/style.min.css\";i:352;s:24:\"pullquote/editor-rtl.css\";i:353;s:28:\"pullquote/editor-rtl.min.css\";i:354;s:20:\"pullquote/editor.css\";i:355;s:24:\"pullquote/editor.min.css\";i:356;s:23:\"pullquote/style-rtl.css\";i:357;s:27:\"pullquote/style-rtl.min.css\";i:358;s:19:\"pullquote/style.css\";i:359;s:23:\"pullquote/style.min.css\";i:360;s:23:\"pullquote/theme-rtl.css\";i:361;s:27:\"pullquote/theme-rtl.min.css\";i:362;s:19:\"pullquote/theme.css\";i:363;s:23:\"pullquote/theme.min.css\";i:364;s:39:\"query-pagination-numbers/editor-rtl.css\";i:365;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:366;s:35:\"query-pagination-numbers/editor.css\";i:367;s:39:\"query-pagination-numbers/editor.min.css\";i:368;s:31:\"query-pagination/editor-rtl.css\";i:369;s:35:\"query-pagination/editor-rtl.min.css\";i:370;s:27:\"query-pagination/editor.css\";i:371;s:31:\"query-pagination/editor.min.css\";i:372;s:30:\"query-pagination/style-rtl.css\";i:373;s:34:\"query-pagination/style-rtl.min.css\";i:374;s:26:\"query-pagination/style.css\";i:375;s:30:\"query-pagination/style.min.css\";i:376;s:25:\"query-title/style-rtl.css\";i:377;s:29:\"query-title/style-rtl.min.css\";i:378;s:21:\"query-title/style.css\";i:379;s:25:\"query-title/style.min.css\";i:380;s:25:\"query-total/style-rtl.css\";i:381;s:29:\"query-total/style-rtl.min.css\";i:382;s:21:\"query-total/style.css\";i:383;s:25:\"query-total/style.min.css\";i:384;s:20:\"query/editor-rtl.css\";i:385;s:24:\"query/editor-rtl.min.css\";i:386;s:16:\"query/editor.css\";i:387;s:20:\"query/editor.min.css\";i:388;s:19:\"quote/style-rtl.css\";i:389;s:23:\"quote/style-rtl.min.css\";i:390;s:15:\"quote/style.css\";i:391;s:19:\"quote/style.min.css\";i:392;s:19:\"quote/theme-rtl.css\";i:393;s:23:\"quote/theme-rtl.min.css\";i:394;s:15:\"quote/theme.css\";i:395;s:19:\"quote/theme.min.css\";i:396;s:23:\"read-more/style-rtl.css\";i:397;s:27:\"read-more/style-rtl.min.css\";i:398;s:19:\"read-more/style.css\";i:399;s:23:\"read-more/style.min.css\";i:400;s:18:\"rss/editor-rtl.css\";i:401;s:22:\"rss/editor-rtl.min.css\";i:402;s:14:\"rss/editor.css\";i:403;s:18:\"rss/editor.min.css\";i:404;s:17:\"rss/style-rtl.css\";i:405;s:21:\"rss/style-rtl.min.css\";i:406;s:13:\"rss/style.css\";i:407;s:17:\"rss/style.min.css\";i:408;s:21:\"search/editor-rtl.css\";i:409;s:25:\"search/editor-rtl.min.css\";i:410;s:17:\"search/editor.css\";i:411;s:21:\"search/editor.min.css\";i:412;s:20:\"search/style-rtl.css\";i:413;s:24:\"search/style-rtl.min.css\";i:414;s:16:\"search/style.css\";i:415;s:20:\"search/style.min.css\";i:416;s:20:\"search/theme-rtl.css\";i:417;s:24:\"search/theme-rtl.min.css\";i:418;s:16:\"search/theme.css\";i:419;s:20:\"search/theme.min.css\";i:420;s:24:\"separator/editor-rtl.css\";i:421;s:28:\"separator/editor-rtl.min.css\";i:422;s:20:\"separator/editor.css\";i:423;s:24:\"separator/editor.min.css\";i:424;s:23:\"separator/style-rtl.css\";i:425;s:27:\"separator/style-rtl.min.css\";i:426;s:19:\"separator/style.css\";i:427;s:23:\"separator/style.min.css\";i:428;s:23:\"separator/theme-rtl.css\";i:429;s:27:\"separator/theme-rtl.min.css\";i:430;s:19:\"separator/theme.css\";i:431;s:23:\"separator/theme.min.css\";i:432;s:24:\"shortcode/editor-rtl.css\";i:433;s:28:\"shortcode/editor-rtl.min.css\";i:434;s:20:\"shortcode/editor.css\";i:435;s:24:\"shortcode/editor.min.css\";i:436;s:24:\"site-logo/editor-rtl.css\";i:437;s:28:\"site-logo/editor-rtl.min.css\";i:438;s:20:\"site-logo/editor.css\";i:439;s:24:\"site-logo/editor.min.css\";i:440;s:23:\"site-logo/style-rtl.css\";i:441;s:27:\"site-logo/style-rtl.min.css\";i:442;s:19:\"site-logo/style.css\";i:443;s:23:\"site-logo/style.min.css\";i:444;s:27:\"site-tagline/editor-rtl.css\";i:445;s:31:\"site-tagline/editor-rtl.min.css\";i:446;s:23:\"site-tagline/editor.css\";i:447;s:27:\"site-tagline/editor.min.css\";i:448;s:26:\"site-tagline/style-rtl.css\";i:449;s:30:\"site-tagline/style-rtl.min.css\";i:450;s:22:\"site-tagline/style.css\";i:451;s:26:\"site-tagline/style.min.css\";i:452;s:25:\"site-title/editor-rtl.css\";i:453;s:29:\"site-title/editor-rtl.min.css\";i:454;s:21:\"site-title/editor.css\";i:455;s:25:\"site-title/editor.min.css\";i:456;s:24:\"site-title/style-rtl.css\";i:457;s:28:\"site-title/style-rtl.min.css\";i:458;s:20:\"site-title/style.css\";i:459;s:24:\"site-title/style.min.css\";i:460;s:26:\"social-link/editor-rtl.css\";i:461;s:30:\"social-link/editor-rtl.min.css\";i:462;s:22:\"social-link/editor.css\";i:463;s:26:\"social-link/editor.min.css\";i:464;s:27:\"social-links/editor-rtl.css\";i:465;s:31:\"social-links/editor-rtl.min.css\";i:466;s:23:\"social-links/editor.css\";i:467;s:27:\"social-links/editor.min.css\";i:468;s:26:\"social-links/style-rtl.css\";i:469;s:30:\"social-links/style-rtl.min.css\";i:470;s:22:\"social-links/style.css\";i:471;s:26:\"social-links/style.min.css\";i:472;s:21:\"spacer/editor-rtl.css\";i:473;s:25:\"spacer/editor-rtl.min.css\";i:474;s:17:\"spacer/editor.css\";i:475;s:21:\"spacer/editor.min.css\";i:476;s:20:\"spacer/style-rtl.css\";i:477;s:24:\"spacer/style-rtl.min.css\";i:478;s:16:\"spacer/style.css\";i:479;s:20:\"spacer/style.min.css\";i:480;s:20:\"table/editor-rtl.css\";i:481;s:24:\"table/editor-rtl.min.css\";i:482;s:16:\"table/editor.css\";i:483;s:20:\"table/editor.min.css\";i:484;s:19:\"table/style-rtl.css\";i:485;s:23:\"table/style-rtl.min.css\";i:486;s:15:\"table/style.css\";i:487;s:19:\"table/style.min.css\";i:488;s:19:\"table/theme-rtl.css\";i:489;s:23:\"table/theme-rtl.min.css\";i:490;s:15:\"table/theme.css\";i:491;s:19:\"table/theme.min.css\";i:492;s:24:\"tag-cloud/editor-rtl.css\";i:493;s:28:\"tag-cloud/editor-rtl.min.css\";i:494;s:20:\"tag-cloud/editor.css\";i:495;s:24:\"tag-cloud/editor.min.css\";i:496;s:23:\"tag-cloud/style-rtl.css\";i:497;s:27:\"tag-cloud/style-rtl.min.css\";i:498;s:19:\"tag-cloud/style.css\";i:499;s:23:\"tag-cloud/style.min.css\";i:500;s:28:\"template-part/editor-rtl.css\";i:501;s:32:\"template-part/editor-rtl.min.css\";i:502;s:24:\"template-part/editor.css\";i:503;s:28:\"template-part/editor.min.css\";i:504;s:27:\"template-part/theme-rtl.css\";i:505;s:31:\"template-part/theme-rtl.min.css\";i:506;s:23:\"template-part/theme.css\";i:507;s:27:\"template-part/theme.min.css\";i:508;s:30:\"term-description/style-rtl.css\";i:509;s:34:\"term-description/style-rtl.min.css\";i:510;s:26:\"term-description/style.css\";i:511;s:30:\"term-description/style.min.css\";i:512;s:27:\"text-columns/editor-rtl.css\";i:513;s:31:\"text-columns/editor-rtl.min.css\";i:514;s:23:\"text-columns/editor.css\";i:515;s:27:\"text-columns/editor.min.css\";i:516;s:26:\"text-columns/style-rtl.css\";i:517;s:30:\"text-columns/style-rtl.min.css\";i:518;s:22:\"text-columns/style.css\";i:519;s:26:\"text-columns/style.min.css\";i:520;s:19:\"verse/style-rtl.css\";i:521;s:23:\"verse/style-rtl.min.css\";i:522;s:15:\"verse/style.css\";i:523;s:19:\"verse/style.min.css\";i:524;s:20:\"video/editor-rtl.css\";i:525;s:24:\"video/editor-rtl.min.css\";i:526;s:16:\"video/editor.css\";i:527;s:20:\"video/editor.min.css\";i:528;s:19:\"video/style-rtl.css\";i:529;s:23:\"video/style-rtl.min.css\";i:530;s:15:\"video/style.css\";i:531;s:19:\"video/style.min.css\";i:532;s:19:\"video/theme-rtl.css\";i:533;s:23:\"video/theme-rtl.min.css\";i:534;s:15:\"video/theme.css\";i:535;s:19:\"video/theme.min.css\";}}', 'on'),
(125, 'nonce_key', 'XGa;po{ifK(=d*84Q)NWU/+ve$A3 GlLbxy#Q]xB</~eHB8Q[jeFzEV)Pfgl4%ho', 'off'),
(126, 'nonce_salt', 'VWU=!(?WTBGBIrshC;RChj6sm/<@Ph7.Pz[B8Ct0k|$l]L?_xL2?VRq&GPzW*.ms', 'off'),
(127, 'recovery_keys', 'a:0:{}', 'off'),
(128, 'secure_auth_key', '8i77xRna `y;/xHlx/`CF+pq(kH?mDFZ |S#8&6$drDpOLJSJN*>&4JVZg/-l^L)', 'off'),
(129, 'secure_auth_salt', 'hG_seV44M p-9*>KQ/2V?ma6~iN0<Nd({{V6VQ<8j=ee8tMMW/qqBT]+b$o0,d7]', 'off'),
(130, 'logged_in_key', '~qS>}/!_JbM2|erLn&}GOl74~&P`MC_JwqzMy0]D%OD:m{P*6X&#mv?:>+=`?wbi', 'off'),
(131, 'logged_in_salt', ')2#CRGo0* tkTY:<66:uq_^UWKb|.Erq@Zp.48kHT/0Xy/6R-ORzlFfUoD/ua^_%', 'off'),
(136, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1760518355;s:7:\"checked\";a:4:{s:11:\"cipitcustom\";s:0:\"\";s:16:\"twentytwentyfive\";s:3:\"1.3\";s:16:\"twentytwentyfour\";s:3:\"1.3\";s:17:\"twentytwentythree\";s:3:\"1.6\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:16:\"twentytwentyfive\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfive\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfive/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfive.1.3.zip\";s:8:\"requires\";s:3:\"6.7\";s:12:\"requires_php\";s:3:\"7.2\";}s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.3.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.6.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'off'),
(137, '_site_transient_timeout_browser_3268fe57febc0d1640e7d7359e3c065d', '1760691736', 'off'),
(138, '_site_transient_browser_3268fe57febc0d1640e7d7359e3c065d', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"141.0.0.0\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'off'),
(139, '_site_transient_timeout_php_check_84bab1ffd8c4f8f9d81d62c8afdcab8a', '1760691736', 'off'),
(140, '_site_transient_php_check_84bab1ffd8c4f8f9d81d62c8afdcab8a', 'a:5:{s:19:\"recommended_version\";s:3:\"8.3\";s:15:\"minimum_version\";s:6:\"7.2.24\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'off'),
(142, 'can_compress_scripts', '0', 'on'),
(157, 'finished_updating_comment_type', '1', 'auto'),
(169, 'theme_mods_cipitcustom', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:1:{s:12:\"primary-menu\";i:3;}}', 'on'),
(170, '_transient_wp_styles_for_blocks', 'a:2:{s:4:\"hash\";s:32:\"8c7d46a72d7d4591fc1dd9485bedb304\";s:6:\"blocks\";a:5:{s:11:\"core/button\";s:0:\"\";s:14:\"core/site-logo\";s:0:\"\";s:18:\"core/post-template\";s:120:\":where(.wp-block-post-template.is-layout-flex){gap: 1.25em;}:where(.wp-block-post-template.is-layout-grid){gap: 1.25em;}\";s:12:\"core/columns\";s:102:\":where(.wp-block-columns.is-layout-flex){gap: 2em;}:where(.wp-block-columns.is-layout-grid){gap: 2em;}\";s:14:\"core/pullquote\";s:69:\":root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}\";}}', 'on'),
(171, 'theme_mods_twentytwentyfive', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'off'),
(174, 'auth_key', 'MiBVFxT5+J9 =1|z~A$KqE4c ,tAv6.Ma(rwG#+]$OX9d#a}a#BQ@dpO3EBpD~_B', 'off'),
(175, 'auth_salt', 'u$1?|)%(?Y[{#vGdF?GH|$hIGL^(e5U!JEmk&I89(}1WJpyk8``Hl/zyRT&Y%qy+', 'off'),
(176, 'current_theme', 'CIPIT Theme', 'auto'),
(177, 'theme_switched', '', 'auto'),
(178, 'theme_switched_via_customizer', '', 'auto'),
(179, 'nav_menu_options', 'a:1:{s:8:\"auto_add\";a:0:{}}', 'auto'),
(180, 'customize_stashed_theme_mods', 'a:0:{}', 'off'),
(195, 'wp_calendar_block_has_published_posts', '1', 'auto'),
(219, '_transient_health-check-site-status-result', '{\"good\":17,\"recommended\":5,\"critical\":1}', 'on'),
(236, '_site_transient_wp_plugin_dependencies_plugin_data', 'a:0:{}', 'off'),
(237, 'recently_activated', 'a:1:{s:63:\"ultimate-addons-for-gutenberg/ultimate-addons-for-gutenberg.php\";i:1760428542;}', 'off'),
(247, 'vc_version', '8.6.1', 'auto'),
(248, 'wpb_license_errors', 'a:0:{}', 'auto');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(293, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.8.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.8.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.8.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.8.3-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.8.3\";s:7:\"version\";s:5:\"6.8.3\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1760522535;s:15:\"version_checked\";s:5:\"6.8.3\";s:12:\"translations\";a:0:{}}', 'off'),
(298, 'wpb_js_js_composer_purchase_code', 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx', 'auto'),
(423, '__uagb_do_redirect', '', 'auto'),
(424, '__uagb_activated_before', '1', 'auto'),
(425, '__uagb_asset_version', '1760416725', 'auto'),
(426, 'uagb_site_url', 'cipit-revamp-org-test', 'auto'),
(427, 'uagb_block_analytics_status', 'a:1:{s:15:\"first_run_check\";b:1;}', 'auto'),
(428, '_uagb_allow_file_generation', 'enabled', 'auto'),
(429, 'uagb-version', '2.19.15', 'auto'),
(430, 'spectra_analytics_installed_time', '1760416695', 'off'),
(431, 'ast-block-templates-version', '2.4.8', 'auto'),
(432, '_transient_timeout_uag_rollback_versions_2.19.15', '1761021496', 'off'),
(433, '_transient_uag_rollback_versions_2.19.15', 'a:10:{i:0;s:7:\"2.19.14\";i:1;s:7:\"2.19.13\";i:2;s:7:\"2.19.12\";i:3;s:7:\"2.19.11\";i:4;s:7:\"2.19.10\";i:5;s:6:\"2.19.9\";i:6;s:6:\"2.19.8\";i:7;s:6:\"2.19.7\";i:8;s:6:\"2.19.6\";i:9;s:6:\"2.19.5\";}', 'off'),
(434, 'uag_content_width_set_by', 'Spectra', 'auto'),
(437, 'nps-survey-spectra', 'a:6:{s:13:\"dismiss_count\";i:0;s:19:\"dismiss_permanently\";b:0;s:12:\"dismiss_step\";s:0:\"\";s:12:\"dismiss_time\";s:0:\"\";s:16:\"dismiss_timespan\";N;s:17:\"first_render_time\";i:1760416697;}', 'auto'),
(438, 'uag_container_global_padding', '10', 'auto'),
(439, 'ast_block_templates_fresh_site', 'no', 'auto'),
(440, 'ast_blocks_sync_in_progress', 'no', 'off'),
(441, 'ast-block-templates-last-export-checksums-time', '1760416741', 'off'),
(442, 'uagb_quick_sidebar_allowed_blocks', 'a:8:{i:0;s:14:\"uagb/container\";i:1;s:21:\"uagb/advanced-heading\";i:2;s:10:\"uagb/image\";i:3;s:9:\"uagb/icon\";i:4;s:12:\"uagb/buttons\";i:5;s:13:\"uagb/info-box\";i:6;s:19:\"uagb/call-to-action\";i:7;s:13:\"core/freeform\";}', 'auto'),
(515, 'category_children', 'a:0:{}', 'auto'),
(549, '_transient_timeout_wpb_notice_list', '1760543892', 'off'),
(550, '_transient_wpb_notice_list', '{\"status\":true,\"data\":{}}', 'off'),
(575, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1760529066', 'off'),
(576, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'O:8:\"stdClass\":100:{s:11:\"woocommerce\";a:3:{s:4:\"name\";s:11:\"woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:5:\"count\";i:7523;}s:6:\"widget\";a:3:{s:4:\"name\";s:6:\"widget\";s:4:\"slug\";s:6:\"widget\";s:5:\"count\";i:4928;}s:4:\"post\";a:3:{s:4:\"name\";s:4:\"post\";s:4:\"slug\";s:4:\"post\";s:5:\"count\";i:2799;}s:5:\"admin\";a:3:{s:4:\"name\";s:5:\"admin\";s:4:\"slug\";s:5:\"admin\";s:5:\"count\";i:2760;}s:5:\"posts\";a:3:{s:4:\"name\";s:5:\"posts\";s:4:\"slug\";s:5:\"posts\";s:5:\"count\";i:2146;}s:9:\"shortcode\";a:3:{s:4:\"name\";s:9:\"shortcode\";s:4:\"slug\";s:9:\"shortcode\";s:5:\"count\";i:2111;}s:3:\"seo\";a:3:{s:4:\"name\";s:3:\"seo\";s:4:\"slug\";s:3:\"seo\";s:5:\"count\";i:2056;}s:8:\"comments\";a:3:{s:4:\"name\";s:8:\"comments\";s:4:\"slug\";s:8:\"comments\";s:5:\"count\";i:1960;}s:9:\"ecommerce\";a:3:{s:4:\"name\";s:9:\"ecommerce\";s:4:\"slug\";s:9:\"ecommerce\";s:5:\"count\";i:1673;}s:6:\"images\";a:3:{s:4:\"name\";s:6:\"images\";s:4:\"slug\";s:6:\"images\";s:5:\"count\";i:1646;}s:5:\"image\";a:3:{s:4:\"name\";s:5:\"image\";s:4:\"slug\";s:5:\"image\";s:5:\"count\";i:1620;}s:6:\"google\";a:3:{s:4:\"name\";s:6:\"google\";s:4:\"slug\";s:6:\"google\";s:5:\"count\";i:1559;}s:7:\"twitter\";a:3:{s:4:\"name\";s:7:\"twitter\";s:4:\"slug\";s:7:\"twitter\";s:5:\"count\";i:1516;}s:8:\"facebook\";a:3:{s:4:\"name\";s:8:\"facebook\";s:4:\"slug\";s:8:\"facebook\";s:5:\"count\";i:1513;}s:5:\"email\";a:3:{s:4:\"name\";s:5:\"email\";s:4:\"slug\";s:5:\"email\";s:5:\"count\";i:1492;}s:7:\"gallery\";a:3:{s:4:\"name\";s:7:\"gallery\";s:4:\"slug\";s:7:\"gallery\";s:5:\"count\";i:1358;}s:8:\"security\";a:3:{s:4:\"name\";s:8:\"security\";s:4:\"slug\";s:8:\"security\";s:5:\"count\";i:1332;}s:7:\"sidebar\";a:3:{s:4:\"name\";s:7:\"sidebar\";s:4:\"slug\";s:7:\"sidebar\";s:5:\"count\";i:1317;}s:5:\"login\";a:3:{s:4:\"name\";s:5:\"login\";s:4:\"slug\";s:5:\"login\";s:5:\"count\";i:1269;}s:6:\"social\";a:3:{s:4:\"name\";s:6:\"social\";s:4:\"slug\";s:6:\"social\";s:5:\"count\";i:1181;}s:4:\"page\";a:3:{s:4:\"name\";s:4:\"page\";s:4:\"slug\";s:4:\"page\";s:5:\"count\";i:1162;}s:5:\"block\";a:3:{s:4:\"name\";s:5:\"block\";s:4:\"slug\";s:5:\"block\";s:5:\"count\";i:1064;}s:7:\"payment\";a:3:{s:4:\"name\";s:7:\"payment\";s:4:\"slug\";s:7:\"payment\";s:5:\"count\";i:1062;}s:5:\"video\";a:3:{s:4:\"name\";s:5:\"video\";s:4:\"slug\";s:5:\"video\";s:5:\"count\";i:1060;}s:9:\"analytics\";a:3:{s:4:\"name\";s:9:\"analytics\";s:4:\"slug\";s:9:\"analytics\";s:5:\"count\";i:1055;}s:10:\"e-commerce\";a:3:{s:4:\"name\";s:10:\"e-commerce\";s:4:\"slug\";s:10:\"e-commerce\";s:5:\"count\";i:1049;}s:9:\"gutenberg\";a:3:{s:4:\"name\";s:9:\"gutenberg\";s:4:\"slug\";s:9:\"gutenberg\";s:5:\"count\";i:1042;}s:7:\"widgets\";a:3:{s:4:\"name\";s:7:\"widgets\";s:4:\"slug\";s:7:\"widgets\";s:5:\"count\";i:1009;}s:9:\"elementor\";a:3:{s:4:\"name\";s:9:\"elementor\";s:4:\"slug\";s:9:\"elementor\";s:5:\"count\";i:992;}s:7:\"content\";a:3:{s:4:\"name\";s:7:\"content\";s:4:\"slug\";s:7:\"content\";s:5:\"count\";i:964;}s:6:\"slider\";a:3:{s:4:\"name\";s:6:\"slider\";s:4:\"slug\";s:6:\"slider\";s:5:\"count\";i:949;}s:15:\"payment-gateway\";a:3:{s:4:\"name\";s:15:\"payment gateway\";s:4:\"slug\";s:15:\"payment-gateway\";s:5:\"count\";i:936;}s:5:\"links\";a:3:{s:4:\"name\";s:5:\"links\";s:4:\"slug\";s:5:\"links\";s:5:\"count\";i:931;}s:4:\"spam\";a:3:{s:4:\"name\";s:4:\"spam\";s:4:\"slug\";s:4:\"spam\";s:5:\"count\";i:920;}s:4:\"form\";a:3:{s:4:\"name\";s:4:\"form\";s:4:\"slug\";s:4:\"form\";s:5:\"count\";i:913;}s:5:\"media\";a:3:{s:4:\"name\";s:5:\"media\";s:4:\"slug\";s:5:\"media\";s:5:\"count\";i:890;}s:6:\"search\";a:3:{s:4:\"name\";s:6:\"search\";s:4:\"slug\";s:6:\"search\";s:5:\"count\";i:863;}s:6:\"editor\";a:3:{s:4:\"name\";s:6:\"editor\";s:4:\"slug\";s:6:\"editor\";s:5:\"count\";i:814;}s:10:\"buddypress\";a:3:{s:4:\"name\";s:10:\"buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:5:\"count\";i:786;}s:12:\"contact-form\";a:3:{s:4:\"name\";s:12:\"contact form\";s:4:\"slug\";s:12:\"contact-form\";s:5:\"count\";i:782;}s:3:\"rss\";a:3:{s:4:\"name\";s:3:\"rss\";s:4:\"slug\";s:3:\"rss\";s:5:\"count\";i:770;}s:4:\"menu\";a:3:{s:4:\"name\";s:4:\"menu\";s:4:\"slug\";s:4:\"menu\";s:5:\"count\";i:769;}s:5:\"embed\";a:3:{s:4:\"name\";s:5:\"embed\";s:4:\"slug\";s:5:\"embed\";s:5:\"count\";i:759;}s:5:\"pages\";a:3:{s:4:\"name\";s:5:\"pages\";s:4:\"slug\";s:5:\"pages\";s:5:\"count\";i:755;}s:4:\"feed\";a:3:{s:4:\"name\";s:4:\"feed\";s:4:\"slug\";s:4:\"feed\";s:5:\"count\";i:721;}s:8:\"category\";a:3:{s:4:\"name\";s:8:\"category\";s:4:\"slug\";s:8:\"category\";s:5:\"count\";i:714;}s:4:\"ajax\";a:3:{s:4:\"name\";s:4:\"ajax\";s:4:\"slug\";s:4:\"ajax\";s:5:\"count\";i:701;}s:11:\"performance\";a:3:{s:4:\"name\";s:11:\"performance\";s:4:\"slug\";s:11:\"performance\";s:5:\"count\";i:693;}s:3:\"api\";a:3:{s:4:\"name\";s:3:\"api\";s:4:\"slug\";s:3:\"api\";s:5:\"count\";i:683;}s:2:\"ai\";a:3:{s:4:\"name\";s:2:\"AI\";s:4:\"slug\";s:2:\"ai\";s:5:\"count\";i:682;}s:4:\"chat\";a:3:{s:4:\"name\";s:4:\"chat\";s:4:\"slug\";s:4:\"chat\";s:5:\"count\";i:682;}s:8:\"shipping\";a:3:{s:4:\"name\";s:8:\"shipping\";s:4:\"slug\";s:8:\"shipping\";s:5:\"count\";i:680;}s:7:\"youtube\";a:3:{s:4:\"name\";s:7:\"youtube\";s:4:\"slug\";s:7:\"youtube\";s:5:\"count\";i:676;}s:6:\"jquery\";a:3:{s:4:\"name\";s:6:\"jquery\";s:4:\"slug\";s:6:\"jquery\";s:5:\"count\";i:665;}s:9:\"marketing\";a:3:{s:4:\"name\";s:9:\"marketing\";s:4:\"slug\";s:9:\"marketing\";s:5:\"count\";i:654;}s:9:\"affiliate\";a:3:{s:4:\"name\";s:9:\"affiliate\";s:4:\"slug\";s:9:\"affiliate\";s:5:\"count\";i:645;}s:10:\"responsive\";a:3:{s:4:\"name\";s:10:\"responsive\";s:4:\"slug\";s:10:\"responsive\";s:5:\"count\";i:641;}s:9:\"dashboard\";a:3:{s:4:\"name\";s:9:\"dashboard\";s:4:\"slug\";s:9:\"dashboard\";s:5:\"count\";i:640;}s:3:\"css\";a:3:{s:4:\"name\";s:3:\"css\";s:4:\"slug\";s:3:\"css\";s:5:\"count\";i:636;}s:14:\"contact-form-7\";a:3:{s:4:\"name\";s:14:\"contact form 7\";s:4:\"slug\";s:14:\"contact-form-7\";s:5:\"count\";i:630;}s:4:\"link\";a:3:{s:4:\"name\";s:4:\"link\";s:4:\"slug\";s:4:\"link\";s:5:\"count\";i:622;}s:10:\"javascript\";a:3:{s:4:\"name\";s:10:\"javascript\";s:4:\"slug\";s:10:\"javascript\";s:5:\"count\";i:617;}s:5:\"share\";a:3:{s:4:\"name\";s:5:\"share\";s:4:\"slug\";s:5:\"share\";s:5:\"count\";i:610;}s:7:\"contact\";a:3:{s:4:\"name\";s:7:\"contact\";s:4:\"slug\";s:7:\"contact\";s:5:\"count\";i:609;}s:6:\"events\";a:3:{s:4:\"name\";s:6:\"events\";s:4:\"slug\";s:6:\"events\";s:5:\"count\";i:606;}s:5:\"forms\";a:3:{s:4:\"name\";s:5:\"forms\";s:4:\"slug\";s:5:\"forms\";s:5:\"count\";i:605;}s:6:\"blocks\";a:3:{s:4:\"name\";s:6:\"blocks\";s:4:\"slug\";s:6:\"blocks\";s:5:\"count\";i:599;}s:3:\"ads\";a:3:{s:4:\"name\";s:3:\"ads\";s:4:\"slug\";s:3:\"ads\";s:5:\"count\";i:591;}s:7:\"comment\";a:3:{s:4:\"name\";s:7:\"comment\";s:4:\"slug\";s:7:\"comment\";s:5:\"count\";i:579;}s:5:\"popup\";a:3:{s:4:\"name\";s:5:\"popup\";s:4:\"slug\";s:5:\"popup\";s:5:\"count\";i:580;}s:5:\"theme\";a:3:{s:4:\"name\";s:5:\"theme\";s:4:\"slug\";s:5:\"theme\";s:5:\"count\";i:579;}s:6:\"custom\";a:3:{s:4:\"name\";s:6:\"custom\";s:4:\"slug\";s:6:\"custom\";s:5:\"count\";i:578;}s:10:\"categories\";a:3:{s:4:\"name\";s:10:\"categories\";s:4:\"slug\";s:10:\"categories\";s:5:\"count\";i:570;}s:8:\"calendar\";a:3:{s:4:\"name\";s:8:\"calendar\";s:4:\"slug\";s:8:\"calendar\";s:5:\"count\";i:569;}s:8:\"payments\";a:3:{s:4:\"name\";s:8:\"payments\";s:4:\"slug\";s:8:\"payments\";s:5:\"count\";i:569;}s:6:\"button\";a:3:{s:4:\"name\";s:6:\"button\";s:4:\"slug\";s:6:\"button\";s:5:\"count\";i:555;}s:4:\"user\";a:3:{s:4:\"name\";s:4:\"user\";s:4:\"slug\";s:4:\"user\";s:5:\"count\";i:537;}s:5:\"users\";a:3:{s:4:\"name\";s:5:\"users\";s:4:\"slug\";s:5:\"users\";s:5:\"count\";i:533;}s:4:\"tags\";a:3:{s:4:\"name\";s:4:\"tags\";s:4:\"slug\";s:4:\"tags\";s:5:\"count\";i:527;}s:10:\"newsletter\";a:3:{s:4:\"name\";s:10:\"newsletter\";s:4:\"slug\";s:10:\"newsletter\";s:5:\"count\";i:526;}s:10:\"navigation\";a:3:{s:4:\"name\";s:10:\"navigation\";s:4:\"slug\";s:10:\"navigation\";s:5:\"count\";i:515;}s:6:\"mobile\";a:3:{s:4:\"name\";s:6:\"mobile\";s:4:\"slug\";s:6:\"mobile\";s:5:\"count\";i:509;}s:8:\"checkout\";a:3:{s:4:\"name\";s:8:\"checkout\";s:4:\"slug\";s:8:\"checkout\";s:5:\"count\";i:507;}s:8:\"tracking\";a:3:{s:4:\"name\";s:8:\"tracking\";s:4:\"slug\";s:8:\"tracking\";s:5:\"count\";i:506;}s:12:\"social-media\";a:3:{s:4:\"name\";s:12:\"social media\";s:4:\"slug\";s:12:\"social-media\";s:5:\"count\";i:502;}s:7:\"gateway\";a:3:{s:4:\"name\";s:7:\"gateway\";s:4:\"slug\";s:7:\"gateway\";s:5:\"count\";i:478;}s:6:\"import\";a:3:{s:4:\"name\";s:6:\"import\";s:4:\"slug\";s:6:\"import\";s:5:\"count\";i:473;}s:5:\"stats\";a:3:{s:4:\"name\";s:5:\"stats\";s:4:\"slug\";s:5:\"stats\";s:5:\"count\";i:472;}s:8:\"redirect\";a:3:{s:4:\"name\";s:8:\"redirect\";s:4:\"slug\";s:8:\"redirect\";s:5:\"count\";i:472;}s:12:\"notification\";a:3:{s:4:\"name\";s:12:\"notification\";s:4:\"slug\";s:12:\"notification\";s:5:\"count\";i:471;}s:10:\"statistics\";a:3:{s:4:\"name\";s:10:\"statistics\";s:4:\"slug\";s:10:\"statistics\";s:5:\"count\";i:464;}s:9:\"slideshow\";a:3:{s:4:\"name\";s:9:\"slideshow\";s:4:\"slug\";s:9:\"slideshow\";s:5:\"count\";i:459;}s:5:\"photo\";a:3:{s:4:\"name\";s:5:\"photo\";s:4:\"slug\";s:5:\"photo\";s:5:\"count\";i:458;}s:5:\"cache\";a:3:{s:4:\"name\";s:5:\"cache\";s:4:\"slug\";s:5:\"cache\";s:5:\"count\";i:446;}s:4:\"news\";a:3:{s:4:\"name\";s:4:\"news\";s:4:\"slug\";s:4:\"news\";s:5:\"count\";i:440;}s:6:\"photos\";a:3:{s:4:\"name\";s:6:\"photos\";s:4:\"slug\";s:6:\"photos\";s:5:\"count\";i:430;}s:4:\"code\";a:3:{s:4:\"name\";s:4:\"code\";s:4:\"slug\";s:4:\"code\";s:5:\"count\";i:427;}s:10:\"shortcodes\";a:3:{s:4:\"name\";s:10:\"shortcodes\";s:4:\"slug\";s:10:\"shortcodes\";s:5:\"count\";i:423;}s:8:\"products\";a:3:{s:4:\"name\";s:8:\"products\";s:4:\"slug\";s:8:\"products\";s:5:\"count\";i:419;}s:7:\"plugins\";a:3:{s:4:\"name\";s:7:\"plugins\";s:4:\"slug\";s:7:\"plugins\";s:5:\"count\";i:419;}}', 'off'),
(581, 'duplicate_page_options', 'a:4:{s:21:\"duplicate_post_status\";s:5:\"draft\";s:23:\"duplicate_post_redirect\";s:7:\"to_list\";s:21:\"duplicate_post_suffix\";s:0:\"\";s:21:\"duplicate_post_editor\";s:7:\"classic\";}', 'auto'),
(594, '_site_transient_timeout_theme_roots', '1760524335', 'off'),
(595, '_site_transient_theme_roots', 'a:4:{s:11:\"cipitcustom\";s:7:\"/themes\";s:16:\"twentytwentyfive\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";}', 'off'),
(596, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1760522536;s:8:\"response\";a:1:{s:27:\"js_composer/js_composer.php\";O:8:\"stdClass\":6:{s:4:\"slug\";s:11:\"js_composer\";s:11:\"new_version\";s:3:\"8.7\";s:6:\"plugin\";s:27:\"js_composer/js_composer.php\";s:3:\"url\";s:0:\"\";s:7:\"package\";b:1;s:4:\"name\";s:21:\"WPBakery Page Builder\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:4:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"5.5\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.5.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";}s:33:\"classic-editor/classic-editor.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/classic-editor\";s:4:\"slug\";s:14:\"classic-editor\";s:6:\"plugin\";s:33:\"classic-editor/classic-editor.php\";s:11:\"new_version\";s:5:\"1.6.7\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/classic-editor/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/classic-editor.1.6.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-256x256.png?rev=1998671\";s:2:\"1x\";s:67:\"https://ps.w.org/classic-editor/assets/icon-128x128.png?rev=1998671\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:70:\"https://ps.w.org/classic-editor/assets/banner-1544x500.png?rev=1998671\";s:2:\"1x\";s:69:\"https://ps.w.org/classic-editor/assets/banner-772x250.png?rev=1998676\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.9\";}s:32:\"duplicate-page/duplicatepage.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:28:\"w.org/plugins/duplicate-page\";s:4:\"slug\";s:14:\"duplicate-page\";s:6:\"plugin\";s:32:\"duplicate-page/duplicatepage.php\";s:11:\"new_version\";s:5:\"4.5.5\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/duplicate-page/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/duplicate-page.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:67:\"https://ps.w.org/duplicate-page/assets/icon-128x128.jpg?rev=1412874\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:69:\"https://ps.w.org/duplicate-page/assets/banner-772x250.jpg?rev=1410328\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"3.4\";}s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}s:7:\"checked\";a:5:{s:19:\"akismet/akismet.php\";s:3:\"5.5\";s:33:\"classic-editor/classic-editor.php\";s:5:\"1.6.7\";s:32:\"duplicate-page/duplicatepage.php\";s:5:\"4.5.5\";s:9:\"hello.php\";s:5:\"1.7.2\";s:27:\"js_composer/js_composer.php\";s:5:\"8.6.1\";}}', 'off'),
(600, '_site_transient_timeout_wp_theme_files_patterns-400276e85072415b0d84b0da16116535', '1760526454', 'off'),
(601, '_site_transient_wp_theme_files_patterns-400276e85072415b0d84b0da16116535', 'a:2:{s:7:\"version\";s:0:\"\";s:8:\"patterns\";a:0:{}}', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 7, '_menu_item_type', 'custom'),
(4, 7, '_menu_item_menu_item_parent', '0'),
(5, 7, '_menu_item_object_id', '7'),
(6, 7, '_menu_item_object', 'custom'),
(7, 7, '_menu_item_target', ''),
(8, 7, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(9, 7, '_menu_item_xfn', ''),
(10, 7, '_menu_item_url', 'https://cipit.revamp.org.test'),
(11, 8, '_menu_item_type', 'post_type'),
(12, 8, '_menu_item_menu_item_parent', '7'),
(13, 8, '_menu_item_object_id', '2'),
(14, 8, '_menu_item_object', 'page'),
(15, 8, '_menu_item_target', ''),
(16, 8, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(17, 8, '_menu_item_xfn', ''),
(18, 8, '_menu_item_url', ''),
(19, 6, '_wp_trash_meta_status', 'publish'),
(20, 6, '_wp_trash_meta_time', '1760093916'),
(21, 9, '_wp_trash_meta_status', 'publish'),
(22, 9, '_wp_trash_meta_time', '1760093942'),
(31, 10, '_wp_trash_meta_status', 'publish'),
(32, 10, '_wp_trash_meta_time', '1760101827'),
(33, 12, '_wp_trash_meta_status', 'publish'),
(34, 12, '_wp_trash_meta_time', '1760101936'),
(35, 14, '_menu_item_type', 'custom'),
(36, 14, '_menu_item_menu_item_parent', '0'),
(37, 14, '_menu_item_object_id', '14'),
(38, 14, '_menu_item_object', 'custom'),
(39, 14, '_menu_item_target', ''),
(40, 14, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(41, 14, '_menu_item_xfn', ''),
(42, 14, '_menu_item_url', '#'),
(51, 13, '_wp_trash_meta_status', 'publish'),
(52, 13, '_wp_trash_meta_time', '1760101962'),
(54, 16, '_customize_changeset_uuid', '5ef0081c-445d-478e-bea6-db77fecc52c5'),
(57, 19, '_menu_item_type', 'post_type'),
(58, 19, '_menu_item_menu_item_parent', '0'),
(59, 19, '_menu_item_object_id', '16'),
(60, 19, '_menu_item_object', 'post'),
(61, 19, '_menu_item_target', ''),
(62, 19, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(63, 19, '_menu_item_xfn', ''),
(64, 19, '_menu_item_url', ''),
(65, 17, '_wp_trash_meta_status', 'publish'),
(66, 17, '_wp_trash_meta_time', '1760102608'),
(67, 20, '_wp_trash_meta_status', 'publish'),
(68, 20, '_wp_trash_meta_time', '1760102642'),
(69, 21, '_edit_lock', '1760102782:1'),
(71, 22, '_customize_changeset_uuid', '26a1782d-663d-40e8-a02b-85ddb1326dfb'),
(72, 21, '_customize_restore_dismissed', '1'),
(73, 25, '_menu_item_type', 'post_type'),
(74, 25, '_menu_item_menu_item_parent', '14'),
(75, 25, '_menu_item_object_id', '22'),
(76, 25, '_menu_item_object', 'page'),
(77, 25, '_menu_item_target', ''),
(78, 25, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(79, 25, '_menu_item_xfn', ''),
(80, 25, '_menu_item_url', ''),
(81, 23, '_wp_trash_meta_status', 'publish'),
(82, 23, '_wp_trash_meta_time', '1760102949'),
(83, 26, '_edit_lock', '1760103251:1'),
(84, 26, '_customize_restore_dismissed', '1'),
(85, 27, '_wp_trash_meta_status', 'publish'),
(86, 27, '_wp_trash_meta_time', '1760103340'),
(87, 28, '_wp_trash_meta_status', 'publish'),
(88, 28, '_wp_trash_meta_time', '1760106570'),
(89, 29, '_edit_lock', '1760119290:1'),
(90, 29, '_customize_restore_dismissed', '1'),
(91, 30, '_edit_lock', '1760119472:1'),
(92, 30, '_customize_restore_dismissed', '1'),
(93, 31, '_edit_lock', '1760256810:1'),
(94, 31, '_customize_restore_dismissed', '1'),
(95, 14, '_wp_old_date', '2025-10-10'),
(96, 25, '_wp_old_date', '2025-10-10'),
(97, 32, '_wp_trash_meta_status', 'publish'),
(98, 32, '_wp_trash_meta_time', '1760258989'),
(99, 33, '_wp_trash_meta_status', 'publish'),
(100, 33, '_wp_trash_meta_time', '1760259027'),
(101, 34, '_customize_draft_post_name', 'our-research-themes'),
(102, 34, '_customize_changeset_uuid', 'a4e17d9c-84d6-40b6-8fe1-11d4bd7bce54'),
(103, 35, '_edit_lock', '1760259668:1'),
(104, 35, '_customize_restore_dismissed', '1'),
(107, 16, '_edit_lock', '1760261322:1'),
(108, 1, '_edit_lock', '1760261213:1'),
(109, 37, '_edit_lock', '1760261194:1'),
(110, 22, '_edit_lock', '1760282437:1'),
(111, 22, '_edit_last', '1'),
(112, 22, '_wpb_vc_js_status', 'true'),
(113, 40, '_edit_lock', '1760291381:1'),
(114, 40, '_edit_last', '1'),
(115, 40, '_wpb_vc_js_status', 'false'),
(116, 42, '_edit_lock', '1760290646:1'),
(117, 43, '_edit_lock', '1760290671:1'),
(118, 44, '_edit_lock', '1760290732:1'),
(119, 45, '_edit_lock', '1760290739:1'),
(120, 46, '_edit_lock', '1760290745:1'),
(121, 47, '_edit_lock', '1760290769:1'),
(122, 48, '_edit_lock', '1760290935:1'),
(125, 50, '_edit_lock', '1760291240:1'),
(126, 51, '_edit_lock', '1760291245:1'),
(127, 52, '_edit_lock', '1760291250:1'),
(128, 53, '_edit_lock', '1760291266:1'),
(129, 54, '_edit_lock', '1760291433:1'),
(130, 55, '_edit_lock', '1760291319:1'),
(131, 40, '_wp_trash_meta_status', 'publish'),
(132, 40, '_wp_trash_meta_time', '1760291530'),
(133, 40, '_wp_desired_post_slug', 'blog'),
(134, 56, '_edit_lock', '1760428635:1'),
(137, 16, '_wp_trash_meta_status', 'publish'),
(138, 16, '_wp_trash_meta_time', '1760291826'),
(139, 16, '_wp_desired_post_slug', 'test'),
(140, 1, '_wp_trash_meta_status', 'publish'),
(141, 1, '_wp_trash_meta_time', '1760291829'),
(142, 1, '_wp_desired_post_slug', 'hello-world'),
(143, 1, '_wp_trash_meta_comments_status', 'a:1:{i:1;s:1:\"1\";}'),
(144, 56, '_edit_last', '1'),
(147, 3, '_edit_lock', '1760292477:1'),
(148, 59, '_edit_lock', '1760458213:1'),
(149, 59, '_edit_last', '1'),
(150, 59, '_wp_page_template', 'default'),
(151, 59, '_wpb_vc_js_status', 'true'),
(152, 59, '_wpb_vc_editor_type', 'classic'),
(153, 61, '_wp_attached_file', '2025/10/Akua-Updated-Photo-1.png'),
(154, 61, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:400;s:6:\"height\";i:400;s:4:\"file\";s:32:\"2025/10/Akua-Updated-Photo-1.png\";s:8:\"filesize\";i:306222;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:32:\"Akua-Updated-Photo-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:59913;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:32:\"Akua-Updated-Photo-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:17220;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(159, 56, '_thumbnail_id', '61'),
(160, 64, '_edit_lock', '1760434057:1'),
(161, 65, '_wp_attached_file', '2025/10/screenshot-1.png'),
(162, 65, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:900;s:4:\"file\";s:24:\"2025/10/screenshot-1.png\";s:8:\"filesize\";i:589419;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:24:\"screenshot-1-300x225.png\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:21969;}s:5:\"large\";a:5:{s:4:\"file\";s:25:\"screenshot-1-1024x768.png\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:170978;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:24:\"screenshot-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:10164;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:24:\"screenshot-1-768x576.png\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:104165;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(165, 64, '_edit_last', '1'),
(174, 64, '_thumbnail_id', '65'),
(181, 59, '_uag_page_assets', 'a:9:{s:3:\"css\";s:263:\".uag-blocks-common-selector{z-index:var(--z-index-desktop) !important}@media (max-width: 976px){.uag-blocks-common-selector{z-index:var(--z-index-tablet) !important}}@media (max-width: 767px){.uag-blocks-common-selector{z-index:var(--z-index-mobile) !important}}\n\";s:2:\"js\";s:0:\"\";s:18:\"current_block_list\";a:7:{i:0;s:11:\"core/search\";i:1;s:10:\"core/group\";i:2;s:12:\"core/heading\";i:3;s:17:\"core/latest-posts\";i:4;s:20:\"core/latest-comments\";i:5;s:13:\"core/archives\";i:6;s:15:\"core/categories\";}s:8:\"uag_flag\";b:0;s:11:\"uag_version\";s:10:\"1760416725\";s:6:\"gfonts\";a:0:{}s:10:\"gfonts_url\";s:0:\"\";s:12:\"gfonts_files\";a:0:{}s:14:\"uag_faq_layout\";b:0;}'),
(182, 59, '_uag_css_file_name', 'uag-css-59.css'),
(183, 56, '_uag_page_assets', 'a:9:{s:3:\"css\";s:263:\".uag-blocks-common-selector{z-index:var(--z-index-desktop) !important}@media (max-width: 976px){.uag-blocks-common-selector{z-index:var(--z-index-tablet) !important}}@media (max-width: 767px){.uag-blocks-common-selector{z-index:var(--z-index-mobile) !important}}\n\";s:2:\"js\";s:0:\"\";s:18:\"current_block_list\";a:9:{i:0;s:24:\"core/post-featured-image\";i:1;s:14:\"core/paragraph\";i:2;s:11:\"core/search\";i:3;s:10:\"core/group\";i:4;s:12:\"core/heading\";i:5;s:17:\"core/latest-posts\";i:6;s:20:\"core/latest-comments\";i:7;s:13:\"core/archives\";i:8;s:15:\"core/categories\";}s:8:\"uag_flag\";b:0;s:11:\"uag_version\";s:10:\"1760416725\";s:6:\"gfonts\";a:0:{}s:10:\"gfonts_url\";s:0:\"\";s:12:\"gfonts_files\";a:0:{}s:14:\"uag_faq_layout\";b:0;}'),
(184, 56, '_uag_css_file_name', 'uag-css-56.css'),
(185, 64, '_uag_page_assets', 'a:9:{s:3:\"css\";s:263:\".uag-blocks-common-selector{z-index:var(--z-index-desktop) !important}@media (max-width: 976px){.uag-blocks-common-selector{z-index:var(--z-index-tablet) !important}}@media (max-width: 767px){.uag-blocks-common-selector{z-index:var(--z-index-mobile) !important}}\n\";s:2:\"js\";s:0:\"\";s:18:\"current_block_list\";a:10:{i:0;s:24:\"core/post-featured-image\";i:1;s:15:\"core/post-terms\";i:2;s:14:\"core/paragraph\";i:3;s:11:\"core/search\";i:4;s:10:\"core/group\";i:5;s:12:\"core/heading\";i:6;s:17:\"core/latest-posts\";i:7;s:20:\"core/latest-comments\";i:8;s:13:\"core/archives\";i:9;s:15:\"core/categories\";}s:8:\"uag_flag\";b:0;s:11:\"uag_version\";s:10:\"1760416725\";s:6:\"gfonts\";a:0:{}s:10:\"gfonts_url\";s:0:\"\";s:12:\"gfonts_files\";a:0:{}s:14:\"uag_faq_layout\";b:0;}'),
(186, 64, '_uag_css_file_name', 'uag-css-64.css'),
(195, 73, 'footnotes', ''),
(198, 75, '_edit_last', '1'),
(199, 75, '_edit_lock', '1760517733:1'),
(200, 76, '_wp_attached_file', '2025/10/Screenshot-2025-09-12-at-3.28.04-PM-1.png'),
(201, 76, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:640;s:6:\"height\";i:830;s:4:\"file\";s:49:\"2025/10/Screenshot-2025-09-12-at-3.28.04-PM-1.png\";s:8:\"filesize\";i:488708;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:49:\"Screenshot-2025-09-12-at-3.28.04-PM-1-231x300.png\";s:5:\"width\";i:231;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:34415;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:49:\"Screenshot-2025-09-12-at-3.28.04-PM-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:12787;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(202, 75, '_thumbnail_id', '76'),
(207, 79, '_edit_last', '1'),
(208, 79, '_wp_page_template', 'default'),
(209, 79, '_wpb_vc_js_status', 'true'),
(210, 79, '_wpb_vc_editor_type', 'backend'),
(211, 79, '_edit_lock', '1760458225:1'),
(214, 81, '_edit_last', '1'),
(215, 81, '_edit_lock', '1760518332:1'),
(216, 81, '_thumbnail_id', '82'),
(217, 82, '_wp_attached_file', '2025/10/Screenshot-2025-09-23-at-2.21.30-PM-1.png'),
(218, 82, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:640;s:6:\"height\";i:830;s:4:\"file\";s:49:\"2025/10/Screenshot-2025-09-23-at-2.21.30-PM-1.png\";s:8:\"filesize\";i:434083;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:49:\"Screenshot-2025-09-23-at-2.21.30-PM-1-231x300.png\";s:5:\"width\";i:231;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:28241;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:49:\"Screenshot-2025-09-23-at-2.21.30-PM-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:10314;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(221, 84, '_edit_last', '1'),
(222, 84, '_edit_lock', '1760519280:1'),
(228, 87, '_edit_last', '1'),
(229, 87, '_edit_lock', '1760519119:1'),
(230, 87, '_thumbnail_id', '88'),
(231, 88, '_wp_attached_file', '2025/10/ethical-ai-dev-2.png'),
(232, 88, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:640;s:6:\"height\";i:830;s:4:\"file\";s:28:\"2025/10/ethical-ai-dev-2.png\";s:8:\"filesize\";i:565687;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:28:\"ethical-ai-dev-2-231x300.png\";s:5:\"width\";i:231;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:37574;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:28:\"ethical-ai-dev-2-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:14593;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(235, 90, '_wp_attached_file', '2025/10/cossa-2025-reports.png'),
(236, 90, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:640;s:6:\"height\";i:830;s:4:\"file\";s:30:\"2025/10/cossa-2025-reports.png\";s:8:\"filesize\";i:481981;s:5:\"sizes\";a:2:{s:6:\"medium\";a:5:{s:4:\"file\";s:30:\"cossa-2025-reports-231x300.png\";s:5:\"width\";i:231;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:31951;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:30:\"cossa-2025-reports-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:11674;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(237, 84, '_thumbnail_id', '90');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint UNSIGNED NOT NULL,
  `post_author` bigint UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2025-10-10 09:02:03', '2025-10-10 09:02:03', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'trash', 'open', 'open', '', 'hello-world__trashed', '', '', '2025-10-12 17:57:09', '2025-10-12 17:57:09', '', 0, 'https://cipit.revamp.org.test/?p=1', 0, 'post', '', 1),
(2, 1, '2025-10-10 09:02:03', '2025-10-10 09:02:03', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"https://cipit.revamp.org.test/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2025-10-10 09:02:03', '2025-10-10 09:02:03', '', 0, 'https://cipit.revamp.org.test/?page_id=2', 0, 'page', '', 0),
(3, 1, '2025-10-10 09:02:03', '2025-10-10 09:02:03', '<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we are</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: https://cipit.revamp.org.test.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comments</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Media</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Embedded content from other websites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we share your data with</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How long we retain your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">What rights you have over your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Where your data is sent</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2025-10-10 09:02:03', '2025-10-10 09:02:03', '', 0, 'https://cipit.revamp.org.test/?page_id=3', 0, 'page', '', 0),
(4, 1, '2025-10-10 09:02:16', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-10 09:02:16', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=4', 0, 'post', '', 0),
(5, 1, '2025-10-10 10:45:50', '2025-10-10 10:45:50', '<!-- wp:page-list /-->', 'Navigation', '', 'publish', 'closed', 'closed', '', 'navigation', '', '', '2025-10-10 10:45:50', '2025-10-10 10:45:50', '', 0, 'https://cipit.revamp.org.test/?p=5', 0, 'wp_navigation', '', 0),
(6, 1, '2025-10-10 10:58:36', '2025-10-10 10:58:36', '{\n    \"nav_menu[-8874505511076506000]\": {\n        \"value\": {\n            \"name\": \"Research\",\n            \"description\": \"\",\n            \"parent\": 0,\n            \"auto_add\": false\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 10:58:36\"\n    },\n    \"nav_menu_item[-4562487432663562000]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"\",\n            \"menu_item_parent\": 0,\n            \"position\": 1,\n            \"type\": \"custom\",\n            \"title\": \"Home\",\n            \"url\": \"https://cipit.revamp.org.test\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": -8874505511076506000,\n            \"_invalid\": false,\n            \"type_label\": \"Custom Link\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 10:58:36\"\n    },\n    \"nav_menu_item[-3303302770740998000]\": {\n        \"value\": {\n            \"object_id\": 2,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 2,\n            \"type\": \"post_type\",\n            \"title\": \"\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=2\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": -8874505511076506000,\n            \"_invalid\": false,\n            \"original_title\": \"Sample Page\",\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 10:58:36\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'fbe0ecdf-167b-462e-8192-84cbfa063aa8', '', '', '2025-10-10 10:58:36', '2025-10-10 10:58:36', '', 0, 'https://cipit.revamp.org.test/?p=6', 0, 'customize_changeset', '', 0),
(7, 1, '2025-10-10 10:59:02', '2025-10-10 10:58:36', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2025-10-10 10:59:02', '2025-10-10 10:59:02', '', 0, 'https://cipit.revamp.org.test/?p=7', 1, 'nav_menu_item', '', 0),
(8, 1, '2025-10-10 10:59:02', '2025-10-10 10:58:36', ' ', '', '', 'publish', 'closed', 'closed', '', '8', '', '', '2025-10-10 10:59:02', '2025-10-10 10:59:02', '', 0, 'https://cipit.revamp.org.test/?p=8', 2, 'nav_menu_item', '', 0),
(9, 1, '2025-10-10 10:59:02', '2025-10-10 10:59:02', '{\n    \"nav_menu_item[7]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 7,\n            \"object\": \"custom\",\n            \"type\": \"custom\",\n            \"type_label\": \"Custom Link\",\n            \"title\": \"Home\",\n            \"url\": \"https://cipit.revamp.org.test\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 2,\n            \"position\": 1,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 10:59:02\"\n    },\n    \"nav_menu_item[8]\": {\n        \"value\": {\n            \"menu_item_parent\": 7,\n            \"object_id\": 2,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=2\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 2,\n            \"position\": 2,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"Sample Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 10:59:02\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '022cbc4a-0156-4ffa-821c-479359b0f7b7', '', '', '2025-10-10 10:59:02', '2025-10-10 10:59:02', '', 0, 'https://cipit.revamp.org.test/?p=9', 0, 'customize_changeset', '', 0),
(10, 1, '2025-10-10 13:10:27', '2025-10-10 13:10:27', '{\n    \"cipitcustom::nav_menu_locations[primary-menu]\": {\n        \"value\": -5841468095379262000,\n        \"type\": \"theme_mod\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:10:27\"\n    },\n    \"nav_menu[-5841468095379262000]\": {\n        \"value\": {\n            \"name\": \"dsdsd\",\n            \"description\": \"\",\n            \"parent\": 0,\n            \"auto_add\": false\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:10:27\"\n    },\n    \"nav_menu_item[-8555196338587608000]\": {\n        \"value\": {\n            \"object_id\": 2,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 1,\n            \"type\": \"post_type\",\n            \"title\": \"\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=2\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": -5841468095379262000,\n            \"_invalid\": false,\n            \"original_title\": \"Sample Page\",\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:10:27\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'df4194ff-0970-40a9-a6d9-7a5716a6253a', '', '', '2025-10-10 13:10:27', '2025-10-10 13:10:27', '', 0, 'https://cipit.revamp.org.test/?p=10', 0, 'customize_changeset', '', 0),
(12, 1, '2025-10-10 13:12:16', '2025-10-10 13:12:16', '{\n    \"nav_menu_item[11]\": {\n        \"value\": false,\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:12:16\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '25e55ede-5d80-47f5-943d-4fc8a31262cc', '', '', '2025-10-10 13:12:16', '2025-10-10 13:12:16', '', 0, 'https://cipit.revamp.org.test/?p=12', 0, 'customize_changeset', '', 0),
(13, 1, '2025-10-10 13:12:42', '2025-10-10 13:12:42', '{\n    \"nav_menu_item[-6983925287382556000]\": {\n        \"value\": {\n            \"object_id\": 0,\n            \"object\": \"\",\n            \"menu_item_parent\": 0,\n            \"position\": 1,\n            \"type\": \"custom\",\n            \"title\": \"Home\",\n            \"url\": \"https://cipit.revamp.org.test\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": 3,\n            \"_invalid\": false,\n            \"type_label\": \"Custom Link\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:12:42\"\n    },\n    \"nav_menu_item[-6194535875426150000]\": {\n        \"value\": {\n            \"object_id\": 2,\n            \"object\": \"page\",\n            \"menu_item_parent\": -6983925287382556000,\n            \"position\": 2,\n            \"type\": \"post_type\",\n            \"title\": \"\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=2\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": 3,\n            \"_invalid\": false,\n            \"original_title\": \"Sample Page\",\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:12:42\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'ef87f775-b4f1-4aea-96e1-87d0c0210adc', '', '', '2025-10-10 13:12:42', '2025-10-10 13:12:42', '', 0, 'https://cipit.revamp.org.test/?p=13', 0, 'customize_changeset', '', 0),
(14, 1, '2025-10-12 08:49:49', '2025-10-10 13:12:42', '', 'Research', '', 'publish', 'closed', 'closed', '', 'home-2', '', '', '2025-10-12 08:49:49', '2025-10-12 08:49:49', '', 0, 'https://cipit.revamp.org.test/?p=14', 1, 'nav_menu_item', '', 0),
(16, 1, '2025-10-10 13:23:27', '2025-10-10 13:23:27', '', 'Test', '', 'trash', 'open', 'open', '', 'test__trashed', '', '', '2025-10-12 17:57:06', '2025-10-12 17:57:06', '', 0, 'https://cipit.revamp.org.test/?p=16', 0, 'post', '', 0),
(17, 1, '2025-10-10 13:23:27', '2025-10-10 13:23:27', '{\n    \"nav_menus_created_posts\": {\n        \"value\": [\n            16\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:23:27\"\n    },\n    \"nav_menu_item[-470607258880518140]\": {\n        \"value\": {\n            \"object_id\": 16,\n            \"object\": \"post\",\n            \"menu_item_parent\": 0,\n            \"position\": 2,\n            \"type\": \"post_type\",\n            \"title\": \"Test\",\n            \"url\": \"https://cipit.revamp.org.test/?p=16\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": 3,\n            \"_invalid\": false,\n            \"type_label\": \"Post\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:23:27\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '5ef0081c-445d-478e-bea6-db77fecc52c5', '', '', '2025-10-10 13:23:27', '2025-10-10 13:23:27', '', 0, 'https://cipit.revamp.org.test/?p=17', 0, 'customize_changeset', '', 0),
(18, 1, '2025-10-10 13:23:27', '2025-10-10 13:23:27', '', 'Test', '', 'inherit', 'closed', 'closed', '', '16-revision-v1', '', '', '2025-10-10 13:23:27', '2025-10-10 13:23:27', '', 16, 'https://cipit.revamp.org.test/?p=18', 0, 'revision', '', 0),
(19, 1, '2025-10-10 13:35:40', '2025-10-10 13:23:28', ' ', '', '', 'publish', 'closed', 'closed', '', '19', '', '', '2025-10-10 13:35:40', '2025-10-10 13:35:40', '', 0, 'https://cipit.revamp.org.test/?p=19', 4, 'nav_menu_item', '', 0),
(20, 1, '2025-10-10 13:24:02', '2025-10-10 13:24:02', '{\n    \"nav_menu[3]\": {\n        \"value\": {\n            \"name\": \"Main Nav\",\n            \"description\": \"\",\n            \"parent\": 0,\n            \"auto_add\": false\n        },\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:24:02\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '12e93e74-ae09-4584-b92c-199bef55b916', '', '', '2025-10-10 13:24:02', '2025-10-10 13:24:02', '', 0, 'https://cipit.revamp.org.test/?p=20', 0, 'customize_changeset', '', 0),
(21, 1, '2025-10-10 13:24:54', '0000-00-00 00:00:00', '{\n    \"nav_menu[2]\": {\n        \"value\": false,\n        \"type\": \"nav_menu\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:24:54\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', '5aa44155-a9af-468a-818b-bf1f1d2b00dd', '', '', '2025-10-10 13:24:54', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=21', 0, 'customize_changeset', '', 0),
(22, 1, '2025-10-10 13:29:09', '2025-10-10 13:29:09', '[vc_row][vc_column][vc_column_text]I am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\nI am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\r\n\r\n&nbsp;\r\n\r\nI am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\r\n\r\n&nbsp;\r\n\r\nI am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\r\n\r\n&nbsp;\r\n\r\nI am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.[/vc_column_text][/vc_column][/vc_row]', 'News And events', '', 'publish', 'closed', 'closed', '', 'news-and-events', '', '', '2025-10-12 09:38:10', '2025-10-12 09:38:10', '', 0, 'https://cipit.revamp.org.test/?page_id=22', 0, 'page', '', 0),
(23, 1, '2025-10-10 13:29:09', '2025-10-10 13:29:09', '{\n    \"nav_menus_created_posts\": {\n        \"value\": [\n            22\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:29:09\"\n    },\n    \"nav_menu_item[-4795436716114137000]\": {\n        \"value\": {\n            \"object_id\": 22,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 4,\n            \"type\": \"post_type\",\n            \"title\": \"News And events\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=22\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": 3,\n            \"_invalid\": false,\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:29:09\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '26a1782d-663d-40e8-a02b-85ddb1326dfb', '', '', '2025-10-10 13:29:09', '2025-10-10 13:29:09', '', 0, 'https://cipit.revamp.org.test/?p=23', 0, 'customize_changeset', '', 0),
(24, 1, '2025-10-10 13:29:09', '2025-10-10 13:29:09', '', 'News And events', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2025-10-10 13:29:09', '2025-10-10 13:29:09', '', 22, 'https://cipit.revamp.org.test/?p=24', 0, 'revision', '', 0),
(25, 1, '2025-10-12 08:50:27', '2025-10-10 13:29:09', '', 'Our Research Themes', '', 'publish', 'closed', 'closed', '', '25', '', '', '2025-10-12 08:50:27', '2025-10-12 08:50:27', '', 0, 'https://cipit.revamp.org.test/?p=25', 2, 'nav_menu_item', '', 0),
(26, 1, '2025-10-10 13:32:00', '0000-00-00 00:00:00', '{\n    \"nav_menu_item[15]\": {\n        \"value\": {\n            \"menu_item_parent\": 14,\n            \"object_id\": 2,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=2\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 2,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"Sample Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:31:28\"\n    },\n    \"nav_menu_item[19]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 16,\n            \"object\": \"post\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Post\",\n            \"url\": \"https://cipit.revamp.org.test/?p=16\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 4,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"Test\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:31:28\"\n    },\n    \"nav_menu_item[25]\": {\n        \"value\": {\n            \"object_id\": 22,\n            \"object\": \"page\",\n            \"menu_item_parent\": 15,\n            \"position\": 3,\n            \"type\": \"post_type\",\n            \"title\": \"News And events\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=22\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": 3,\n            \"_invalid\": false,\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:32:00\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', 'ad26cdf9-4c89-4462-876a-323adf58608f', '', '', '2025-10-10 13:32:00', '2025-10-10 13:32:00', '', 0, 'https://cipit.revamp.org.test/?p=26', 0, 'customize_changeset', '', 0),
(27, 1, '2025-10-10 13:35:40', '2025-10-10 13:35:40', '{\n    \"nav_menu_item[19]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 16,\n            \"object\": \"post\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Post\",\n            \"url\": \"https://cipit.revamp.org.test/?p=16\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 4,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"Test\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:35:40\"\n    },\n    \"nav_menu_item[25]\": {\n        \"value\": {\n            \"menu_item_parent\": 15,\n            \"object_id\": 22,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=22\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 3,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"News And events\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 13:35:40\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'a9dc9a18-f1db-430c-a23a-30344c25ef37', '', '', '2025-10-10 13:35:40', '2025-10-10 13:35:40', '', 0, 'https://cipit.revamp.org.test/?p=27', 0, 'customize_changeset', '', 0),
(28, 1, '2025-10-10 14:29:30', '2025-10-10 14:29:30', '{\n    \"nav_menu_item[25]\": {\n        \"value\": {\n            \"menu_item_parent\": 15,\n            \"object_id\": 22,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=22\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 3,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"News And events\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 14:29:30\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'd1da3867-7f56-44e8-a2cc-a159d174f5b1', '', '', '2025-10-10 14:29:30', '2025-10-10 14:29:30', '', 0, 'https://cipit.revamp.org.test/?p=28', 0, 'customize_changeset', '', 0),
(29, 1, '2025-10-10 17:50:11', '0000-00-00 00:00:00', '{\n    \"nav_menu_item[25]\": {\n        \"value\": {\n            \"menu_item_parent\": 15,\n            \"object_id\": 22,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=22\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 3,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"News And events\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 17:50:11\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', '74bdef1b-a20e-47b1-b2a1-684148d3953c', '', '', '2025-10-10 17:50:11', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=29', 0, 'customize_changeset', '', 0),
(30, 1, '2025-10-10 18:04:08', '0000-00-00 00:00:00', '{\n    \"nav_menu_item[25]\": {\n        \"value\": {\n            \"menu_item_parent\": 15,\n            \"object_id\": 22,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=22\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 3,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"News And events\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 18:04:08\"\n    },\n    \"nav_menu_item[19]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 16,\n            \"object\": \"post\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Post\",\n            \"url\": \"https://cipit.revamp.org.test/?p=16\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 4,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"Test\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-10 18:04:08\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', '8fb0d030-e440-46e7-bd6f-ec7d3aac19e9', '', '', '2025-10-10 18:04:08', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=30', 0, 'customize_changeset', '', 0),
(31, 1, '2025-10-12 08:12:45', '0000-00-00 00:00:00', '{\n    \"nav_menu_item[25]\": {\n        \"value\": {\n            \"menu_item_parent\": 14,\n            \"object_id\": 22,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=22\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 3,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"News And events\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:12:45\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', 'bfb3d4ef-6df7-41ad-9fbc-acbd9a15455f', '', '', '2025-10-12 08:12:45', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=31', 0, 'customize_changeset', '', 0),
(32, 1, '2025-10-12 08:49:49', '2025-10-12 08:49:49', '{\n    \"nav_menu_item[14]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 14,\n            \"object\": \"custom\",\n            \"type\": \"custom\",\n            \"type_label\": \"Custom Link\",\n            \"title\": \"Research\",\n            \"url\": \"#\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 1,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:49:49\"\n    },\n    \"nav_menu_item[15]\": {\n        \"value\": false,\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:49:49\"\n    },\n    \"nav_menu_item[25]\": {\n        \"value\": {\n            \"menu_item_parent\": 14,\n            \"object_id\": 22,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=22\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 2,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"News And events\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:49:49\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '0611d298-3ad6-4514-925f-7323b065c155', '', '', '2025-10-12 08:49:49', '2025-10-12 08:49:49', '', 0, 'https://cipit.revamp.org.test/?p=32', 0, 'customize_changeset', '', 0),
(33, 1, '2025-10-12 08:50:27', '2025-10-12 08:50:27', '{\n    \"nav_menu_item[25]\": {\n        \"value\": {\n            \"menu_item_parent\": 14,\n            \"object_id\": 22,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=22\",\n            \"title\": \"Our Research Themes\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 2,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"News And events\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:50:27\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '4207097d-2eff-4b96-8265-9bbe442e5641', '', '', '2025-10-12 08:50:27', '2025-10-12 08:50:27', '', 0, 'https://cipit.revamp.org.test/?p=33', 0, 'customize_changeset', '', 0),
(34, 1, '2025-10-12 08:54:06', '0000-00-00 00:00:00', '', 'Our Research Themes', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2025-10-12 08:50:59', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?page_id=34', 0, 'page', '', 0),
(35, 1, '2025-10-12 08:54:06', '0000-00-00 00:00:00', '{\n    \"nav_menu_item[19]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 16,\n            \"object\": \"post\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Post\",\n            \"url\": \"https://cipit.revamp.org.test/?p=16\",\n            \"title\": \"\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 7,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"Test\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:54:06\"\n    },\n    \"nav_menus_created_posts\": {\n        \"value\": [\n            34\n        ],\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:51:35\"\n    },\n    \"nav_menu_item[-2033973256872748000]\": {\n        \"value\": {\n            \"object_id\": 34,\n            \"object\": \"page\",\n            \"menu_item_parent\": 14,\n            \"position\": 3,\n            \"type\": \"post_type\",\n            \"title\": \"Our Research Themes\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=34\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": 3,\n            \"_invalid\": false,\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:54:06\"\n    },\n    \"nav_menu_item[-1270603086317150200]\": {\n        \"value\": {\n            \"object_id\": 2,\n            \"object\": \"page\",\n            \"menu_item_parent\": -7398512409616874000,\n            \"position\": 5,\n            \"type\": \"post_type\",\n            \"title\": \"Data Governance & Policy\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=2\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": 3,\n            \"_invalid\": false,\n            \"original_title\": \"Sample Page\",\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:54:06\"\n    },\n    \"nav_menu_item[-7398512409616874000]\": {\n        \"value\": {\n            \"object_id\": 2,\n            \"object\": \"page\",\n            \"menu_item_parent\": -2033973256872748000,\n            \"position\": 4,\n            \"type\": \"post_type\",\n            \"title\": \"Artificial Intelligence\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=2\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": 3,\n            \"_invalid\": false,\n            \"original_title\": \"Sample Page\",\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:54:06\"\n    },\n    \"nav_menu_item[-8198769095052559000]\": {\n        \"value\": {\n            \"object_id\": 2,\n            \"object\": \"page\",\n            \"menu_item_parent\": 0,\n            \"position\": 1,\n            \"type\": \"post_type\",\n            \"title\": \"Digital Identity\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=2\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"status\": \"publish\",\n            \"nav_menu_term_id\": 3,\n            \"_invalid\": false,\n            \"original_title\": \"Sample Page\",\n            \"type_label\": \"Page\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:54:06\"\n    },\n    \"nav_menu_item[25]\": {\n        \"value\": {\n            \"menu_item_parent\": -7398512409616874000,\n            \"object_id\": 22,\n            \"object\": \"page\",\n            \"type\": \"post_type\",\n            \"type_label\": \"Page\",\n            \"url\": \"https://cipit.revamp.org.test/?page_id=22\",\n            \"title\": \"Our Research Themes\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 6,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"News And events\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:54:06\"\n    },\n    \"nav_menu_item[14]\": {\n        \"value\": {\n            \"menu_item_parent\": 0,\n            \"object_id\": 14,\n            \"object\": \"custom\",\n            \"type\": \"custom\",\n            \"type_label\": \"Custom Link\",\n            \"title\": \"Research\",\n            \"url\": \"#\",\n            \"target\": \"\",\n            \"attr_title\": \"\",\n            \"description\": \"\",\n            \"classes\": \"\",\n            \"xfn\": \"\",\n            \"nav_menu_term_id\": 3,\n            \"position\": 2,\n            \"status\": \"publish\",\n            \"_invalid\": false,\n            \"original_title\": \"\"\n        },\n        \"type\": \"nav_menu_item\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2025-10-12 08:54:06\"\n    }\n}', '', '', 'auto-draft', 'closed', 'closed', '', 'a4e17d9c-84d6-40b6-8fe1-11d4bd7bce54', '', '', '2025-10-12 08:54:06', '2025-10-12 08:54:06', '', 0, 'https://cipit.revamp.org.test/?p=35', 0, 'customize_changeset', '', 0),
(37, 1, '2025-10-12 09:28:57', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-12 09:28:57', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=37', 0, 'post', '', 0),
(38, 1, '2025-10-12 09:30:08', '2025-10-12 09:30:08', '[vc_row][vc_column][vc_column_text]I am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.[/vc_column_text][/vc_column][/vc_row]', 'News And events', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2025-10-12 09:30:08', '2025-10-12 09:30:08', '', 22, 'https://cipit.revamp.org.test/?p=38', 0, 'revision', '', 0),
(39, 1, '2025-10-12 09:38:10', '2025-10-12 09:38:10', '[vc_row][vc_column][vc_column_text]I am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\nI am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\r\n\r\n&nbsp;\r\n\r\nI am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\r\n\r\n&nbsp;\r\n\r\nI am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.\r\n\r\n&nbsp;\r\n\r\nI am text block. Click edit button to change this text. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo.[/vc_column_text][/vc_column][/vc_row]', 'News And events', '', 'inherit', 'closed', 'closed', '', '22-revision-v1', '', '', '2025-10-12 09:38:10', '2025-10-12 09:38:10', '', 22, 'https://cipit.revamp.org.test/?p=39', 0, 'revision', '', 0),
(40, 1, '2025-10-12 17:27:30', '2025-10-12 17:27:30', '', 'Blog', '', 'trash', 'closed', 'closed', '', 'blog__trashed', '', '', '2025-10-12 17:52:10', '2025-10-12 17:52:10', '', 0, 'https://cipit.revamp.org.test/?page_id=40', 0, 'page', '', 0),
(41, 1, '2025-10-12 17:27:30', '2025-10-12 17:27:30', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '40-revision-v1', '', '', '2025-10-12 17:27:30', '2025-10-12 17:27:30', '', 40, 'https://cipit.revamp.org.test/?p=41', 0, 'revision', '', 0),
(42, 1, '2025-10-12 17:39:42', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-12 17:39:42', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=42', 0, 'post', '', 0),
(43, 1, '2025-10-12 17:40:13', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-12 17:40:13', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=43', 0, 'post', '', 0),
(44, 1, '2025-10-12 17:41:14', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-12 17:41:14', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=44', 0, 'post', '', 0),
(45, 1, '2025-10-12 17:41:17', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-12 17:41:17', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=45', 0, 'post', '', 0),
(46, 1, '2025-10-12 17:41:27', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-12 17:41:27', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=46', 0, 'post', '', 0),
(47, 1, '2025-10-12 17:41:51', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-12 17:41:51', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=47', 0, 'post', '', 0),
(48, 1, '2025-10-12 17:44:38', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-12 17:44:38', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=48', 0, 'post', '', 0),
(50, 1, '2025-10-12 17:49:40', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-12 17:49:40', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=50', 0, 'post', '', 0),
(51, 1, '2025-10-12 17:49:47', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-12 17:49:47', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=51', 0, 'post', '', 0),
(52, 1, '2025-10-12 17:49:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-12 17:49:53', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=52', 0, 'post', '', 0),
(53, 1, '2025-10-12 17:50:07', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2025-10-12 17:50:07', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?post_type=blog_post&p=53', 0, 'blog_post', '', 0),
(54, 1, '2025-10-12 17:50:37', '2025-10-12 17:50:37', '<!-- wp:paragraph -->\n<p>fdfdfdf</p>\n<!-- /wp:paragraph -->', 'THessdsd', '', 'publish', 'open', 'closed', '', 'thessdsd', '', '', '2025-10-12 17:50:37', '2025-10-12 17:50:37', '', 0, 'https://cipit.revamp.org.test/?post_type=blog_post&#038;p=54', 0, 'blog_post', '', 0),
(55, 1, '2025-10-12 17:51:02', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2025-10-12 17:51:02', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?post_type=blog_post&p=55', 0, 'blog_post', '', 0),
(56, 1, '2025-10-12 17:56:15', '2025-10-12 17:56:15', '<!-- wp:post-featured-image /-->\n\n<!-- wp:paragraph -->\n<p>This is a blog test</p>\n<!-- /wp:paragraph -->', 'This is a test', '', 'publish', 'open', 'open', '', 'this-is-a-test', '', '', '2025-10-14 07:57:14', '2025-10-14 07:57:14', '', 0, 'https://cipit.revamp.org.test/?p=56', 0, 'post', '', 0),
(57, 1, '2025-10-12 17:56:15', '2025-10-12 17:56:15', '<!-- wp:paragraph -->\n<p>This is a blog test</p>\n<!-- /wp:paragraph -->', 'This is a test', '', 'inherit', 'closed', 'closed', '', '56-revision-v1', '', '', '2025-10-12 17:56:15', '2025-10-12 17:56:15', '', 56, 'https://cipit.revamp.org.test/?p=57', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(58, 1, '2025-10-12 17:57:09', '2025-10-12 17:57:09', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2025-10-12 17:57:09', '2025-10-12 17:57:09', '', 1, 'https://cipit.revamp.org.test/?p=58', 0, 'revision', '', 0),
(59, 1, '2025-10-12 18:11:15', '2025-10-12 18:11:15', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2025-10-12 18:11:15', '2025-10-12 18:11:15', '', 0, 'https://cipit.revamp.org.test/?page_id=59', 0, 'page', '', 0),
(60, 1, '2025-10-12 18:11:15', '2025-10-12 18:11:15', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2025-10-12 18:11:15', '2025-10-12 18:11:15', '', 59, 'https://cipit.revamp.org.test/?p=60', 0, 'revision', '', 0),
(61, 1, '2025-10-12 18:42:15', '2025-10-12 18:42:15', '', 'Akua Updated Photo 1', '', 'inherit', 'open', 'closed', '', 'akua-updated-photo-1', '', '', '2025-10-12 18:42:15', '2025-10-12 18:42:15', '', 56, 'https://cipit.revamp.org.test/wp-content/uploads/2025/10/Akua-Updated-Photo-1.png', 0, 'attachment', 'image/png', 0),
(62, 1, '2025-10-12 18:42:33', '2025-10-12 18:42:33', '<!-- wp:image {\"id\":61} -->\n<figure class=\"wp-block-image\"><img src=\"https://cipit.revamp.org.test/wp-content/uploads/2025/10/Akua-Updated-Photo-1.png\" alt=\"\" class=\"wp-image-61\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>This is a blog test</p>\n<!-- /wp:paragraph -->', 'This is a test', '', 'inherit', 'closed', 'closed', '', '56-revision-v1', '', '', '2025-10-12 18:42:33', '2025-10-12 18:42:33', '', 56, 'https://cipit.revamp.org.test/?p=62', 0, 'revision', '', 0),
(63, 1, '2025-10-12 18:44:01', '2025-10-12 18:44:01', '<!-- wp:post-featured-image /-->\n\n<!-- wp:paragraph -->\n<p>This is a blog test</p>\n<!-- /wp:paragraph -->', 'This is a test', '', 'inherit', 'closed', 'closed', '', '56-revision-v1', '', '', '2025-10-12 18:44:01', '2025-10-12 18:44:01', '', 56, 'https://cipit.revamp.org.test/?p=63', 0, 'revision', '', 0),
(64, 1, '2025-10-13 08:00:10', '2025-10-13 08:00:10', '<!-- wp:post-featured-image /-->\r\n\r\n<!-- wp:post-terms {\"term\":\"post_tag\"} /-->\r\n\r\n<!-- wp:paragraph --><!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<!-- /wp:paragraph -->', 'The test', '', 'publish', 'open', 'open', '', 'the-test', '', '', '2025-10-14 09:06:24', '2025-10-14 09:06:24', '', 0, 'https://cipit.revamp.org.test/?p=64', 0, 'post', '', 0),
(65, 1, '2025-10-13 07:59:10', '2025-10-13 07:59:10', '', 'screenshot (1)', '', 'inherit', 'open', 'closed', '', 'screenshot-1', '', '', '2025-10-13 07:59:10', '2025-10-13 07:59:10', '', 64, 'https://cipit.revamp.org.test/wp-content/uploads/2025/10/screenshot-1.png', 0, 'attachment', 'image/png', 0),
(66, 1, '2025-10-13 08:00:10', '2025-10-13 08:00:10', '<!-- wp:image {\"id\":65,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"https://cipit.revamp.org.test/wp-content/uploads/2025/10/screenshot-1-1024x768.png\" alt=\"\" class=\"wp-image-65\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<!-- /wp:paragraph -->', 'The test', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2025-10-13 08:00:10', '2025-10-13 08:00:10', '', 64, 'https://cipit.revamp.org.test/?p=66', 0, 'revision', '', 0),
(68, 1, '2025-10-13 08:03:19', '2025-10-13 08:03:19', '<!-- wp:image {\"id\":65} -->\n<figure class=\"wp-block-image\"><img src=\"https://cipit.revamp.org.test/wp-content/uploads/2025/10/screenshot-1.png\" alt=\"\" class=\"wp-image-65\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<!-- /wp:paragraph -->', 'The test', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2025-10-13 08:03:19', '2025-10-13 08:03:19', '', 64, 'https://cipit.revamp.org.test/?p=68', 0, 'revision', '', 0),
(70, 1, '2025-10-13 08:06:17', '2025-10-13 08:06:17', '<!-- wp:post-featured-image /-->\n\n<!-- wp:paragraph -->\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<!-- /wp:paragraph -->', 'The test', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2025-10-13 08:06:17', '2025-10-13 08:06:17', '', 64, 'https://cipit.revamp.org.test/?p=70', 0, 'revision', '', 0),
(71, 1, '2025-10-14 03:56:59', '2025-10-14 03:56:59', '<!-- wp:post-featured-image /-->\n\n<!-- wp:post-terms {\"term\":\"post_tag\",\"prefix\":\"Artificial Intelligence \"} /-->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<!-- /wp:paragraph -->', 'The test', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2025-10-14 03:56:59', '2025-10-14 03:56:59', '', 64, 'https://cipit.revamp.org.test/?p=71', 0, 'revision', '', 0),
(72, 1, '2025-10-14 08:51:48', '2025-10-14 08:51:48', '<!-- wp:post-featured-image /-->\n\n<!-- wp:post-terms {\"term\":\"post_tag\"} /-->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<!-- /wp:paragraph -->', 'The test', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2025-10-14 08:51:48', '2025-10-14 08:51:48', '', 64, 'https://cipit.revamp.org.test/?p=72', 0, 'revision', '', 0),
(73, 1, '2025-10-14 08:53:57', '2025-10-14 08:53:57', '<!-- wp:post-featured-image /-->\n\n<!-- wp:post-terms {\"term\":\"post_tag\"} /-->\n\n<!-- wp:post-author-name /-->\n\n<!-- wp:paragraph -->\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<!-- /wp:paragraph -->', 'The test', '', 'inherit', 'closed', 'closed', '', '64-autosave-v1', '', '', '2025-10-14 08:53:57', '2025-10-14 08:53:57', '', 64, 'https://cipit.revamp.org.test/?p=73', 0, 'revision', '', 0),
(74, 1, '2025-10-14 09:06:24', '2025-10-14 09:06:24', '<!-- wp:post-featured-image /-->\r\n\r\n<!-- wp:post-terms {\"term\":\"post_tag\"} /-->\r\n\r\n<!-- wp:paragraph --><!-- /wp:paragraph -->\r\n\r\n<!-- wp:paragraph -->\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<!-- /wp:paragraph -->', 'The test', '', 'inherit', 'closed', 'closed', '', '64-revision-v1', '', '', '2025-10-14 09:06:24', '2025-10-14 09:06:24', '', 64, 'https://cipit.revamp.org.test/?p=74', 0, 'revision', '', 0),
(75, 1, '2025-10-14 15:54:14', '2025-10-14 15:54:14', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque hendrerit odio vel molestie interdum. Donec efficitur egestas leo vitae porttitor. Nunc ultrices semper porttitor. Donec elementum id dui ac fermentum. In eu tempus magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pellentesque blandit risus id pharetra. Donec eu nibh nec tellus mollis ultrices. Vivamus placerat tincidunt mauris blandit facilisis.\r\n\r\nVivamus eleifend ornare pellentesque. Donec ut metus placerat, mattis ex eu, mollis nibh. Sed ullamcorper venenatis quam finibus tincidunt. Aliquam tristique mi nec nisl tempor, nec pretium felis auctor. Nulla vitae ultrices erat. Nulla maximus tristique quam, sed lobortis enim porta at. Nullam vitae rhoncus lectus. Integer nec massa eget lacus placerat tristique sed a neque.\r\n\r\nSed varius odio in mauris sollicitudin varius sit amet et tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ornare sollicitudin nibh in tristique. Morbi vitae erat aliquam, malesuada erat nec, ornare metus. Cras non nibh sed erat lobortis fringilla. Nam efficitur mattis velit, eu euismod lorem. Curabitur consectetur urna quis quam convallis accumsan. Maecenas vulputate est neque, id gravida justo imperdiet quis. Nam nunc tortor, consectetur in porta consequat, porttitor a diam. Nulla aliquam a elit eget euismod. In et cursus nibh.\r\n\r\nNam interdum vitae magna sed vehicula. Sed sapien tellus, consequat sed lectus at, congue fermentum odio. Ut id varius mauris. Mauris molestie felis eu posuere pharetra. Fusce sit amet dolor sem. Fusce pellentesque consectetur feugiat. Praesent eget felis aliquet, varius nunc et, maximus velit. Fusce euismod ornare aliquam. Quisque et venenatis velit, a suscipit est.\r\n\r\nMauris quis ultricies quam. Nullam dictum id sapien vel ultricies. Etiam sagittis nunc dui, eget blandit massa ultrices vitae. Quisque varius, dui id laoreet condimentum, nulla quam posuere nisl, ac varius nulla nisi at leo. Suspendisse leo nunc, vehicula eu justo et, iaculis porta est. Ut et rhoncus justo, eu maximus justo. Aenean vehicula at diam cursus viverra. Quisque molestie mi vitae fermentum fringilla. Suspendisse in dui ut quam varius vestibulum pellentesque nec mi.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '', 'publish', 'open', 'open', '', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit', '', '', '2025-10-15 08:42:13', '2025-10-15 08:42:13', '', 0, 'https://cipit.revamp.org.test/?p=75', 0, 'post', '', 0),
(76, 1, '2025-10-14 15:54:04', '2025-10-14 15:54:04', '', 'Screenshot 2025-09-12 at 3.28.04 PM 1', '', 'inherit', 'open', 'closed', '', 'screenshot-2025-09-12-at-3-28-04-pm-1', '', '', '2025-10-14 15:54:04', '2025-10-14 15:54:04', '', 75, 'https://cipit.revamp.org.test/wp-content/uploads/2025/10/Screenshot-2025-09-12-at-3.28.04-PM-1.png', 0, 'attachment', 'image/png', 0),
(77, 1, '2025-10-14 15:54:14', '2025-10-14 15:54:14', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque hendrerit odio vel molestie interdum. Donec efficitur egestas leo vitae porttitor. Nunc ultrices semper porttitor. Donec elementum id dui ac fermentum. In eu tempus magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pellentesque blandit risus id pharetra. Donec eu nibh nec tellus mollis ultrices. Vivamus placerat tincidunt mauris blandit facilisis.\r\n\r\nVivamus eleifend ornare pellentesque. Donec ut metus placerat, mattis ex eu, mollis nibh. Sed ullamcorper venenatis quam finibus tincidunt. Aliquam tristique mi nec nisl tempor, nec pretium felis auctor. Nulla vitae ultrices erat. Nulla maximus tristique quam, sed lobortis enim porta at. Nullam vitae rhoncus lectus. Integer nec massa eget lacus placerat tristique sed a neque.\r\n\r\nSed varius odio in mauris sollicitudin varius sit amet et tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ornare sollicitudin nibh in tristique. Morbi vitae erat aliquam, malesuada erat nec, ornare metus. Cras non nibh sed erat lobortis fringilla. Nam efficitur mattis velit, eu euismod lorem. Curabitur consectetur urna quis quam convallis accumsan. Maecenas vulputate est neque, id gravida justo imperdiet quis. Nam nunc tortor, consectetur in porta consequat, porttitor a diam. Nulla aliquam a elit eget euismod. In et cursus nibh.\r\n\r\nNam interdum vitae magna sed vehicula. Sed sapien tellus, consequat sed lectus at, congue fermentum odio. Ut id varius mauris. Mauris molestie felis eu posuere pharetra. Fusce sit amet dolor sem. Fusce pellentesque consectetur feugiat. Praesent eget felis aliquet, varius nunc et, maximus velit. Fusce euismod ornare aliquam. Quisque et venenatis velit, a suscipit est.\r\n\r\nMauris quis ultricies quam. Nullam dictum id sapien vel ultricies. Etiam sagittis nunc dui, eget blandit massa ultrices vitae. Quisque varius, dui id laoreet condimentum, nulla quam posuere nisl, ac varius nulla nisi at leo. Suspendisse leo nunc, vehicula eu justo et, iaculis porta est. Ut et rhoncus justo, eu maximus justo. Aenean vehicula at diam cursus viverra. Quisque molestie mi vitae fermentum fringilla. Suspendisse in dui ut quam varius vestibulum pellentesque nec mi.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '', 'inherit', 'closed', 'closed', '', '75-revision-v1', '', '', '2025-10-14 15:54:14', '2025-10-14 15:54:14', '', 75, 'https://cipit.revamp.org.test/?p=77', 0, 'revision', '', 0),
(78, 1, '2025-10-14 15:58:11', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-10-14 15:58:11', '0000-00-00 00:00:00', '', 0, 'https://cipit.revamp.org.test/?p=78', 0, 'post', '', 0),
(79, 1, '2025-10-14 16:11:43', '2025-10-14 16:11:43', '', 'Books', '', 'publish', 'closed', 'closed', '', 'books', '', '', '2025-10-14 16:11:43', '2025-10-14 16:11:43', '', 0, 'https://cipit.revamp.org.test/?page_id=79', 0, 'page', '', 0),
(80, 1, '2025-10-14 16:11:43', '2025-10-14 16:11:43', '', 'Books', '', 'inherit', 'closed', 'closed', '', '79-revision-v1', '', '', '2025-10-14 16:11:43', '2025-10-14 16:11:43', '', 79, 'https://cipit.revamp.org.test/?p=80', 0, 'revision', '', 0),
(81, 1, '2025-10-15 08:54:06', '2025-10-15 08:54:06', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque hendrerit odio vel molestie interdum. Donec efficitur egestas leo vitae porttitor. Nunc ultrices semper porttitor. Donec elementum id dui ac fermentum. In eu tempus magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pellentesque blandit risus id pharetra. Donec eu nibh nec tellus mollis ultrices. Vivamus placerat tincidunt mauris blandit facilisis.\r\n\r\nVivamus eleifend ornare pellentesque. Donec ut metus placerat, mattis ex eu, mollis nibh. Sed ullamcorper venenatis quam finibus tincidunt. Aliquam tristique mi nec nisl tempor, nec pretium felis auctor. Nulla vitae ultrices erat. Nulla maximus tristique quam, sed lobortis enim porta at. Nullam vitae rhoncus lectus. Integer nec massa eget lacus placerat tristique sed a neque.\r\n\r\nSed varius odio in mauris sollicitudin varius sit amet et tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ornare sollicitudin nibh in tristique. Morbi vitae erat aliquam, malesuada erat nec, ornare metus. Cras non nibh sed erat lobortis fringilla. Nam efficitur mattis velit, eu euismod lorem. Curabitur consectetur urna quis quam convallis accumsan. Maecenas vulputate est neque, id gravida justo imperdiet quis. Nam nunc tortor, consectetur in porta consequat, porttitor a diam. Nulla aliquam a elit eget euismod. In et cursus nibh.\r\n\r\nNam interdum vitae magna sed vehicula. Sed sapien tellus, consequat sed lectus at, congue fermentum odio. Ut id varius mauris. Mauris molestie felis eu posuere pharetra. Fusce sit amet dolor sem. Fusce pellentesque consectetur feugiat. Praesent eget felis aliquet, varius nunc et, maximus velit. Fusce euismod ornare aliquam. Quisque et venenatis velit, a suscipit est.\r\n\r\nMauris quis ultricies quam. Nullam dictum id sapien vel ultricies. Etiam sagittis nunc dui, eget blandit massa ultrices vitae. Quisque varius, dui id laoreet condimentum, nulla quam posuere nisl, ac varius nulla nisi at leo. Suspendisse leo nunc, vehicula eu justo et, iaculis porta est. Ut et rhoncus justo, eu maximus justo. Aenean vehicula at diam cursus viverra. Quisque molestie mi vitae fermentum fringilla. Suspendisse in dui ut quam varius vestibulum pellentesque nec mi.', 'Aliquam tristique mi nec nisl tempor, nec pretium felis auctor', '', 'publish', 'open', 'open', '', 'aliquam-tristique-mi-nec-nisl-tempor-nec-pretium-felis-auctor', '', '', '2025-10-15 08:54:06', '2025-10-15 08:54:06', '', 0, 'https://cipit.revamp.org.test/?p=81', 0, 'post', '', 0),
(82, 1, '2025-10-15 08:53:47', '2025-10-15 08:53:47', '', 'Screenshot 2025-09-23 at 2.21.30 PM 1', '', 'inherit', 'open', 'closed', '', 'screenshot-2025-09-23-at-2-21-30-pm-1', '', '', '2025-10-15 08:53:47', '2025-10-15 08:53:47', '', 81, 'https://cipit.revamp.org.test/wp-content/uploads/2025/10/Screenshot-2025-09-23-at-2.21.30-PM-1.png', 0, 'attachment', 'image/png', 0),
(83, 1, '2025-10-15 08:54:06', '2025-10-15 08:54:06', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque hendrerit odio vel molestie interdum. Donec efficitur egestas leo vitae porttitor. Nunc ultrices semper porttitor. Donec elementum id dui ac fermentum. In eu tempus magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pellentesque blandit risus id pharetra. Donec eu nibh nec tellus mollis ultrices. Vivamus placerat tincidunt mauris blandit facilisis.\r\n\r\nVivamus eleifend ornare pellentesque. Donec ut metus placerat, mattis ex eu, mollis nibh. Sed ullamcorper venenatis quam finibus tincidunt. Aliquam tristique mi nec nisl tempor, nec pretium felis auctor. Nulla vitae ultrices erat. Nulla maximus tristique quam, sed lobortis enim porta at. Nullam vitae rhoncus lectus. Integer nec massa eget lacus placerat tristique sed a neque.\r\n\r\nSed varius odio in mauris sollicitudin varius sit amet et tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ornare sollicitudin nibh in tristique. Morbi vitae erat aliquam, malesuada erat nec, ornare metus. Cras non nibh sed erat lobortis fringilla. Nam efficitur mattis velit, eu euismod lorem. Curabitur consectetur urna quis quam convallis accumsan. Maecenas vulputate est neque, id gravida justo imperdiet quis. Nam nunc tortor, consectetur in porta consequat, porttitor a diam. Nulla aliquam a elit eget euismod. In et cursus nibh.\r\n\r\nNam interdum vitae magna sed vehicula. Sed sapien tellus, consequat sed lectus at, congue fermentum odio. Ut id varius mauris. Mauris molestie felis eu posuere pharetra. Fusce sit amet dolor sem. Fusce pellentesque consectetur feugiat. Praesent eget felis aliquet, varius nunc et, maximus velit. Fusce euismod ornare aliquam. Quisque et venenatis velit, a suscipit est.\r\n\r\nMauris quis ultricies quam. Nullam dictum id sapien vel ultricies. Etiam sagittis nunc dui, eget blandit massa ultrices vitae. Quisque varius, dui id laoreet condimentum, nulla quam posuere nisl, ac varius nulla nisi at leo. Suspendisse leo nunc, vehicula eu justo et, iaculis porta est. Ut et rhoncus justo, eu maximus justo. Aenean vehicula at diam cursus viverra. Quisque molestie mi vitae fermentum fringilla. Suspendisse in dui ut quam varius vestibulum pellentesque nec mi.', 'Aliquam tristique mi nec nisl tempor, nec pretium felis auctor', '', 'inherit', 'closed', 'closed', '', '81-revision-v1', '', '', '2025-10-15 08:54:06', '2025-10-15 08:54:06', '', 81, 'https://cipit.revamp.org.test/?p=83', 0, 'revision', '', 0),
(84, 1, '2025-10-15 08:55:34', '2025-10-15 08:55:34', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque hendrerit odio vel molestie interdum. Donec efficitur egestas leo vitae porttitor. Nunc ultrices semper porttitor. Donec elementum id dui ac fermentum. In eu tempus magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pellentesque blandit risus id pharetra. Donec eu nibh nec tellus mollis ultrices. Vivamus placerat tincidunt mauris blandit facilisis.\r\n\r\nVivamus eleifend ornare pellentesque. Donec ut metus placerat, mattis ex eu, mollis nibh. Sed ullamcorper venenatis quam finibus tincidunt. Aliquam tristique mi nec nisl tempor, nec pretium felis auctor. Nulla vitae ultrices erat. Nulla maximus tristique quam, sed lobortis enim porta at. Nullam vitae rhoncus lectus. Integer nec massa eget lacus placerat tristique sed a neque.\r\n\r\nSed varius odio in mauris sollicitudin varius sit amet et tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ornare sollicitudin nibh in tristique. Morbi vitae erat aliquam, malesuada erat nec, ornare metus. Cras non nibh sed erat lobortis fringilla. Nam efficitur mattis velit, eu euismod lorem. Curabitur consectetur urna quis quam convallis accumsan. Maecenas vulputate est neque, id gravida justo imperdiet quis. Nam nunc tortor, consectetur in porta consequat, porttitor a diam. Nulla aliquam a elit eget euismod. In et cursus nibh.\r\n\r\nNam interdum vitae magna sed vehicula. Sed sapien tellus, consequat sed lectus at, congue fermentum odio. Ut id varius mauris. Mauris molestie felis eu posuere pharetra. Fusce sit amet dolor sem. Fusce pellentesque consectetur feugiat. Praesent eget felis aliquet, varius nunc et, maximus velit. Fusce euismod ornare aliquam. Quisque et venenatis velit, a suscipit est.\r\n\r\nMauris quis ultricies quam. Nullam dictum id sapien vel ultricies. Etiam sagittis nunc dui, eget blandit massa ultrices vitae. Quisque varius, dui id laoreet condimentum, nulla quam posuere nisl, ac varius nulla nisi at leo. Suspendisse leo nunc, vehicula eu justo et, iaculis porta est. Ut et rhoncus justo, eu maximus justo. Aenean vehicula at diam cursus viverra. Quisque molestie mi vitae fermentum fringilla. Suspendisse in dui ut quam varius vestibulum pellentesque nec mi.', 'Nam nunc tortor, consectetur in porta consequat, porttitor a diam', '', 'publish', 'open', 'open', '', 'nam-nunc-tortor-consectetur-in-porta-consequat-porttitor-a-diam', '', '', '2025-10-15 09:08:00', '2025-10-15 09:08:00', '', 0, 'https://cipit.revamp.org.test/?p=84', 0, 'post', '', 0),
(86, 1, '2025-10-15 08:55:34', '2025-10-15 08:55:34', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque hendrerit odio vel molestie interdum. Donec efficitur egestas leo vitae porttitor. Nunc ultrices semper porttitor. Donec elementum id dui ac fermentum. In eu tempus magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pellentesque blandit risus id pharetra. Donec eu nibh nec tellus mollis ultrices. Vivamus placerat tincidunt mauris blandit facilisis.\r\n\r\nVivamus eleifend ornare pellentesque. Donec ut metus placerat, mattis ex eu, mollis nibh. Sed ullamcorper venenatis quam finibus tincidunt. Aliquam tristique mi nec nisl tempor, nec pretium felis auctor. Nulla vitae ultrices erat. Nulla maximus tristique quam, sed lobortis enim porta at. Nullam vitae rhoncus lectus. Integer nec massa eget lacus placerat tristique sed a neque.\r\n\r\nSed varius odio in mauris sollicitudin varius sit amet et tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ornare sollicitudin nibh in tristique. Morbi vitae erat aliquam, malesuada erat nec, ornare metus. Cras non nibh sed erat lobortis fringilla. Nam efficitur mattis velit, eu euismod lorem. Curabitur consectetur urna quis quam convallis accumsan. Maecenas vulputate est neque, id gravida justo imperdiet quis. Nam nunc tortor, consectetur in porta consequat, porttitor a diam. Nulla aliquam a elit eget euismod. In et cursus nibh.\r\n\r\nNam interdum vitae magna sed vehicula. Sed sapien tellus, consequat sed lectus at, congue fermentum odio. Ut id varius mauris. Mauris molestie felis eu posuere pharetra. Fusce sit amet dolor sem. Fusce pellentesque consectetur feugiat. Praesent eget felis aliquet, varius nunc et, maximus velit. Fusce euismod ornare aliquam. Quisque et venenatis velit, a suscipit est.\r\n\r\nMauris quis ultricies quam. Nullam dictum id sapien vel ultricies. Etiam sagittis nunc dui, eget blandit massa ultrices vitae. Quisque varius, dui id laoreet condimentum, nulla quam posuere nisl, ac varius nulla nisi at leo. Suspendisse leo nunc, vehicula eu justo et, iaculis porta est. Ut et rhoncus justo, eu maximus justo. Aenean vehicula at diam cursus viverra. Quisque molestie mi vitae fermentum fringilla. Suspendisse in dui ut quam varius vestibulum pellentesque nec mi.', 'Nam nunc tortor, consectetur in porta consequat, porttitor a diam', '', 'inherit', 'closed', 'closed', '', '84-revision-v1', '', '', '2025-10-15 08:55:34', '2025-10-15 08:55:34', '', 84, 'https://cipit.revamp.org.test/?p=86', 0, 'revision', '', 0),
(87, 1, '2025-10-15 08:58:00', '2025-10-15 08:58:00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque hendrerit odio vel molestie interdum. Donec efficitur egestas leo vitae porttitor. Nunc ultrices semper porttitor. Donec elementum id dui ac fermentum. In eu tempus magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pellentesque blandit risus id pharetra. Donec eu nibh nec tellus mollis ultrices. Vivamus placerat tincidunt mauris blandit facilisis.\r\n\r\nVivamus eleifend ornare pellentesque. Donec ut metus placerat, mattis ex eu, mollis nibh. Sed ullamcorper venenatis quam finibus tincidunt. Aliquam tristique mi nec nisl tempor, nec pretium felis auctor. Nulla vitae ultrices erat. Nulla maximus tristique quam, sed lobortis enim porta at. Nullam vitae rhoncus lectus. Integer nec massa eget lacus placerat tristique sed a neque.\r\n\r\nSed varius odio in mauris sollicitudin varius sit amet et tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ornare sollicitudin nibh in tristique. Morbi vitae erat aliquam, malesuada erat nec, ornare metus. Cras non nibh sed erat lobortis fringilla. Nam efficitur mattis velit, eu euismod lorem. Curabitur consectetur urna quis quam convallis accumsan. Maecenas vulputate est neque, id gravida justo imperdiet quis. Nam nunc tortor, consectetur in porta consequat, porttitor a diam. Nulla aliquam a elit eget euismod. In et cursus nibh.\r\n\r\nNam interdum vitae magna sed vehicula. Sed sapien tellus, consequat sed lectus at, congue fermentum odio. Ut id varius mauris. Mauris molestie felis eu posuere pharetra. Fusce sit amet dolor sem. Fusce pellentesque consectetur feugiat. Praesent eget felis aliquet, varius nunc et, maximus velit. Fusce euismod ornare aliquam. Quisque et venenatis velit, a suscipit est.\r\n\r\nMauris quis ultricies quam. Nullam dictum id sapien vel ultricies. Etiam sagittis nunc dui, eget blandit massa ultrices vitae. Quisque varius, dui id laoreet condimentum, nulla quam posuere nisl, ac varius nulla nisi at leo. Suspendisse leo nunc, vehicula eu justo et, iaculis porta est. Ut et rhoncus justo, eu maximus justo. Aenean vehicula at diam cursus viverra. Quisque molestie mi vitae fermentum fringilla. Suspendisse in dui ut quam varius vestibulum pellentesque nec mi.', 'Donec ut metus placerat, mattis ex eu, mollis nibh', '', 'publish', 'open', 'open', '', 'donec-ut-metus-placerat-mattis-ex-eu-mollis-nibh', '', '', '2025-10-15 08:58:00', '2025-10-15 08:58:00', '', 0, 'https://cipit.revamp.org.test/?p=87', 0, 'post', '', 0),
(88, 1, '2025-10-15 08:57:54', '2025-10-15 08:57:54', '', 'ethical-ai-dev-2', '', 'inherit', 'open', 'closed', '', 'ethical-ai-dev-2', '', '', '2025-10-15 08:57:54', '2025-10-15 08:57:54', '', 87, 'https://cipit.revamp.org.test/wp-content/uploads/2025/10/ethical-ai-dev-2.png', 0, 'attachment', 'image/png', 0),
(89, 1, '2025-10-15 08:58:00', '2025-10-15 08:58:00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque hendrerit odio vel molestie interdum. Donec efficitur egestas leo vitae porttitor. Nunc ultrices semper porttitor. Donec elementum id dui ac fermentum. In eu tempus magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In pellentesque blandit risus id pharetra. Donec eu nibh nec tellus mollis ultrices. Vivamus placerat tincidunt mauris blandit facilisis.\r\n\r\nVivamus eleifend ornare pellentesque. Donec ut metus placerat, mattis ex eu, mollis nibh. Sed ullamcorper venenatis quam finibus tincidunt. Aliquam tristique mi nec nisl tempor, nec pretium felis auctor. Nulla vitae ultrices erat. Nulla maximus tristique quam, sed lobortis enim porta at. Nullam vitae rhoncus lectus. Integer nec massa eget lacus placerat tristique sed a neque.\r\n\r\nSed varius odio in mauris sollicitudin varius sit amet et tellus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed ornare sollicitudin nibh in tristique. Morbi vitae erat aliquam, malesuada erat nec, ornare metus. Cras non nibh sed erat lobortis fringilla. Nam efficitur mattis velit, eu euismod lorem. Curabitur consectetur urna quis quam convallis accumsan. Maecenas vulputate est neque, id gravida justo imperdiet quis. Nam nunc tortor, consectetur in porta consequat, porttitor a diam. Nulla aliquam a elit eget euismod. In et cursus nibh.\r\n\r\nNam interdum vitae magna sed vehicula. Sed sapien tellus, consequat sed lectus at, congue fermentum odio. Ut id varius mauris. Mauris molestie felis eu posuere pharetra. Fusce sit amet dolor sem. Fusce pellentesque consectetur feugiat. Praesent eget felis aliquet, varius nunc et, maximus velit. Fusce euismod ornare aliquam. Quisque et venenatis velit, a suscipit est.\r\n\r\nMauris quis ultricies quam. Nullam dictum id sapien vel ultricies. Etiam sagittis nunc dui, eget blandit massa ultrices vitae. Quisque varius, dui id laoreet condimentum, nulla quam posuere nisl, ac varius nulla nisi at leo. Suspendisse leo nunc, vehicula eu justo et, iaculis porta est. Ut et rhoncus justo, eu maximus justo. Aenean vehicula at diam cursus viverra. Quisque molestie mi vitae fermentum fringilla. Suspendisse in dui ut quam varius vestibulum pellentesque nec mi.', 'Donec ut metus placerat, mattis ex eu, mollis nibh', '', 'inherit', 'closed', 'closed', '', '87-revision-v1', '', '', '2025-10-15 08:58:00', '2025-10-15 08:58:00', '', 87, 'https://cipit.revamp.org.test/?p=89', 0, 'revision', '', 0),
(90, 1, '2025-10-15 09:01:02', '2025-10-15 09:01:02', '', 'cossa-2025-reports', '', 'inherit', 'open', 'closed', '', 'cossa-2025-reports', '', '', '2025-10-15 09:01:02', '2025-10-15 09:01:02', '', 84, 'https://cipit.revamp.org.test/wp-content/uploads/2025/10/cossa-2025-reports.png', 0, 'attachment', 'image/png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Research', 'research', 0),
(3, 'Main Nav', 'main-nav', 0),
(4, 'Blog', 'blog', 0),
(5, 'Artificial Intelligence', 'artificial-intelligence', 0),
(6, 'Intellectual Property', 'intellectual-property', 0),
(7, 'Books', 'books', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(7, 2, 0),
(8, 2, 0),
(14, 3, 0),
(16, 1, 0),
(19, 3, 0),
(25, 3, 0),
(56, 4, 0),
(56, 6, 0),
(64, 4, 0),
(64, 5, 0),
(75, 7, 0),
(81, 7, 0),
(84, 7, 0),
(87, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'nav_menu', '', 0, 2),
(3, 3, 'nav_menu', '', 0, 3),
(4, 4, 'category', '', 0, 2),
(5, 5, 'post_tag', '', 0, 1),
(6, 6, 'post_tag', '', 0, 1),
(7, 7, 'category', '', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'C1P1T'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice,vc_pointers_frontend_editor,vc_pointers_backend_editor'),
(15, 1, 'show_welcome_panel', '1'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:9:\"127.0.0.0\";}'),
(19, 1, 'wp_persisted_preferences', 'a:3:{s:4:\"core\";a:5:{s:26:\"isComplementaryAreaVisible\";b:0;s:10:\"editorMode\";s:6:\"visual\";s:9:\"focusMode\";b:1;s:15:\"distractionFree\";b:0;s:12:\"fixedToolbar\";b:1;}s:14:\"core/edit-post\";a:2:{s:12:\"welcomeGuide\";b:0;s:14:\"fullscreenMode\";b:1;}s:9:\"_modified\";s:24:\"2025-10-14T08:56:13.729Z\";}'),
(20, 1, 'session_tokens', 'a:1:{s:64:\"341c293f48f8bacd08bbf271f3be08cf5479c56404d92c7048ec2910bdeb8bc1\";a:4:{s:10:\"expiration\";i:1760629934;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36\";s:5:\"login\";i:1760457134;}}'),
(21, 1, 'wp_user-settings', 'editor=tinymce&libraryContent=browse'),
(22, 1, 'wp_user-settings-time', '1760518861'),
(23, 1, '_vc_editor_promo_popup', '8.6.1'),
(24, 1, 'pse_country_code', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'C1P1T', '$wp$2y$10$VDkusyvd9ZAhmG2oOAYU/ubLpEUWHI/qDUwH.1wgvatmWnDQVSYTS', 'c1p1t', 'kevinmuchwat@gmail.com', 'https://cipit.revamp.org.test', '2025-10-10 09:02:03', '', 0, 'C1P1T');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=602;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
