/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : china

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-09-17 23:46:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `zs` int(11) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `collection_photo_path` varchar(255) DEFAULT NULL,
  `collection_cd` varchar(255) DEFAULT NULL,
  `c_no` varchar(255) DEFAULT NULL,
  `c_weight` varchar(255) DEFAULT NULL,
  `c_js` varchar(255) DEFAULT NULL,
  `create_man` varchar(255) DEFAULT NULL,
  `update_man` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('1', '祖传小猫一只', '7', 'SVIP', '动物095.png', '天朝', 'NO12345', '368克', '杨贵妃抱过', null, null, '2016-09-17 13:38:13', '2016-09-17 14:26:21');
INSERT INTO `collection` VALUES ('2', '祖传毛驴一头', '9', 'VIP', 'psbCAFWSKXQ.jpg', '宋朝', 'NO1421', '1000千克', '这个毛驴纪晓岚骑过', null, null, '2016-09-17 14:23:44', null);

-- ----------------------------
-- Table structure for distribution
-- ----------------------------
DROP TABLE IF EXISTS `distribution`;
CREATE TABLE `distribution` (
  `disid` int(11) NOT NULL AUTO_INCREMENT,
  `disphoto_path` varchar(255) DEFAULT NULL,
  `describes` varchar(255) DEFAULT NULL,
  `disname` varchar(255) DEFAULT NULL,
  `a` int(11) DEFAULT NULL,
  `b` varchar(255) DEFAULT NULL,
  `c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`disid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of distribution
-- ----------------------------
INSERT INTO `distribution` VALUES ('1', '75394a90f603738da32a08afb31bb051f919ec97.jpg', '描述', '测试', null, null, null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `meid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_man` varchar(255) DEFAULT NULL,
  `update_man` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`meid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', '1', '张三', 'img/5c1c3f6d55fbb2fb7e1d9ee14f4a20a44723dc05.jpg', '我是留言内容', null, null, '2016-09-17 01:08:25', null);

-- ----------------------------
-- Table structure for my_dh
-- ----------------------------
DROP TABLE IF EXISTS `my_dh`;
CREATE TABLE `my_dh` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) DEFAULT NULL,
  `d_sname` varchar(255) DEFAULT NULL,
  `zt_photo_path` varchar(255) DEFAULT NULL,
  `create_man` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_man` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_dh
-- ----------------------------
INSERT INTO `my_dh` VALUES ('1', '展厅名2', '次展厅名2', '15c1d72a6059252d813f1989349b033b5ab5b9cf2.jpg', null, null, null, '2016-09-17 15:29:59');
INSERT INTO `my_dh` VALUES ('2', '展厅名1', '次展厅名1', '4b39a18b87d6277f847536b528381f30e824fc942.jpg', null, '2016-09-17 15:29:29', null, null);

-- ----------------------------
-- Table structure for my_info
-- ----------------------------
DROP TABLE IF EXISTS `my_info`;
CREATE TABLE `my_info` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `msub` varchar(255) DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `present` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `create_man` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_man` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_info
-- ----------------------------
INSERT INTO `my_info` VALUES ('1', '标题1', '4b39a18b87d6277f847536b528381f30e824fc94.jpg', '描述1', '详情1', '11', null, '2016-09-17 03:35:03', null, '2016-09-17 03:37:21');
INSERT INTO `my_info` VALUES ('3', '标题3', '15c1d72a6059252d813f1989349b033b5ab5b9cf.jpg', '描述3', '详情3', '13', null, '2016-09-17 03:21:41', null, '2016-09-17 03:37:12');
INSERT INTO `my_info` VALUES ('4', '标题2', '75394a90f603738da32a08afb31bb051f919ec97.jpg', '描述2', '详情2', '12', null, '2016-09-17 03:36:31', null, '2016-09-17 03:37:48');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `age` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `passwords` varchar(255) DEFAULT NULL,
  `User_photo_path` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `create_man` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_man` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `dsname` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '25', null, null, 'img/5c1c3f6d55fbb2fb7e1d9ee14f4a20a44723dc05.jpg', '管理员', 'M', '15670246810', '用户', null, '2016-09-16 23:30:25', null, '2016-09-16 23:30:27', '蜗牛', '2016-09-16 23:31:03');
