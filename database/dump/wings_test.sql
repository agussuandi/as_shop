/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : wings_test

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 12/10/2022 11:47:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for m_products
-- ----------------------------
DROP TABLE IF EXISTS `m_products`;
CREATE TABLE `m_products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(6, 0) NOT NULL,
  `currency` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `discount` decimal(6, 0) NOT NULL,
  `dimension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `thumbnail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_products
-- ----------------------------
INSERT INTO `m_products` VALUES (2, '10000001', 'So Klin Pemutih', 20000, 'IDR', 0, '500ml', 'Dus', 'storage/products/so-klin-pemutih.jpg', 1, '2022-10-12 02:13:12', 1, '2022-10-12 03:23:51');
INSERT INTO `m_products` VALUES (3, '10000002', 'Milku', 50000, 'IDR', 0, '200ml', 'Dus', 'storage/products/milku.jpg', 1, '2022-10-12 02:28:57', NULL, NULL);
INSERT INTO `m_products` VALUES (4, '10000003', 'Choco Drink', 10000, 'IDR', 10, '30g', 'Lusin', 'storage/products/choco-drink.jpg', 1, '2022-10-12 02:39:07', NULL, NULL);
INSERT INTO `m_products` VALUES (5, '10000004', 'Sabun Ekonomi', 15000, 'IDR', 0, '380g', 'Pcs', 'storage/products/sabun-ekonomi.jpg', 1, '2022-10-12 03:32:13', NULL, NULL);
INSERT INTO `m_products` VALUES (6, '10000005', 'Golda Coffe', 20000, 'IDR', 10, '200ml', 'Dus', 'storage/products/golda-coffe.jpg', 1, '2022-10-12 03:33:45', NULL, NULL);
INSERT INTO `m_products` VALUES (7, '10000006', 'Mie Sedaap Goreng', 67500, 'IDR', 5, '250 x 100', 'Dus', 'storage/products/mie-sedap-goreng.jpg', 1, '2022-10-12 04:23:56', 1, '2022-10-12 04:27:12');
INSERT INTO `m_products` VALUES (8, '10000007', 'Mie Sedaap Goreng Salero Padang', 3200, 'IDR', 0, '50g', 'Pcs', 'storage/products/mie-sedaap-goreng-salero-padang.jpg', 1, '2022-10-12 04:28:14', NULL, NULL);
INSERT INTO `m_products` VALUES (9, '10000008', 'Mie Sedaap Cup Varian', 5000, 'IDR', 0, '15x7', 'Pcs', 'storage/products/mie-sedaap-cup-varian.jpg', 1, '2022-10-12 04:30:10', NULL, NULL);
INSERT INTO `m_products` VALUES (10, '10000009', 'Potabee 400g', 15000, 'IDR', 0, '400g', 'Pcs', 'storage/products/potabee-400g.png', 1, '2022-10-12 04:32:27', NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trx_d_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `trx_d_penjualan`;
CREATE TABLE `trx_d_penjualan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trx_h_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `sub_total` decimal(10, 0) NOT NULL,
  `qty` int(6) NOT NULL,
  `price` decimal(10, 0) NOT NULL,
  `discount` decimal(10, 0) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `trx_header`(`trx_h_id`) USING BTREE,
  INDEX `product`(`product_id`) USING BTREE,
  CONSTRAINT `product` FOREIGN KEY (`product_id`) REFERENCES `m_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trx_header` FOREIGN KEY (`trx_h_id`) REFERENCES `trx_h_penjualan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_d_penjualan
-- ----------------------------
INSERT INTO `trx_d_penjualan` VALUES (4, 3, 2, 40000, 2, 20000, 0, 1, '2022-10-12 03:17:13');
INSERT INTO `trx_d_penjualan` VALUES (5, 3, 3, 50000, 1, 50000, 0, 1, '2022-10-12 03:17:13');
INSERT INTO `trx_d_penjualan` VALUES (6, 3, 4, 18000, 2, 10000, 1000, 1, '2022-10-12 03:17:13');
INSERT INTO `trx_d_penjualan` VALUES (7, 4, 5, 15000, 1, 15000, 0, 1, '2022-10-12 03:34:53');
INSERT INTO `trx_d_penjualan` VALUES (8, 4, 6, 36000, 2, 20000, 2000, 1, '2022-10-12 03:34:53');
INSERT INTO `trx_d_penjualan` VALUES (9, 5, 6, 18000, 1, 20000, 2000, 1, '2022-10-12 03:35:54');
INSERT INTO `trx_d_penjualan` VALUES (10, 5, 4, 9000, 1, 10000, 1000, 1, '2022-10-12 03:35:54');
INSERT INTO `trx_d_penjualan` VALUES (11, 5, 3, 50000, 1, 50000, 0, 1, '2022-10-12 03:35:54');
INSERT INTO `trx_d_penjualan` VALUES (12, 6, 6, 18000, 1, 20000, 2000, 1, '2022-10-12 03:59:22');
INSERT INTO `trx_d_penjualan` VALUES (13, 6, 4, 9000, 1, 10000, 1000, 1, '2022-10-12 03:59:22');

-- ----------------------------
-- Table structure for trx_h_penjualan
-- ----------------------------
DROP TABLE IF EXISTS `trx_h_penjualan`;
CREATE TABLE `trx_h_penjualan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `total` decimal(10, 0) NOT NULL,
  `trans_date` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trx_h_penjualan
-- ----------------------------
INSERT INTO `trx_h_penjualan` VALUES (3, 'TRX00001.22', 108000, '2022-10-12', 1, '2022-10-12 03:17:13');
INSERT INTO `trx_h_penjualan` VALUES (4, 'TRX00002.22', 51000, '2022-10-12', 1, '2022-10-12 03:34:53');
INSERT INTO `trx_h_penjualan` VALUES (5, 'TRX00003.22', 77000, '2022-10-12', 1, '2022-10-12 03:35:54');
INSERT INTO `trx_h_penjualan` VALUES (6, 'TRX00004.22', 27000, '2022-10-12', 1, '2022-10-12 03:59:22');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` datetime(0) NOT NULL,
  `updated_by` int(11) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Agus Suandi', 'agus.suandi', 'agussuandi48@gmail.com', '$2a$12$iU9V23YbMFailPq49GLKp.3PpAlpum94Q7HDfLKD9c6R5dYiv5bKG', 1, '2022-03-31 09:33:31', NULL, NULL);
INSERT INTO `users` VALUES (2, 'Ika Noviyanti', 'ika.noviyanti', 'ikanoviyanti90@gmail.com', '$2y$10$oDC4yXFOKB4idJut0f/DuOI6m7oVcAX6g9NAwEIzPj2rXd.O6Xlc.', 1, '2022-10-12 04:13:11', NULL, '2022-10-12 04:13:11');

SET FOREIGN_KEY_CHECKS = 1;
