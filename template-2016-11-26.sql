/*
Navicat MySQL Data Transfer

Source Server         : template
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : template

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-11-27 09:25:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `b_area`
-- ----------------------------
DROP TABLE IF EXISTS `b_area`;
CREATE TABLE `b_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '名称',
  `level` tinyint(4) DEFAULT NULL COMMENT '等级(全国0,省1,市(区)2)',
  `pid` int(11) DEFAULT NULL COMMENT '父节点id',
  `note` varchar(128) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='行政区划';

-- ----------------------------
-- Records of b_area
-- ----------------------------
INSERT INTO `b_area` VALUES ('0', '全国', '0', null, null, '0', '11');
INSERT INTO `b_area` VALUES ('2', '河北', '1', '0', null, '0', '11');
INSERT INTO `b_area` VALUES ('3', '河南', '1', '0', null, '0', '11');
INSERT INTO `b_area` VALUES ('4', '山东', '1', '0', null, '0', '11');
INSERT INTO `b_area` VALUES ('5', '山西', '1', '0', null, '0', '11');
INSERT INTO `b_area` VALUES ('6', '保定', '2', '2', null, '0', '11');
INSERT INTO `b_area` VALUES ('7', '邯郸', '2', '2', null, '0', '11');
INSERT INTO `b_area` VALUES ('8', '安阳', '2', '3', null, '0', '11');
INSERT INTO `b_area` VALUES ('9', '日照', '2', '4', null, '0', '11');
INSERT INTO `b_area` VALUES ('10', '太原', '2', '5', null, '0', '11');
INSERT INTO `b_area` VALUES ('32', '全国', '0', null, null, '0', '15');
INSERT INTO `b_area` VALUES ('34', '河北', '1', '32', null, '0', '15');
INSERT INTO `b_area` VALUES ('35', '保定', '2', '34', null, '0', '15');
INSERT INTO `b_area` VALUES ('36', '全国', '0', null, null, '0', '19');
INSERT INTO `b_area` VALUES ('37', '广东', '1', '36', null, '0', '19');
INSERT INTO `b_area` VALUES ('38', '广州', '2', '37', null, '0', '19');
INSERT INTO `b_area` VALUES ('39', '贵州', '1', '36', null, '0', '19');
INSERT INTO `b_area` VALUES ('40', '贵阳', '2', '39', null, '0', '19');
INSERT INTO `b_area` VALUES ('41', '全国', '0', null, null, '0', '20');
INSERT INTO `b_area` VALUES ('42', '全国', '0', null, null, '0', '21');
INSERT INTO `b_area` VALUES ('43', '全国', '0', null, null, '0', '22');

-- ----------------------------
-- Table structure for `b_company`
-- ----------------------------
DROP TABLE IF EXISTS `b_company`;
CREATE TABLE `b_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `column_3` int(11) DEFAULT NULL,
  `contacts` varchar(64) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `column_6` int(11) DEFAULT NULL,
  `typ` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_company
-- ----------------------------
INSERT INTO `b_company` VALUES ('1', '施工单位1', null, '张三', '18808888888', null, '2', '0', '11');
INSERT INTO `b_company` VALUES ('2', '建设单位1', null, '李四', '137777777777', null, '1', '0', '11');
INSERT INTO `b_company` VALUES ('3', '监理单位', null, '王五', '13999999999', null, '3', '0', '11');
INSERT INTO `b_company` VALUES ('4', '123', null, '123', '123', null, '1', '0', '15');
INSERT INTO `b_company` VALUES ('5', 'c1', null, 'c1', '112', null, '1', '0', '19');

-- ----------------------------
-- Table structure for `b_dept`
-- ----------------------------
DROP TABLE IF EXISTS `b_dept`;
CREATE TABLE `b_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '公司名称',
  `logo` varchar(128) DEFAULT NULL COMMENT '公司logo文件名',
  `note` varchar(128) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='公司信息';

-- ----------------------------
-- Records of b_dept
-- ----------------------------
INSERT INTO `b_dept` VALUES ('11', '管理员', '', '超级管理员用户组', '0');
INSERT INTO `b_dept` VALUES ('19', 'test', '3edf8d84-8333-4263-979e-5edc3f663332.png', '测试用户组', '0');

-- ----------------------------
-- Table structure for `b_equipment`
-- ----------------------------
DROP TABLE IF EXISTS `b_equipment`;
CREATE TABLE `b_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL COMMENT '设备编号',
  `name` varchar(128) DEFAULT NULL COMMENT '设备名称',
  `note` varchar(128) DEFAULT NULL COMMENT '备注',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属机构id',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='设备信息';

-- ----------------------------
-- Records of b_equipment
-- ----------------------------
INSERT INTO `b_equipment` VALUES ('3', 'EQP030303', 'XXX大型检测仪', '造价10000万', '1', '0', '11');
INSERT INTO `b_equipment` VALUES ('4', '123', '123', '123', '3', '0', '15');
INSERT INTO `b_equipment` VALUES ('5', '123', '123', '123', '4', '0', '19');

-- ----------------------------
-- Table structure for `b_user`
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别(1男0女)',
  `note` varchar(128) DEFAULT NULL COMMENT '备注',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属机构id',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='设备信息';

-- ----------------------------
-- Records of b_user
-- ----------------------------
INSERT INTO `b_user` VALUES ('10', '张亮', '1', '主管', '1', '0', '11');
INSERT INTO `b_user` VALUES ('11', '123', '0', '123', null, '0', '11');
INSERT INTO `b_user` VALUES ('12', '舒淇', '0', '测试', '1', '0', '11');
INSERT INTO `b_user` VALUES ('13', '', '1', '', null, '0', '11');
INSERT INTO `b_user` VALUES ('15', '黎明', '1', '监管员', '1', '0', '11');
INSERT INTO `b_user` VALUES ('16', '123', '1', '123', '3', '0', '15');
INSERT INTO `b_user` VALUES ('17', '123', '1', '123', '4', '0', '19');

-- ----------------------------
-- Table structure for `b_inspect_data`
-- ----------------------------
DROP TABLE IF EXISTS `b_inspect_data`;
CREATE TABLE `b_inspect_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PRG` varchar(128) DEFAULT NULL COMMENT '工程:(编号和工程名称)',
  `STZH` varchar(128) DEFAULT NULL COMMENT '桩号:(数字)',
  `DevNB` varchar(128) DEFAULT NULL COMMENT '设备编号数据:(字符和数字)',
  `PRS` varchar(128) DEFAULT NULL COMMENT '压力',
  `HZJC` varchar(128) DEFAULT NULL COMMENT '荷载',
  `WYJC` varchar(128) DEFAULT NULL COMMENT '位移,(1#:     ,2#:     3#,)',
  `LAT` float DEFAULT NULL COMMENT '纬度',
  `LNG` float DEFAULT NULL COMMENT '经度',
  `Devstr` varchar(128) DEFAULT NULL COMMENT '设备类型代号(GZM,JZCS,FCJC,等,后续添加)',
  `Time` varchar(128) DEFAULT NULL COMMENT '数据上传时间(YYYY-MM-DD-HH-MM)',
  `QJX` varchar(128) DEFAULT NULL COMMENT '倾角数据QJX,',
  `NDSJ` varchar(128) DEFAULT NULL COMMENT '挠度数据NDSJ',
  `DevST` tinyint(4) DEFAULT NULL COMMENT '设备状态0:,1:,2:,3:',
  `SETprs` varchar(128) DEFAULT NULL COMMENT '基准值',
  `LoadFlag` tinyint(1) DEFAULT NULL COMMENT '数据类型:true加压,false减压',
  `plan_id` int(11) DEFAULT NULL COMMENT '检测计划id',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `totalTime` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='传感器原始数据';

-- ----------------------------
-- Records of b_inspect_data
-- ----------------------------
INSERT INTO `b_inspect_data` VALUES ('85', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '0.00,0.00 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '340', '1', '21', '0', '11', '0', null);
INSERT INTO `b_inspect_data` VALUES ('86', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '0.43,0.57 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '340', '1', '21', '0', '11', '5', null);
INSERT INTO `b_inspect_data` VALUES ('87', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '0.48,0.63 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '340', '1', '21', '0', '11', '15', null);
INSERT INTO `b_inspect_data` VALUES ('88', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '0.52,0.68 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '340', '1', '21', '0', '11', '30', null);
INSERT INTO `b_inspect_data` VALUES ('89', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '0.55,0.72 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '340', '1', '21', '0', '11', '45', null);
INSERT INTO `b_inspect_data` VALUES ('90', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '0.57,0.74 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '340', '1', '21', '0', '11', '60', null);
INSERT INTO `b_inspect_data` VALUES ('91', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '0.58,0.76 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '340', '1', '21', '0', '11', '90', null);
INSERT INTO `b_inspect_data` VALUES ('92', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '0.63,0.77 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '340', '1', '21', '0', '11', '120', null);
INSERT INTO `b_inspect_data` VALUES ('93', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '0.63,0.77 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '510', '1', '21', '0', '11', '0', null);
INSERT INTO `b_inspect_data` VALUES ('94', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '1.14,1.29 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '510', '1', '21', '0', '11', '5', null);
INSERT INTO `b_inspect_data` VALUES ('95', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '1.21,1.35 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '510', '1', '21', '0', '11', '15', null);
INSERT INTO `b_inspect_data` VALUES ('96', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '1.24,1.37 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '510', '1', '21', '0', '11', '30', null);
INSERT INTO `b_inspect_data` VALUES ('97', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '1.28,1.42 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '510', '1', '21', '0', '11', '45', null);
INSERT INTO `b_inspect_data` VALUES ('98', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '1.31,1.45 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '510', '1', '21', '0', '11', '60', null);
INSERT INTO `b_inspect_data` VALUES ('99', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '1.33,1.46 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '510', '1', '21', '0', '11', '90', null);
INSERT INTO `b_inspect_data` VALUES ('100', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '1.36,1.48 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '510', '1', '21', '0', '11', '120', null);
INSERT INTO `b_inspect_data` VALUES ('101', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '1.36,1.48 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '680', '1', '21', '0', '11', '0', null);
INSERT INTO `b_inspect_data` VALUES ('102', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '2.07,2.20 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '680', '1', '21', '0', '11', '5', null);
INSERT INTO `b_inspect_data` VALUES ('103', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '2.13,2.25 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '680', '1', '21', '0', '11', '15', null);
INSERT INTO `b_inspect_data` VALUES ('104', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '2.17,2.28 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '680', '1', '21', '0', '11', '30', null);
INSERT INTO `b_inspect_data` VALUES ('105', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '2.21,2.32 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '680', '1', '21', '0', '11', '45', null);
INSERT INTO `b_inspect_data` VALUES ('106', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '2.24,2.35 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '680', '1', '21', '0', '11', '60', null);
INSERT INTO `b_inspect_data` VALUES ('107', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '2.27,2.38 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '680', '1', '21', '0', '11', '90', null);
INSERT INTO `b_inspect_data` VALUES ('108', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '2.29,2.41 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '680', '1', '21', '0', '11', '120', null);
INSERT INTO `b_inspect_data` VALUES ('109', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '2.30,2.42 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '850', '1', '21', '0', '11', '0', null);
INSERT INTO `b_inspect_data` VALUES ('110', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '3.11,3.24 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '850', '1', '21', '0', '11', '5', null);
INSERT INTO `b_inspect_data` VALUES ('111', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '3.18,3.32 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '850', '1', '21', '0', '11', '15', null);
INSERT INTO `b_inspect_data` VALUES ('112', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '3.22,3.37 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '850', '1', '21', '0', '11', '30', null);
INSERT INTO `b_inspect_data` VALUES ('113', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '3.25,3.41 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '850', '1', '21', '0', '11', '45', null);
INSERT INTO `b_inspect_data` VALUES ('114', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '3.28,3.44 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '850', '1', '21', '0', '11', '60', null);
INSERT INTO `b_inspect_data` VALUES ('115', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '3.30,3.45 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '850', '1', '21', '0', '11', '90', null);
INSERT INTO `b_inspect_data` VALUES ('116', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '3.31,3.47 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '850', '1', '21', '0', '11', '120', null);

-- ----------------------------
-- Table structure for `b_inspect_item`
-- ----------------------------
DROP TABLE IF EXISTS `b_inspect_item`;
CREATE TABLE `b_inspect_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '检测项目名称',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_inspect_item
-- ----------------------------
INSERT INTO `b_inspect_item` VALUES ('3', '检测项目1', '0', '11');
INSERT INTO `b_inspect_item` VALUES ('4', '检测项目2', '0', '11');
INSERT INTO `b_inspect_item` VALUES ('5', '检测项目3', '0', '11');
INSERT INTO `b_inspect_item` VALUES ('6', '123', '0', '11');
INSERT INTO `b_inspect_item` VALUES ('7', '123', '0', null);
INSERT INTO `b_inspect_item` VALUES ('8', '123', '0', null);
INSERT INTO `b_inspect_item` VALUES ('9', '123', '0', null);
INSERT INTO `b_inspect_item` VALUES ('10', '123', '0', '15');
INSERT INTO `b_inspect_item` VALUES ('11', '123', '0', '19');

-- ----------------------------
-- Table structure for `b_inspect_method`
-- ----------------------------
DROP TABLE IF EXISTS `b_inspect_method`;
CREATE TABLE `b_inspect_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '检测方法名称',
  `inspect_item_id` int(11) DEFAULT NULL COMMENT '检测项目id',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='检测项目';

-- ----------------------------
-- Records of b_inspect_method
-- ----------------------------
INSERT INTO `b_inspect_method` VALUES ('10', '检测项目1-方法1', '3', '0', '11');
INSERT INTO `b_inspect_method` VALUES ('11', '检测项目1-方法2', '3', '0', '11');
INSERT INTO `b_inspect_method` VALUES ('12', '1234', '10', '0', '15');
INSERT INTO `b_inspect_method` VALUES ('13', '123', '11', '0', '19');

-- ----------------------------
-- Table structure for `b_inspect_plan`
-- ----------------------------
DROP TABLE IF EXISTS `b_inspect_plan`;
CREATE TABLE `b_inspect_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `inspect_scheme_id` int(11) DEFAULT NULL COMMENT '流水号(检测方案id)',
  `user_id` int(11) DEFAULT NULL COMMENT '检测负责人id',
  `equipment_id` int(11) DEFAULT NULL COMMENT '检测设备id',
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `major_user_id` int(11) DEFAULT NULL COMMENT '主检人id(需要关联取电话)',
  `assistant_user_id` int(11) DEFAULT NULL COMMENT '副检人id(需要关联取电话)',
  `note` varchar(128) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `stzh` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='检测计划';

-- ----------------------------
-- Records of b_inspect_plan
-- ----------------------------
INSERT INTO `b_inspect_plan` VALUES ('21', '测试计划1', '14', '10', '10', '3', '2016-11-14', '2016-11-30', '12', '12', null, '0', '11', 'SH00001');

-- ----------------------------
-- Table structure for `b_inspect_project`
-- ----------------------------
DROP TABLE IF EXISTS `b_inspect_project`;
CREATE TABLE `b_inspect_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '工程id',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工程登记';

-- ----------------------------
-- Records of b_inspect_project
-- ----------------------------

-- ----------------------------
-- Table structure for `b_inspect_scheme`
-- ----------------------------
DROP TABLE IF EXISTS `b_inspect_scheme`;
CREATE TABLE `b_inspect_scheme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '检测方案名称',
  `inspect_project_id` int(11) NOT NULL COMMENT '工程登记id',
  `basement_lev` tinyint(4) DEFAULT NULL COMMENT '低级基础设计等级(甲级,乙级,丙级)',
  `safety_lev` tinyint(4) DEFAULT NULL COMMENT '建筑安全等级(一级,二级,三级)',
  `pile_count` int(11) DEFAULT NULL COMMENT '总桩数',
  `dept_id` int(11) DEFAULT NULL COMMENT '检测单位',
  `approval_file` int(11) DEFAULT NULL COMMENT '检测方案审批表(attachment_id)',
  `inspect_file_id` int(11) DEFAULT NULL COMMENT '检测方案附件(attachment_id)',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='检测方案';

-- ----------------------------
-- Records of b_inspect_scheme
-- ----------------------------
INSERT INTO `b_inspect_scheme` VALUES ('10', '测试方案1', '14', '1', '1', '5', '1', null, null, '0', null);

-- ----------------------------
-- Table structure for `b_dept`
-- ----------------------------
DROP TABLE IF EXISTS `b_dept`;
CREATE TABLE `b_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL COMMENT '机构编号',
  `name` varchar(128) DEFAULT NULL COMMENT '机构名称',
  `economy_typ` tinyint(4) DEFAULT NULL COMMENT '经济性质',
  `certificate_code` varchar(128) DEFAULT NULL COMMENT '资质证书编号',
  `certificate_img` varchar(128) DEFAULT NULL COMMENT '资质证书图片id',
  `certificate_date` date DEFAULT NULL COMMENT '发证日期',
  `expired_date` date DEFAULT NULL COMMENT '有效日期',
  `national_lib_certificate_code` varchar(128) DEFAULT NULL COMMENT '国家实验室认可证书号',
  `website` varchar(128) DEFAULT NULL COMMENT '网址',
  `measure_certificate_code` varchar(128) DEFAULT NULL COMMENT '计量认证书号',
  `certificate_dept` varchar(128) DEFAULT NULL COMMENT '发证机关',
  `certificate_attachment` varchar(128) DEFAULT NULL COMMENT '计量认证合格证书及附件',
  `register_money` varchar(128) DEFAULT NULL COMMENT '注册资金(万元)',
  `register_type` tinyint(4) DEFAULT NULL COMMENT '注册类型',
  `investor` varchar(128) DEFAULT NULL COMMENT '投资人',
  `legal_representative_name` varchar(128) DEFAULT NULL COMMENT '法定代表人',
  `legal_representative_duty` varchar(128) DEFAULT NULL COMMENT '职务',
  `legal_representative_title` varchar(128) DEFAULT NULL COMMENT '职称',
  `tech_representative` varchar(128) DEFAULT NULL COMMENT '技术负责人',
  `tech_representative_duty` varchar(128) DEFAULT NULL COMMENT '职务',
  `tech_representative_title` varchar(128) DEFAULT NULL COMMENT '职称',
  `personal_count` varchar(128) DEFAULT NULL COMMENT '在编人员总数',
  `professional_count` varchar(128) DEFAULT NULL COMMENT '专业技术人员数',
  `professional_senior_count` varchar(128) DEFAULT NULL COMMENT '高级职称人数',
  `professional_intermidate_count` varchar(128) DEFAULT NULL COMMENT '中级职称人数',
  `professional_junior_count` varchar(128) DEFAULT NULL COMMENT '初级职称人数',
  `equipment_count` int(11) DEFAULT NULL COMMENT '一起设备总台(套)数',
  `gross_area` float DEFAULT NULL COMMENT '房屋建筑面积(平方米)',
  `office_area` float DEFAULT NULL COMMENT '办公面积(平方米)',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='机构信息';

-- ----------------------------
-- Records of b_dept
-- ----------------------------
INSERT INTO `b_dept` VALUES ('1', 'JC8888', '检测机构1', '1', '13444444444', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '11');
INSERT INTO `b_dept` VALUES ('2', '123', '123', '1', '123', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '11');
INSERT INTO `b_dept` VALUES ('3', '123', '测试机构', '2', '123', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '15');
INSERT INTO `b_dept` VALUES ('4', 't1', 't', '1', 't', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '19');

-- ----------------------------
-- Table structure for `b_project`
-- ----------------------------
DROP TABLE IF EXISTS `b_project`;
CREATE TABLE `b_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL COMMENT '工程编码',
  `name` varchar(128) DEFAULT NULL COMMENT '工程名称',
  `province_id` int(11) DEFAULT NULL COMMENT '所在省份id',
  `city_id` int(11) DEFAULT NULL COMMENT '所在市id',
  `address` varchar(128) DEFAULT NULL COMMENT '具体地址',
  `lat` float DEFAULT NULL COMMENT '纬度',
  `lng` float DEFAULT NULL COMMENT '经度',
  `constructor_id` int(11) DEFAULT NULL COMMENT '建设单位id',
  `builder_id` int(11) DEFAULT NULL COMMENT '施工单位id',
  `user_id` int(11) DEFAULT NULL COMMENT '监理单位id',
  `note` varchar(128) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='工程信息';

-- ----------------------------
-- Records of b_project
-- ----------------------------
INSERT INTO `b_project` VALUES ('14', 'PRG0001', '测试工程1', '2', '6', '高阳县', '38.5955', '115.752', '2', '1', '3', '测试工程1', '0', '11');

-- ----------------------------
-- Table structure for `b_r_inspect_plan_method`
-- ----------------------------
DROP TABLE IF EXISTS `b_r_inspect_plan_method`;
CREATE TABLE `b_r_inspect_plan_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL COMMENT '检测项目id',
  `method_id` int(11) NOT NULL COMMENT '检测方法id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='检测项目-检测方法关联表';

-- ----------------------------
-- Records of b_r_inspect_plan_method
-- ----------------------------

-- ----------------------------
-- Table structure for `b_r_inspect_scheme_item`
-- ----------------------------
DROP TABLE IF EXISTS `b_r_inspect_scheme_item`;
CREATE TABLE `b_r_inspect_scheme_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inspect_scheme_id` int(11) NOT NULL COMMENT '检测方案id',
  `inspect_item_id` int(11) NOT NULL COMMENT '检测项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='检测方案-检测项目关联表';

-- ----------------------------
-- Records of b_r_inspect_scheme_item
-- ----------------------------
INSERT INTO `b_r_inspect_scheme_item` VALUES ('4', '5', '4');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('5', '6', '3');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('6', '7', '3');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('7', '8', '11');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('8', '9', '3');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('9', '10', '3');

-- ----------------------------
-- Table structure for `test_user`
-- ----------------------------
DROP TABLE IF EXISTS `test_user`;
CREATE TABLE `test_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test_user_username_uindex` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test_user
-- ----------------------------
INSERT INTO `test_user` VALUES ('1', 'admin', '123', '1');

-- ----------------------------
-- Table structure for `t_business_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_business_config`;
CREATE TABLE `t_business_config` (
  `CONF_ID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '参数标识',
  `CONF_NAME` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '参数名称',
  `CONF_CONTEXT` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '参数内容',
  `CONF_DESC` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '参数说明',
  `UPDATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `ADMIN_NAME` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '操作管理员名称',
  `DATA_VER_FLAG` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '数据版本标识',
  PRIMARY KEY (`CONF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_business_config
-- ----------------------------
INSERT INTO `t_business_config` VALUES ('RATE_ALYPAY', '支付宝渠道费率', '6', '支付宝渠道费率，单位&permil;', '2016-06-01 14:14:25', 'tecom', '1');
INSERT INTO `t_business_config` VALUES ('RATE_BAIDUPAY', '百度支付渠道费率', '3', '百度支付渠道费率，单位&permil;', '2016-06-01 14:15:55', 'tecom', '2');
INSERT INTO `t_business_config` VALUES ('RATE_UNIONPAY', '银联渠道费率', '8', '银联渠道费率，单位&permil;', '2016-06-01 14:17:20', 'tecom', '2');
INSERT INTO `t_business_config` VALUES ('RATE_WEIXIN', '微信支付渠道费率', '3', '微信支付渠道费率，单位&permil;', '2016-06-01 14:16:22', 'zhaoqiaoning', '2');
INSERT INTO `t_business_config` VALUES ('VERIFICATIONCODE_TIMEOUT', '短信验证码超时时间', '5', '单位为分钟(最大为20)', '2016-06-01 14:23:04', 'tecom', '1');

-- ----------------------------
-- Table structure for `t_online`
-- ----------------------------
DROP TABLE IF EXISTS `t_online`;
CREATE TABLE `t_online` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `IP` varchar(20) COLLATE utf8_bin NOT NULL,
  `LOGINDATETIME` datetime NOT NULL,
  `LOGINNAME` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_online
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resource`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '资源ID',
  `ICON` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '资源图标',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '资源名称',
  `REMARK` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `SEQ` smallint(6) DEFAULT NULL COMMENT '资源排序',
  `URL` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '资源URL',
  `PID` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '父功能ID',
  `TRESOURCETYPE_ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '资源类型ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES ('0eeb6e4a-5900-41e1-8026-bd8a3b35df8b', 'wrench', '系统参数管理', '', '4', '/systemConfigController/manager', 'xtgl', '1');
INSERT INTO `t_resource` VALUES ('105f9e02-0c0d-4bd4-92ea-2a35079a8c5a', null, '站点管理删除', '', '3', '/tagController/delete', '200ee674-e4b4-4c6e-be8f-3b61cc147150', '2');
INSERT INTO `t_resource` VALUES ('1127f1c9-df69-4637-9680-f597ef7fa423', null, '巡更计划修改页面', '', '5', '/patrolPlanController/editPage', 'ec2840db-5e25-4743-b699-f50ed3e6c791', '2');
INSERT INTO `t_resource` VALUES ('1e3c419b-204a-4a61-af77-1699da10d737', null, '巡更计划修改', '', '2', '/patrolPlanController/edit', 'ec2840db-5e25-4743-b699-f50ed3e6c791', '2');
INSERT INTO `t_resource` VALUES ('200ee674-e4b4-4c6e-be8f-3b61cc147150', 'folderlink', '巡更站点管理', '', '1', '/tagController/manager', '3c403869-e149-4b1d-b03e-8c509f659644', '1');
INSERT INTO `t_resource` VALUES ('25a6df1d-69a0-4a05-b600-d893ee8898e5', 'folderlink', '巡更人员管理', '', '4', '/patrolPersonController/manager', '3c403869-e149-4b1d-b03e-8c509f659644', '1');
INSERT INTO `t_resource` VALUES ('298313bc-9c8c-4457-a9f7-b270f4d4b2f2', null, '巡更计划添加页面', '', '4', '/patrolPlanController/addPage', 'ec2840db-5e25-4743-b699-f50ed3e6c791', '2');
INSERT INTO `t_resource` VALUES ('37fc2e08-9bba-4fe3-a3dd-3a5cde265dab', 'folderlink', '巡更路线修改', '', '2', '/patrolRouteController/editPage', 'a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7', '2');
INSERT INTO `t_resource` VALUES ('3c403869-e149-4b1d-b03e-8c509f659644', 'folder09', '巡更管理', '', '4', '', null, '1');
INSERT INTO `t_resource` VALUES ('3ec341d3-e4f5-42b6-b3a6-f9b05d314387', 'folderlink', '巡更任务详情', '', '2', '/patrolTaskController/search', '410582bb-7ca2-43b9-ae95-d8cb3c833405', '2');
INSERT INTO `t_resource` VALUES ('40d98aa9-6621-4aa3-8c3d-daa991c95285', null, '人员管理修改', '', '2', '/patrolPersonController/edit', '25a6df1d-69a0-4a05-b600-d893ee8898e5', '2');
INSERT INTO `t_resource` VALUES ('410582bb-7ca2-43b9-ae95-d8cb3c833405', 'folderlink', '巡更任务管理', '', '4', '/patrolTaskController/manager', '3c403869-e149-4b1d-b03e-8c509f659644', '1');
INSERT INTO `t_resource` VALUES ('6bd6b64d-f394-49d3-9793-fa5ac41d0658', 'folderlink', '系统操作日志', '', '1', '/userlogController/manager', '833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3', '1');
INSERT INTO `t_resource` VALUES ('6c6f6e82-ae0d-4481-8dcb-c9dd0bc1bc61', null, '巡更计划删除', '', '3', '/patrolPlanController/delete', 'ec2840db-5e25-4743-b699-f50ed3e6c791', '2');
INSERT INTO `t_resource` VALUES ('6dfa0a5a-14a2-4f81-8858-8e1bd4030417', null, '站点管理添加', '', '1', '/tagController/add', '200ee674-e4b4-4c6e-be8f-3b61cc147150', '2');
INSERT INTO `t_resource` VALUES ('6dfa66d1-3ed8-4dd4-825e-e21f7eae3a4c', null, '站点管理添加', '', '4', '/tagController/addPage', '200ee674-e4b4-4c6e-be8f-3b61cc147150', '2');
INSERT INTO `t_resource` VALUES ('704ba7bc-3717-436f-bba0-24ae1e901e58', null, '人员管理添加', '', '1', '/patrolPersonController/add', '25a6df1d-69a0-4a05-b600-d893ee8898e5', '2');
INSERT INTO `t_resource` VALUES ('71c58564-ac29-4681-a55c-4dd61349f2fe', 'wrench', '系统参数修改', '', '2', '/systemConfigController/editPage', '0eeb6e4a-5900-41e1-8026-bd8a3b35df8b', '2');
INSERT INTO `t_resource` VALUES ('7d82e9ea-2711-4fe9-ac64-f142d8d9b81a', null, '人员管理删除', '', '3', '/patrolPersonController/delete', '25a6df1d-69a0-4a05-b600-d893ee8898e5', '2');
INSERT INTO `t_resource` VALUES ('8097abd8-e20b-47d9-b3a7-d4a5cd73caef', null, '站点管理修改', '', '5', '/tagController/editPage', '200ee674-e4b4-4c6e-be8f-3b61cc147150', '2');
INSERT INTO `t_resource` VALUES ('833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3', 'folder09', '日志管理', '', '3', '', null, '1');
INSERT INTO `t_resource` VALUES ('87bd5cf0-3071-46e9-8b9f-be80e9db1f11', 'wrench', '重置用户密码', '', '4', '/userController/resetPwd', 'yhgl', '2');
INSERT INTO `t_resource` VALUES ('89699dcf-7a15-4c11-8799-a4e1e39f1cca', 'folderlink', '巡更任务删除', '', '2', '/patrolTaskController/delete', '410582bb-7ca2-43b9-ae95-d8cb3c833405', '2');
INSERT INTO `t_resource` VALUES ('8ecd66a3-e5a1-4dd3-baa7-f017fc50dc60', 'wrench', '系统参数添加', '', '1', '/systemConfigController/addPage', '0eeb6e4a-5900-41e1-8026-bd8a3b35df8b', '2');
INSERT INTO `t_resource` VALUES ('a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7', 'folderlink', '巡更路线管理', '', '2', '/patrolRouteController/manager', '3c403869-e149-4b1d-b03e-8c509f659644', '1');
INSERT INTO `t_resource` VALUES ('ad457a51-7a25-4288-b37d-686cc8e32a8d', 'folderlink', '巡更路线添加', '', '1', '/patrolRouteController/addPage', 'a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7', '2');
INSERT INTO `t_resource` VALUES ('af341173-02a8-44d8-8a38-95a492fb7f90', null, '站点管理修改', '', '2', '/tagController/edit', '200ee674-e4b4-4c6e-be8f-3b61cc147150', '2');
INSERT INTO `t_resource` VALUES ('bff4bb97-2d90-4104-a463-06be60d2174b', null, '人员管理修改', '', '5', '/patrolPersonController/editPage', '25a6df1d-69a0-4a05-b600-d893ee8898e5', '2');
INSERT INTO `t_resource` VALUES ('c6229b60-bcdd-4302-84c2-8c49614ee00b', 'folderlink', '查看系统操作日志详情', '', '1', '/userlogController/search', '6bd6b64d-f394-49d3-9793-fa5ac41d0658', '2');
INSERT INTO `t_resource` VALUES ('c86bf4a0-1767-4da6-a0fc-07242c180b67', 'wrench', '系统参数删除', '', '3', '/systemConfigController/delete', '0eeb6e4a-5900-41e1-8026-bd8a3b35df8b', '2');
INSERT INTO `t_resource` VALUES ('e2f124a1-7256-4fc2-a4ef-a6f8da21d813', null, '人员管理添加', '', '4', '/patrolPersonController/addPage', '25a6df1d-69a0-4a05-b600-d893ee8898e5', '2');
INSERT INTO `t_resource` VALUES ('e7465120-7f19-4e0e-bf96-23a5239171a0', 'folderlink', '巡更路线删除', '', '3', '/patrolRouteController/delete', 'a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7', '2');
INSERT INTO `t_resource` VALUES ('e83effde-6a73-4a32-9269-27a63ef1ba73', 'folderlink', '巡更任务修改', '', '1', '/patrolTaskController/editPage', '410582bb-7ca2-43b9-ae95-d8cb3c833405', '2');
INSERT INTO `t_resource` VALUES ('ec2840db-5e25-4743-b699-f50ed3e6c791', 'folderlink', '巡更计划管理', '', '3', '/patrolPlanController/manager', '3c403869-e149-4b1d-b03e-8c509f659644', '1');
INSERT INTO `t_resource` VALUES ('ff4ce28d-c5c1-4322-92a2-7680fe2513c4', null, '巡更计划添加', '', '1', '/patrolPlanController/add', 'ec2840db-5e25-4743-b699-f50ed3e6c791', '2');
INSERT INTO `t_resource` VALUES ('jsgl', 'tux', '角色管理', null, '2', '/roleController/manager', 'xtgl', '1');
INSERT INTO `t_resource` VALUES ('jsglAdd', 'wrench', '添加角色', '', '1', '/roleController/addPage', 'jsgl', '2');
INSERT INTO `t_resource` VALUES ('jsglDelete', 'wrench', '删除角色', '', '3', '/roleController/delete', 'jsgl', '2');
INSERT INTO `t_resource` VALUES ('jsglEdit', 'wrench', '编辑角色', '', '2', '/roleController/editPage', 'jsgl', '2');
INSERT INTO `t_resource` VALUES ('jsglGrant', 'wrench', '角色授权', '', '4', '/roleController/grantPage', 'jsgl', '2');
INSERT INTO `t_resource` VALUES ('sjygl', 'server_database', '数据源管理', null, '5', '/druidController/druid', 'xtgl', '1');
INSERT INTO `t_resource` VALUES ('xtgl', 'plugin', '系统管理', null, '0', null, null, '1');
INSERT INTO `t_resource` VALUES ('yhgl', 'status_online', '用户管理', null, '3', '/userController/manager', 'xtgl', '1');
INSERT INTO `t_resource` VALUES ('yhglAdd', 'wrench', '添加用户', '', '1', '/userController/addPage', 'yhgl', '2');
INSERT INTO `t_resource` VALUES ('yhglDelete', 'wrench', '删除用户', '', '3', '/userController/delete', 'yhgl', '2');
INSERT INTO `t_resource` VALUES ('yhglEdit', 'wrench', '编辑用户', '', '2', '/userController/editPage', 'yhgl', '2');
INSERT INTO `t_resource` VALUES ('zygl', 'database_gear', '资源管理', '管理系统中所有的菜单或功能', '1', '/resourceController/manager', 'xtgl', '1');
INSERT INTO `t_resource` VALUES ('zyglAdd', 'wrench', '添加资源', '', '1', '/resourceController/addPage', 'zygl', '2');
INSERT INTO `t_resource` VALUES ('zyglDelete', 'wrench', '删除资源', '', '3', '/resourceController/delete', 'zygl', '2');
INSERT INTO `t_resource` VALUES ('zyglEdit', 'wrench', '编辑资源', '', '2', '/resourceController/editPage', 'zygl', '2');

-- ----------------------------
-- Table structure for `t_resource_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource_type`;
CREATE TABLE `t_resource_type` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '资源类型名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_resource_type
-- ----------------------------
INSERT INTO `t_resource_type` VALUES ('1', '菜单');
INSERT INTO `t_resource_type` VALUES ('2', '功能');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '角色ID',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `REMARK` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `SEQ` smallint(6) DEFAULT NULL COMMENT '排序',
  `PID` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '自身表关联',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('0', '超管', '超级管理员角色，拥有系统中所有的资源访问权限', '0', null);
INSERT INTO `t_role` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '业务管理', '', null, null);
INSERT INTO `t_role` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '数据源管理', '', null, null);
INSERT INTO `t_role` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '最高权限', '', null, null);
INSERT INTO `t_role` VALUES ('guest', 'Guest', '只拥有只看的权限', '1', null);

-- ----------------------------
-- Table structure for `t_role_tresource`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_tresource`;
CREATE TABLE `t_role_tresource` (
  `TROLE_ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '资源ID',
  `TRESOURCE_ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`TRESOURCE_ID`,`TROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_role_tresource
-- ----------------------------
INSERT INTO `t_role_tresource` VALUES ('0', '0eeb6e4a-5900-41e1-8026-bd8a3b35df8b');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '0eeb6e4a-5900-41e1-8026-bd8a3b35df8b');
INSERT INTO `t_role_tresource` VALUES ('guest', '0eeb6e4a-5900-41e1-8026-bd8a3b35df8b');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '105f9e02-0c0d-4bd4-92ea-2a35079a8c5a');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '105f9e02-0c0d-4bd4-92ea-2a35079a8c5a');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '105f9e02-0c0d-4bd4-92ea-2a35079a8c5a');
INSERT INTO `t_role_tresource` VALUES ('guest', '105f9e02-0c0d-4bd4-92ea-2a35079a8c5a');
INSERT INTO `t_role_tresource` VALUES ('0', '1127f1c9-df69-4637-9680-f597ef7fa423');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '1127f1c9-df69-4637-9680-f597ef7fa423');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '1127f1c9-df69-4637-9680-f597ef7fa423');
INSERT INTO `t_role_tresource` VALUES ('guest', '1127f1c9-df69-4637-9680-f597ef7fa423');
INSERT INTO `t_role_tresource` VALUES ('0', '1e3c419b-204a-4a61-af77-1699da10d737');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '1e3c419b-204a-4a61-af77-1699da10d737');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '1e3c419b-204a-4a61-af77-1699da10d737');
INSERT INTO `t_role_tresource` VALUES ('guest', '1e3c419b-204a-4a61-af77-1699da10d737');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '200ee674-e4b4-4c6e-be8f-3b61cc147150');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '200ee674-e4b4-4c6e-be8f-3b61cc147150');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '200ee674-e4b4-4c6e-be8f-3b61cc147150');
INSERT INTO `t_role_tresource` VALUES ('guest', '200ee674-e4b4-4c6e-be8f-3b61cc147150');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '25a6df1d-69a0-4a05-b600-d893ee8898e5');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '25a6df1d-69a0-4a05-b600-d893ee8898e5');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '25a6df1d-69a0-4a05-b600-d893ee8898e5');
INSERT INTO `t_role_tresource` VALUES ('guest', '25a6df1d-69a0-4a05-b600-d893ee8898e5');
INSERT INTO `t_role_tresource` VALUES ('0', '298313bc-9c8c-4457-a9f7-b270f4d4b2f2');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '298313bc-9c8c-4457-a9f7-b270f4d4b2f2');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '298313bc-9c8c-4457-a9f7-b270f4d4b2f2');
INSERT INTO `t_role_tresource` VALUES ('guest', '298313bc-9c8c-4457-a9f7-b270f4d4b2f2');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '37fc2e08-9bba-4fe3-a3dd-3a5cde265dab');
INSERT INTO `t_role_tresource` VALUES ('guest', '37fc2e08-9bba-4fe3-a3dd-3a5cde265dab');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '3c403869-e149-4b1d-b03e-8c509f659644');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '3c403869-e149-4b1d-b03e-8c509f659644');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '3c403869-e149-4b1d-b03e-8c509f659644');
INSERT INTO `t_role_tresource` VALUES ('guest', '3c403869-e149-4b1d-b03e-8c509f659644');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '3ec341d3-e4f5-42b6-b3a6-f9b05d314387');
INSERT INTO `t_role_tresource` VALUES ('guest', '3ec341d3-e4f5-42b6-b3a6-f9b05d314387');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '40d98aa9-6621-4aa3-8c3d-daa991c95285');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '40d98aa9-6621-4aa3-8c3d-daa991c95285');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '40d98aa9-6621-4aa3-8c3d-daa991c95285');
INSERT INTO `t_role_tresource` VALUES ('guest', '40d98aa9-6621-4aa3-8c3d-daa991c95285');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '410582bb-7ca2-43b9-ae95-d8cb3c833405');
INSERT INTO `t_role_tresource` VALUES ('guest', '410582bb-7ca2-43b9-ae95-d8cb3c833405');
INSERT INTO `t_role_tresource` VALUES ('0', '6bd6b64d-f394-49d3-9793-fa5ac41d0658');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '6bd6b64d-f394-49d3-9793-fa5ac41d0658');
INSERT INTO `t_role_tresource` VALUES ('guest', '6bd6b64d-f394-49d3-9793-fa5ac41d0658');
INSERT INTO `t_role_tresource` VALUES ('0', '6c6f6e82-ae0d-4481-8dcb-c9dd0bc1bc61');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '6c6f6e82-ae0d-4481-8dcb-c9dd0bc1bc61');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '6c6f6e82-ae0d-4481-8dcb-c9dd0bc1bc61');
INSERT INTO `t_role_tresource` VALUES ('guest', '6c6f6e82-ae0d-4481-8dcb-c9dd0bc1bc61');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '6dfa0a5a-14a2-4f81-8858-8e1bd4030417');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '6dfa0a5a-14a2-4f81-8858-8e1bd4030417');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '6dfa0a5a-14a2-4f81-8858-8e1bd4030417');
INSERT INTO `t_role_tresource` VALUES ('guest', '6dfa0a5a-14a2-4f81-8858-8e1bd4030417');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '6dfa66d1-3ed8-4dd4-825e-e21f7eae3a4c');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '6dfa66d1-3ed8-4dd4-825e-e21f7eae3a4c');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '6dfa66d1-3ed8-4dd4-825e-e21f7eae3a4c');
INSERT INTO `t_role_tresource` VALUES ('guest', '6dfa66d1-3ed8-4dd4-825e-e21f7eae3a4c');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '704ba7bc-3717-436f-bba0-24ae1e901e58');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '704ba7bc-3717-436f-bba0-24ae1e901e58');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '704ba7bc-3717-436f-bba0-24ae1e901e58');
INSERT INTO `t_role_tresource` VALUES ('guest', '704ba7bc-3717-436f-bba0-24ae1e901e58');
INSERT INTO `t_role_tresource` VALUES ('0', '71c58564-ac29-4681-a55c-4dd61349f2fe');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '71c58564-ac29-4681-a55c-4dd61349f2fe');
INSERT INTO `t_role_tresource` VALUES ('guest', '71c58564-ac29-4681-a55c-4dd61349f2fe');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '7d82e9ea-2711-4fe9-ac64-f142d8d9b81a');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '7d82e9ea-2711-4fe9-ac64-f142d8d9b81a');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '7d82e9ea-2711-4fe9-ac64-f142d8d9b81a');
INSERT INTO `t_role_tresource` VALUES ('guest', '7d82e9ea-2711-4fe9-ac64-f142d8d9b81a');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '8097abd8-e20b-47d9-b3a7-d4a5cd73caef');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '8097abd8-e20b-47d9-b3a7-d4a5cd73caef');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '8097abd8-e20b-47d9-b3a7-d4a5cd73caef');
INSERT INTO `t_role_tresource` VALUES ('guest', '8097abd8-e20b-47d9-b3a7-d4a5cd73caef');
INSERT INTO `t_role_tresource` VALUES ('0', '833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3');
INSERT INTO `t_role_tresource` VALUES ('guest', '833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3');
INSERT INTO `t_role_tresource` VALUES ('0', '87bd5cf0-3071-46e9-8b9f-be80e9db1f11');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '87bd5cf0-3071-46e9-8b9f-be80e9db1f11');
INSERT INTO `t_role_tresource` VALUES ('guest', '87bd5cf0-3071-46e9-8b9f-be80e9db1f11');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '89699dcf-7a15-4c11-8799-a4e1e39f1cca');
INSERT INTO `t_role_tresource` VALUES ('guest', '89699dcf-7a15-4c11-8799-a4e1e39f1cca');
INSERT INTO `t_role_tresource` VALUES ('0', '8ecd66a3-e5a1-4dd3-baa7-f017fc50dc60');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '8ecd66a3-e5a1-4dd3-baa7-f017fc50dc60');
INSERT INTO `t_role_tresource` VALUES ('guest', '8ecd66a3-e5a1-4dd3-baa7-f017fc50dc60');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7');
INSERT INTO `t_role_tresource` VALUES ('guest', 'a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'ad457a51-7a25-4288-b37d-686cc8e32a8d');
INSERT INTO `t_role_tresource` VALUES ('guest', 'ad457a51-7a25-4288-b37d-686cc8e32a8d');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', 'af341173-02a8-44d8-8a38-95a492fb7f90');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', 'af341173-02a8-44d8-8a38-95a492fb7f90');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'af341173-02a8-44d8-8a38-95a492fb7f90');
INSERT INTO `t_role_tresource` VALUES ('guest', 'af341173-02a8-44d8-8a38-95a492fb7f90');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', 'bff4bb97-2d90-4104-a463-06be60d2174b');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', 'bff4bb97-2d90-4104-a463-06be60d2174b');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'bff4bb97-2d90-4104-a463-06be60d2174b');
INSERT INTO `t_role_tresource` VALUES ('guest', 'bff4bb97-2d90-4104-a463-06be60d2174b');
INSERT INTO `t_role_tresource` VALUES ('0', 'c6229b60-bcdd-4302-84c2-8c49614ee00b');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'c6229b60-bcdd-4302-84c2-8c49614ee00b');
INSERT INTO `t_role_tresource` VALUES ('guest', 'c6229b60-bcdd-4302-84c2-8c49614ee00b');
INSERT INTO `t_role_tresource` VALUES ('0', 'c86bf4a0-1767-4da6-a0fc-07242c180b67');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'c86bf4a0-1767-4da6-a0fc-07242c180b67');
INSERT INTO `t_role_tresource` VALUES ('guest', 'c86bf4a0-1767-4da6-a0fc-07242c180b67');
INSERT INTO `t_role_tresource` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', 'e2f124a1-7256-4fc2-a4ef-a6f8da21d813');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', 'e2f124a1-7256-4fc2-a4ef-a6f8da21d813');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'e2f124a1-7256-4fc2-a4ef-a6f8da21d813');
INSERT INTO `t_role_tresource` VALUES ('guest', 'e2f124a1-7256-4fc2-a4ef-a6f8da21d813');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'e7465120-7f19-4e0e-bf96-23a5239171a0');
INSERT INTO `t_role_tresource` VALUES ('guest', 'e7465120-7f19-4e0e-bf96-23a5239171a0');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'e83effde-6a73-4a32-9269-27a63ef1ba73');
INSERT INTO `t_role_tresource` VALUES ('guest', 'e83effde-6a73-4a32-9269-27a63ef1ba73');
INSERT INTO `t_role_tresource` VALUES ('0', 'ec2840db-5e25-4743-b699-f50ed3e6c791');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', 'ec2840db-5e25-4743-b699-f50ed3e6c791');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'ec2840db-5e25-4743-b699-f50ed3e6c791');
INSERT INTO `t_role_tresource` VALUES ('guest', 'ec2840db-5e25-4743-b699-f50ed3e6c791');
INSERT INTO `t_role_tresource` VALUES ('0', 'ff4ce28d-c5c1-4322-92a2-7680fe2513c4');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', 'ff4ce28d-c5c1-4322-92a2-7680fe2513c4');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'ff4ce28d-c5c1-4322-92a2-7680fe2513c4');
INSERT INTO `t_role_tresource` VALUES ('guest', 'ff4ce28d-c5c1-4322-92a2-7680fe2513c4');
INSERT INTO `t_role_tresource` VALUES ('0', 'jsgl');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'jsgl');
INSERT INTO `t_role_tresource` VALUES ('guest', 'jsgl');
INSERT INTO `t_role_tresource` VALUES ('0', 'jsglAdd');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'jsglAdd');
INSERT INTO `t_role_tresource` VALUES ('0', 'jsglDelete');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'jsglDelete');
INSERT INTO `t_role_tresource` VALUES ('0', 'jsglEdit');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'jsglEdit');
INSERT INTO `t_role_tresource` VALUES ('0', 'jsglGrant');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'jsglGrant');
INSERT INTO `t_role_tresource` VALUES ('0', 'sjygl');
INSERT INTO `t_role_tresource` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', 'sjygl');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'sjygl');
INSERT INTO `t_role_tresource` VALUES ('0', 'xtgl');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'xtgl');
INSERT INTO `t_role_tresource` VALUES ('guest', 'xtgl');
INSERT INTO `t_role_tresource` VALUES ('0', 'yhgl');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'yhgl');
INSERT INTO `t_role_tresource` VALUES ('guest', 'yhgl');
INSERT INTO `t_role_tresource` VALUES ('0', 'yhglAdd');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'yhglAdd');
INSERT INTO `t_role_tresource` VALUES ('0', 'yhglDelete');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'yhglDelete');
INSERT INTO `t_role_tresource` VALUES ('0', 'yhglEdit');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'yhglEdit');
INSERT INTO `t_role_tresource` VALUES ('0', 'zygl');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'zygl');
INSERT INTO `t_role_tresource` VALUES ('guest', 'zygl');
INSERT INTO `t_role_tresource` VALUES ('0', 'zyglAdd');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'zyglAdd');
INSERT INTO `t_role_tresource` VALUES ('0', 'zyglDelete');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'zyglDelete');
INSERT INTO `t_role_tresource` VALUES ('0', 'zyglEdit');
INSERT INTO `t_role_tresource` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'zyglEdit');

-- ----------------------------
-- Table structure for `t_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_config`;
CREATE TABLE `t_system_config` (
  `CONF_ID` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '参数标识',
  `CONF_NAME` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '参数名称',
  `CONF_CONTEXT` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '参数内容',
  `CONF_DESC` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '参数说明',
  `UPDATE_TIME` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `ADMIN_NAME` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '操作管理员名称',
  `DATA_VER_FLAG` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '数据版本标识',
  PRIMARY KEY (`CONF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_system_config
-- ----------------------------
INSERT INTO `t_system_config` VALUES ('MAIL_NOTIFICATION', '账户锁定后是否邮件通知', '1', '1:开启   0:关闭', '2016-01-11 13:19:06', 'tecom', '1');
INSERT INTO `t_system_config` VALUES ('OPERATE_TIMEOUT', '用户操作超时时间', '20', '单位为分钟(最大为180)，用户超过规定时间不操作将自动退出', '2016-01-11 13:20:04', 'liyunxia', '2');
INSERT INTO `t_system_config` VALUES ('REMAINING_LOGINS', '账户剩余登录次数', '5', '允许用户每天连续输入密码的错误次数', '2016-01-11 13:21:51', 'tecom', '1');
INSERT INTO `t_system_config` VALUES ('TO_ADDRESS', '账户锁定后邮件接收人邮箱', 'liyx@bjleisen.com', null, '2016-01-11 13:20:54', 'tecom', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '管理员ID',
  `CREATEDATETIME` datetime DEFAULT NULL COMMENT '管理员创建时间',
  `EMAIL` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '管理员邮箱',
  `LOCK_SYMBOL` smallint(6) NOT NULL COMMENT '账号状态',
  `MODIFYDATETIME` datetime DEFAULT NULL COMMENT '管理员最后一次修改时间',
  `NAME` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '登陆用户名',
  `PWD` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '登陆密码',
  `REMAINING_LOGINS` smallint(6) NOT NULL COMMENT '每天的剩余登陆次数',
  `VALIDDATETIME` date DEFAULT NULL COMMENT '管理员账户有效时间',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `role` int(1) DEFAULT NULL COMMENT '超级管理员,公司管理员,普通用户',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_r10pkdejrfxie1lbe7a7rlcwt` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('0', '2015-12-25 11:19:51', 'zhangzq@bjleisen.com', '0', null, 'admin', '5B42403537626463656162:30DE21804EA6806A325E4A708172D50C51DEE323FA9987DFE8B0DBD4C3E17BE8', '5', null, '11', '0');
INSERT INTO `t_user` VALUES ('12f8f68c-73ae-4de6-bc65-1d6baf6c4a33', '2016-10-30 15:04:17', 'test', '0', null, 'test', '5B424066366630363862:CAE6A1F159D7AB9B8FA65E544D426D20A5D9CF2C0F6C39B7BE7177BEBB197A84', '5', null, '19', '1');
INSERT INTO `t_user` VALUES ('2a28cff4-7ec2-4a95-83d7-92f9ebba04ee', '2016-11-10 01:05:06', '123', '0', null, '123', '5B424065653331616532:BAD7E63A1DF2339E92A320FF1ABFFA85ED658EEDB3ABCE1FAB1B3CD2784C0D02', '5', null, '19', '2');

-- ----------------------------
-- Table structure for `t_user_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_log`;
CREATE TABLE `t_user_log` (
  `USER_LOG_ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '日志ID',
  `FORM_CONTENT` longtext COLLATE utf8_bin COMMENT '操作表单内容',
  `ADMIN_NAME` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '登陆用户名',
  `TEXT` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '资源名称',
  `CREATE_TIME` datetime NOT NULL COMMENT '操作时间',
  `URL` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '资源URL',
  `USER_IP` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '用户IP信息',
  PRIMARY KEY (`USER_LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_log
-- ----------------------------
INSERT INTO `t_user_log` VALUES ('10cb91f0-6b59-4cf3-8b6b-d335e316ad14', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-27 09:20:04', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('10ee46de-c91f-4059-a02e-ed1596626e6c', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 17:50:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('15a4f985-41d5-468a-9330-0f312866487a', null, 'admin', '用户正常退出', '2016-11-26 16:58:02', '/userController/logout', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('21aa4175-ff58-44b5-a349-29d771bbe282', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 20:30:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('25660248-cc90-40d4-a73d-b870b2823bb8', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 16:40:40', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('26df1215-8bf4-4bb2-8a6b-3e3d82e68591', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 17:50:26', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('2a043d32-7765-40d8-aa6c-b67c6e451191', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:10:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('2e7ed7cb-5f6c-4865-8d40-174ca8683eee', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:10:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('31af32f8-4c3d-46c5-a4a9-23106d77bfbd', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:40:19', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('364b6b30-591d-4b99-8b13-a9ec05970a40', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 16:20:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3b137d63-5606-4bdf-998b-b04800bd7eef', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 19:50:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3f6c649d-c03f-4268-8c1a-471b2eec5a6a', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:30:57', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3fc095f9-6401-4d08-aabd-f7ead0efcc87', null, 'admin', '用户登录', '2016-11-26 19:00:21', '/userController/login', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('41d73a6f-d968-42a1-a146-0f00b42da228', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 20:10:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('528b0397-568e-4994-b630-5761ecc836a2', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:50:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('555c9513-6a36-4b16-a3bf-6b8f5df3c7fe', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:00:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('5599b2cd-367a-454f-8ff0-eec4e011e23f', null, 'admin', '用户登录', '2016-11-26 17:32:29', '/userController/login', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('586d7bb1-aedf-4efc-89de-3fabff85df30', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 20:00:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('58a2fa1d-d210-4751-84de-be2b9301cfef', null, 'admin', '用户登录', '2016-11-26 17:42:01', '/userController/login', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('676fc1c9-d08a-407a-bf78-34e4f4b983a8', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 17:50:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('82099c4d-96e3-4587-b796-9eb688bc3a29', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 17:20:17', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('8270c104-12e1-4c26-8ca9-0c33fe05d902', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 19:50:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('86655697-b882-4818-bc45-7c7a26c4e26b', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 19:20:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('8a571c4c-0461-4f4c-be6b-b2362ca9a559', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 16:20:40', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('93490637-f2ee-4e80-99d0-e2e19ebf018c', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:20:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('97b8d6a7-5318-4af9-8275-97a5500fabb6', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-27 09:20:35', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('9972e241-3345-442f-805b-8c9af0c1fae6', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 19:20:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('9bb91d89-3546-488f-8d04-d7ad67a22a12', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 16:40:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('9d1c7f16-524c-41ec-b513-a917a1414836', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:20:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('9de45e86-cbeb-4994-a571-5447a58ee5e5', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 20:20:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('9e8e6a9b-d9fa-47da-b854-b4407be9b00b', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 19:40:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('a219f0ff-703f-4390-a981-cfb462db4bb8', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 20:00:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('a2b2c9e2-3e5b-4c6f-adca-f063f2048648', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:50:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('a9b661c5-0739-4588-93d3-5518d192bf86', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 16:50:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('b0db6270-cd3d-4569-a6f7-138475562c80', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 16:30:40', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('b7d96704-e0ef-4029-b0b1-4a979d1d63e1', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 16:50:27', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('b952c111-340c-4637-b6b3-722756cdb9b2', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 19:30:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('c27042f4-ef97-4ae1-afd8-27a02c843eca', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:40:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('c2d8aff8-04c4-4766-aa71-35b9f587a173', null, 'admin', '用户登录', '2016-11-27 09:17:41', '/userController/login', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('cc2b973b-1305-43a7-871e-d0c3ee0d1b5e', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:30:06', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('cd113edc-bd0c-4371-9808-8f109fbeace7', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 19:30:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('cd21046e-3fe0-40b3-8554-b633feaa1ac7', null, 'admin', '用户登录', '2016-11-26 16:43:40', '/userController/login', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d04d71be-c5f5-481d-854e-889a5c66c543', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 19:10:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('d29f7249-667b-4298-93f4-f4c3c8c47352', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 19:00:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('db1f40bf-cc45-4340-a6a4-77d64ef1ad44', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 20:10:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('e4a4f0b7-f7fb-4b5e-a339-bd6febd2c0ac', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 20:20:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('e7553081-2239-4a00-96a6-27e1ce2e94ef', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 19:40:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('f1cfbfb1-a9a9-4b21-90a4-e5dac66fd8c1', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 16:30:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('f7737b21-e50f-431c-a996-5ccb11759200', null, 'admin', '用户正常退出', '2016-11-26 18:59:40', '/userController/logout', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f9c5b9fa-8472-4d20-895f-2b2b52a2ffbf', null, 'admin', '用户登录', '2016-11-26 17:12:16', '/userController/login', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('fbdd0423-cfb7-443d-9850-463f3780013a', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 17:40:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('fc95fe43-e39f-45cc-a648-292a4b180cdc', null, 'admin', '用户登录', '2016-11-26 17:23:09', '/userController/login', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('fcfcda0e-b51a-452f-a0a9-16662d24971f', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 19:10:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('fff2af67-a14f-475f-b134-de48d37b1faf', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-26 18:00:00', 'Not a normal exit', null);

-- ----------------------------
-- Table structure for `t_user_trole`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_trole`;
CREATE TABLE `t_user_trole` (
  `TROLE_ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '角色ID',
  `TUSER_ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '管理员ID',
  PRIMARY KEY (`TROLE_ID`,`TUSER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_trole
-- ----------------------------
INSERT INTO `t_user_trole` VALUES ('0', '0');
INSERT INTO `t_user_trole` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '5b072f38-6f61-40d2-93bc-27ae64cecb07');
INSERT INTO `t_user_trole` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '5b4c01ff-7be0-4eff-84b1-b7ddfdcf45fe');
INSERT INTO `t_user_trole` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', '676a82b0-aeb7-4570-a7b9-cfbdbca130d8');
INSERT INTO `t_user_trole` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', 'af23f125-9d12-4aec-9d96-ea518d19bf86');
INSERT INTO `t_user_trole` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', 'ca5a9f16-b040-4c7f-b76b-85886bf7ef01');
INSERT INTO `t_user_trole` VALUES ('38bfae60-e840-4471-b2d8-b1f9a1801899', 'e2bb3f51-1b3c-4797-9d4c-f5118fedf805');
INSERT INTO `t_user_trole` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '0');
INSERT INTO `t_user_trole` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '5b072f38-6f61-40d2-93bc-27ae64cecb07');
INSERT INTO `t_user_trole` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '5b4c01ff-7be0-4eff-84b1-b7ddfdcf45fe');
INSERT INTO `t_user_trole` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', '676a82b0-aeb7-4570-a7b9-cfbdbca130d8');
INSERT INTO `t_user_trole` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', 'af23f125-9d12-4aec-9d96-ea518d19bf86');
INSERT INTO `t_user_trole` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', 'ca5a9f16-b040-4c7f-b76b-85886bf7ef01');
INSERT INTO `t_user_trole` VALUES ('61de65bf-ced1-4cb9-be0e-27962a8e2a73', 'e2bb3f51-1b3c-4797-9d4c-f5118fedf805');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '0');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '451f140b-d1b2-4607-b6c2-31ede8e48daa');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '5b072f38-6f61-40d2-93bc-27ae64cecb07');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '5b4c01ff-7be0-4eff-84b1-b7ddfdcf45fe');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '676a82b0-aeb7-4570-a7b9-cfbdbca130d8');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', '8d619a6e-ba32-4e29-8759-0d361a9d2ecc');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'a51139b5-bf94-4576-a0d3-bf60f297433d');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'af23f125-9d12-4aec-9d96-ea518d19bf86');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'ca232b3b-7d5a-4859-884f-32e16beeb4e3');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'ca5a9f16-b040-4c7f-b76b-85886bf7ef01');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'e2bb3f51-1b3c-4797-9d4c-f5118fedf805');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'f6dd51df-b9c8-49a3-95ff-be3304ec829e');
INSERT INTO `t_user_trole` VALUES ('734d68bf-3a81-47cb-927a-1d6a31f97b5d', 'fd6bd97a-2eb9-4d2a-95a4-d81cf8a2607e');
INSERT INTO `t_user_trole` VALUES ('guest', '0');
INSERT INTO `t_user_trole` VALUES ('guest', '5b072f38-6f61-40d2-93bc-27ae64cecb07');
INSERT INTO `t_user_trole` VALUES ('guest', '5b4c01ff-7be0-4eff-84b1-b7ddfdcf45fe');
INSERT INTO `t_user_trole` VALUES ('guest', '676a82b0-aeb7-4570-a7b9-cfbdbca130d8');
INSERT INTO `t_user_trole` VALUES ('guest', 'af23f125-9d12-4aec-9d96-ea518d19bf86');
INSERT INTO `t_user_trole` VALUES ('guest', 'ca5a9f16-b040-4c7f-b76b-85886bf7ef01');
INSERT INTO `t_user_trole` VALUES ('guest', 'e2bb3f51-1b3c-4797-9d4c-f5118fedf805');
INSERT INTO `t_user_trole` VALUES ('guest', 'f6dd51df-b9c8-49a3-95ff-be3304ec829e');
INSERT INTO `t_user_trole` VALUES ('guest', 'guest');

-- ----------------------------
-- View structure for `b_overview`
-- ----------------------------
DROP VIEW IF EXISTS `b_overview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_overview` AS select `template`.`b_area`.`id` AS `id`,`template`.`b_area`.`name` AS `name`,`template`.`b_area`.`level` AS `level`,`template`.`b_area`.`pid` AS `pid`,`template`.`b_area`.`note` AS `note`,`template`.`b_area`.`dept_id` AS `dept_id`,`template`.`b_area`.`deleted` AS `deleted`,`project_count`.`count` AS `count` from (`template`.`b_area` left join (select 0 AS `area_id`,count(0) AS `count` from `template`.`b_project` union all select `template`.`b_project`.`province_id` AS `area_id`,count(0) AS `count(*)` from `template`.`b_project` group by `template`.`b_project`.`province_id` union all select `template`.`b_project`.`city_id` AS `city_id`,count(0) AS `count(*)` from `template`.`b_project` group by `template`.`b_project`.`city_id`) `project_count` on((`template`.`b_area`.`id` = `project_count`.`area_id`))) ;
DROP TRIGGER IF EXISTS `init_area`;
DELIMITER ;;
CREATE TRIGGER `init_area` AFTER INSERT ON `b_dept` FOR EACH ROW begin
  insert into b_area(name,level,deleted,dept_id) values('全国',0,0,NEW.id);
end
;;
DELIMITER ;
