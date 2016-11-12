/*
Navicat MySQL Data Transfer

Source Server         : 123
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : template

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-11-10 01:07:58
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='行政区划';

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='公司信息';

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
  `institution_id` int(11) DEFAULT NULL COMMENT '所属机构id',
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
-- Table structure for `b_inspector`
-- ----------------------------
DROP TABLE IF EXISTS `b_inspector`;
CREATE TABLE `b_inspector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别(1男0女)',
  `note` varchar(128) DEFAULT NULL COMMENT '备注',
  `institution_id` int(11) DEFAULT NULL COMMENT '所属机构id',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='设备信息';

-- ----------------------------
-- Records of b_inspector
-- ----------------------------
INSERT INTO `b_inspector` VALUES ('10', '张亮', '1', '主管', '1', '0', '11');
INSERT INTO `b_inspector` VALUES ('11', '123', '0', '123', null, '0', '11');
INSERT INTO `b_inspector` VALUES ('12', '舒淇', '0', '测试', '1', '0', '11');
INSERT INTO `b_inspector` VALUES ('13', '', '1', '', null, '0', '11');
INSERT INTO `b_inspector` VALUES ('15', '黎明', '1', '监管员', '1', '0', '11');
INSERT INTO `b_inspector` VALUES ('16', '123', '1', '123', '3', '0', '15');
INSERT INTO `b_inspector` VALUES ('17', '123', '1', '123', '4', '0', '19');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='传感器原始数据';

-- ----------------------------
-- Records of b_inspect_data
-- ----------------------------
INSERT INTO `b_inspect_data` VALUES ('32', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('33', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('34', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('35', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('36', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('37', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('38', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('39', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('40', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('41', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('42', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('43', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('44', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('45', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('46', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '15', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('47', 'PRG2', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('48', 'PRG2', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('49', 'PRG2', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16', '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('50', 'PRG3', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', null, '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('51', 'PRG3', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', null, '0', '11', null, null);
INSERT INTO `b_inspect_data` VALUES ('52', 'PRG3', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', null, '0', '11', null, null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='检测计划';

-- ----------------------------
-- Records of b_inspect_plan
-- ----------------------------
INSERT INTO `b_inspect_plan` VALUES ('9', '检测计划', '7', null, null, null, null, null, null, null, '0', '11');
INSERT INTO `b_inspect_plan` VALUES ('10', '检测计划', '6', null, null, null, null, null, null, null, '0', '11');
INSERT INTO `b_inspect_plan` VALUES ('15', 'wrwe', '6', '12', '3', '2016-10-13', '2016-10-04', '10', '12', null, '0', '11');
INSERT INTO `b_inspect_plan` VALUES ('16', 'abc', '6', '12', '3', '2016-10-14', '2016-10-21', '10', '12', null, '0', '11');
INSERT INTO `b_inspect_plan` VALUES ('17', '123', '8', '17', '5', '2016-10-18', '2016-10-19', '17', '17', null, '0', null);

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
  `approval_file_id` int(11) DEFAULT NULL COMMENT '检测方案审批表(attachment_id)',
  `inspect_file_id` int(11) DEFAULT NULL COMMENT '检测方案附件(attachment_id)',
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='检测方案';

-- ----------------------------
-- Records of b_inspect_scheme
-- ----------------------------
INSERT INTO `b_inspect_scheme` VALUES ('5', '检测方案1', '12', '1', '2', '456', '1', null, null, '0', '11');
INSERT INTO `b_inspect_scheme` VALUES ('6', '检测方案2', '11', '1', '1', '123', '1', null, null, '0', '11');
INSERT INTO `b_inspect_scheme` VALUES ('7', '检测方案3', '11', '2', '2', '123', '1', null, null, '0', '11');
INSERT INTO `b_inspect_scheme` VALUES ('8', '123', '13', '1', '1', '123', '4', null, null, '0', null);

-- ----------------------------
-- Table structure for `b_institution`
-- ----------------------------
DROP TABLE IF EXISTS `b_institution`;
CREATE TABLE `b_institution` (
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
  `deleted` tinyint(1) DEFAULT '0' COMMENT '删除标志位',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='机构信息';

-- ----------------------------
-- Records of b_institution
-- ----------------------------
INSERT INTO `b_institution` VALUES ('1', 'JC8888', '检测机构1', '1', '13444444444', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '11');
INSERT INTO `b_institution` VALUES ('2', '123', '123', '1', '123', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '11');
INSERT INTO `b_institution` VALUES ('3', '123', '测试机构', '2', '123', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '15');
INSERT INTO `b_institution` VALUES ('4', 't1', 't', '1', 't', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '19');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='工程信息';

-- ----------------------------
-- Records of b_project
-- ----------------------------
INSERT INTO `b_project` VALUES ('11', 'PRG0001', '测试工程1', '2', '6', '高阳县', '38.6875', '115.768', '2', '1', '2', '测试工程1', '0', '11');
INSERT INTO `b_project` VALUES ('12', 'PRG0002', '测试工程2', '3', '8', 'xx街道', '36.113', '114.528', '2', '3', '1', '无', '0', '11');
INSERT INTO `b_project` VALUES ('13', '123', '123', '39', '40', '123', '26.6073', '106.745', '5', '5', '5', '123', '0', '19');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='检测方案-检测项目关联表';

-- ----------------------------
-- Records of b_r_inspect_scheme_item
-- ----------------------------
INSERT INTO `b_r_inspect_scheme_item` VALUES ('4', '5', '4');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('5', '6', '3');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('6', '7', '3');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('7', '8', '11');

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
INSERT INTO `t_resource` VALUES ('0eeb6e4a-5900-41e1-8026-bd8a3b35df8b', 'wrench', '系统参数管理', '', '4', '/systemConfigController/manager.action', 'xtgl', '1');
INSERT INTO `t_resource` VALUES ('105f9e02-0c0d-4bd4-92ea-2a35079a8c5a', null, '站点管理删除', '', '3', '/tagController/delete.action', '200ee674-e4b4-4c6e-be8f-3b61cc147150', '2');
INSERT INTO `t_resource` VALUES ('1127f1c9-df69-4637-9680-f597ef7fa423', null, '巡更计划修改页面', '', '5', '/patrolPlanController/editPage.action', 'ec2840db-5e25-4743-b699-f50ed3e6c791', '2');
INSERT INTO `t_resource` VALUES ('1e3c419b-204a-4a61-af77-1699da10d737', null, '巡更计划修改', '', '2', '/patrolPlanController/edit.action', 'ec2840db-5e25-4743-b699-f50ed3e6c791', '2');
INSERT INTO `t_resource` VALUES ('200ee674-e4b4-4c6e-be8f-3b61cc147150', 'folderlink', '巡更站点管理', '', '1', '/tagController/manager.action', '3c403869-e149-4b1d-b03e-8c509f659644', '1');
INSERT INTO `t_resource` VALUES ('25a6df1d-69a0-4a05-b600-d893ee8898e5', 'folderlink', '巡更人员管理', '', '4', '/patrolPersonController/manager.action', '3c403869-e149-4b1d-b03e-8c509f659644', '1');
INSERT INTO `t_resource` VALUES ('298313bc-9c8c-4457-a9f7-b270f4d4b2f2', null, '巡更计划添加页面', '', '4', '/patrolPlanController/addPage.action', 'ec2840db-5e25-4743-b699-f50ed3e6c791', '2');
INSERT INTO `t_resource` VALUES ('37fc2e08-9bba-4fe3-a3dd-3a5cde265dab', 'folderlink', '巡更路线修改', '', '2', '/patrolRouteController/editPage.action', 'a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7', '2');
INSERT INTO `t_resource` VALUES ('3c403869-e149-4b1d-b03e-8c509f659644', 'folder09', '巡更管理', '', '4', '', null, '1');
INSERT INTO `t_resource` VALUES ('3ec341d3-e4f5-42b6-b3a6-f9b05d314387', 'folderlink', '巡更任务详情', '', '2', '/patrolTaskController/search.action', '410582bb-7ca2-43b9-ae95-d8cb3c833405', '2');
INSERT INTO `t_resource` VALUES ('40d98aa9-6621-4aa3-8c3d-daa991c95285', null, '人员管理修改', '', '2', '/patrolPersonController/edit.action', '25a6df1d-69a0-4a05-b600-d893ee8898e5', '2');
INSERT INTO `t_resource` VALUES ('410582bb-7ca2-43b9-ae95-d8cb3c833405', 'folderlink', '巡更任务管理', '', '4', '/patrolTaskController/manager.action', '3c403869-e149-4b1d-b03e-8c509f659644', '1');
INSERT INTO `t_resource` VALUES ('6bd6b64d-f394-49d3-9793-fa5ac41d0658', 'folderlink', '系统操作日志', '', '1', '/userlogController/manager.action', '833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3', '1');
INSERT INTO `t_resource` VALUES ('6c6f6e82-ae0d-4481-8dcb-c9dd0bc1bc61', null, '巡更计划删除', '', '3', '/patrolPlanController/delete.action', 'ec2840db-5e25-4743-b699-f50ed3e6c791', '2');
INSERT INTO `t_resource` VALUES ('6dfa0a5a-14a2-4f81-8858-8e1bd4030417', null, '站点管理添加', '', '1', '/tagController/add.action', '200ee674-e4b4-4c6e-be8f-3b61cc147150', '2');
INSERT INTO `t_resource` VALUES ('6dfa66d1-3ed8-4dd4-825e-e21f7eae3a4c', null, '站点管理添加', '', '4', '/tagController/addPage.action', '200ee674-e4b4-4c6e-be8f-3b61cc147150', '2');
INSERT INTO `t_resource` VALUES ('704ba7bc-3717-436f-bba0-24ae1e901e58', null, '人员管理添加', '', '1', '/patrolPersonController/add.action', '25a6df1d-69a0-4a05-b600-d893ee8898e5', '2');
INSERT INTO `t_resource` VALUES ('71c58564-ac29-4681-a55c-4dd61349f2fe', 'wrench', '系统参数修改', '', '2', '/systemConfigController/editPage.action', '0eeb6e4a-5900-41e1-8026-bd8a3b35df8b', '2');
INSERT INTO `t_resource` VALUES ('7d82e9ea-2711-4fe9-ac64-f142d8d9b81a', null, '人员管理删除', '', '3', '/patrolPersonController/delete.action', '25a6df1d-69a0-4a05-b600-d893ee8898e5', '2');
INSERT INTO `t_resource` VALUES ('8097abd8-e20b-47d9-b3a7-d4a5cd73caef', null, '站点管理修改', '', '5', '/tagController/editPage.action', '200ee674-e4b4-4c6e-be8f-3b61cc147150', '2');
INSERT INTO `t_resource` VALUES ('833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3', 'folder09', '日志管理', '', '3', '', null, '1');
INSERT INTO `t_resource` VALUES ('87bd5cf0-3071-46e9-8b9f-be80e9db1f11', 'wrench', '重置用户密码', '', '4', '/userController/resetPwd.action', 'yhgl', '2');
INSERT INTO `t_resource` VALUES ('89699dcf-7a15-4c11-8799-a4e1e39f1cca', 'folderlink', '巡更任务删除', '', '2', '/patrolTaskController/delete.action', '410582bb-7ca2-43b9-ae95-d8cb3c833405', '2');
INSERT INTO `t_resource` VALUES ('8ecd66a3-e5a1-4dd3-baa7-f017fc50dc60', 'wrench', '系统参数添加', '', '1', '/systemConfigController/addPage.action', '0eeb6e4a-5900-41e1-8026-bd8a3b35df8b', '2');
INSERT INTO `t_resource` VALUES ('a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7', 'folderlink', '巡更路线管理', '', '2', '/patrolRouteController/manager.action', '3c403869-e149-4b1d-b03e-8c509f659644', '1');
INSERT INTO `t_resource` VALUES ('ad457a51-7a25-4288-b37d-686cc8e32a8d', 'folderlink', '巡更路线添加', '', '1', '/patrolRouteController/addPage.action', 'a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7', '2');
INSERT INTO `t_resource` VALUES ('af341173-02a8-44d8-8a38-95a492fb7f90', null, '站点管理修改', '', '2', '/tagController/edit.action', '200ee674-e4b4-4c6e-be8f-3b61cc147150', '2');
INSERT INTO `t_resource` VALUES ('bff4bb97-2d90-4104-a463-06be60d2174b', null, '人员管理修改', '', '5', '/patrolPersonController/editPage.action', '25a6df1d-69a0-4a05-b600-d893ee8898e5', '2');
INSERT INTO `t_resource` VALUES ('c6229b60-bcdd-4302-84c2-8c49614ee00b', 'folderlink', '查看系统操作日志详情', '', '1', '/userlogController/search.action', '6bd6b64d-f394-49d3-9793-fa5ac41d0658', '2');
INSERT INTO `t_resource` VALUES ('c86bf4a0-1767-4da6-a0fc-07242c180b67', 'wrench', '系统参数删除', '', '3', '/systemConfigController/delete.action', '0eeb6e4a-5900-41e1-8026-bd8a3b35df8b', '2');
INSERT INTO `t_resource` VALUES ('e2f124a1-7256-4fc2-a4ef-a6f8da21d813', null, '人员管理添加', '', '4', '/patrolPersonController/addPage.action', '25a6df1d-69a0-4a05-b600-d893ee8898e5', '2');
INSERT INTO `t_resource` VALUES ('e7465120-7f19-4e0e-bf96-23a5239171a0', 'folderlink', '巡更路线删除', '', '3', '/patrolRouteController/delete.action', 'a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7', '2');
INSERT INTO `t_resource` VALUES ('e83effde-6a73-4a32-9269-27a63ef1ba73', 'folderlink', '巡更任务修改', '', '1', '/patrolTaskController/editPage.action', '410582bb-7ca2-43b9-ae95-d8cb3c833405', '2');
INSERT INTO `t_resource` VALUES ('ec2840db-5e25-4743-b699-f50ed3e6c791', 'folderlink', '巡更计划管理', '', '3', '/patrolPlanController/manager.action', '3c403869-e149-4b1d-b03e-8c509f659644', '1');
INSERT INTO `t_resource` VALUES ('ff4ce28d-c5c1-4322-92a2-7680fe2513c4', null, '巡更计划添加', '', '1', '/patrolPlanController/add.action', 'ec2840db-5e25-4743-b699-f50ed3e6c791', '2');
INSERT INTO `t_resource` VALUES ('jsgl', 'tux', '角色管理', null, '2', '/roleController/manager.action', 'xtgl', '1');
INSERT INTO `t_resource` VALUES ('jsglAdd', 'wrench', '添加角色', '', '1', '/roleController/addPage.action', 'jsgl', '2');
INSERT INTO `t_resource` VALUES ('jsglDelete', 'wrench', '删除角色', '', '3', '/roleController/delete.action', 'jsgl', '2');
INSERT INTO `t_resource` VALUES ('jsglEdit', 'wrench', '编辑角色', '', '2', '/roleController/editPage.action', 'jsgl', '2');
INSERT INTO `t_resource` VALUES ('jsglGrant', 'wrench', '角色授权', '', '4', '/roleController/grantPage.action', 'jsgl', '2');
INSERT INTO `t_resource` VALUES ('sjygl', 'server_database', '数据源管理', null, '5', '/druidController/druid.action', 'xtgl', '1');
INSERT INTO `t_resource` VALUES ('xtgl', 'plugin', '系统管理', null, '0', null, null, '1');
INSERT INTO `t_resource` VALUES ('yhgl', 'status_online', '用户管理', null, '3', '/userController/manager.action', 'xtgl', '1');
INSERT INTO `t_resource` VALUES ('yhglAdd', 'wrench', '添加用户', '', '1', '/userController/addPage.action', 'yhgl', '2');
INSERT INTO `t_resource` VALUES ('yhglDelete', 'wrench', '删除用户', '', '3', '/userController/delete.action', 'yhgl', '2');
INSERT INTO `t_resource` VALUES ('yhglEdit', 'wrench', '编辑用户', '', '2', '/userController/editPage.action', 'yhgl', '2');
INSERT INTO `t_resource` VALUES ('zygl', 'database_gear', '资源管理', '管理系统中所有的菜单或功能', '1', '/resourceController/manager.action', 'xtgl', '1');
INSERT INTO `t_resource` VALUES ('zyglAdd', 'wrench', '添加资源', '', '1', '/resourceController/addPage.action', 'zygl', '2');
INSERT INTO `t_resource` VALUES ('zyglDelete', 'wrench', '删除资源', '', '3', '/resourceController/delete.action', 'zygl', '2');
INSERT INTO `t_resource` VALUES ('zyglEdit', 'wrench', '编辑资源', '', '2', '/resourceController/editPage.action', 'zygl', '2');

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
INSERT INTO `t_user_log` VALUES ('008342d4-5508-4308-95f6-8cd95f5489c4', null, 'admin', '用户登录', '2016-11-09 22:04:10', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('00dc6d99-4057-48aa-a7e0-971bc5f93735', null, 'admin', '用户登录', '2016-11-08 15:35:58', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('01b24dd3-72cb-4a4b-9b5b-7a8c84ef7f7d', null, '123', '用户登录', '2016-10-24 23:40:35', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('03072bfc-8894-4d4c-b818-131a441084db', null, 'admin', '用户登录', '2016-11-08 14:30:33', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('03bb3e91-01b1-467c-851c-b14d0d82a38c', null, 'admin', '用户登录', '2016-11-09 22:20:32', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('03bf1934-c37d-4201-82e8-a27d21b61637', null, 'admin', '用户登录', '2016-10-25 23:56:01', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('03e38e0a-7cb9-47d4-8a27-d2920ef76425', null, 'admin', '用户正常退出', '2016-10-26 21:03:49', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('03e5192b-ce84-44ba-a4f6-3491ee2d37f8', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-10-31 19:57:57', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('04b4eb7f-cffb-4b2d-985b-5beadf35be18', null, '123', '用户登录', '2016-10-26 21:47:50', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('07b35170-5371-45fa-85cc-17b4ac5fdd10', null, '123', '用户正常退出', '2016-10-24 23:29:03', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('07dbcd51-5485-43ce-a4e3-e1f3fea485e1', null, 'admin', '用户登录', '2016-10-31 20:05:36', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('091b2906-e8c4-42a5-ad0c-8400f6dd23b4', null, 'tecom', '用户登录', '2016-10-24 22:34:11', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('0975228d-8840-4699-aa5f-b1dea7d811bd', null, 'admin', '用户可能是长时间没操作，自动退出', '2016-10-26 22:24:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('0aa7f79f-8752-4101-811a-3190a563a7aa', null, 'admin', '用户登录', '2016-10-30 14:32:21', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('0c60a8c4-d838-4930-9f4b-ff1a6bc56ff2', null, 'admin', '用户登录', '2016-10-31 20:00:04', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('0c8a6d61-202a-480e-b429-50dacc681afb', null, 'test', '用户登录', '2016-11-10 00:16:45', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('0d2c3dde-d476-4ca0-82ce-f72f59f89def', null, 'admin', '用户登录', '2016-11-08 15:33:46', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('0f7002ea-ec33-488c-99c7-bd9c959001b2', null, 'admin', '用户登录', '2016-11-08 15:34:39', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('1159c958-ddd9-4f30-9a6b-057e80ad39e0', null, 'admin', '用户登录', '2016-10-30 15:01:21', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('11c6938d-2fcf-4188-907a-4305074c0e67', null, '123', '用户正常退出', '2016-10-28 15:00:18', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('12bbbd90-9811-4d4d-bc19-b5724e6e84a4', null, 'tecom', '用户登录', '2016-10-17 23:59:10', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('132ce144-d76a-44c1-9181-c02e56549478', null, 'test', '用户登录', '2016-10-31 21:50:59', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('146d8381-9295-4b34-bb6f-472e55992b46', null, 'tecom', '用户正常退出', '2016-10-18 22:48:08', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('165f5566-33de-4298-a35c-0ee50b4de8db', null, 'tecom', '用户登录', '2016-10-24 22:21:33', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('1768bb8b-76de-405c-baf1-c3b86f1564a1', null, 'admin', '用户可能是长时间没操作，自动退出', '2016-10-28 14:10:45', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('17b8a833-ce69-448a-be16-27b16c258962', null, '123', '用户正常退出', '2016-10-25 22:20:50', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('1811ddf1-44c2-4a2b-836d-14447a9f3bba', null, '123', '用户登录', '2016-10-28 13:48:52', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('186d694c-6631-4e06-a7b7-deaf44ede689', null, 'admin', '用户正常退出', '2016-10-31 21:13:41', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('19900d14-b986-4752-b015-49cc2d9a7ad9', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-16 01:47:35', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('1a48df30-1037-40cc-ac6f-9fa5ed73b61a', null, 'tecom', '用户登录', '2016-10-25 22:20:56', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('1ae77a70-f015-41b7-9df2-df534a4403e1', null, 'admin', '用户登录', '2016-11-09 23:24:17', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('1d2c042c-7a2a-48f4-b6e5-a68ca8869cc6', null, 'admin', '用户登录', '2016-10-26 20:56:20', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('203b849a-fa27-487f-b51b-69526c414120', null, 'test', '用户正常退出', '2016-11-10 01:05:13', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('20c32f84-942d-4d15-8acd-c01528aa245b', null, 'admin', '用户正常退出', '2016-11-10 00:16:26', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('211fd6b3-9820-402b-bf81-e26d034246e5', null, 'admin', '用户登录', '2016-10-30 14:42:17', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('2122a157-91ef-48f5-a476-d14eaec65e1e', null, 'admin', '用户登录', '2016-11-08 14:24:05', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('21c8242f-21a7-4640-b71a-a1909253d91c', null, '123', '用户登录', '2016-10-26 22:00:54', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('227eb7e9-8726-4e1c-be3a-6454810156c7', null, 'tecom', '用户正常退出', '2016-10-25 21:41:44', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('23fca95b-0982-4f43-886f-e1f46188f805', null, 'admin', '用户登录', '2016-10-30 15:03:58', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('24134716-c512-4cf7-94a0-52639cf1be03', null, '456', '用户正常退出', '2016-10-24 23:29:47', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('2793ccee-c955-4cb6-b991-1a3aade41db8', null, 'tecom', '用户登录', '2016-10-22 23:40:07', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('28be3d4a-8434-4268-98f9-32b6f95cddeb', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-18 00:03:14', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('2abe1e20-9ce5-422c-94b2-dae8bcf03dd3', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 14:19:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('2c18d929-eb9a-4a76-a32b-7636de1298b8', null, 'tecom', '用户登录', '2016-10-24 20:38:38', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('2cf6f191-7975-48a7-9523-ae1a73ef9aad', null, 'admin', '用户登录', '2016-10-30 14:24:38', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('2d227acf-8c80-44e8-919e-6dfb629e6e68', null, 'abc', '用户登录', '2016-10-28 14:52:22', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('2f32192e-6205-4378-9ff9-81a0ee1406cc', null, 'admin', '用户登录', '2016-11-09 23:32:12', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('30981076-7cff-46c5-9e72-b6efaaa8f655', null, 'admin', '用户登录', '2016-10-31 21:41:03', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('31d043f4-1057-44e6-b26e-174ff3292f66', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-24 21:41:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3314fc49-afbf-4714-a94b-7e67f5dd8140', null, 'tecom', '用户登录', '2016-10-24 20:49:39', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('349b2274-c85b-401e-a7dc-13f3c9a3571f', null, 'tecom', '用户登录', '2016-10-16 01:54:33', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('360ae940-c4e6-4602-a05b-5b5618ad7954', null, 'admin', '用户正常退出', '2016-10-26 21:17:55', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('3633a703-6159-44d0-a703-761969d1de35', null, 'admin', '用户登录', '2016-10-31 18:47:30', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('389520bc-c2e7-4280-85aa-693e0d33755a', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-18 22:02:38', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('395e104a-63dd-4742-9fbb-3496970abdc9', null, 'admin', '用户登录', '2016-10-26 21:03:57', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('3a9e6bac-3bf7-4307-94d8-98431a313bb0', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-16 01:26:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3afe5965-87b8-4d10-a25f-17579c96a1b4', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 14:32:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3d54c04e-9f04-4079-953d-b15f6e533cb2', null, '123', '用户可能是长时间没操作，自动退出', '2016-10-25 23:27:10', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3dcb25d2-2af4-469c-ab89-c928e6727dfb', null, 'tecom', '用户登录', '2016-10-24 22:56:19', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('3defd008-e269-4b45-8b81-20e9b7d43e6d', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-18 19:31:18', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3e03689c-7a69-4401-9e70-091be3598796', null, 'tecom', '用户登录', '2016-10-18 19:11:15', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('3eed9533-595b-4f2b-8a3b-6ef10df966d6', null, 'admin', '用户登录', '2016-11-08 15:44:49', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('424bfb2c-f2e1-4267-b52a-a8987b43ea78', null, '123', '用户可能是长时间没操作，自动退出', '2016-10-25 23:47:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('430e9420-d4b6-46da-beab-0750549a6a71', null, 'admin', '用户正常退出', '2016-10-31 20:30:22', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('45078b66-c7e3-4607-a5e9-38b0c764d8db', null, '123', '用户登录', '2016-10-26 21:58:01', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('450a2764-2f9d-4ef2-b193-7d94d878c687', null, 'admin', '用户登录', '2016-10-25 23:54:57', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('45316f80-3db0-4396-9565-df09af7cc9d3', null, 'test', '用户可能是关闭浏览器等方式非正常退出', '2016-10-31 21:49:55', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('45a85524-9880-4f7c-8404-5e527b3ae7e6', null, 'test', '用户正常退出', '2016-10-31 20:46:18', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('45f41b43-03c8-40e4-bc22-30270478d30b', null, 'admin', '用户登录', '2016-11-09 23:17:10', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('48547fba-8989-46cb-8f65-a7c85af3dfc7', null, 'admin', '用户正常退出', '2016-10-30 14:42:09', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('48857d76-a456-4d97-b9f6-d42945623d77', null, 'admin', '用户正常退出', '2016-11-08 15:35:09', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('489c0599-908a-43d6-9c1c-e2a61a71bfd3', null, 'test', '用户正常退出', '2016-10-30 15:03:53', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('4a4e8dfa-82f8-4031-b41e-9de4ce0353f7', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-16 02:21:10', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('4c6a2de7-9afb-44e7-bb08-2728011fa1f1', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 14:31:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('4ce73680-5cf8-4ab2-bc00-78299f4f4d1b', null, 'admin', '用户可能是长时间没操作，自动退出', '2016-10-31 21:06:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('4d24a146-8814-4919-8700-d19614d8b103', null, 'admin', '用户正常退出', '2016-10-31 19:59:57', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('4f330ffd-50de-4aee-97db-d05aed78fa3e', null, '123', '用户正常退出', '2016-10-26 21:57:59', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('4f8ebe8b-815b-4561-81e7-03447b1765c8', null, 'admin', '用户登录', '2016-10-31 21:33:34', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5089f0ed-8b0c-44b1-964a-af278beea8e4', null, 'admin', '用户登录', '2016-10-31 20:34:26', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('50cf1332-27ef-49d5-b374-10e628a9bca1', null, 'admin', '用户登录', '2016-10-31 19:14:41', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5116a37c-88f1-47dc-9060-2df83935ada6', null, '123', '用户登录', '2016-10-25 21:41:47', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('51798738-3d7c-4b53-9035-faba897ced7e', null, '123', '用户登录', '2016-10-25 22:41:31', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('547aa10b-6dcc-42ce-aaf5-2c70b51b7c05', null, 'tecom', '用户登录', '2016-10-18 20:25:45', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('552351eb-e781-4592-a01d-592c2bf653a9', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 14:39:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('5540a3af-e77e-4d72-9f9c-70bcedf86d64', null, 'admin', '用户正常退出', '2016-10-30 14:43:22', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('55462225-0223-4ae6-bf1a-a4d9ebf6217c', null, 'tecom', '用户登录', '2016-10-24 23:22:38', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5649f6ef-c725-4885-add3-ee695a0fa0e6', null, 'tecom', '用户登录', '2016-10-16 01:27:30', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('568041ff-421b-4dd9-83cc-210b99b2ca60', null, '123', '用户登录', '2016-10-28 15:00:12', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('574f3c08-e30c-4769-a0ba-43d76f5952a8', null, 'tecom', '用户登录', '2016-10-18 21:53:46', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('58739efc-33d1-4b76-b527-3cffc7e11a58', null, '123', '用户正常退出', '2016-11-10 01:05:39', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('58860f45-5e54-4f0a-b262-f0fd36c69698', null, 'admin', '用户登录', '2016-10-30 14:43:33', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5895996a-072c-435e-b226-a65785f1c057', null, 'admin', '用户正常退出', '2016-10-26 21:05:35', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('593e7234-4faa-48b5-9cd8-b15778349296', null, 'admin', '用户正常退出', '2016-10-30 15:02:35', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5981885f-316b-4548-94ea-906adbfc328f', null, 'tecom', '用户登录', '2016-10-24 23:33:46', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('59990308-9e1d-4b08-aebb-6ccd46a0da03', null, 'admin', '用户登录', '2016-10-30 14:22:51', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5aff0948-b8c7-45e2-aabe-0d5de0737473', null, 'admin', '用户可能是长时间没操作，自动退出', '2016-10-31 19:14:10', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('5bcc5ecb-9baf-411e-a3c8-860224a1ee0c', null, 'tecom', '用户登录', '2016-10-16 01:06:25', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5bf11971-2e42-49ea-88c4-bac1b1946b4f', null, 'admin', '用户登录', '2016-11-08 13:01:59', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5c0dbe5f-9b61-47b7-b249-8ed489819141', null, 'admin', '用户正常退出', '2016-10-31 20:05:26', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5dc5248a-3325-438e-9a48-d768134f6ea8', null, 'test', '用户登录', '2016-10-30 15:04:25', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5ed77b30-3dba-418a-b646-80daee912100', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 13:02:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('604065f5-c665-4610-b119-7661f1eacbf7', null, 'admin', '用户登录', '2016-11-08 14:22:51', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6064592e-43c3-4d0f-bc73-1317e511818d', null, '456', '用户登录', '2016-10-24 23:29:08', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('60734082-dfb9-456f-84d1-ae3f1c2ae79b', null, 'test', '用户登录', '2016-10-31 20:35:26', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('614fb33f-c1a9-4065-851d-d388bdd342ae', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-18 21:53:01', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('61e2feb0-fa97-46b3-b118-5c156332438b', null, 'admin', '用户登录', '2016-10-28 13:50:41', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6288a237-a0b5-4c39-a824-84b7d4bd726e', null, 'admin', '用户正常退出', '2016-10-31 20:35:15', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('62fd1118-de59-411e-8ec9-a921f9a6ddd1', null, 'admin', '用户登录', '2016-11-09 22:49:00', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('64c685c6-f92f-437e-b83a-c2d8bbc4f5d8', null, '123', '用户登录', '2016-10-24 23:28:30', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('66d78989-228d-42c0-8fc0-b5e41926950d', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-18 22:43:15', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('674ea4b4-8c82-438b-96c8-aec4e4b42690', null, 'admin', '用户登录', '2016-10-26 22:04:30', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6761df07-820e-4a30-b6c6-ed9651fc97c2', null, '789', '用户登录', '2016-10-24 23:29:52', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('68aa0fe7-de10-422e-8136-93a53f2fa5b8', null, 'admin', '用户登录', '2016-11-08 14:39:44', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('69ce0f9f-8c52-4af0-b557-e16558b0ec67', null, 'admin', '用户正常退出', '2016-10-31 20:04:03', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6b7ddc59-321e-46ee-b096-54105295f030', null, 'tecom', '用户登录', '2016-10-17 23:54:59', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6bffa53a-b271-4769-b3c4-2752aa6aeeeb', null, 'admin', '用户登录', '2016-10-31 19:43:25', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6d3aeb27-3847-46a8-919b-9950b85baaf9', null, 'admin', '用户正常退出', '2016-10-30 15:01:39', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6e7e4dd0-bc58-4926-a464-435fe8d6b5b8', null, '123', '用户正常退出', '2016-10-26 22:04:19', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('704acee1-876b-4f13-92e9-f05c85d11cb8', null, 'abc', '用户正常退出', '2016-10-28 14:53:34', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('714260f9-28a4-4390-b590-36ab24d47a6b', null, 'test', '用户可能是关闭浏览器等方式非正常退出', '2016-10-31 21:51:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('722abbdc-b883-4876-bd39-1a6943deb6ba', null, 'tecom', '用户登录', '2016-10-23 00:02:42', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7403bbc1-acd9-447b-8b10-c46273f174b5', null, 'tecom', '用户登录', '2016-10-23 22:52:57', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7415266e-ed4e-4f48-ae54-8a6d61e9b07b', null, 'tecom', '用户登录', '2016-10-18 21:51:29', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('787a4a64-4146-41f2-98f5-341bfc5edbf3', null, 'tecom', '用户登录', '2016-10-24 23:25:04', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('791ad975-d374-4894-90ed-243cab1e81c4', null, 'admin', '用户登录', '2016-11-08 14:25:46', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7966fae1-dd2a-40ad-940f-7ddac37c5e16', null, 'admin', '用户正常退出', '2016-11-08 15:34:13', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('79a897a7-6086-43bb-ac15-87968f765a05', null, 'admin', '用户正常退出', '2016-10-25 23:55:54', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('79de3adf-66a8-47a0-bc71-820992c1ff07', null, '123', '用户登录', '2016-10-25 22:13:36', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7a3cce0e-1546-4c41-bec1-040d07e1bae8', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 15:36:20', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('7e13da0b-bbca-49c8-934b-2eac004c1a0c', null, '123', '用户登录', '2016-10-25 23:48:13', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7e25c595-2142-478b-9f36-1c5e89ebd8bd', null, 'admin', '用户登录', '2016-10-30 15:19:47', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7e6b489d-a0be-49ca-9019-44750351afb5', null, 'tecom', '用户登录', '2016-10-18 19:53:03', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7f4870ee-0f2f-450e-8391-0384e867bd61', null, '123', '用户登录', '2016-10-26 22:00:36', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7fcd8eea-1ce1-4307-b89f-a6a95e1a2382', null, 'admin', '用户登录', '2016-10-31 18:54:08', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('80f5c351-da77-407b-ab40-eaa3640b32a7', null, 'admin', '用户登录', '2016-11-08 15:48:31', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('815bdfd7-240b-45be-a374-6a91a7dab760', null, 'test', '用户可能是关闭浏览器等方式非正常退出', '2016-10-31 21:47:15', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('8451897c-5853-429a-a56c-977d7f17dd5a', null, 'tecom', '用户登录', '2016-10-18 22:17:46', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('878dbd2b-8cae-4207-9754-2d74b707cac4', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 14:23:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('895376c2-ed47-48bc-9045-8d950cc7d015', null, 'admin', '用户正常退出', '2016-10-30 15:20:10', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8b17262c-502f-46f8-9791-4c7663be8408', null, 'admin', '用户正常退出', '2016-10-30 15:04:21', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8b493c99-0f3e-4bff-bf4e-29e67c66ba64', null, 'admin', '用户正常退出', '2016-10-31 20:34:16', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8b5171f8-a48c-4af2-9573-d248f6af3a00', null, 'admin', '用户登录', '2016-10-31 20:11:58', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8b9ab158-1bd2-431f-87e1-525deccdd524', null, 'admin', '用户登录', '2016-11-10 00:02:25', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8d38b913-9660-417b-a4f3-71fc0c18fee3', null, 'tecom', '用户登录', '2016-10-24 21:44:34', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8d410a34-df35-4c7e-b88b-fdccdc110f39', null, 'admin', '用户登录', '2016-10-31 21:07:31', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8e117fbd-719f-44eb-9c9b-61f7b126fa1b', null, 'tecom', '用户登录', '2016-10-24 20:46:57', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('9031f038-aa43-48bd-be1a-d57c007593c8', null, 'admin', '用户登录', '2016-10-31 20:32:22', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('912b3829-21d9-4c53-bcec-5c7bf23ddd50', null, 'admin', '用户登录', '2016-10-31 20:46:28', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('914f5778-f4f0-4e74-b3ee-ab7684453929', null, 'admin', '用户正常退出', '2016-10-31 19:56:12', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('916bbda1-e584-4e33-88c5-0a59c9a036fd', null, 'admin', '用户登录', '2016-11-09 23:28:33', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('91d69a56-4719-4679-b2a2-f13660c0837b', null, 'admin', '用户正常退出', '2016-10-31 20:09:32', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('961482b7-fcbd-4c3b-9606-be87360f2291', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 15:45:13', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('96b04011-e31b-41f3-8b21-49bcc183ce96', null, 'admin', '用户登录', '2016-10-31 20:04:11', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('96b23dbc-6cbe-4414-abf8-8519ab2f616f', null, '123', '用户正常退出', '2016-10-26 22:00:52', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('96c42394-553a-435d-accd-0609385c5da5', null, '123', '用户正常退出', '2016-10-24 23:42:49', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('981d21fb-f795-49fe-93bc-64dee7bcb9c7', null, 'admin', '用户正常退出', '2016-10-26 21:06:56', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('996a89af-a4e0-40cd-a0c9-21066354e093', null, '123', '用户登录', '2016-10-26 21:06:58', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('9a5c8468-ef1b-4879-8747-3bcc2a93fd30', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-18 23:39:10', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('9b34a127-ec15-4311-96b7-1fa4977c1ab9', null, '123', '用户登录', '2016-10-25 23:27:25', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('9be15770-ae82-46df-82eb-2a0704b6c2ef', null, 'admin', '用户登录', '2016-10-30 15:01:44', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('9c39505f-e463-4123-aa29-e24fab0a7c43', null, 'test', '用户可能是关闭浏览器等方式非正常退出', '2016-10-31 21:44:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('9cae3ee1-a54f-4bcc-96e9-a462c8cd74fb', null, 'tecom', '用户登录', '2016-10-18 22:48:11', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('9cbfa85a-b15b-4570-b0bf-f4a8f724dbfd', null, 'tecom', '用户登录', '2016-10-18 20:31:37', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('9d6669cb-352a-4f32-a073-aa347c05fb2c', null, 'test', '用户登录', '2016-10-30 15:02:39', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('9da3da77-d952-4e45-90c9-639178d8e8cc', null, 'tecom', '用户登录', '2016-10-16 02:01:10', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a0c29c27-3aea-4de1-a1a4-4f6b8ce6723a', null, 'tecom', '用户正常退出', '2016-10-24 23:36:00', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a2c1928d-2339-4779-9762-cbdf4684ee43', null, 'tecom', '用户登录', '2016-10-18 21:43:06', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a4872430-a1c5-49fb-b121-efb0b7eb9f7c', null, '123', '用户正常退出', '2016-10-28 15:00:54', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a5c1f731-eede-4d65-add3-8eed0511c7b5', null, 'tecom', '用户登录', '2016-10-25 21:33:51', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a7894b70-fc6f-44cb-9295-0ff40d1c2257', null, 'test', '用户登录', '2016-10-31 21:49:34', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a9699bd5-c883-4320-9d06-3f8455f8caf5', null, 'admin', '用户正常退出', '2016-10-31 21:41:08', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('ab32849b-7d15-453a-bfa1-2ad826185617', null, 'admin', '用户登录', '2016-10-31 20:32:09', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('abd17b5f-3788-45a3-b26d-211d6b6598b8', null, 'tecom', '用户正常退出', '2016-10-24 23:28:25', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('ad29e7b1-775a-4405-9127-214abb0a53bd', null, '123', '用户正常退出', '2016-10-26 21:59:16', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('ad522746-d83b-4fed-bd69-adfeb7626c65', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-10-30 14:58:55', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('aee3d9ae-d614-4761-8680-9608ff07c55c', null, '123', '用户登录', '2016-10-28 15:00:21', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('af120e12-f39c-4880-af8f-b14c765b4056', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 14:21:45', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('afa3a3c5-7772-40bc-9c01-1b6d8367e785', null, 'admin', '用户正常退出', '2016-11-08 16:09:48', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b09a748a-6dca-4b82-9889-6e1a45867202', null, 'tecom', '用户登录', '2016-10-24 22:44:03', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b09fc287-fc20-4865-9d4f-839cdeed83f4', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-10-31 19:18:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('b2c3528c-3bbb-47ce-bed6-22835740faba', null, '123', '用户正常退出', '2016-10-28 13:50:34', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b3397cdf-69c5-44a9-bb1f-dd6e8122bae5', null, 'tecom', '用户登录', '2016-10-24 22:39:37', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b49803fd-7296-455f-9d54-b959bc670c03', null, 'admin', '用户登录', '2016-10-31 19:58:25', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b49a9c48-a4dc-4d54-8d77-f693d2d116c3', null, 'admin', '用户可能是长时间没操作，自动退出', '2016-10-30 15:40:16', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('b587e7cb-1164-4661-9510-932664567390', null, 'admin', '用户正常退出', '2016-11-08 16:46:35', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b5d53c1d-c5d6-483a-a093-1b39fb60e53f', null, 'test', '用户登录', '2016-10-30 15:02:49', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b60c61d6-7df0-4b26-a827-6e03ab659878', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-16 02:34:40', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('b649e52f-5391-4529-ad52-1ed80ad92e7d', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-18 20:13:06', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('b8761651-0a21-4f0e-aecc-3430337b72ca', null, 'tecom', '用户登录', '2016-10-18 22:03:36', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('ba19a179-f250-4852-9b1f-4ffee9272a14', null, 'admin', '用户正常退出', '2016-10-30 14:32:15', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('bae8a2cc-6a65-4d1a-9ab6-9381020175b5', null, 'tecom', '用户正常退出', '2016-10-24 23:34:23', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('bbef11ef-3845-4015-9142-34b195d70dec', null, 'admin', '用户登录', '2016-11-08 16:02:19', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('bc215779-458d-48fd-962d-7b926354118b', null, '123', '用户正常退出', '2016-10-26 21:05:55', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('bde881ed-3e72-48e1-829a-bc4297809eff', null, 'tecom', '用户正常退出', '2016-10-18 20:31:35', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c1fc4520-5834-464d-8fa2-1296692bdfba', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-24 23:16:20', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('c2ac7164-3e5a-4dc4-8343-a54a1bda3e03', null, '123', '用户正常退出', '2016-10-26 21:09:15', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c2dad05a-48ce-448c-9f7b-f7380ab0a592', null, 'tecom', '用户登录', '2016-10-18 23:38:08', '/userController/login.action', '120.2.144.12');
INSERT INTO `t_user_log` VALUES ('c36d9549-74de-49bc-bbcf-6bc71a23cac7', null, 'test', '用户可能是关闭浏览器等方式非正常退出', '2016-10-31 21:41:53', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('c3bb8587-c4bd-405a-9797-904d1bd696f5', null, 'admin', '用户登录', '2016-11-08 16:47:00', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c3cdc1a6-1946-46dd-b145-3206d8a6f716', null, 'tecom', '用户登录', '2016-10-16 02:28:05', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c3d5a7c7-df05-4b10-9ffa-946cad28f1b2', null, 'test', '用户登录', '2016-10-31 21:46:51', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c54c0996-6f30-43bc-b73a-6c470f279052', null, '123', '用户登录', '2016-10-25 23:07:08', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c56030fc-5a95-41e6-bfd8-6ce8d6d187ea', null, 'admin', '用户登录', '2016-10-26 21:09:20', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c6e099fd-c39b-4eaa-a404-e1e8257720bc', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 15:35:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('c716e38e-7c4c-446e-a1c6-33ef1b01e812', null, 'test', '用户登录', '2016-11-10 01:04:38', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c8157827-a72f-464a-8e90-9caf6cf39d91', null, 'admin', '用户登录', '2016-11-08 14:43:01', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c9911e43-e52b-4612-85ce-ba05a36f4e9b', null, 'admin', '用户正常退出', '2016-10-28 15:00:10', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c99887f2-dafd-41a9-aac4-1d06f16df318', null, 'admin', '用户正常退出', '2016-11-09 23:31:38', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('ca447c68-68e1-44fe-8fdb-128479125c02', null, 'admin', '用户登录', '2016-10-28 14:33:34', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('cb592968-ba89-47d7-9426-2eecf5228fa6', null, 'tecom', '用户登录', '2016-10-18 23:20:15', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('cc967bfe-7b89-4451-ac4a-6cba8100af7b', null, 'tecom', '用户登录', '2016-10-24 23:37:41', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d0663c16-6319-4b59-9c84-75816cc194e6', null, 'test', '用户正常退出', '2016-10-30 15:04:42', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d06bd05e-7211-4994-b05f-7132cd431df5', null, 'test', '用户登录', '2016-10-31 21:44:04', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d0a41a1e-5fcd-4534-bcfc-3e94527942f1', null, 'admin', '用户登录', '2016-11-08 16:41:43', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d10509d9-1194-41aa-8afd-3027c4441bf2', null, 'admin', '用户登录', '2016-10-30 14:29:28', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d134b24d-177b-4747-ace2-f38325c2478e', null, 'admin', '用户登录', '2016-11-09 21:06:38', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d196c40f-ea99-42b8-90a5-9debfa6ca493', null, 'admin', '用户登录', '2016-11-08 14:19:01', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d1f8f8fa-99c1-40e4-a24b-a46a4c987bc9', null, '123', '用户登录', '2016-10-26 21:05:37', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d4043944-37c0-4e1a-b0fb-7f4433528332', null, 'admin', '用户正常退出', '2016-10-31 19:39:08', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d5242eda-d28b-4e8d-ba7b-1d011896ab2f', null, 'admin', '用户登录', '2016-10-26 21:06:02', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d606af05-02df-4552-85d7-3f44d03b795a', null, 'test', '用户登录', '2016-10-31 21:41:28', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d685d008-2f05-4662-94bd-f28584e47fc3', null, 'admin', '用户登录', '2016-10-31 19:56:21', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d7774f7e-e35e-4249-a3d8-ee78a7fa979a', null, 'tecom', '用户登录', '2016-10-18 00:04:32', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d7b1e0ff-49e5-42be-97c2-1b1694d2fa9d', null, 'admin', '用户登录', '2016-10-28 14:53:41', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d7c261af-20d0-4117-b490-a7c21c737332', null, 'test', '用户正常退出', '2016-10-30 15:02:44', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d7c5f953-e4f0-48e1-89e4-453545ec56db', null, '123', '用户登录', '2016-11-10 01:05:22', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d890d399-3e86-476d-814c-52d890b1bc43', null, 'admin', '用户正常退出', '2016-10-30 14:24:36', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d9ae4369-b0bc-4c0e-b4d6-4d27ea996a31', null, 'admin', '用户正常退出', '2016-10-31 19:43:17', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d9ff629f-0c32-417a-9f5a-a803003a8675', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-24 22:04:35', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('da448612-349f-4c7d-b8cb-7794eb4a7aa7', null, 'admin', '用户登录', '2016-11-08 14:27:12', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('da6a82ac-8fe2-43af-8008-bbebb976b8c0', null, 'admin', '用户正常退出', '2016-10-30 14:29:18', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('dca15afd-eff2-4095-b901-34734c77a830', null, 'admin', '用户登录', '2016-11-08 14:38:52', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('dcb8d272-880e-47fd-aafd-320e53091ac6', null, 'tecom', '用户登录', '2016-10-24 23:35:46', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('dcedfe94-8e48-4124-9709-be2a49348ceb', null, 'admin', '用户正常退出', '2016-10-26 00:01:46', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('deafff57-71c8-407f-9cca-578b4bb4a477', null, '123', '用户可能是长时间没操作，自动退出', '2016-10-26 21:38:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('df05be94-c287-4fe3-b9d2-ce9f8771a1c2', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 14:26:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('dfd5d9e9-d397-4d6f-86c4-e933ea4bc695', null, 'tecom', '用户登录', '2016-10-18 21:30:43', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('dff9272e-a5d5-4bd8-a8d7-8ab6f069f15b', null, 'tecom', '用户登录', '2016-10-18 21:53:40', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e11c445a-f3c0-4c00-a467-f3dd67d45bce', null, 'admin', '用户登录', '2016-11-08 14:21:19', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e1f7e6de-8753-44a6-9451-14ff0398044b', null, 'admin', '用户正常退出', '2016-10-28 14:52:17', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e2295ac3-6df3-49ac-817a-eafd12c27023', null, 'tecom', '用户登录', '2016-10-17 20:34:26', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e27b1c87-20fe-4c60-a09d-8f02f49939b7', null, 'tecom', '用户登录', '2016-10-24 21:21:30', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e3ded934-1603-4ef7-80c2-f3ec7810fe72', null, 'admin', '用户登录', '2016-11-09 23:12:49', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e831c10c-4600-4e81-87a6-70ac456408af', null, 'tecom', '用户登录', '2016-10-23 00:20:16', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e89b740e-76d9-474d-b53b-ddd60d09bb93', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-25 22:41:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('e94b5ed2-df92-42bc-89d6-de93c871e777', null, 'tecom', '用户登录', '2016-10-18 22:43:53', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e99ff886-e72e-4868-8dd6-e32933486f83', null, '123', '用户可能是长时间没操作，自动退出', '2016-10-25 23:01:35', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('ebcb5d82-2b13-4d02-86e5-f0e1685efebd', null, 'admin', '用户登录', '2016-11-08 16:53:16', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('ebcd5ec2-757b-433e-b66e-f0931a74556c', null, 'tecom', '用户登录', '2016-10-18 22:23:14', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('ec545ba8-7c15-4ed2-a809-b98707a84e79', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-18 21:32:40', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('ed77071d-dc0a-436a-8111-e30f4a080859', null, '123', '用户正常退出', '2016-10-25 23:54:50', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('eda6eee8-a280-4be9-a4d3-3e81f359f8d9', null, 'admin', '用户正常退出', '2016-10-31 18:53:26', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('efb2f6ec-0384-4c47-a982-f3f2ae1135d6', null, 'admin', '用户登录', '2016-10-30 15:20:15', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f05ca8bf-cecc-4089-a1ea-cba58216a63b', null, '123', '用户登录', '2016-10-26 21:17:56', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f2c1e6bb-e4bf-4d81-83dc-1a2d081997da', null, 'tecom', '用户正常退出', '2016-10-24 23:38:10', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f3ad3c60-065e-4699-baf6-ac1be07ea5c7', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-23 00:00:11', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('f4ed271c-3afa-4b9d-8521-98647cad7d12', null, 'admin', '用户登录', '2016-11-08 14:31:44', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f4f8a3d8-7da1-4e57-af5f-327689264346', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-17 21:07:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('f5f99e44-2a0a-489d-bb10-eaefd90185d4', null, 'admin', '用户正常退出', '2016-11-08 16:53:02', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f62b4f89-c76e-4702-82aa-c39db0e865e3', null, 'admin', '用户登录', '2016-10-31 19:39:15', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f6664f3e-d703-4c54-92f6-813fde2612c6', null, 'tecom', '用户登录', '2016-10-17 20:47:28', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f69716ec-5f0c-4da4-aa25-b467a92b436f', null, 'tecom', '用户登录', '2016-10-18 22:58:19', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f6ad6c3e-3f71-4edb-8eb3-e0d188f8c95a', null, 'admin', '用户正常退出', '2016-11-08 14:39:36', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f796793d-6e69-46ff-9d08-0e486fc1bd00', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 14:24:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('f8c9cea7-ad2c-437e-abc4-41e12d654f60', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 14:43:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('fa35ba26-ed61-4fd7-b7a6-b211bf326227', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-10-31 21:38:06', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('fc3f9683-d21f-40ab-92e6-26a48a09e057', null, 'admin', '用户正常退出', '2016-10-31 19:43:54', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('fcd24ddb-ce40-4f57-89b8-6ecb4fd0bbb6', null, 'admin', '用户登录', '2016-10-31 19:44:02', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('fd98b50c-a71d-41d9-a014-fd8078c49bc4', null, 'admin', '用户可能是关闭浏览器等方式非正常退出', '2016-11-08 14:27:35', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('fdb87c7e-c8ef-4641-8968-ecac8c16343e', null, 'admin', '用户登录', '2016-10-31 19:36:01', '/userController/login.action', '127.0.0.1');

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
