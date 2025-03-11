/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50560
 Source Host           : localhost:3306
 Source Schema         : jspnltcj

 Target Server Type    : MySQL
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 29/09/2020 14:02:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bangongshebei
-- ----------------------------
DROP TABLE IF EXISTS `bangongshebei`;
CREATE TABLE `bangongshebei`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shebeibianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `shebeimingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `shuliang` int(11) NULL DEFAULT NULL COMMENT '数量',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `xiangqing` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `shebeibianhao`(`shebeibianhao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1601359226843 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '办公设备' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bangongshebei
-- ----------------------------
INSERT INTO `bangongshebei` VALUES (1601359204186, '2020-09-29 14:00:03', '1601359173', '垃圾桶', 100, 'http://localhost:8080/jspNltCJ/upload/1601359188741.jpg', '法撒旦范德萨范德萨大水发<img src=\"http://localhost:8080/jspNltCJ/upload/1601359202881.jpg\" width=\"100\" height=\"100\" _src=\"http://localhost:8080/jspNltCJ/upload/1601359202881.jpg\">\r\n');
INSERT INTO `bangongshebei` VALUES (1601359226842, '2020-09-29 14:00:26', '1601359207', '笔', 100, 'http://localhost:8080/jspNltCJ/upload/1601359217635.jpg', '发大水发大水f<img src=\"http://localhost:8080/jspNltCJ/upload/1601359223073.jpg\" width=\"100\" height=\"100\" _src=\"http://localhost:8080/jspNltCJ/upload/1601359223073.jpg\">\r\n');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'http://localhost:8080/jspNltCJ/upload/1601359020440.png');
INSERT INTO `config` VALUES (2, 'picture2', 'http://localhost:8080/jspNltCJ/upload/1601359028877.png');
INSERT INTO `config` VALUES (3, 'picture3', 'http://localhost:8080/jspNltCJ/upload/1601359036161.png');
INSERT INTO `config` VALUES (4, 'picture4', 'http://localhost:8080/jspNltCJ/upload/1601359053959.jpg');
INSERT INTO `config` VALUES (5, 'picture5', 'http://localhost:8080/jspNltCJ/upload/1601359062670.png');
INSERT INTO `config` VALUES (6, 'homepage', NULL);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1601359270766 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1601355812585, '2020-09-29 13:03:32', '最新资讯', 'http://localhost:8080/jspNltCJ/upload/1601359090260.png', 'das fdas fdas<img src=\"http://localhost:8080/jspNltCJ/upload/1601359095812.png\" width=\"100\" height=\"100\" _src=\"http://localhost:8080/jspNltCJ/upload/1601359095812.png\"> \r\n');
INSERT INTO `news` VALUES (1601359270765, '2020-09-29 14:01:10', '最新公告', 'http://localhost:8080/jspNltCJ/upload/1601359262476.jpg', '发大水发大水放大<img src=\"http://localhost:8080/jspNltCJ/upload/1601359268911.jpg\" width=\"100\" height=\"100\" _src=\"http://localhost:8080/jspNltCJ/upload/1601359268911.jpg\">\r\n');

-- ----------------------------
-- Table structure for qiandaopingtai
-- ----------------------------
DROP TABLE IF EXISTS `qiandaopingtai`;
CREATE TABLE `qiandaopingtai`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `biaoti` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `xiangqing` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1601359142804 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签到平台' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qiandaopingtai
-- ----------------------------
INSERT INTO `qiandaopingtai` VALUES (1601359142803, '2020-09-29 13:59:02', '签到平台', '在这里签到', 'http://localhost:8080/jspNltCJ/upload/1601359132571.jpg');

-- ----------------------------
-- Table structure for qiandaoxinxi
-- ----------------------------
DROP TABLE IF EXISTS `qiandaoxinxi`;
CREATE TABLE `qiandaoxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `qiandaoleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到类型',
  `qiandaoshijian` datetime NULL DEFAULT NULL COMMENT '签到时间',
  `yuangonggonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工工号',
  `yuangongxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签到信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for qingjiapingtai
-- ----------------------------
DROP TABLE IF EXISTS `qingjiapingtai`;
CREATE TABLE `qingjiapingtai`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `biaoti` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `neirong` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1601359168499 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '请假平台' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of qingjiapingtai
-- ----------------------------
INSERT INTO `qingjiapingtai` VALUES (1601359168498, '2020-09-29 13:59:28', '请假平台', '在这里请假\r\n', 'http://localhost:8080/jspNltCJ/upload/1601359161744.jpg');

-- ----------------------------
-- Table structure for qingjiaxinxi
-- ----------------------------
DROP TABLE IF EXISTS `qingjiaxinxi`;
CREATE TABLE `qingjiaxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `biaoti` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `qingjialiyou` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '请假理由',
  `yuangonggonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工工号',
  `yuangongxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `shenqingshijian` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `sfsh` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '请假信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for shebeishenqingxinxi
-- ----------------------------
DROP TABLE IF EXISTS `shebeishenqingxinxi`;
CREATE TABLE `shebeishenqingxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `shebeibianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备编号',
  `shebeimingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `shuliang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数量',
  `yuangonggonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工工号',
  `yuangongxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `shenqingshijian` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `sfsh` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核回复',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设备申请信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for storeup
-- ----------------------------
DROP TABLE IF EXISTS `storeup`;
CREATE TABLE `storeup`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) NULL DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 1, 'abo', 'users', '管理员', 'syhviqve9vh7gelry4qlkqxknxmq1zws', '2020-09-29 12:41:58', '2020-09-29 14:55:44');
INSERT INTO `token` VALUES (2, 1601358994649, '001', 'yuangongxinxi', '员工信息', 'xnwttewfg2pkla08mh65ja9qmhrghbt8', '2020-09-29 14:01:51', '2020-09-29 15:01:51');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'abo', 'abo', '管理员', '2020-09-29 12:35:01');

-- ----------------------------
-- Table structure for yuangongxinxi
-- ----------------------------
DROP TABLE IF EXISTS `yuangongxinxi`;
CREATE TABLE `yuangongxinxi`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `yuangonggonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工工号',
  `yuangongxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工姓名',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `bumen` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `gangwei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位',
  `lianxidianhua` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `shenfenzheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `zhaopian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片',
  `jiatingzhuzhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '家庭住址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yuangonggonghao`(`yuangonggonghao`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1601358994650 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of yuangongxinxi
-- ----------------------------
INSERT INTO `yuangongxinxi` VALUES (1601358994649, '2020-09-29 13:56:34', '001', '胡静', '001', '女', '人事部', '经理', '13513513525', '123456789789456', 'http://localhost:8080/jspNltCJ/upload/1601358992047.jpg', '放大范德萨富士达');

SET FOREIGN_KEY_CHECKS = 1;
