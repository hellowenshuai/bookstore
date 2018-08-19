/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2018-07-05 12:28:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `n_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('2', '公告', '大家好，儿童节临近，祝大家节日快乐！', '2018-06-03 18:42:55');
INSERT INTO `notice` VALUES ('6', '618', '网上书城，邀你来！', '2018-06-03 22:28:27');
INSERT INTO `notice` VALUES ('10', '10.1', '国庆促销', '2018-06-03 22:28:52');
INSERT INTO `notice` VALUES ('11', '12.22', '圣诞来袭', '2018-06-03 22:29:07');
INSERT INTO `notice` VALUES ('12', '春节', '大团圆', '2018-06-03 22:29:26');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `order_id` varchar(100) NOT NULL DEFAULT '',
  `product_id` varchar(100) NOT NULL DEFAULT '',
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('494aaca8-b3fa-4f32-b52d-e0990869064c', '3c135334-2e02-47ad-845a-5abb8d619721', '1');
INSERT INTO `orderitem` VALUES ('494aaca8-b3fa-4f32-b52d-e0990869064c', '4440bba8-b8db-4d35-93eb-4a3e01b4823e', '1');
INSERT INTO `orderitem` VALUES ('6eae5168-ac75-463f-90ea-471d9aa4cac1', '3c135334-2e02-47ad-845a-5abb8d619721', '7');
INSERT INTO `orderitem` VALUES ('8ee38a2d-ba67-4a73-9d22-e520236b679f', '6b567a95-f742-427e-917e-859c80155104', '2');
INSERT INTO `orderitem` VALUES ('fd216db0-9705-4bfb-9a7e-57c00e90ae27', '3c135334-2e02-47ad-845a-5abb8d619721', '2');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(100) NOT NULL,
  `money` double DEFAULT NULL,
  `receiverAddress` varchar(255) DEFAULT NULL,
  `receiverName` varchar(20) DEFAULT NULL,
  `receiverPhone` varchar(20) DEFAULT NULL,
  `paystate` int(11) DEFAULT '0',
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('494aaca8-b3fa-4f32-b52d-e0990869064c', '66.5', '安阳师范学院436号', '霍维尔', '15893630801', '1', '2018-06-03 23:39:03', '8');
INSERT INTO `orders` VALUES ('6eae5168-ac75-463f-90ea-471d9aa4cac1', '196', '安阳师范学院436号', '陈帅帅', '15893630801', '0', '2018-06-04 08:46:29', '8');
INSERT INTO `orders` VALUES ('8ee38a2d-ba67-4a73-9d22-e520236b679f', '77', '安阳师范学院', '陈帅', '15893630801', '0', '2018-06-03 22:32:58', '8');
INSERT INTO `orders` VALUES ('fd216db0-9705-4bfb-9a7e-57c00e90ae27', '56', '安阳师范学院', '陈帅帅', '15893630801', '0', '2018-06-03 22:32:22', '8');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `imgurl` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('3c135334-2e02-47ad-845a-5abb8d619721', 'SpringBoot解密', '28', '计算机', '0', '/bookimage/SpringBoot解密.jpg', 'SpringBoot解密');
INSERT INTO `products` VALUES ('4440bba8-b8db-4d35-93eb-4a3e01b4823e', '文化苦旅', '38.5', '文学', '3', '/bookimage/文化苦旅.jpeg', '法国司法更舒服');
INSERT INTO `products` VALUES ('59a36a0f-9493-4312-a639-ebdc9c3fa722', '疯狂java讲义', '29.8', '计算机', '3', '/bookimage/疯狂java讲义.jpg', '这是java入门神书，浅显易懂！');
INSERT INTO `products` VALUES ('630572cd-81b5-4b84-9f91-c160ef08cfbb', 'java入门到精通', '36.5', '计算机', '10', '/bookimage/java从门到精通.jpg', 'java入门到精通,大神鼎力推荐');
INSERT INTO `products` VALUES ('66bd1ae9-e822-4259-bc92-c245d8a42086', '漫画术', '29.8', '生活', '3', '/bookimage/漫画术.jpg', 'dasfadadfa');
INSERT INTO `products` VALUES ('6b567a95-f742-427e-917e-859c80155104', '乖，摸摸头', '38.5', '励志', '17', '/bookimage/乖，摸摸头.jpg', '大冰');
INSERT INTO `products` VALUES ('db54ca50-ba08-4bd8-a565-01f6bf02d709', 'HIbernate', '85', '计算机', '10', '/bookimage/HIbernate.jpg', '都是');
INSERT INTO `products` VALUES ('eaf5f443-36f3-4f8d-9225-8fe6e00402fa', 'Redis入门指南', '29.8', '计算机', '9', '/bookimage/Redis入门指南.jpg', 'sadfdadfafa');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `introduce` varchar(100) DEFAULT NULL,
  `activeCode` varchar(50) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `role` varchar(10) DEFAULT '普通用户',
  `registTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('7', 'abc', '123456', '女', '906779930@qq.com', '', '', 'cd682eda-4a7b-4cf3-8a1e-18e800f97d64', '1', '超级用户', '2018-06-03 20:34:28');
INSERT INTO `user` VALUES ('8', 'chenshuai', '123456', '男', '15893630802@163.com', '15893630801', '', 'a82b0943-f0af-49d3-ba69-2aae9a4e2896', '1', '普通用户', '2018-07-05 12:21:31');
INSERT INTO `user` VALUES ('9', 'css', '123456', '男', '15893630801@163.com', '15893630801', 'asda', '6e8c795d-180a-4729-8430-3a533b157b15', '1', '普通用户', '2018-07-05 12:26:37');
