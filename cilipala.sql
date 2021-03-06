/*
Navicat MySQL Data Transfer

Source Server         : CILIPALA
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : cilipala

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-01-02 13:08:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL COMMENT '账号',
  `phone` bigint(25) NOT NULL,
  `password` varchar(25) NOT NULL COMMENT '密码',
  `userRole` varchar(25) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'KM', '12345678910', '123456', '超级管理员');

-- ----------------------------
-- Table structure for `catelog`
-- ----------------------------
DROP TABLE IF EXISTS `catelog`;
CREATE TABLE `catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '分类名',
  `number` int(11) DEFAULT '0' COMMENT '该分类下的商品数量',
  `status` tinyint(10) DEFAULT '0' COMMENT '分类状态，0正常，1暂用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catelog
-- ----------------------------
INSERT INTO `catelog` VALUES ('1', '数码电子', '16', '1');
INSERT INTO `catelog` VALUES ('2', '单车滑板', '6', '1');
INSERT INTO `catelog` VALUES ('3', '电脑百货', '10', '1');
INSERT INTO `catelog` VALUES ('4', '图书教材', '10', '1');
INSERT INTO `catelog` VALUES ('5', '玩偶衣物', '16', '1');
INSERT INTO `catelog` VALUES ('6', '棋牌桌游', '7', '1');
INSERT INTO `catelog` VALUES ('7', '饰品手办', '10', '1');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品，外键',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `create_at` varchar(250) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('130', '28', '125', '秋山澪天下第一', '2019-12-13 05:17:31');
INSERT INTO `comments` VALUES ('131', '28', '119', '能便宜一些吗？', '2019-12-13 05:19:03');
INSERT INTO `comments` VALUES ('132', '28', '130', '', '2019-12-13 11:50:35');

-- ----------------------------
-- Table structure for `focus`
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '外键 商品id',
  `user_id` int(11) DEFAULT NULL COMMENT '外键 用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of focus
-- ----------------------------
INSERT INTO `focus` VALUES ('46', '140', '27');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `catelog_id` int(11) DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户外键',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `price` float(11,2) DEFAULT NULL COMMENT '出售价格',
  `real_price` float(11,2) DEFAULT NULL COMMENT '真实价格',
  `start_time` varchar(25) DEFAULT NULL COMMENT '发布时间',
  `polish_time` varchar(30) DEFAULT NULL COMMENT '擦亮时间，按该时间进行查询，精确到时分秒',
  `end_time` varchar(25) DEFAULT NULL COMMENT '下架时间',
  `describle` text COMMENT '详细信息',
  `status` int(11) DEFAULT '1' COMMENT '状态 上架1 下架0',
  PRIMARY KEY (`id`),
  KEY `catelog_id` (`catelog_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('135', '1', '27', '二手ipad', '2000.00', '2300.00', '2020-01-01', '2020-01-01', '2020-01-11', '送保护套', '1');
INSERT INTO `goods` VALUES ('136', '2', '27', '假装是个滑板', '20.00', '30.00', '2020-01-01', '2020-01-01', '2020-01-11', '假装是个滑板其实是个凳子', '1');
INSERT INTO `goods` VALUES ('137', '3', '27', '二手电脑', '5000.00', '9000.00', '2020-01-01', '2020-01-01', '2020-01-11', '没有描述', '1');
INSERT INTO `goods` VALUES ('138', '1', '27', '三手电脑', '2000.00', '5000.00', '2020-01-01', '2020-01-01', '2020-01-11', '还是上一台', '1');
INSERT INTO `goods` VALUES ('139', '4', '29', '考研数学', '50.00', '50.00', '2020-01-01', '2020-01-01', '2020-01-11', '刚买的', '0');
INSERT INTO `goods` VALUES ('140', '5', '29', '狗头企鹅', '80.00', '120.00', '2020-01-01', '2020-01-01', '2020-01-11', 'rua', '1');
INSERT INTO `goods` VALUES ('141', '6', '29', '诡镇奇谈', '300.00', '500.00', '2020-01-01', '2020-01-01', '2020-01-11', '四角尖尖，无磕无碰', '0');
INSERT INTO `goods` VALUES ('142', '7', '29', '二锅头摆件', '5.00', '10.00', '2020-01-01', '2020-01-01', '2020-01-11', '只是个摆件，宿舍不能喝酒', '1');
INSERT INTO `goods` VALUES ('143', '5', '27', '11', '22.00', '33.00', '2020-01-02', '2020-01-02', '2020-01-12', '4444', '0');
INSERT INTO `goods` VALUES ('144', '5', '27', 'quin', '33.00', '77.00', '2020-01-02', '2020-01-02', '2020-01-12', '小秦', '1');

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片主键',
  `goods_id` int(11) NOT NULL COMMENT '商品外键',
  `img_url` text NOT NULL COMMENT '图片链接',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '1', 'nopic1.png');
INSERT INTO `image` VALUES ('2', '2', 'nopic2.png');
INSERT INTO `image` VALUES ('3', '3', 'nopic3.png');
INSERT INTO `image` VALUES ('4', '4', 'nopic4.png');
INSERT INTO `image` VALUES ('5', '5', 'nopic5.png');
INSERT INTO `image` VALUES ('6', '6', 'nopic6.png');
INSERT INTO `image` VALUES ('7', '7', 'nopic7.png');
INSERT INTO `image` VALUES ('8', '8', 'nopic8.png');
INSERT INTO `image` VALUES ('9', '9', 'nopic9.png');
INSERT INTO `image` VALUES ('11', '11', 'nopic11.png');
INSERT INTO `image` VALUES ('12', '12', 'nopic12.png');
INSERT INTO `image` VALUES ('13', '13', 'nopic13.png');
INSERT INTO `image` VALUES ('16', '16', 'nopic16.png');
INSERT INTO `image` VALUES ('17', '17', 'nopic17.png');
INSERT INTO `image` VALUES ('18', '18', 'nopic18.png');
INSERT INTO `image` VALUES ('20', '20', 'nopic20.png');
INSERT INTO `image` VALUES ('21', '77', '4f320b75-427a-484e-b725-a2f5d066af6f.jpg');
INSERT INTO `image` VALUES ('78', '78', '599629aa-9440-435c-8185-42e34a862470.jpg');
INSERT INTO `image` VALUES ('79', '79', '266abea1-a202-47f2-b5c4-095e96c10473.jpg');
INSERT INTO `image` VALUES ('80', '80', '4d472617-d430-4540-a510-f7606861dde0.jpg');
INSERT INTO `image` VALUES ('81', '81', 'e62acc43-8122-421a-940b-a68e6aeadd30.jpg');
INSERT INTO `image` VALUES ('82', '82', '67a5f2ee-a09a-488d-9e7a-87ac6d8ab9c4.jpg');
INSERT INTO `image` VALUES ('83', '83', '110456d4-cc20-4fe2-b0a6-217b023d7dd6.jpg');
INSERT INTO `image` VALUES ('84', '84', '499afa59-53bc-4d23-99ef-5d0f9d60de69.jpg');
INSERT INTO `image` VALUES ('85', '85', '23f242e3-6dbf-4d46-a1b2-a620918908d9.jpg');
INSERT INTO `image` VALUES ('86', '86', 'ae1097a5-736d-4850-9552-b5901ad6d84b.jpg');
INSERT INTO `image` VALUES ('87', '87', '95daa308-8011-4e0c-b5bd-8cd151830c32.jpg');
INSERT INTO `image` VALUES ('88', '88', '5c212d57-d8a4-4cc0-8853-dba957fba3d5.jpg');
INSERT INTO `image` VALUES ('89', '89', 'ec5369f6-7c87-43db-98aa-112efa91c8c6.JPG');
INSERT INTO `image` VALUES ('90', '90', 'fd680315-9ac8-4268-803e-7da7b492e8b0.JPG');
INSERT INTO `image` VALUES ('91', '91', '455e9ee5-92a7-4c7c-aa94-55f4373a16ee.JPG');
INSERT INTO `image` VALUES ('92', '92', '33434fa2-8bf3-4fbc-b1d9-d1e67202e2f2.jpg');
INSERT INTO `image` VALUES ('93', '93', 'dc4f9591-bd1a-4eac-b1ea-be6412296fb6.png');
INSERT INTO `image` VALUES ('94', '94', '7eb89aaa-56c0-4283-893f-bd5718301d80.jpg');
INSERT INTO `image` VALUES ('95', '95', '6664b320-87d4-4d37-b14f-fc5dba41f529.PNG');
INSERT INTO `image` VALUES ('96', '96', '451c3aa2-529d-449d-b69f-b8771af1d806.jpg');
INSERT INTO `image` VALUES ('97', '97', 'ee6e735c-6479-40bb-b45f-69888c42862e.jpg');
INSERT INTO `image` VALUES ('98', '98', '2f92136b-af5b-45f4-902d-7bb1d0ad0809.png');
INSERT INTO `image` VALUES ('99', '99', '022fe88a-5328-4b42-8333-10b782d39373.png');
INSERT INTO `image` VALUES ('100', '100', 'a1f11b39-490b-42ef-a8e1-44285c4a80d4.png');
INSERT INTO `image` VALUES ('101', '101', '0f022547-b2cb-45fe-ab86-fb8b6d70adbc.jpg');
INSERT INTO `image` VALUES ('102', '102', '');
INSERT INTO `image` VALUES ('103', '103', 'b0933eb3-1ccb-43e1-80a4-1d50902916db.jpg');
INSERT INTO `image` VALUES ('104', '104', '');
INSERT INTO `image` VALUES ('105', '105', '504d47df-32b0-4195-b63c-10d1562896cc.jpg');
INSERT INTO `image` VALUES ('106', '106', 'a634ca2b-70cc-404d-95cb-fc4166fe6706.jpg');
INSERT INTO `image` VALUES ('107', '107', '1ba8f318-fbf3-42f6-b8d9-0baa7e678cec.jpg');
INSERT INTO `image` VALUES ('108', '108', 'afd57674-338c-414f-98ae-78e0d25b12f8.jpg');
INSERT INTO `image` VALUES ('109', '109', '330a9a46-6434-4d04-a72b-a91a14035229.jpg');
INSERT INTO `image` VALUES ('110', '110', '0583cb1e-6acd-46da-bebc-4a9f1d6c3ac7.jpg');
INSERT INTO `image` VALUES ('111', '111', 'ce18c0f4-dc10-454e-9791-e1992164a384.jpg');
INSERT INTO `image` VALUES ('112', '112', '854dff80-d049-4381-ae40-d1d23cd0e88b.jpg');
INSERT INTO `image` VALUES ('113', '113', '');
INSERT INTO `image` VALUES ('114', '114', '');
INSERT INTO `image` VALUES ('115', '115', 'd75711a2-ce0d-487b-afc7-49fe94e75c54.jpg');
INSERT INTO `image` VALUES ('116', '116', 'f0983943-2dea-4a19-a96f-989d6ee70780.png');
INSERT INTO `image` VALUES ('117', '117', '');
INSERT INTO `image` VALUES ('118', '118', 'a1b9e342-de62-4a2b-83e8-024a734465a2.png');
INSERT INTO `image` VALUES ('119', '119', 'ef09eb70-b01b-4b5f-9043-2bc92b0bb27b.jpg');
INSERT INTO `image` VALUES ('120', '120', '5b4bf6ac-31c7-4cce-b639-ff21bfd7ef7e.png');
INSERT INTO `image` VALUES ('121', '121', '4ff79e42-d798-4fe3-bd10-ed68757ba768.jpg');
INSERT INTO `image` VALUES ('122', '122', '19ac7234-3fca-4f24-a885-ff2cff08b948.png');
INSERT INTO `image` VALUES ('123', '123', '4f743a29-24b1-4f2d-89ab-3f4403ee85de.png');
INSERT INTO `image` VALUES ('124', '124', '7ba764ba-2941-451d-91c7-c7c0d0767b59.jpg');
INSERT INTO `image` VALUES ('125', '125', '4970e3f2-dad0-4d9e-b39d-01702bcf6faa.jpg');
INSERT INTO `image` VALUES ('126', '126', 'dd3415a6-b954-4496-969b-e5c416903b49.jpg');
INSERT INTO `image` VALUES ('127', '127', 'd5748609-1cde-4ea0-b717-b4d21e41094e.jpg');
INSERT INTO `image` VALUES ('128', '128', '84fc7a54-cef8-4bdd-81c4-025b37307233.jpg');
INSERT INTO `image` VALUES ('129', '129', '0456fe60-5303-47ff-8711-082aa6dfe984.png');
INSERT INTO `image` VALUES ('130', '130', 'd84a53ab-ef4e-4f37-b88e-dcec3f1d00eb.png');
INSERT INTO `image` VALUES ('131', '131', 'b836004e-6aa9-46a1-aba0-2bc97cf0db88.jpg');
INSERT INTO `image` VALUES ('132', '132', '7a0192cf-436c-49b8-999a-c76d11891ed0.jpg');
INSERT INTO `image` VALUES ('133', '133', 'eaf4af7f-b016-4a4b-b403-b32a664e0b40.jpg');
INSERT INTO `image` VALUES ('134', '134', '');
INSERT INTO `image` VALUES ('135', '135', 'af5f0ee1-52a7-4065-b4ad-3a93159037a1.jpg');
INSERT INTO `image` VALUES ('136', '136', 'fe53b93e-24d7-4a31-bab7-156619f262cc.jpg');
INSERT INTO `image` VALUES ('137', '137', '1e3c7191-b091-4505-a725-19dfcfe9cbfa.jpg');
INSERT INTO `image` VALUES ('138', '138', '2add8c73-e71d-410d-aea3-ed0bdd90dfcd.jpg');
INSERT INTO `image` VALUES ('139', '139', '66dc78ef-b46b-4956-8faf-b9d97f3f5769.jpg');
INSERT INTO `image` VALUES ('140', '140', 'd58e64e9-1be1-4b46-9c87-592bea121bf3.jpg');
INSERT INTO `image` VALUES ('141', '141', 'a0381d3b-ce19-4055-9f6e-eb6cf176817a.jpg');
INSERT INTO `image` VALUES ('142', '142', '2f4196a5-4b5a-4625-a145-d4bf192c6cc2.jpg');
INSERT INTO `image` VALUES ('143', '143', '');
INSERT INTO `image` VALUES ('144', '144', '5dabb88f-56e0-427c-bac7-a9ffb9f1b767.jpg');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统信息主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `context` text COMMENT '信息内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '推送信息时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0未读，1已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('20', '27', '1111', '2020-01-01 14:00:59', '0');
INSERT INTO `notice` VALUES ('21', '27', '121212', '2020-01-01 14:36:39', '0');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `order_num` bigint(25) DEFAULT NULL COMMENT '订单编号',
  `order_price` float(11,0) DEFAULT NULL COMMENT '订单价格',
  `order_state` int(11) DEFAULT '1' COMMENT '订单状态 1待发货 2待收货 3已完成',
  `order_information` varchar(50) DEFAULT NULL,
  `order_date` varchar(50) DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('5', '27', '141', '53586240', '300', '1', '', '2020-01-01 08:03:20');

-- ----------------------------
-- Table structure for `purse`
-- ----------------------------
DROP TABLE IF EXISTS `purse`;
CREATE TABLE `purse` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '钱包id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `balance` float(11,0) unsigned zerofill DEFAULT '00000000000' COMMENT '总钱数',
  `recharge` float(11,0) DEFAULT NULL COMMENT '充值钱数',
  `withdrawals` float(11,0) DEFAULT NULL COMMENT '提现钱数',
  `state` int(11) DEFAULT NULL COMMENT '状态 0未审核   已审核（1不通过 2通过）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purse
-- ----------------------------
INSERT INTO `purse` VALUES ('22', '27', '00000049635', null, null, null);
INSERT INTO `purse` VALUES ('23', '28', '00000004720', null, null, '1');
INSERT INTO `purse` VALUES ('24', '29', '00000000050', null, null, null);

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论回复主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户，外键',
  `atuser_id` int(11) DEFAULT NULL,
  `commet_id` int(11) DEFAULT NULL COMMENT '评论，外键',
  `content` text COMMENT '回复内容',
  `create_at` varchar(25) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录使用的手机号',
  `username` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `QQ` varchar(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '即时通讯',
  `create_at` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建时间',
  `goods_num` int(11) DEFAULT '0' COMMENT '发布过的物品数量',
  `power` int(10) unsigned zerofill DEFAULT '0000000100' COMMENT '信用分，普通用户默认为100',
  `last_login` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近一次登陆时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '账号是否冻结，默认0未冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('27', '17660620893', '777', 'E10ADC3949BA59ABBE56E057F20F883E', '', '2019-12-26 14:59', '16', '0000000100', null, '1');
INSERT INTO `user` VALUES ('28', '17561745205', 'kmsa', 'E10ADC3949BA59ABBE56E057F20F883E', '', '2019-12-27 15:45', '5', '0000000100', null, '1');
INSERT INTO `user` VALUES ('29', '17853243105', '7的分身', 'E10ADC3949BA59ABBE56E057F20F883E', null, '2020-01-01 19:47', '4', '0000000100', null, '1');
