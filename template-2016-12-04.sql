/*
Navicat MySQL Data Transfer

Source Server         : template
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : template

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2016-12-04 21:49:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `b_about`
-- ----------------------------
DROP TABLE IF EXISTS `b_about`;
CREATE TABLE `b_about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_about
-- ----------------------------
INSERT INTO `b_about` VALUES ('1', '# 智能无线静荷载试验检测云平台\n******\n平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明平台测试说明\n    \n    ');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='行政区划';

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_company
-- ----------------------------
INSERT INTO `b_company` VALUES ('1', '施工单位1', null, '张三', '18808888888', null, '2', '0', '11');
INSERT INTO `b_company` VALUES ('2', '建设单位1', null, '李四', '137777777777', null, '1', '0', '11');
INSERT INTO `b_company` VALUES ('3', '监理单位', null, '王五', '13999999999', null, '3', '0', '11');
INSERT INTO `b_company` VALUES ('4', '123', null, '123', '123', null, '1', '0', '15');
INSERT INTO `b_company` VALUES ('5', 'c1', null, 'c1', '112', null, '1', '0', '19');
INSERT INTO `b_company` VALUES ('6', '测试单位1', null, '测试单位1', '123456', null, '1', '0', '11');

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
  `certificate_institution` varchar(128) DEFAULT NULL COMMENT '发证机关',
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
  `logo` varchar(128) DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='机构信息';

-- ----------------------------
-- Records of b_dept
-- ----------------------------
INSERT INTO `b_dept` VALUES ('2', '123', '123', '1', '123', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '0');
INSERT INTO `b_dept` VALUES ('11', 'JC8888', '检测机构1', '1', '13444444444', null, null, null, null, null, null, null, null, null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '123', '0');


-- ----------------------------
-- Table structure for `b_equipment`
-- ----------------------------
DROP TABLE IF EXISTS `b_equipment`;
CREATE TABLE `b_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL COMMENT '设备编号',
  `name` varchar(128) DEFAULT NULL COMMENT '设备名称',
  `expired_date` datetime DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL COMMENT '备注',
  `institution_id` int(11) DEFAULT NULL COMMENT '所属机构id',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='设备信息';

-- ----------------------------
-- Records of b_equipment
-- ----------------------------
INSERT INTO `b_equipment` VALUES ('3', 'EQP030303', 'XXX检测设备', '2016-12-01 00:00:00', '423423', '1', '0', '11');

-- ----------------------------
-- Table structure for `b_file`
-- ----------------------------
DROP TABLE IF EXISTS `b_file`;
CREATE TABLE `b_file` (
  `uuid` varchar(64) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `b_file_uuid_uindex` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
INSERT INTO `b_inspect_data` VALUES ('116', 'PRG0001', 'SH00001', 'EQP030303', '1.00,2.00', '1.00,2.00', '3.31,3.47 ', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-30', '1.00,2.00', '1.00,2.00', '1', '850', '1', '21', '0', '11', '120', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_inspect_item
-- ----------------------------
INSERT INTO `b_inspect_item` VALUES ('3', '检测项目1', '0', '11');
INSERT INTO `b_inspect_item` VALUES ('4', '检测项目2', '0', '11');
INSERT INTO `b_inspect_item` VALUES ('5', '检测项目3', '0', '11');


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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='检测项目';

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
  `inspector_id` int(11) DEFAULT NULL COMMENT '检测负责人id',
  `equipment_id` int(11) DEFAULT NULL COMMENT '检测设备id',
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `major_inspector_id` int(11) DEFAULT NULL COMMENT '主检人id(需要关联取电话)',
  `assistant_inspector_id` int(11) DEFAULT NULL COMMENT '副检人id(需要关联取电话)',
  `note` varchar(128) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `stzh` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='检测计划';

-- ----------------------------
-- Records of b_inspect_plan
-- ----------------------------
INSERT INTO `b_inspect_plan` VALUES ('21', '测试计划1', '14', '10', '1', '3', '2016-11-14', '2016-11-30', '1', '1', null, '0', '11', 'SH00001');

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
  `institution_id` int(11) DEFAULT NULL COMMENT '检测单位',
  `approval_file_id` varchar(64) DEFAULT NULL COMMENT '检测方案审批表(attachment_id)',
  `inspect_file_id` varchar(64) DEFAULT NULL COMMENT '检测方案附件(attachment_id)',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='检测方案';

-- ----------------------------
-- Records of b_inspect_scheme
-- ----------------------------
INSERT INTO `b_inspect_scheme` VALUES ('10', '测试方案1', '14', '1', '1', '5', '1', null, null, '0', '11');

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
  `inspector_id` int(11) DEFAULT NULL COMMENT '监理单位id',
  `note` varchar(128) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='工程信息';

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='检测方案-检测项目关联表';

-- ----------------------------
-- Records of b_r_inspect_scheme_item
-- ----------------------------
INSERT INTO `b_r_inspect_scheme_item` VALUES ('4', '5', '4');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('5', '6', '3');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('6', '7', '3');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('7', '8', '11');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('8', '9', '3');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('9', '10', '3');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('10', '11', '4');


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
  `ID` int(36) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `CREATEDATETIME` datetime DEFAULT NULL COMMENT '管理员创建时间',
  `EMAIL` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '管理员邮箱',
  `LOCK_SYMBOL` smallint(6) NOT NULL COMMENT '账号状态',
  `MODIFYDATETIME` datetime DEFAULT NULL COMMENT '管理员最后一次修改时间',
  `NAME` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '登陆用户名',
  `PWD` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '登陆密码',
  `real_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '真实姓名',
  `REMAINING_LOGINS` smallint(6) NOT NULL COMMENT '每天的剩余登陆次数',
  `VALIDDATETIME` date DEFAULT NULL COMMENT '管理员账户有效时间',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别(1男0女)',
  `note` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  `role` int(1) DEFAULT NULL COMMENT '超级管理员,公司管理员,普通用户',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_r10pkdejrfxie1lbe7a7rlcwt` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '2015-12-25 11:19:51', 'zhangzq@bjleisen.com', '0', null, 'admin', '5B42403537626463656162:30DE21804EA6806A325E4A708172D50C51DEE323FA9987DFE8B0DBD4C3E17BE8', null, '5', null, null, null, '11', '0');
INSERT INTO `t_user` VALUES ('2', '2016-10-30 15:04:17', 'test', '0', null, 'test', '5B424066366630363862:CAE6A1F159D7AB9B8FA65E544D426D20A5D9CF2C0F6C39B7BE7177BEBB197A84', null, '5', null, null, null, '11', '1');
INSERT INTO `t_user` VALUES ('3', '2016-11-10 01:05:06', '123', '0', null, '123', '5B424065653331616532:BAD7E63A1DF2339E92A320FF1ABFFA85ED658EEDB3ABCE1FAB1B3CD2784C0D02', null, '5', null, null, null, '11', '2');

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
-- Table structure for `t_user_trole`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_trole`;
CREATE TABLE `t_user_trole` (
  `TROLE_ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '角色ID',
  `TUSER_ID` int(32) NOT NULL COMMENT '管理员ID',
  PRIMARY KEY (`TROLE_ID`,`TUSER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user_trole
-- ----------------------------
INSERT INTO `t_user_trole` VALUES ('0', '1');

-- ----------------------------
-- Table structure for `user_plan`
-- ----------------------------
DROP TABLE IF EXISTS `user_plan`;
CREATE TABLE `user_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_plan
-- ----------------------------
INSERT INTO `user_plan` VALUES ('1', '1', '21');

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
