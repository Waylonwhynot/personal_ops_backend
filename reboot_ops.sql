/*
 Navicat Premium Data Transfer

 Source Server         : MySQL-Mac
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : reboot_ops

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 09/01/2022 15:50:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `codename` varchar(100) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 'add_logentry', 1);
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 'change_logentry', 1);
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 'delete_logentry', 1);
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 'view_logentry', 1);
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 'add_permission', 2);
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 'change_permission', 2);
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 'delete_permission', 2);
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 'view_permission', 2);
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 'add_group', 3);
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 'change_group', 3);
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 'delete_group', 3);
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 'view_group', 3);
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 'add_contenttype', 4);
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 'change_contenttype', 4);
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 'delete_contenttype', 4);
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 'view_contenttype', 4);
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 'add_session', 5);
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 'change_session', 5);
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 'delete_session', 5);
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 'view_session', 5);
INSERT INTO `auth_permission` VALUES (21, 'Can add idc', 'add_idc', 6);
INSERT INTO `auth_permission` VALUES (22, 'Can change idc', 'change_idc', 6);
INSERT INTO `auth_permission` VALUES (23, 'Can delete idc', 'delete_idc', 6);
INSERT INTO `auth_permission` VALUES (24, 'Can view idc', 'view_idc', 6);
INSERT INTO `auth_permission` VALUES (25, 'Can add cabinet', 'add_cabinet', 7);
INSERT INTO `auth_permission` VALUES (26, 'Can change cabinet', 'change_cabinet', 7);
INSERT INTO `auth_permission` VALUES (27, 'Can delete cabinet', 'delete_cabinet', 7);
INSERT INTO `auth_permission` VALUES (28, 'Can view cabinet', 'view_cabinet', 7);
INSERT INTO `auth_permission` VALUES (29, 'Can add 用户', 'add_user', 8);
INSERT INTO `auth_permission` VALUES (30, 'Can change 用户', 'change_user', 8);
INSERT INTO `auth_permission` VALUES (31, 'Can delete 用户', 'delete_user', 8);
INSERT INTO `auth_permission` VALUES (32, 'Can view 用户', 'view_user', 8);
INSERT INTO `auth_permission` VALUES (33, 'Can add manufacturer', 'add_manufacturer', 9);
INSERT INTO `auth_permission` VALUES (34, 'Can change manufacturer', 'change_manufacturer', 9);
INSERT INTO `auth_permission` VALUES (35, 'Can delete manufacturer', 'delete_manufacturer', 9);
INSERT INTO `auth_permission` VALUES (36, 'Can view manufacturer', 'view_manufacturer', 9);
INSERT INTO `auth_permission` VALUES (37, 'Can add product model', 'add_productmodel', 10);
INSERT INTO `auth_permission` VALUES (38, 'Can change product model', 'change_productmodel', 10);
INSERT INTO `auth_permission` VALUES (39, 'Can delete product model', 'delete_productmodel', 10);
INSERT INTO `auth_permission` VALUES (40, 'Can view product model', 'view_productmodel', 10);
INSERT INTO `auth_permission` VALUES (41, 'Can add server', 'add_server', 11);
INSERT INTO `auth_permission` VALUES (42, 'Can change server', 'change_server', 11);
INSERT INTO `auth_permission` VALUES (43, 'Can delete server', 'delete_server', 11);
INSERT INTO `auth_permission` VALUES (44, 'Can view server', 'view_server', 11);
INSERT INTO `auth_permission` VALUES (45, 'Can add network device', 'add_networkdevice', 12);
INSERT INTO `auth_permission` VALUES (46, 'Can change network device', 'change_networkdevice', 12);
INSERT INTO `auth_permission` VALUES (47, 'Can delete network device', 'delete_networkdevice', 12);
INSERT INTO `auth_permission` VALUES (48, 'Can view network device', 'view_networkdevice', 12);
INSERT INTO `auth_permission` VALUES (49, 'Can add ip', 'add_ip', 13);
INSERT INTO `auth_permission` VALUES (50, 'Can change ip', 'change_ip', 13);
INSERT INTO `auth_permission` VALUES (51, 'Can delete ip', 'delete_ip', 13);
INSERT INTO `auth_permission` VALUES (52, 'Can view ip', 'view_ip', 13);
COMMIT;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `id_rsa_key` longtext,
  `id_rsa_pub` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (7, 'cabinet', 'cabinet');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'idcs', 'idc');
INSERT INTO `django_content_type` VALUES (9, 'manufacturer', 'manufacturer');
INSERT INTO `django_content_type` VALUES (10, 'manufacturer', 'productmodel');
INSERT INTO `django_content_type` VALUES (13, 'servers', 'ip');
INSERT INTO `django_content_type` VALUES (12, 'servers', 'networkdevice');
INSERT INTO `django_content_type` VALUES (11, 'servers', 'server');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'users', 'user');
COMMIT;

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
BEGIN;
INSERT INTO `django_migrations` VALUES (10, 'contenttypes', '0001_initial', '2021-12-26 19:10:19.250107');
INSERT INTO `django_migrations` VALUES (11, 'contenttypes', '0002_remove_content_type_name', '2021-12-26 19:10:19.276778');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0001_initial', '2021-12-26 19:10:19.311478');
INSERT INTO `django_migrations` VALUES (13, 'users', '0001_initial', '2021-12-26 19:10:19.408347');
INSERT INTO `django_migrations` VALUES (14, 'admin', '0001_initial', '2021-12-26 19:10:19.495719');
INSERT INTO `django_migrations` VALUES (15, 'idcs', '0001_initial', '2021-12-26 19:10:19.537397');
INSERT INTO `django_migrations` VALUES (16, 'cabinet', '0001_initial', '2021-12-26 19:10:19.549198');
INSERT INTO `django_migrations` VALUES (17, 'manufacturer', '0001_initial', '2021-12-26 19:10:19.584720');
INSERT INTO `django_migrations` VALUES (18, 'servers', '0001_initial', '2021-12-26 19:10:19.665691');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2021-12-26 19:10:19.812530');
COMMIT;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for resources_cabinet
-- ----------------------------
DROP TABLE IF EXISTS `resources_cabinet`;
CREATE TABLE `resources_cabinet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `idc_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resources_cabinet_idc_id_4c48bdaf_fk_resources_idc_id` (`idc_id`),
  CONSTRAINT `resources_cabinet_idc_id_4c48bdaf_fk_resources_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `resources_idc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of resources_cabinet
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for resources_idc
-- ----------------------------
DROP TABLE IF EXISTS `resources_idc`;
CREATE TABLE `resources_idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `address` varchar(256) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `letter` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of resources_idc
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for resources_ip
-- ----------------------------
DROP TABLE IF EXISTS `resources_ip`;
CREATE TABLE `resources_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_addr` varchar(15) NOT NULL,
  `netmask` varchar(15) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `device_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip_addr` (`ip_addr`),
  KEY `resources_ip_device_id_fdac0136_fk_resources_network_device_id` (`device_id`),
  CONSTRAINT `resources_ip_device_id_fdac0136_fk_resources_network_device_id` FOREIGN KEY (`device_id`) REFERENCES `resources_network_device` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of resources_ip
-- ----------------------------
BEGIN;
INSERT INTO `resources_ip` VALUES (1, '192.168.1.112', '255.255.255.0', NULL, 1);
INSERT INTO `resources_ip` VALUES (2, '192.168.1.113', '255.255.255.0', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for resources_manufacturer
-- ----------------------------
DROP TABLE IF EXISTS `resources_manufacturer`;
CREATE TABLE `resources_manufacturer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(32) NOT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `mail` varchar(32) DEFAULT NULL,
  `remark` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vendor_name` (`vendor_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of resources_manufacturer
-- ----------------------------
BEGIN;
INSERT INTO `resources_manufacturer` VALUES (1, '3', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for resources_network_device
-- ----------------------------
DROP TABLE IF EXISTS `resources_network_device`;
CREATE TABLE `resources_network_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mac_address` varchar(30) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resources_network_device_host_id_8a7c0c95_fk_resources_server_id` (`host_id`),
  CONSTRAINT `resources_network_device_host_id_8a7c0c95_fk_resources_server_id` FOREIGN KEY (`host_id`) REFERENCES `resources_server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of resources_network_device
-- ----------------------------
BEGIN;
INSERT INTO `resources_network_device` VALUES (1, 'eth0', '27:3d:2e:c8:91:d9', 'reamrk', 1);
COMMIT;

-- ----------------------------
-- Table structure for resources_productmodel
-- ----------------------------
DROP TABLE IF EXISTS `resources_productmodel`;
CREATE TABLE `resources_productmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_name` varchar(40) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resources_productmod_vendor_id_7e006d79_fk_resources` (`vendor_id`),
  CONSTRAINT `resources_productmod_vendor_id_7e006d79_fk_resources` FOREIGN KEY (`vendor_id`) REFERENCES `resources_manufacturer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of resources_productmodel
-- ----------------------------
BEGIN;
INSERT INTO `resources_productmodel` VALUES (1, '9', 1);
COMMIT;

-- ----------------------------
-- Table structure for resources_server
-- ----------------------------
DROP TABLE IF EXISTS `resources_server`;
CREATE TABLE `resources_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `hostname` varchar(20) NOT NULL,
  `cpu` varchar(50) NOT NULL,
  `mem` varchar(32) NOT NULL,
  `disk` varchar(200) NOT NULL,
  `os` varchar(50) NOT NULL,
  `sn` varchar(80) NOT NULL,
  `rmt_card_ip` varchar(15) DEFAULT NULL,
  `cabinet_position` varchar(20) DEFAULT NULL,
  `uuid` varchar(80) NOT NULL,
  `last_check` datetime(6) NOT NULL,
  `cabinet_id` int(11) DEFAULT NULL,
  `idc_id` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `model_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`),
  UNIQUE KEY `hostname` (`hostname`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `rmt_card_ip` (`rmt_card_ip`),
  KEY `resources_server_cabinet_id_b6bc883b_fk_resources_cabinet_id` (`cabinet_id`),
  KEY `resources_server_idc_id_fe131330_fk_resources_idc_id` (`idc_id`),
  KEY `resources_server_manufacturer_id_e95c0de3_fk_resources` (`manufacturer_id`),
  KEY `resources_server_model_name_id_95b32a09_fk_resources` (`model_name_id`),
  KEY `resources_server_sn_3369a7d0` (`sn`),
  KEY `resources_server_last_check_dc00457d` (`last_check`),
  CONSTRAINT `resources_server_cabinet_id_b6bc883b_fk_resources_cabinet_id` FOREIGN KEY (`cabinet_id`) REFERENCES `resources_cabinet` (`id`),
  CONSTRAINT `resources_server_idc_id_fe131330_fk_resources_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `resources_idc` (`id`),
  CONSTRAINT `resources_server_manufacturer_id_e95c0de3_fk_resources` FOREIGN KEY (`manufacturer_id`) REFERENCES `resources_manufacturer` (`id`),
  CONSTRAINT `resources_server_model_name_id_95b32a09_fk_resources` FOREIGN KEY (`model_name_id`) REFERENCES `resources_productmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of resources_server
-- ----------------------------
BEGIN;
INSERT INTO `resources_server` VALUES (1, '192.168.1.17', 'yz-ms-web-17', 'Intel(R) Core(TM) i5-4590 CPU @ 3.30GHZ 1', '2G', '100G', 'centos 7', '3FABC54A-3CC9-453C-8800-4F0237B71D87', NULL, NULL, '3FABC54A-3CC9-453C-8800-4F0237B71D87', '2021-12-26 19:11:19.891572', NULL, NULL, 1, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
