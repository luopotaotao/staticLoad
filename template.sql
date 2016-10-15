/*
Navicat MySQL Data Transfer

Source Server         : staticLoad
Source Server Version : 50713
Source Host           : localhost:3306
Source Database       : template

Target Server Type    : MYSQL
Target Server Version : 50713
File Encoding         : 65001

Date: 2016-10-15 22:52:38
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='行政区划';

-- ----------------------------
-- Records of b_area
-- ----------------------------
INSERT INTO `b_area` VALUES ('0', '全国', '0', null, null);
INSERT INTO `b_area` VALUES ('2', '河北', '1', '0', null);
INSERT INTO `b_area` VALUES ('3', '河南', '1', '0', null);
INSERT INTO `b_area` VALUES ('4', '山东', '1', '0', null);
INSERT INTO `b_area` VALUES ('5', '山西', '1', '0', null);
INSERT INTO `b_area` VALUES ('6', '保定', '2', '2', null);
INSERT INTO `b_area` VALUES ('7', '邯郸', '2', '2', null);
INSERT INTO `b_area` VALUES ('8', '安阳', '2', '3', null);
INSERT INTO `b_area` VALUES ('9', '日照', '2', '4', null);
INSERT INTO `b_area` VALUES ('10', '太原', '2', '5', null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_company
-- ----------------------------
INSERT INTO `b_company` VALUES ('1', '施工单位1', null, '张三', '18808888888', null, '2');
INSERT INTO `b_company` VALUES ('2', '建设单位1', null, '李四', '137777777777', null, '1');
INSERT INTO `b_company` VALUES ('3', '监理单位', null, '王五', '13999999999', null, '3');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='设备信息';

-- ----------------------------
-- Records of b_equipment
-- ----------------------------
INSERT INTO `b_equipment` VALUES ('3', 'EQP030303', 'XXX大型检测仪', '造价10000万', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='设备信息';

-- ----------------------------
-- Records of b_inspector
-- ----------------------------
INSERT INTO `b_inspector` VALUES ('10', '张亮', '1', '主管', '1');
INSERT INTO `b_inspector` VALUES ('11', '123', '0', '123', null);
INSERT INTO `b_inspector` VALUES ('12', '舒淇', '0', '测试', '1');
INSERT INTO `b_inspector` VALUES ('13', '', '1', '', null);
INSERT INTO `b_inspector` VALUES ('15', '黎明', '1', '监管员', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='传感器原始数据';

-- ----------------------------
-- Records of b_inspect_data
-- ----------------------------
INSERT INTO `b_inspect_data` VALUES ('32', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('33', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('34', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('35', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('36', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('37', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('38', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('39', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('40', '1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03 17:15', '1.00,2.00', '1.00,2.00', '1', '2360', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('41', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('42', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('43', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('44', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('45', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('46', 'PRG1', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('47', 'PRG2', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('48', 'PRG2', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('49', 'PRG2', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('50', 'PRG3', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('51', 'PRG3', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');
INSERT INTO `b_inspect_data` VALUES ('52', 'PRG3', 'SH00001', 'GD110', '1.00,2.00', '1.00,2.00', '1.00,2.00', '1.23432', '2.12312', 'JZCS ', '2016-10-03-16-29', '1.00,2.00', '1.00,2.00', '1', '1340', '1', '16');

-- ----------------------------
-- Table structure for `b_inspect_item`
-- ----------------------------
DROP TABLE IF EXISTS `b_inspect_item`;
CREATE TABLE `b_inspect_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '检测项目名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_inspect_item
-- ----------------------------
INSERT INTO `b_inspect_item` VALUES ('3', '检测项目1');
INSERT INTO `b_inspect_item` VALUES ('4', '检测项目2');
INSERT INTO `b_inspect_item` VALUES ('5', '检测项目3');

-- ----------------------------
-- Table structure for `b_inspect_method`
-- ----------------------------
DROP TABLE IF EXISTS `b_inspect_method`;
CREATE TABLE `b_inspect_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '检测方法名称',
  `inspect_item_id` int(11) DEFAULT NULL COMMENT '检测项目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='检测项目';

-- ----------------------------
-- Records of b_inspect_method
-- ----------------------------
INSERT INTO `b_inspect_method` VALUES ('10', '检测项目1-方法1', '3');
INSERT INTO `b_inspect_method` VALUES ('11', '检测项目1-方法2', '3');
INSERT INTO `b_inspect_method` VALUES ('12', '123', '3');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='检测计划';

-- ----------------------------
-- Records of b_inspect_plan
-- ----------------------------
INSERT INTO `b_inspect_plan` VALUES ('9', '检测计划', '7', null, null, null, null, null, null, null);
INSERT INTO `b_inspect_plan` VALUES ('10', '检测计划', '6', null, null, null, null, null, null, null);
INSERT INTO `b_inspect_plan` VALUES ('15', 'wrwe', '6', '12', '3', '2016-10-13', '2016-10-04', '10', '12', null);
INSERT INTO `b_inspect_plan` VALUES ('16', 'abc', '6', '12', '3', '2016-10-14', '2016-10-21', '10', '12', null);

-- ----------------------------
-- Table structure for `b_inspect_project`
-- ----------------------------
DROP TABLE IF EXISTS `b_inspect_project`;
CREATE TABLE `b_inspect_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL COMMENT '工程id',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='检测方案';

-- ----------------------------
-- Records of b_inspect_scheme
-- ----------------------------
INSERT INTO `b_inspect_scheme` VALUES ('5', '检测方案1', '12', '1', '2', '456', '1', null, null);
INSERT INTO `b_inspect_scheme` VALUES ('6', '检测方案2', '11', '1', '1', '123', '1', null, null);
INSERT INTO `b_inspect_scheme` VALUES ('7', '检测方案3', '11', '2', '2', '123', '1', null, null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='机构信息';

-- ----------------------------
-- Records of b_institution
-- ----------------------------
INSERT INTO `b_institution` VALUES ('1', 'JC8888', '检测机构1', '1', '13444444444', null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='工程信息';

-- ----------------------------
-- Records of b_project
-- ----------------------------
INSERT INTO `b_project` VALUES ('11', 'PRG0001', '测试工程1', '2', '6', '高阳县', '38.6875', '115.768', '2', '1', '2', '测试工程1');
INSERT INTO `b_project` VALUES ('12', 'PRG0002', '测试工程2', '3', '8', 'xx街道', '36.113', '114.528', '2', '3', '1', '无');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='检测方案-检测项目关联表';

-- ----------------------------
-- Records of b_r_inspect_scheme_item
-- ----------------------------
INSERT INTO `b_r_inspect_scheme_item` VALUES ('4', '5', '4');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('5', '6', '3');
INSERT INTO `b_r_inspect_scheme_item` VALUES ('6', '7', '3');

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
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_r10pkdejrfxie1lbe7a7rlcwt` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('0', '2015-12-25 11:19:51', 'zhangzq@bjleisen.com', '0', null, 'tecom', '5B42403537626463656162:30DE21804EA6806A325E4A708172D50C51DEE323FA9987DFE8B0DBD4C3E17BE8', '5', null);
INSERT INTO `t_user` VALUES ('451f140b-d1b2-4607-b6c2-31ede8e48daa', '2015-12-25 11:44:17', 'zhangzq@bjleisen.com', '0', '2016-03-07 10:30:44', 'zhangziqi', '5B42403431346435343762:72F4AE8102E281B79B452B79BF1465D26AC62EC237DEE97523656192BB73C9FF', '5', '2019-12-31');
INSERT INTO `t_user` VALUES ('5b072f38-6f61-40d2-93bc-27ae64cecb07', '2016-05-25 16:34:08', 'fanpp@bjleisen.com', '0', '2016-05-25 16:36:02', 'fanpanpan', '5B42403232323238653438:5284C7367BE6CCDE50CE4F9EEF42F75F35C75EC71177E75B0565954C73BC839D', '5', null);
INSERT INTO `t_user` VALUES ('5b4c01ff-7be0-4eff-84b1-b7ddfdcf45fe', '2016-06-23 15:06:43', 'ningzy@bjleisen.com', '0', '2016-06-23 15:07:26', 'ningzhaoyun', '5B424034313761396339:FC711358BDE7CA4DFBDF3ACC05D2A27F247EB796A82122750E55E3516F5851C1', '5', null);
INSERT INTO `t_user` VALUES ('676a82b0-aeb7-4570-a7b9-cfbdbca130d8', '2016-07-26 09:22:28', 'liyx@bjleisen.com', '0', '2016-07-26 09:25:01', 'zhaoqiaoning', '5B424039623133666631:7529B4F95654ACDCAF039DC46BCBE581AEA6D66309FAA98487EB38D5D14E2195', '5', null);
INSERT INTO `t_user` VALUES ('8d619a6e-ba32-4e29-8759-0d361a9d2ecc', '2016-03-07 13:08:20', 'chenjp@bjleisen.com', '0', '2016-03-07 13:10:37', 'chenjinpeng', '5B42403438363165343337:DB215BF0B3F41E929D121358D671E816B6209E2474BCB074A9ACA335AD2A23DC', '5', null);
INSERT INTO `t_user` VALUES ('a51139b5-bf94-4576-a0d3-bf60f297433d', '2016-05-23 17:06:57', 'linjw@bjleisen.com', '0', '2016-05-23 17:21:43', 'linjingwu', '5B424062353738343939:606785DFD25071816C2D8337AB5A2CE9D8838AF95C0AD884DF8721AAA08FC67A', '5', null);
INSERT INTO `t_user` VALUES ('af23f125-9d12-4aec-9d96-ea518d19bf86', '2015-12-28 17:44:01', 'zhangxh@bjleisen.com', '0', '2016-08-18 14:07:44', 'zhangxiaohui', '5B42403537626463656162:30DE21804EA6806A325E4A708172D50C51DEE323FA9987DFE8B0DBD4C3E17BE8', '5', null);
INSERT INTO `t_user` VALUES ('ca232b3b-7d5a-4859-884f-32e16beeb4e3', '2016-03-07 14:20:58', 'chenjp@bjleisen.com', '0', '2016-08-24 13:33:33', 'chenjp', '5B42403537626463656162:30DE21804EA6806A325E4A708172D50C51DEE323FA9987DFE8B0DBD4C3E17BE8', '5', null);
INSERT INTO `t_user` VALUES ('ca5a9f16-b040-4c7f-b76b-85886bf7ef01', '2016-05-06 11:23:14', 'hanxk@bjleisen.com', '0', '2016-05-06 11:23:37', 'hanxk', '5B42403630333934626665:B4961A75957A5E5973CC29DCD44AEC2BD56049CB2547B1995314174B2A38C484', '5', null);
INSERT INTO `t_user` VALUES ('e2bb3f51-1b3c-4797-9d4c-f5118fedf805', '2016-07-19 17:33:14', 'songzq@bjleisen.com', '0', '2016-07-21 10:52:06', 'songzhiqiang', '5B424035333839643633:6E1E32F1FC3B6A27527F4B008644A37F0BC981BEF422B02E30F76642D75B0E26', '5', null);
INSERT INTO `t_user` VALUES ('f6dd51df-b9c8-49a3-95ff-be3304ec829e', '2015-12-28 16:55:32', 'liyx@bjleisen.com', '0', '2016-07-26 09:30:18', 'liyunxia', '5B42403734386266653135:3869CED78FCA9955C41A7A0FCD608553551B1EB07B6A6D9E95D2243C27F81F98', '5', null);
INSERT INTO `t_user` VALUES ('fd6bd97a-2eb9-4d2a-95a4-d81cf8a2607e', '2016-01-15 16:18:51', 'mamz@bjleisen.com', '0', '2016-01-15 16:22:54', 'mamingzhi', '5B42403334363637356239:A2EA5A0A8F9822082A5381ED1CB536447E061902ED4A5501D1F375B80417067A', '5', null);
INSERT INTO `t_user` VALUES ('guest', '2015-12-25 11:19:51', 'zhangzq@bjleisen.com', '0', '2015-12-27 12:05:28', 'guest', '5B42403537626463656162:30DE21804EA6806A325E4A708172D50C51DEE323FA9987DFE8B0DBD4C3E17BE8', '5', null);

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
INSERT INTO `t_user_log` VALUES ('018dbde3-f2d3-4d5b-b828-c82a544606c3', null, 'tecom', '用户登录', '2016-10-13 22:50:19', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('01985357-dea3-4b90-af44-715a64ef8029', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-06 22:28:15', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('0498034a-a7e2-487a-bfb0-3be732b4b589', null, 'tecom', '用户登录', '2016-10-11 20:11:14', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('05e1cc4d-9dc2-40d6-af33-3a01552db65b', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-06 23:25:26', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('07143eb0-7ad7-4119-b021-9d6dd5451b21', null, 'tecom', '用户登录', '2016-10-02 16:34:39', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('07f0fcbc-555d-47a9-98de-ff03f8d6115d', null, 'tecom', '用户正常退出', '2016-10-13 00:16:16', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('091a9394-e7ff-41be-acac-651c16dfc996', null, 'tecom', '用户登录', '2016-10-08 21:03:40', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('098d9188-d20e-40eb-a98b-1c25f5add9c2', null, 'tecom', '用户登录', '2016-10-08 21:18:26', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('0a254140-401a-4ae5-80cc-8c5c5adae187', null, 'tecom', '用户登录', '2016-10-11 20:24:04', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('0ab9f557-a76f-4aed-879a-e747e2501a65', null, 'tecom', '用户登录', '2016-10-12 20:56:11', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('0ba91af9-2a0a-46cc-8974-e34b756cab46', null, 'tecom', '用户登录', '2016-10-05 22:09:28', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('0d589ed6-f4d1-44ec-b492-529b5905c8b1', null, 'tecom', '用户登录', '2016-10-12 22:31:40', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('0f02a6b5-b474-4517-90b1-b07a5669fbad', null, 'tecom', '用户正常退出', '2016-10-11 20:10:35', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('10c203d0-3614-4497-a6a4-7c47403e7fdf', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-13 21:51:45', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('10c6ef83-dcbd-4211-a7de-e274f81c4fbf', null, 'tecom', '用户登录', '2016-10-06 00:33:34', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('1298f601-db68-4d42-ace4-57b298c5a646', null, 'tecom', '用户登录', '2016-10-05 19:31:47', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('129d4c3b-6115-4689-8281-f3e606a81956', null, 'tecom', '用户登录', '2016-10-06 10:16:34', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('1387dcc7-00da-43bb-9519-af716e09158d', null, 'tecom', '用户登录', '2016-10-15 18:00:37', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('138c1bee-38ee-4542-a6eb-aaca115a47cb', null, 'tecom', '用户登录', '2016-10-08 21:06:45', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('14b69395-2d25-47db-8619-d2da6814db91', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-15 16:40:20', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('154bc6c3-a2e2-4e3a-8eab-5844cf70fe23', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-06 10:52:55', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('16a1c123-ec88-4b85-9048-44cd42e6510b', null, 'tecom', '用户登录', '2016-10-07 22:39:07', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('178a596a-d89b-4921-936c-6ca8b81b68d6', null, 'tecom', '用户正常退出', '2016-10-13 00:17:14', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('17bd71b2-77f1-4818-847d-1d1be040bad4', null, 'tecom', '用户登录', '2016-10-04 12:57:36', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('18f4de5b-a7ef-4f99-8fdd-7f38b587d1bd', null, 'tecom', '用户登录', '2016-10-07 19:29:37', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('194f2d23-1590-44b1-ac8d-c8967f6b15af', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-08 21:21:54', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('1c131aad-fa21-4653-b7bb-245eafd04966', null, 'tecom', '用户登录', '2016-10-07 16:25:31', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('1d82fc64-7973-4c96-8e6c-f3620e8c6989', null, 'tecom', '用户登录', '2016-10-12 20:04:11', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('2067cb48-48db-4b8c-a402-c85125b5175b', null, 'tecom', '用户登录', '2016-10-06 00:22:01', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('212317d0-c876-41b4-a1ab-e26329b5acd4', null, 'tecom', '用户登录', '2016-10-15 17:15:15', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('2180e84f-a4dc-4eba-ba28-98acf67116cd', null, 'tecom', '用户登录', '2016-10-12 23:35:46', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('21c26646-5649-4895-a822-51830da43f1a', null, 'tecom', '用户正常退出', '2016-10-11 22:10:47', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('227400de-6331-4aa9-adaf-21dde34fbc9f', null, 'tecom', '用户登录', '2016-10-12 21:58:26', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('2385b177-e93c-4043-b560-793b51319338', null, 'tecom', '用户登录', '2016-10-04 15:45:33', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('255223db-72b7-4041-bb73-d05f37e205ea', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-12 21:16:15', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('27d9485b-e8c0-4a3f-a5c9-f9de79cd11f5', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-05 19:51:53', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('28678441-bf98-460c-b622-d810d8e42656', null, 'tecom', '用户登录', '2016-10-14 00:11:07', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('2a644494-39fd-4383-a3f5-7dbcaa7c0504', null, 'tecom', '用户登录', '2016-10-11 22:11:32', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('2ae093d1-c43a-49b1-a686-68f39afd47bf', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-07 21:16:51', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('2b297cdb-992f-40cd-b3a9-65d33e992119', null, 'tecom', '用户登录', '2016-10-07 20:21:59', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('2c797cc9-bd78-4c7a-ae95-8440e6844411', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-06 23:47:52', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('2de761f5-baa2-4da8-b2ea-d3dc53d7f68b', null, 'tecom', '用户登录', '2016-10-04 14:27:29', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('30264fa0-11f4-407f-8d60-4d67423dabdf', null, 'tecom', '用户登录', '2016-10-04 13:54:54', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('303155a3-3794-44fa-997c-c645eb44537d', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-13 23:09:15', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3082958e-9751-4edc-921f-5efbf08b84f4', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-13 21:25:20', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('31ac629e-be81-49ff-afbd-5f6da8e156ca', null, 'tecom', '用户登录', '2016-10-02 21:57:53', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('321a5088-e798-4603-b486-3be99f21e24a', null, 'tecom', '用户正常退出', '2016-10-11 22:18:13', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('33f6b49a-6bf3-4f28-9a98-a6ede7c5a0dc', null, 'tecom', '用户登录', '2016-10-14 00:14:57', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('34020e9d-de61-434f-923c-03cad69044f1', null, 'tecom', '用户登录', '2016-10-05 23:58:26', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('34e0095b-0427-45e3-bc02-19441b19b25f', null, 'tecom', '用户登录', '2016-10-08 20:16:34', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('34e294c7-81d4-4a00-a111-b732552dfac8', null, 'tecom', '用户登录', '2016-10-04 13:16:53', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('34fe0ceb-4f86-4999-92da-ffb21d442e97', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-05 22:23:42', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('35b9d5ac-6706-44da-a78e-c35e11a8ce49', null, 'tecom', '用户登录', '2016-10-04 13:20:56', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('35d08d0d-9043-4b05-aef1-0eec1bfd7635', null, 'tecom', '用户登录', '2016-10-08 21:09:15', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('3742943b-0211-4aff-a2d6-e8d4102df7d1', null, 'tecom', '用户正常退出', '2016-10-11 20:27:24', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('3afa60d7-fbf7-4ff6-9da6-5cb763dbbfa4', null, 'tecom', '用户登录', '2016-10-07 23:17:50', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('3b6a944b-6a43-45e7-82d4-7c5639bcd6a6', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-11 23:29:31', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3c0b9db1-b01a-4c73-b0bb-0c6da4b246f0', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-03 21:56:06', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3c1e5934-6069-4863-8072-5604e4d4a0bc', null, 'tecom', '用户登录', '2016-10-08 21:22:06', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('3c34546b-8d69-44eb-8782-c14762394f0b', null, 'tecom', '用户登录', '2016-10-08 21:37:40', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('3c94199b-f563-494c-90fb-4fa29fc89798', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-13 23:48:05', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('3e098e05-5290-4244-990c-8a1337c219ee', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-15 16:24:15', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('411621a4-e4b6-4681-a9d9-a0d3de5a6947', null, 'tecom', '用户登录', '2016-10-05 22:44:58', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('42dd9cd5-3ae3-4fc4-a199-56021afd452f', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-02 16:54:40', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('4482cfaa-70f5-4d3e-a0b8-46385b6817aa', null, 'tecom', '用户登录', '2016-10-11 19:43:09', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('44c6cabe-0d52-4110-a81d-f5de558e3439', null, 'tecom', '用户登录', '2016-10-07 16:55:36', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('4625a683-86ef-42fa-9743-f41e6f1fa974', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-07 20:42:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('4628f57a-a282-4888-b417-64142bc67f90', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-13 22:12:45', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('46673f55-4d93-42bc-80b8-615d77e1b565', null, 'tecom', '用户登录', '2016-10-06 21:27:50', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('468ae4bb-11ef-4f4e-8140-0eacd2e5da9c', null, 'tecom', '用户登录', '2016-10-11 22:24:59', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('4789b32e-ecaa-4664-86cc-73be0a24ed3c', null, 'tecom', '用户登录', '2016-10-13 20:23:13', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('479888e6-b0de-4b51-9248-83bdafc451b7', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-06 21:52:05', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('494ec392-a54f-4937-bb16-1bd905f5a8bc', null, 'tecom', '用户登录', '2016-10-06 22:17:48', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('4a371b0a-8191-46fd-9de9-c80543687daf', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-14 00:06:50', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('4a9209c3-f029-4559-8cdf-0b0df56db2d5', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-12 21:57:35', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('4ba63143-ee45-4a35-986c-bb951721adde', null, 'tecom', '用户登录', '2016-10-04 10:32:03', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('4d259ec9-7655-465e-9df8-c1da1c15a402', null, 'tecom', '用户登录', '2016-10-04 10:33:59', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('4df46a1e-4728-48dd-9f11-b6e7922a1462', null, 'tecom', '用户登录', '2016-10-07 21:02:21', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('4e205fa2-83e2-4e9c-a188-5810cdf305e9', null, 'tecom', '用户登录', '2016-10-12 23:31:12', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('4eb5fb30-67e3-4d88-83de-614ef8f66811', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-06 21:13:55', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('4ffbf46a-2784-492b-9c26-cd554fde1552', null, 'tecom', '用户登录', '2016-10-11 21:47:52', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('52719b13-421e-4659-a489-ad1dd786df56', null, 'tecom', '用户登录', '2016-10-11 19:24:35', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('52c3feb9-2cad-43bf-ae46-0fac1fc32c86', null, 'tecom', '用户登录', '2016-10-07 19:27:54', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('52e55be9-aca6-4597-ba7b-808fcbde1c6c', null, 'tecom', '用户登录', '2016-10-15 16:31:36', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('53442210-2be6-4b94-bb8d-c57a9a5517f4', null, 'tecom', '用户登录', '2016-10-12 23:56:06', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('54535967-fde4-40ed-aee5-8cb26b9c8c6d', null, 'tecom', '用户登录', '2016-10-11 23:09:27', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('54f4327b-3be0-4055-8f39-33e44a092413', null, 'tecom', '用户登录', '2016-10-11 21:02:36', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('56750fe5-c277-4d02-bd1e-81a8be34d400', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-06 10:36:35', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('5811ee12-8694-433d-824a-b9a64673e0f9', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-08 20:15:40', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('5842a96f-ad78-4e56-b460-bc6f863c1cb4', null, 'tecom', '用户登录', '2016-10-07 18:58:15', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('58485ca7-d4f7-40da-81e6-469581cc675d', null, 'tecom', '用户登录', '2016-10-05 21:33:50', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('596997cb-9802-43ce-98bb-4621eafd9bd1', null, 'tecom', '用户登录', '2016-10-04 12:46:06', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5a6bf89e-cdc8-462c-ba85-535746866708', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-02 21:51:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('5a808e00-44d0-4756-94c7-b706f3a9a763', null, 'tecom', '用户登录', '2016-10-15 16:39:05', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5ab9cf4f-09b3-40e4-b0ed-7da8cf6dfc80', null, 'tecom', '用户登录', '2016-10-05 22:24:06', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5b1464d7-1b47-4693-8e71-245a083b4cc7', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-15 17:15:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('5b87191f-c859-4eba-b88f-a44c5ccc9619', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-02 22:57:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('5d1c3427-d470-4db4-ba39-a8921d6c6ad7', null, 'tecom', '用户登录', '2016-10-04 13:05:24', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5dce3217-828f-4736-b2e2-530bb3fc6aa5', null, 'tecom', '用户登录', '2016-10-06 20:23:04', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5e09f729-ce56-4a46-8682-b63ac5f8a530', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-12 23:55:50', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('5e107915-f023-4bf0-a33d-85347b62f2e8', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-04 17:30:07', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('5e9103dd-c76f-476c-b175-bd7a8e3814a4', null, 'tecom', '用户正常退出', '2016-10-15 16:54:54', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('5eab9250-1518-4139-b102-de282d086d2a', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-02 22:25:05', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('5fe77477-b0a9-4407-8e34-aeb60979a217', null, 'tecom', '用户登录', '2016-10-04 12:43:49', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6208aecd-e3bd-4ae9-9b8a-9b8bf0133f27', null, 'tecom', '用户登录', '2016-10-12 23:06:02', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('62ab9ed4-9396-424f-bd9f-1eeb0fcbca48', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-04 14:25:37', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('64bbaafe-279f-4f3e-9f64-6e017d31f861', null, 'tecom', '用户登录', '2016-10-06 21:03:28', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('68d1fcc9-9a77-40af-9b8f-6af24161d728', null, 'tecom', '用户登录', '2016-10-12 20:09:47', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6add9b91-7424-4947-b559-e00e14f1ce81', null, 'tecom', '用户登录', '2016-10-04 13:24:09', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6b5b5507-5c97-4a3e-8f59-9dcc1e554743', null, 'tecom', '用户登录', '2016-10-12 22:37:52', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6d71983a-c652-4eea-9e58-ff5980348c20', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-12 22:57:55', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('6e3b3417-effd-42d1-b4a5-0fe17f9b4beb', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-13 22:33:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('6f1b56f0-6a41-4fbc-8ff5-4288e393a2a1', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-12 23:26:05', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('6f9c05aa-4a32-475e-a945-47dda697c54d', null, 'tecom', '用户登录', '2016-10-08 21:11:45', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('6faef593-bd5d-499a-9b84-b8b91803a768', null, 'tecom', '用户登录', '2016-10-05 22:08:59', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('70085a29-cf72-4dbb-a991-bf6de07866d1', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-14 00:35:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('70606295-3d4c-460b-ba16-5991f3c6b267', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-13 23:07:55', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('715dd77e-4516-48ea-bd69-98bfc1408eb2', null, 'tecom', '用户登录', '2016-10-04 12:07:13', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('718831eb-cc68-4a31-bd5f-8395ac6881ce', null, 'tecom', '用户登录', '2016-10-07 16:53:17', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('73dd2add-d00f-4653-8b34-e4411ae465de', null, 'tecom', '用户登录', '2016-10-06 11:03:25', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7482bc95-7d4d-477c-a74d-db13f9c50b68', null, 'tecom', '用户登录', '2016-10-06 00:22:27', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('754b65fe-5ebc-4bd7-93b4-5181d5198c44', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-11 19:22:22', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('756b7e76-93bb-4c7a-88ab-b92cde975f4b', null, 'tecom', '用户正常退出', '2016-10-13 00:14:53', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('75fb9166-09f1-4c79-ba2e-e3216db10fd1', null, 'tecom', '用户登录', '2016-10-04 13:05:24', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('763146e3-8e83-41d4-a6a6-cbb26937495f', null, 'tecom', '用户登录', '2016-10-07 23:27:09', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('77d2a77a-6f37-48d1-90ff-35e56b89bd16', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-04 12:46:05', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('78162cb1-3332-4314-bc79-751f523b9e26', null, 'tecom', '用户登录', '2016-10-06 23:27:46', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7a386aa5-337e-458d-8b06-a16b0d393aff', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-06 11:00:17', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('7ce43eae-93aa-41ed-b8f5-f997073cc321', null, 'tecom', '用户登录', '2016-10-07 23:44:49', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7d445b82-4fdf-44dc-a624-20b056bdcdc6', null, 'tecom', '用户登录', '2016-10-13 23:28:04', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7d659b1c-61fe-477c-b16a-e584805b01e5', null, 'tecom', '用户登录', '2016-10-05 23:50:14', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7d8e0597-4f7e-4b8e-bf06-05f89386f0eb', null, 'tecom', '用户登录', '2016-10-02 22:05:03', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7da3a308-daa2-4772-887f-11ea1b2ab2f4', null, 'tecom', '用户正常退出', '2016-10-11 20:27:39', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7da3f524-66f5-4bba-a2a4-ed4b065c1226', null, 'tecom', '用户登录', '2016-10-11 21:23:37', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7dd337b4-bba3-4903-a202-49a18d6ca0c0', null, 'tecom', '用户登录', '2016-10-02 16:55:29', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('7f4a6b63-e7e2-4067-a8a1-a60e278de971', null, 'tecom', '用户登录', '2016-10-13 23:10:36', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8003b855-c4db-4792-a498-6bf2c31cea1e', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-04 15:10:31', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('81733cb6-0c01-42bd-ab0d-b79991d42537', null, 'tecom', '用户登录', '2016-10-11 20:04:20', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('817c17d0-f92d-4a4a-8ac9-879dfd9456a2', null, 'tecom', '用户登录', '2016-10-12 19:51:39', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('822560e1-f832-4f94-8444-2ace9e6390fa', null, 'tecom', '用户登录', '2016-10-13 00:16:17', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8275f0c4-c0b0-4492-a5df-d0995c72675b', null, 'tecom', '用户登录', '2016-10-08 19:26:11', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('82806256-f5df-4477-b6ee-9c1523c94950', null, 'tecom', '用户登录', '2016-10-14 00:07:59', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8318d7e9-b4d3-4a89-9248-8c00d608f4cd', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-15 18:00:15', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('836a4993-08d7-44ed-8531-b333803ec52e', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-11 22:07:55', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('84aadffd-d030-4405-8a3f-0fb93c3fdaba', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-04 10:38:19', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('84d338bc-87c0-4391-a02d-f5afe619b594', null, 'tecom', '用户登录', '2016-10-14 00:24:38', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('84f573b0-b12e-4fc0-856f-e8a6abc1fd40', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-11 20:23:55', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('852a8bb8-7496-4d51-a43b-6c1592a20a12', null, 'tecom', '用户登录', '2016-10-07 22:25:01', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('85849db7-4c9d-4c02-9144-db3d3b8c8396', null, 'tecom', '用户登录', '2016-10-13 21:07:49', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('85906177-82c3-4959-82cc-d9b508813c69', null, 'tecom', '用户登录', '2016-10-14 00:07:53', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('85bf9a46-d7e7-4651-8e42-1956d9f166d6', null, 'tecom', '用户登录', '2016-10-13 00:14:58', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('88080117-28ad-4d75-a13a-ba112de03601', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-12 20:53:35', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('887a44e0-645f-4ee5-91ac-748add92adae', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-06 00:53:37', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('89904c77-92f4-4979-85b6-820e008d821e', null, 'tecom', '用户登录', '2016-10-07 16:18:03', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('89f6c521-9aa5-4a0a-9e5f-f97437234ef8', null, 'tecom', '用户登录', '2016-10-12 20:17:52', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8a86ea1d-a5dd-41e7-b9ec-c8155f47f43c', null, 'tecom', '用户正常退出', '2016-10-11 19:35:18', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8b4f1631-db2f-4ee1-90eb-71e013ceda59', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-12 22:18:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('8c0effa6-0122-4e21-b3c6-ba9026b3b753', null, 'tecom', '用户正常退出', '2016-10-13 00:14:40', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8d38284f-88c0-4755-8508-2b6fddb3c220', null, 'tecom', '用户登录', '2016-10-13 22:12:56', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8e047626-48fc-41f6-aee9-30f4eb8bfcd5', null, 'tecom', '用户登录', '2016-10-06 00:54:33', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8e155a86-7aa3-4b73-aabd-aae0fc1f6025', null, 'tecom', '用户登录', '2016-10-15 16:44:10', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8e622455-4add-40aa-96b5-7d1456ca844f', null, 'tecom', '用户登录', '2016-10-08 19:35:20', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('8f0e6528-8a8f-4b15-88df-be2f0502bed4', null, 'tecom', '用户登录', '2016-10-13 00:16:24', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('91547b2f-b7ae-4bae-9bae-61275a2aecb5', null, 'tecom', '用户登录', '2016-10-11 19:12:43', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('92abdcd8-410e-47b9-92e5-94664fe3e424', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-07 16:40:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('953659da-3295-4f80-b031-e2bf5da2eb75', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-08 21:32:31', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('980ca77d-b2ed-480f-87d9-63d5d3694ffb', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-07 19:49:40', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('985ebe7b-36d4-42ff-a05d-8d5594c9ed09', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-05 21:31:26', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('9c4f8249-477b-4d84-8fd0-997ddb425d49', null, 'tecom', '用户登录', '2016-10-08 20:48:46', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('9cc141ed-6bb2-4f45-b3c5-3b4a0107de0a', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-06 09:53:35', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('9dde8afb-621e-48db-a1f2-5dd7487872fd', null, 'tecom', '用户登录', '2016-10-06 23:54:38', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('9e6eb340-db7e-47c2-ab8c-6d1ba10767ae', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-13 23:26:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('9fee837d-7aa5-4652-8867-4c21e0e8caab', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-14 00:13:05', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('a1887c8b-33af-4d59-b41b-f60592b3b22d', null, 'tecom', '用户登录', '2016-10-07 19:50:40', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a18bbc8a-7cd2-404e-a0c1-a1879e426144', null, 'tecom', '用户登录', '2016-10-04 13:34:16', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a1e9bef3-5b56-43d6-9762-69a989740147', null, 'tecom', '用户登录', '2016-10-07 19:56:41', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a1ee0033-bcd8-4a31-9bff-8c71a0009d7e', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-02 17:15:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('a2a7e076-59fc-42be-b000-cc4f16a5d55e', null, 'tecom', '用户登录', '2016-10-06 09:37:34', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a3eeb19b-020c-46c9-a1ab-f24ade70dacc', null, 'tecom', '用户登录', '2016-10-04 15:43:18', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a48f8508-0812-406b-a968-b84026072fa4', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-04 15:34:11', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('a52b6528-5e87-4507-a26f-8db77e03a95c', null, 'tecom', '用户登录', '2016-10-12 23:34:41', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a54405aa-473d-49ff-9757-47b027d507af', null, 'tecom', '用户登录', '2016-10-08 20:33:32', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a5643c9a-0999-4756-bf6c-8d3843ea98d2', null, 'tecom', '用户登录', '2016-10-04 15:14:05', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('a9369835-7889-4d31-a625-f1c89c0260b5', null, 'tecom', '用户登录', '2016-10-06 00:24:07', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('ab485b74-aea2-4aeb-be88-9d5972004258', null, 'tecom', '用户登录', '2016-10-06 16:34:27', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('aba39fd8-95c6-433d-8caf-d4b6b7cbc8c5', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-11 20:59:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('ac6534a4-ee91-45fa-83dc-7282a73c607c', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-15 17:38:50', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('aeed474b-d391-4694-b90d-a939c06753ea', null, 'tecom', '用户登录', '2016-10-11 22:08:24', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('af56c243-e9a7-410b-9a69-f3a3b3c76df3', null, 'tecom', '用户登录', '2016-10-04 11:54:08', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b08cd586-0afe-4870-8efd-27228a62abc0', null, 'tecom', '用户登录', '2016-10-04 15:34:22', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b0fd2512-2b63-44e2-ad97-f615e8543472', null, 'tecom', '用户登录', '2016-10-13 00:14:42', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b11f5298-0e58-4a2b-83d0-851d455fb483', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-15 17:35:15', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('b353c606-9cf7-4ba4-9fde-86cc8ccd43e3', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-08 19:55:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('b3d7995c-5628-4c12-b0e5-010e45cc1339', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-06 23:00:36', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('b6c29683-ca75-481e-810c-2e4a71560583', null, 'tecom', '用户登录', '2016-10-12 19:47:00', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b79e07e7-0d6d-4697-bc12-d502135f3474', null, 'tecom', '用户登录', '2016-10-12 20:33:35', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b7b7c6f4-a3f9-4a7a-ac8f-e9d713dff943', null, 'tecom', '用户登录', '2016-10-05 21:45:58', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b81da6d0-67e3-4383-aa0e-3514ad164cfb', null, 'tecom', '用户登录', '2016-10-06 23:51:00', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b8a53f2c-6185-4ed9-8919-e45935f4eeb2', null, 'tecom', '用户登录', '2016-10-12 21:37:34', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b8b1acce-ca5f-40ae-975c-7cc8f430a674', null, 'tecom', '用户登录', '2016-10-08 20:43:44', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b8c8bdb5-825b-460a-8701-efc89c217811', null, 'tecom', '用户登录', '2016-10-05 21:50:41', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('b9561f20-e147-4a1c-a63e-f1560c14198e', null, 'tecom', '用户登录', '2016-10-05 19:17:57', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('ba8aa3df-9683-45d6-b6be-8e376fe19d1d', null, 'tecom', '用户登录', '2016-10-12 21:33:15', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('bb1bb58c-9b31-4577-86f1-2c4a9033b765', null, 'tecom', '用户登录', '2016-10-06 19:44:23', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('bb1c4e33-63e7-4ffe-9108-ca35e228fe99', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-11 20:03:10', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('bba21a7a-58c5-4328-893a-669334954e7b', null, 'tecom', '用户登录', '2016-10-06 20:36:17', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('bbd9e78a-7df5-4402-aca8-29d73e6e7187', null, 'tecom', '用户登录', '2016-10-15 16:54:56', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('bc6d6bda-8b91-4bc2-9700-6a161084a661', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-11 22:45:00', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('bc7fd14a-3964-410c-8c15-0d23ba6c17ef', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-06 11:23:34', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('bcdf8945-e41b-4299-bee5-52f70287b3d1', null, 'tecom', '用户登录', '2016-10-04 11:48:38', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('bcf53e99-be5c-4d80-9389-2c9c57169e69', null, 'tecom', '用户登录', '2016-10-08 19:55:35', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('be175915-e669-4c54-bf4b-4ebd78cc70f2', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-05 22:44:11', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('c09bb2c3-c7b6-4cd6-b931-10ebefb2651a', null, 'tecom', '用户登录', '2016-10-06 22:50:15', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c0cc17f5-8ac0-464c-b8ba-d89e115057dd', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-04 12:58:35', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('c0dabdd6-2aa7-42fd-a19c-91547758e18a', null, 'tecom', '用户登录', '2016-10-03 21:44:47', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c10da411-1b8b-4440-8351-8a8e8910050f', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-15 16:36:05', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('c1781f9f-869d-47c4-b6a3-f9ee3c8da50d', null, 'tecom', '用户登录', '2016-10-05 21:07:17', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c528001f-aa7b-4645-bf11-af6249c7811f', null, 'tecom', '用户登录', '2016-10-02 22:36:56', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c5b028f4-77fc-4333-ac55-ba86a3624000', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-12 22:35:45', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('c6b38e5b-7a78-44d6-a031-2f51f8b26d94', null, 'tecom', '用户登录', '2016-10-07 22:50:35', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c7134b33-a202-477a-a00c-0c49461aa00f', null, 'tecom', '用户登录', '2016-10-06 21:31:59', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c7da2e1b-473c-4064-a693-646841efd6a9', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-07 22:33:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('c819ae8b-bd66-495f-9b65-1f878ec7729c', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-13 20:43:15', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('c84b4c56-1905-4a8d-97ed-0badb559757b', null, 'tecom', '用户登录', '2016-10-06 20:41:30', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('c8706ff6-283b-4c4a-ace0-fb80b18e8933', null, 'tecom', '用户正常退出', '2016-10-15 16:12:45', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('cafc8fa3-6ff4-4866-bb43-562b42bf4bac', null, 'tecom', '用户登录', '2016-10-07 22:16:42', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('cd04a34a-1ca1-4f38-a3d8-467ff36c0b42', null, 'tecom', '用户登录', '2016-10-03 21:55:03', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('cdaf19ef-795c-4d8e-901e-a7ce5129f6dc', null, 'tecom', '用户登录', '2016-10-07 23:07:42', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d1a23062-8b8b-4db2-8646-3de48be7e108', null, 'tecom', '用户登录', '2016-10-06 00:11:25', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d5c27db1-00d1-4ba8-aaba-2a369c026c4f', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-06 00:21:50', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('d6b00fdd-65bb-477a-ba43-06c18fd470bf', null, 'tecom', '用户登录', '2016-10-07 23:05:50', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d75ac70c-97a1-4257-8687-4f68fbad7f07', null, 'tecom', '用户登录', '2016-10-13 21:31:44', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d7879752-4034-49db-aa3f-949f5c473c2c', null, 'tecom', '用户正常退出', '2016-10-11 20:38:21', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d7d7c640-9593-4307-934a-405ae3f28afb', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-11 21:22:40', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('d83857e3-f413-4d53-adcb-4f20e62cd40c', null, 'tecom', '用户登录', '2016-10-15 17:37:07', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d83cdda9-7a34-40ec-928c-dc085a950ecd', null, 'tecom', '用户登录', '2016-10-13 23:48:20', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d8bc676a-c710-471f-8826-38a064f1ebdf', null, 'tecom', '用户登录', '2016-10-03 21:56:23', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d900b43a-5a94-4f59-8954-a0db07e0070c', null, 'tecom', '用户登录', '2016-10-13 21:52:42', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d9c9c99c-b830-4c91-bdda-d4765363b36f', null, 'tecom', '用户登录', '2016-10-11 20:39:24', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('d9f6df56-d0de-4574-ab86-64e7614d7e13', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-07 20:16:45', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('da76178c-6b67-46fd-b2dd-70fa80e9c5d7', null, 'tecom', '用户登录', '2016-10-04 14:55:23', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('da79eb95-ab59-4ab4-83b4-62ab071d9fea', null, 'tecom', '用户登录', '2016-10-06 10:54:29', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('db32257e-0027-4cea-b56a-d4e88197497f', null, 'tecom', '用户登录', '2016-10-05 20:51:33', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('db8bbd11-b84c-48f4-896c-b8146ef55608', null, 'tecom', '用户登录', '2016-10-15 16:07:38', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('dbea4c29-7f83-4e3d-8f89-af3595141158', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-06 20:04:25', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('dd65a9f6-cc1f-4328-bad5-78f5df420737', null, 'tecom', '用户登录', '2016-10-06 20:06:15', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('dfd0bc2c-14ed-4f82-b07d-f9f501cdf6e4', null, 'tecom', '用户登录', '2016-10-06 23:01:04', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('dfed62eb-869b-4297-9260-d85747168623', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-15 22:09:17', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('dff9ca88-ed29-4974-a37f-93107804621d', null, 'tecom', '用户正常退出', '2016-10-13 00:16:22', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e368cfc5-f05c-49d9-9891-76695959f8c0', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-11 21:43:40', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('e6729a42-48cb-4f72-b131-34e25569cc5e', null, 'tecom', '用户登录', '2016-10-15 16:12:47', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e6c9ba51-f555-46b4-b6e8-86b047ea29fe', null, 'tecom', '用户登录', '2016-10-07 23:14:50', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e71d5c07-98d4-4bcb-862c-e8251f75c287', null, 'tecom', '用户登录', '2016-10-11 23:31:58', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e850138e-5c4f-433e-82f9-6719c31f1776', null, 'tecom', '用户登录', '2016-10-11 20:33:55', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e871b183-65a6-4e2b-a5dd-eaf8724bcef9', null, 'tecom', '用户登录', '2016-10-11 20:27:33', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('e8a718e4-c1fc-4e43-9074-e4a24d7232a8', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-07 19:08:40', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('e930c2d1-cea9-4db0-b8bc-8a4e54f370d5', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-05 23:05:04', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('ebd7b3a3-1db9-4c4c-bd06-16f137ef7727', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-05 22:08:47', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('ec5f5f1a-ad54-4f8b-ad47-b0ad9f763277', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-14 00:08:20', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('ecd87d8a-e784-4caa-9299-c4a0a5428002', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-03 20:55:50', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('ece1c96f-4fac-4669-8a77-129107d79259', null, 'tecom', '用户登录', '2016-10-05 21:11:24', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('ed264fbd-0100-45c6-adfa-24312a8f9d5b', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-06 16:54:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('f04bf1a9-4914-4ad9-b930-89af48ab16b3', null, 'tecom', '用户登录', '2016-10-07 22:44:50', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f0a86123-81b1-427a-a72e-364449711cba', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-04 14:47:30', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('f1621f14-15bd-449a-83aa-92981d854532', null, 'tecom', '用户登录', '2016-10-03 20:35:47', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f171292f-527a-464e-a7c2-0460d555c310', null, 'tecom', '用户登录', '2016-10-06 10:38:01', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f3677802-ff94-49b7-9609-17b2cd115962', null, 'tecom', '用户登录', '2016-10-04 15:57:31', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f48f32be-bf08-40e4-96ff-aa1d6e3ca8e0', null, 'tecom', '用户可能是长时间没操作，自动退出', '2016-10-04 13:54:20', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('f5ac8c30-a322-41ea-a3c6-7bb85cb58649', null, 'tecom', '用户可能是关闭浏览器等方式非正常退出', '2016-10-07 23:37:35', 'Not a normal exit', null);
INSERT INTO `t_user_log` VALUES ('f5dc1a7e-3790-46d8-85bb-e71734ab484c', null, 'tecom', '用户登录', '2016-10-13 00:15:38', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f6f660b8-9131-4c3d-a470-ee01fe0444e8', null, 'tecom', '用户登录', '2016-10-15 17:40:11', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f6fb63e6-dbc8-4d79-86e0-2bbb82edff5d', null, 'tecom', '用户登录', '2016-10-06 23:15:01', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f741c69e-8393-4206-a257-4dc161be2389', null, 'tecom', '用户登录', '2016-10-07 16:41:26', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f7596176-8cb6-4c91-b4eb-7d779aa6731c', null, 'tecom', '用户正常退出', '2016-10-13 00:15:35', '/userController/logout.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('f8b32bd3-6b0c-4185-93e9-0580d7d3cd96', null, 'tecom', '用户登录', '2016-10-08 20:37:01', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('faa185bc-f407-4547-9629-e9ebb9e44203', null, 'tecom', '用户登录', '2016-10-02 21:31:24', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('fb20490c-42eb-4b87-861e-a8fc15a6c89c', null, 'tecom', '用户登录', '2016-10-11 22:18:14', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('fc1666bf-7592-44fe-be67-8fad47c192c5', null, 'tecom', '用户登录', '2016-10-07 19:22:28', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('fd1078c3-a1c3-48c6-ae96-db6454b28061', null, 'tecom', '用户登录', '2016-10-13 23:08:28', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('fd83d5c4-9c91-442c-bdb1-e4fd0f4cff86', null, 'tecom', '用户登录', '2016-10-13 00:16:10', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('fdd556b5-2693-40e2-a5d7-9b16c1a6cc27', null, 'tecom', '用户登录', '2016-10-04 12:58:50', '/userController/login.action', '127.0.0.1');
INSERT INTO `t_user_log` VALUES ('fdebe254-4ae3-425e-a3b3-575441d7ae69', null, 'tecom', '用户登录', '2016-10-12 19:33:54', '/userController/login.action', '127.0.0.1');

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
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `b_overview` AS select `template`.`b_area`.`id` AS `id`,`template`.`b_area`.`name` AS `name`,`template`.`b_area`.`level` AS `level`,`template`.`b_area`.`pid` AS `pid`,`template`.`b_area`.`note` AS `note`,`project_count`.`count` AS `count` from (`template`.`b_area` left join (select 0 AS `area_id`,count(0) AS `count` from `template`.`b_project` union all select `template`.`b_project`.`province_id` AS `area_id`,count(0) AS `count(*)` from `template`.`b_project` group by `template`.`b_project`.`province_id` union all select `template`.`b_project`.`city_id` AS `city_id`,count(0) AS `count(*)` from `template`.`b_project` group by `template`.`b_project`.`city_id`) `project_count` on((`template`.`b_area`.`id` = `project_count`.`area_id`))) ;
