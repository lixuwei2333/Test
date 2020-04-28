/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50155
Source Host           : localhost:3306
Source Database       : lm

Target Server Type    : MYSQL
Target Server Version : 50155
File Encoding         : 65001

Date: 2019-07-04 11:04:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `flag` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', 'c++从入门到入土', '0');
INSERT INTO `book` VALUES ('2', '数据库实训', '0');
INSERT INTO `book` VALUES ('3', '防治脱发', '0');
INSERT INTO `book` VALUES ('4', '正确的摸鱼姿势', '1');

-- ----------------------------
-- Table structure for borrow
-- ----------------------------
DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `id` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`,`account`),
  KEY `account` (`account`),
  CONSTRAINT `account` FOREIGN KEY (`account`) REFERENCES `user` (`account`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrow
-- ----------------------------
INSERT INTO `borrow` VALUES ('1', 'misaka', '2019-07-04');
INSERT INTO `borrow` VALUES ('2', 'lisi', '2019-07-04');
INSERT INTO `borrow` VALUES ('3', 'lisi', '2019-07-01');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `time` date DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '2019-07-03', '123');
INSERT INTO `notice` VALUES ('2', '2019-07-02', '24233szfsdf ');
INSERT INTO `notice` VALUES ('4', '2019-07-03', 'java.sql.Date和java.util.Date，String和java.util.Date之间的相互转换  此博文包含图片 (2016-12-02 19:49:43)转载▼ 标签： java string java.util.date java.sql.date	分类： Java相关 因为数据库的字段类型是date，但用户输入是String。所以一开始我想着是把用户输入的字符串直接转换成Date类型（对，一开始我就没有意识到还有java.sql.Date类型），然后将这个Date直接输入到数据库里面的。后来发现自己想多了。于是就在网上查了一下，下面我就把我查到的简单总结一下。    1. java.util.Date转java.sql.Date 前者是常用的表示时间的类，而后者通常是在读写数据库的时候使用。而我就是打算用PreparedStatement类的setDate()方法对数据库中类型为date的字段赋值。一开始我是用的java.util.Date类，主要代码是这样的：  pStmt.setDdate(1, checkDate); pStmt是PreparedStatement的实例，checkDate是方法得到一个long类型的值，然后用这个值实例化一个java.sql.Date类，代码如下：');
INSERT INTO `notice` VALUES ('3', '2019-07-03', '3');
INSERT INTO `notice` VALUES ('40', '2019-07-04', '1.23776');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `account` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1', '0');
INSERT INTO `user` VALUES ('alice', '123', '0');
INSERT INTO `user` VALUES ('bob', '123', '0');
INSERT INTO `user` VALUES ('lisi', '123', '0');
INSERT INTO `user` VALUES ('misaka', '27149', '1');
INSERT INTO `user` VALUES ('wangwu', '123', '0');
INSERT INTO `user` VALUES ('zhangsan', '123', '0');
