/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100126
 Source Host           : localhost:3306
 Source Schema         : vmaig

 Target Server Type    : MySQL
 Target Server Version : 100126
 File Encoding         : 65001

 Date: 11/07/2018 11:20:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_name_key` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
INSERT INTO `auth_group` VALUES (0, 'Klay');
INSERT INTO `auth_group` VALUES (1, 'stephen');
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_key` (`group_id`,`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_key` (`content_type_id`,`codename`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `en_title` varchar(100) DEFAULT NULL COMMENT '英文标题',
  `img` varchar(200) DEFAULT NULL,
  `tags` varchar(200) DEFAULT NULL COMMENT '标签',
  `summary` text COMMENT '摘要',
  `content` text COMMENT '正文',
  `view_times` int(11) DEFAULT NULL,
  `zan_times` int(11) DEFAULT NULL,
  `is_top` tinyint(1) DEFAULT NULL COMMENT '置顶',
  `rank` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `pub_time` datetime DEFAULT NULL COMMENT '发布时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `author_id` int(11) DEFAULT NULL COMMENT '作者',
  `category_id` int(11) DEFAULT NULL COMMENT '分类',
  `comment_times` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
BEGIN;
INSERT INTO `blog_article` VALUES (0, 'My first JFinal article', NULL, '/blog/static/img/article/default.jpg', '0', 'hahahahahahahaha', 'lsalalalalalalalal什么都没有', 43, NULL, NULL, NULL, NULL, '2018-06-29 17:59:40', '2018-06-28 17:37:43', NULL, 0, 0, 3);
COMMIT;

-- ----------------------------
-- Table structure for blog_carousel
-- ----------------------------
DROP TABLE IF EXISTS `blog_carousel`;
CREATE TABLE `blog_carousel` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `summary` text COMMENT '摘要',
  `img` varchar(200) NOT NULL COMMENT '轮播图片',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `article_id` int(11) DEFAULT NULL COMMENT '文章',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_carousel
-- ----------------------------
BEGIN;
INSERT INTO `blog_carousel` VALUES (0, 'linux环境编程', 'linux环境编程', '/blog/static/img/carousel/linux-carousel.jpg', '2018-06-28 08:06:47', NULL);
INSERT INTO `blog_carousel` VALUES (1, 'default page', 'hhhh', '/blog/static/img/carousel/default.jpg', '2018-06-28 08:07:17', NULL);
COMMIT;

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL COMMENT '名称',
  `rank` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级分类',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
BEGIN;
INSERT INTO `blog_category` VALUES (0, 'Java', NULL, NULL, '2018-06-28 09:44:19', NULL);
INSERT INTO `blog_category` VALUES (1, 'linux', NULL, NULL, '2018-06-29 08:19:13', NULL);
INSERT INTO `blog_category` VALUES (2, 'Django', NULL, NULL, '2018-06-29 08:19:22', NULL);
INSERT INTO `blog_category` VALUES (3, 'python', NULL, NULL, '2018-06-29 08:19:34', NULL);
COMMIT;

-- ----------------------------
-- Table structure for blog_column
-- ----------------------------
DROP TABLE IF EXISTS `blog_column`;
CREATE TABLE `blog_column` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL COMMENT '专栏内容',
  `summary` text NOT NULL COMMENT '专栏摘要',
  `status` int(11) NOT NULL COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog_column_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_column_article`;
CREATE TABLE `blog_column_article` (
  `id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL COMMENT '文章',
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_column_artical_column_id_article_id_key` (`column_id`,`article_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog_nav
-- ----------------------------
DROP TABLE IF EXISTS `blog_nav`;
CREATE TABLE `blog_nav` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL COMMENT '导航条内容',
  `url` varchar(200) DEFAULT NULL COMMENT '指向地址',
  `status` int(11) NOT NULL COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for blog_news
-- ----------------------------
DROP TABLE IF EXISTS `blog_news`;
CREATE TABLE `blog_news` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `summary` text NOT NULL COMMENT '摘要',
  `news_from` varchar(11) NOT NULL COMMENT '来源',
  `url` varchar(200) NOT NULL COMMENT '源地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `pub_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_news
-- ----------------------------
BEGIN;
INSERT INTO `blog_news` VALUES (0, 'oschina', '测试oschina', 'oschina', 'oschina.com', '2018-06-29 08:14:45', '2018-06-29 16:14:27');
INSERT INTO `blog_news` VALUES (1, '', '', '', '', '2018-06-29 08:16:05', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
BEGIN;
INSERT INTO `blog_tag` VALUES (0, 'JFinal', '2018-07-11 09:41:33');
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` text,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(6) NOT NULL,
  `change_message` text NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` text NOT NULL,
  `expire_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `img` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '123', '202cb962ac59075b964b07152d234b70', '4321', '/blog/static/img/123.jpg');
INSERT INTO `user` VALUES (9, '1234', '81dc9bdb52d04dc20036dbd8313ed055', '1234', 'http://vmaig.qiniudn.com/image/tx/tx-default.jpg');
COMMIT;

-- ----------------------------
-- Table structure for vmaig_auth_vmaiguser
-- ----------------------------
DROP TABLE IF EXISTS `vmaig_auth_vmaiguser`;
CREATE TABLE `vmaig_auth_vmaiguser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `img` varchar(200) DEFAULT NULL COMMENT '头像地址',
  `intro` varchar(200) DEFAULT NULL COMMENT '简介',
  `secretKey` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vmaig_auth_vmaiguser_username_key` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Table structure for vmaig_auth_vmaiguser_groups
-- ----------------------------
DROP TABLE IF EXISTS `vmaig_auth_vmaiguser_groups`;
CREATE TABLE `vmaig_auth_vmaiguser_groups` (
  `id` int(11) NOT NULL,
  `vmaiguser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vmaig_auth_vmaiguser_groups_vmaiguser_id_group_id_key` (`vmaiguser_id`,`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vmaig_auth_vmaiguser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `vmaig_auth_vmaiguser_user_permissions`;
CREATE TABLE `vmaig_auth_vmaiguser_user_permissions` (
  `id` int(11) NOT NULL,
  `vmaiguser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vmaig_auth_vmaiguser_user_permis_vmaiguser_id_permission_id_key` (`vmaiguser_id`,`permission_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vmaig_comments_comment
-- ----------------------------
DROP TABLE IF EXISTS `vmaig_comments_comment`;
CREATE TABLE `vmaig_comments_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL COMMENT '评论内容',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `article_id` int(11) NOT NULL COMMENT '文章',
  `parent_id` int(11) DEFAULT NULL COMMENT '引用',
  `user_id` int(11) NOT NULL COMMENT '用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vmaig_comments_comment
-- ----------------------------
BEGIN;
INSERT INTO `vmaig_comments_comment` VALUES (61, '1', '2018-07-09 03:21:30', 0, NULL, 1);
INSERT INTO `vmaig_comments_comment` VALUES (64, '回复', '2018-07-09 08:57:26', 0, 61, 1);
INSERT INTO `vmaig_comments_comment` VALUES (65, 'jajandkand', '2018-07-09 09:44:35', 0, 64, 1);
COMMIT;

-- ----------------------------
-- Table structure for vmaig_system_link
-- ----------------------------
DROP TABLE IF EXISTS `vmaig_system_link`;
CREATE TABLE `vmaig_system_link` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `url` varchar(200) DEFAULT NULL COMMENT '连接',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vmaig_system_link
-- ----------------------------
BEGIN;
INSERT INTO `vmaig_system_link` VALUES (0, '炉石', 'https://hs.blizzard.cn', 'primary', '2018-06-29 07:37:14', '0000-00-00 00:00:00');
INSERT INTO `vmaig_system_link` VALUES (1, '刺激战场', 'https://pg.qq.com', 'success', '2018-06-29 07:41:17', '0000-00-00 00:00:00');
INSERT INTO `vmaig_system_link` VALUES (2, '文明', 'https://civilization6.com', 'danger', '2018-06-29 07:44:39', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
-- Table structure for vmaig_system_notification
-- ----------------------------
DROP TABLE IF EXISTS `vmaig_system_notification`;
CREATE TABLE `vmaig_system_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL COMMENT '标题',
  `text` text COMMENT '内容',
  `url` varchar(200) DEFAULT NULL COMMENT '连接',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `is_read` int(11) NOT NULL DEFAULT '0' COMMENT '是否读过',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `from_user_id` int(11) NOT NULL COMMENT '发送者',
  `to_user_id` int(11) NOT NULL COMMENT '接受者',
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vmaig_system_notification
-- ----------------------------
BEGIN;
INSERT INTO `vmaig_system_notification` VALUES (1, '123回复了你在 My first JFinal article 的评论', NULL, NULL, NULL, 1, '2018-07-09 08:57:26', NULL, 123, 1, 0);
INSERT INTO `vmaig_system_notification` VALUES (2, '123回复了你在 My first JFinal article 的评论', NULL, NULL, NULL, 1, '2018-07-09 09:44:35', NULL, 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for vmaig_userIp
-- ----------------------------
DROP TABLE IF EXISTS `vmaig_userIp`;
CREATE TABLE `vmaig_userIp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Seen Ip Remote Address',
  `articleId` int(11) NOT NULL COMMENT 'matching article',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
