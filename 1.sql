/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.32-log : Database - ls_xggl_dev
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `t_business_config` */
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
/*Table structure for table `t_online` */

CREATE TABLE `t_online` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL,
  `IP` varchar(20) COLLATE utf8_bin NOT NULL,
  `LOGINDATETIME` datetime NOT NULL,
  `LOGINNAME` varchar(20) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*Table structure for table `t_resource` */

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
/*Table structure for table `t_resource_type` */

CREATE TABLE `t_resource_type` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '资源类型名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*Table structure for table `t_role` */

CREATE TABLE `t_role` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '角色ID',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `REMARK` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `SEQ` smallint(6) DEFAULT NULL COMMENT '排序',
  `PID` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '自身表关联',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*Table structure for table `t_role_tresource` */

CREATE TABLE `t_role_tresource` (
  `TROLE_ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '资源ID',
  `TRESOURCE_ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`TRESOURCE_ID`,`TROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*Table structure for table `t_system_config` */

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

/*Table structure for table `t_user` */

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
/*Table structure for table `t_user_trole` */

CREATE TABLE `t_user_trole` (
  `TROLE_ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '角色ID',
  `TUSER_ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '管理员ID',
  PRIMARY KEY (`TROLE_ID`,`TUSER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*Table structure for table `t_user_log` */

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

drop table b_dept;
CREATE TABLE `b_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL COMMENT '机构编号',
  `name` varchar(128) DEFAULT NULL COMMENT '机构名称',
  `economy_typ` tinyint(4) DEFAULT NULL COMMENT '经济性质',
  `certificate_code` varchar(128) DEFAULT NULL COMMENT '资质证书编号',
  `certificate_img` varchar(128) DEFAULT NULL COMMENT '资质证书图片id',
  `certificate_date` date  DEFAULT NULL COMMENT '发证日期',
  `expired_date` date DEFAULT NULL COMMENT '有效日期',
	`national_lib_certificate_code` varchar(128) DEFAULT NULL COMMENT '国家实验室认可证书号',
	`website` varchar(128) DEFAULT NULL COMMENT '网址',
	`measure_certificate_code` varchar(128) DEFAULT NULL COMMENT '计量认证书号',
	`certificate_dept` varchar(128) DEFAULT NULL COMMENT '发证机关',
	`certificate_attachment` varchar(128) DEFAULT NULL COMMENT '计量认证合格证书及附件',
	`register_money` varchar(128) DEFAULT NULL COMMENT '注册资金(万元)',
	`register_type` tinyint DEFAULT NULL COMMENT '注册类型',
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
	`equipment_count` int DEFAULT NULL COMMENT '一起设备总台(套)数',
	`gross_area` float DEFAULT NULL COMMENT '房屋建筑面积(平方米)',
	`office_area` float DEFAULT NULL COMMENT '办公面积(平方米)',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='机构信息';

CREATE TABLE b_equipment(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  code VARCHAR(64) COMMENT '设备编号',
  name VARCHAR(128) COMMENT '设备名称',
  dept_id INT COMMENT '所属机构id'
) COMMENT '设备信息';

CREATE TABLE b_user(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(128) COMMENT '姓名',
  gender TINYINT COMMENT '姓名(1男0女)',
  note VARCHAR(128) COMMENT '备注',
  dept_id INT COMMENT '所属机构id'
) COMMENT '设备信息';

CREATE TABLE `b_inspect_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE b_area(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(128) COMMENT '名称',
  level TINYINT COMMENT '等级(全国0,省1,市(区)2)',
  pid INT COMMENT '父节点id',
  note VARCHAR(128) COMMENT '备注'
) COMMENT '行政区划';
CREATE TABLE `b_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `column_3` int(11) DEFAULT NULL,
  `contacts` varchar(64) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `column_6` int(11) DEFAULT NULL,
  `typ` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工程信息';
CREATE OR REPLACE VIEW template.b_overview AS select `template`.`b_area`.`id` AS `id`,`template`.`b_area`.`name` AS `name`,`template`.`b_area`.`level` AS `level`,`template`.`b_area`.`pid` AS `pid`,`template`.`b_area`.`note` AS `note`,`project_count`.`count` AS `count` from (`template`.`b_area` left join (select 0 AS `area_id`,count(0) AS `count` from `template`.`b_project` union all select `template`.`b_project`.`province_id` AS `area_id`,count(0) AS `count(*)` from `template`.`b_project` group by `template`.`b_project`.`province_id` union all select `template`.`b_project`.`city_id` AS `city_id`,count(0) AS `count(*)` from `template`.`b_project` group by `template`.`b_project`.`city_id`) `project_count` on((`template`.`b_area`.`id` = `project_count`.`area_id`)));

-- 工程登记(监督机构?监督编号?)
drop table b_inspect_project;
create table b_inspect_project(
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `project_id` int(11) DEFAULT NULL COMMENT '工程id'
)  ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='工程登记';
-- 检测方案
create table b_inspect_scheme(
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  inspect_project_id int(11) NOT NULL COMMENT '工程登记id',
  basement_lev tinyint  COMMENT '低级基础设计等级(甲级,乙级,丙级)',
  safety_lev tinyint COMMENT '建筑安全等级(一级,二级,三级)',
  pile_count  int(11) COMMENT '总桩数',
  dept_id  int(11) COMMENT '检测单位',
  approval_file  int(11) COMMENT '检测方案审批表(attachment_id)',
  inspect_file_id  int(11) COMMENT '检测方案附件(attachment_id)'
)  ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='检测方案';

--	检测方案-检测项目关联表
	create table b_r_inspect_scheme_item(
		`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
		inspect_scheme_id int(11) NOT NULL COMMENT '检测方案id',
		inspect_item_id int(11) NOT NULL COMMENT '检测项目id'
	)  ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='检测方案-检测项目关联表';
--	检测项目(静载,超声波...)
	create table b_inspect_item(
		`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
		`name` varchar(128) DEFAULT NULL COMMENT '检测项目名称'
	) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='检测项目';
--	附件
--	create table attachement(
--		id,
--		name,
--		typ --文件类型
--	) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='附件';

-- 检测计划
create table b_inspect_plan(
	`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
	inspect_scheme_id int(11) COMMENT '流水号(检测方案id)',
	inspect_plan_item_id  int(11) COMMENT '检测方案-检测项目关联表id',
	inspect_method_id int(11) COMMENT '检测方法id',
	user_id int(11) COMMENT '检测负责人id',
	equipment_id int(11) COMMENT '检测设备id',
	start_time date,
	end_time date,
	marjor_user_id int(11) COMMENT '主检人id(需要关联取电话)',
	assistant_user_id int(11) COMMENT '副检人id(需要关联取电话)',
	note varchar(128) COMMENT '备注'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='检测计划';
--	检测方法
		create table b_inspect_method(
    		`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    		`name` varchar(128) DEFAULT NULL COMMENT '检测项目名称'
    	) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='检测项目';
--	检测项目-检测方法关联表
	create table b_r_inspect_item_method(
		`id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
		item_id int(11) NOT NULL COMMENT '检测项目id',
		method_id int(11) NOT NULL COMMENT '检测方法id'
	) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='检测项目-检测方法关联表';


-- 数据这里需要讨论
create table b_inspect_data(
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `PRG` varchar(128) DEFAULT NULL COMMENT '工程:(编号和工程名称)',
  `STZH` varchar(128) DEFAULT NULL COMMENT '桩号:(数字)',
  `DevNB` varchar(128) DEFAULT NULL COMMENT '设备编号数据:(字符和数字)',
  `PRS` varchar(128) DEFAULT NULL COMMENT '压力',
  `HZJC` varchar(128) DEFAULT NULL COMMENT '荷载',
  `WYJC` varchar(128) DEFAULT NULL COMMENT '位移,(1#:     ,2#:     3#,)',
  `GPS` varchar(128) DEFAULT NULL COMMENT 'GPS信息( xxx.xxxxxxx,xxx.xxxxxxx,经纬度)',
  `Devstr` varchar(128) DEFAULT NULL COMMENT '设备类型代号(GZM,JZCS,FCJC,等,后续添加)',
  `Time` varchar(128) DEFAULT NULL COMMENT '数据上传时间(YYYY-MM-DD-HH-MM)',
  `QJX` varchar(128) DEFAULT NULL COMMENT '倾角数据QJX,',
  `NDSJ` varchar(128) DEFAULT NULL COMMENT '挠度数据NDSJ',
  `DevST` tinyint DEFAULT NULL COMMENT '设备状态0:,1:,2:,3:'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='传感器原始数据';

  /*Data for the table `t_business_config` */

insert  into `t_business_config`(`CONF_ID`,`CONF_NAME`,`CONF_CONTEXT`,`CONF_DESC`,`UPDATE_TIME`,`ADMIN_NAME`,`DATA_VER_FLAG`) values ('RATE_ALYPAY','支付宝渠道费率','6','支付宝渠道费率，单位&permil;','2016-06-01 14:14:25','admin',1),('RATE_BAIDUPAY','百度支付渠道费率','3','百度支付渠道费率，单位&permil;','2016-06-01 14:15:55','admin',2),('RATE_UNIONPAY','银联渠道费率','8','银联渠道费率，单位&permil;','2016-06-01 14:17:20','admin',2),('RATE_WEIXIN','微信支付渠道费率','3','微信支付渠道费率，单位&permil;','2016-06-01 14:16:22','zhaoqiaoning',2),('VERIFICATIONCODE_TIMEOUT','短信验证码超时时间','5','单位为分钟(最大为20)','2016-06-01 14:23:04','admin',1);


/*Data for the table `t_online` */


/*Data for the table `t_resource` */

insert  into `t_resource`(`ID`,`ICON`,`NAME`,`REMARK`,`SEQ`,`URL`,`PID`,`TRESOURCETYPE_ID`) values ('0eeb6e4a-5900-41e1-8026-bd8a3b35df8b','wrench','系统参数管理','',4,'/systemConfigController/manager','xtgl','1'),('105f9e02-0c0d-4bd4-92ea-2a35079a8c5a',NULL,'站点管理删除','',3,'/tagController/delete','200ee674-e4b4-4c6e-be8f-3b61cc147150','2'),('1127f1c9-df69-4637-9680-f597ef7fa423',NULL,'巡更计划修改页面','',5,'/patrolPlanController/editPage','ec2840db-5e25-4743-b699-f50ed3e6c791','2'),('1e3c419b-204a-4a61-af77-1699da10d737',NULL,'巡更计划修改','',2,'/patrolPlanController/edit','ec2840db-5e25-4743-b699-f50ed3e6c791','2'),('200ee674-e4b4-4c6e-be8f-3b61cc147150','folderlink','巡更站点管理','',1,'/tagController/manager','3c403869-e149-4b1d-b03e-8c509f659644','1'),('25a6df1d-69a0-4a05-b600-d893ee8898e5','folderlink','巡更人员管理','',4,'/patrolPersonController/manager','3c403869-e149-4b1d-b03e-8c509f659644','1'),('298313bc-9c8c-4457-a9f7-b270f4d4b2f2',NULL,'巡更计划添加页面','',4,'/patrolPlanController/addPage','ec2840db-5e25-4743-b699-f50ed3e6c791','2'),('37fc2e08-9bba-4fe3-a3dd-3a5cde265dab','folderlink','巡更路线修改','',2,'/patrolRouteController/editPage','a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7','2'),('3c403869-e149-4b1d-b03e-8c509f659644','folder09','巡更管理','',4,'',NULL,'1'),('3ec341d3-e4f5-42b6-b3a6-f9b05d314387','folderlink','巡更任务详情','',2,'/patrolTaskController/search','410582bb-7ca2-43b9-ae95-d8cb3c833405','2'),('40d98aa9-6621-4aa3-8c3d-daa991c95285',NULL,'人员管理修改','',2,'/patrolPersonController/edit','25a6df1d-69a0-4a05-b600-d893ee8898e5','2'),('410582bb-7ca2-43b9-ae95-d8cb3c833405','folderlink','巡更任务管理','',4,'/patrolTaskController/manager','3c403869-e149-4b1d-b03e-8c509f659644','1'),('6bd6b64d-f394-49d3-9793-fa5ac41d0658','folderlink','系统操作日志','',1,'/userlogController/manager','833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3','1'),('6c6f6e82-ae0d-4481-8dcb-c9dd0bc1bc61',NULL,'巡更计划删除','',3,'/patrolPlanController/delete','ec2840db-5e25-4743-b699-f50ed3e6c791','2'),('6dfa0a5a-14a2-4f81-8858-8e1bd4030417',NULL,'站点管理添加','',1,'/tagController/add','200ee674-e4b4-4c6e-be8f-3b61cc147150','2'),('6dfa66d1-3ed8-4dd4-825e-e21f7eae3a4c',NULL,'站点管理添加','',4,'/tagController/addPage','200ee674-e4b4-4c6e-be8f-3b61cc147150','2'),('704ba7bc-3717-436f-bba0-24ae1e901e58',NULL,'人员管理添加','',1,'/patrolPersonController/add','25a6df1d-69a0-4a05-b600-d893ee8898e5','2'),('71c58564-ac29-4681-a55c-4dd61349f2fe','wrench','系统参数修改','',2,'/systemConfigController/editPage','0eeb6e4a-5900-41e1-8026-bd8a3b35df8b','2'),('7d82e9ea-2711-4fe9-ac64-f142d8d9b81a',NULL,'人员管理删除','',3,'/patrolPersonController/delete','25a6df1d-69a0-4a05-b600-d893ee8898e5','2'),('8097abd8-e20b-47d9-b3a7-d4a5cd73caef',NULL,'站点管理修改','',5,'/tagController/editPage','200ee674-e4b4-4c6e-be8f-3b61cc147150','2'),('833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3','folder09','日志管理','',3,'',NULL,'1'),('87bd5cf0-3071-46e9-8b9f-be80e9db1f11','wrench','重置用户密码','',4,'/userController/resetPwd','yhgl','2'),('89699dcf-7a15-4c11-8799-a4e1e39f1cca','folderlink','巡更任务删除','',2,'/patrolTaskController/delete','410582bb-7ca2-43b9-ae95-d8cb3c833405','2'),('8ecd66a3-e5a1-4dd3-baa7-f017fc50dc60','wrench','系统参数添加','',1,'/systemConfigController/addPage','0eeb6e4a-5900-41e1-8026-bd8a3b35df8b','2'),('a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7','folderlink','巡更路线管理','',2,'/patrolRouteController/manager','3c403869-e149-4b1d-b03e-8c509f659644','1'),('ad457a51-7a25-4288-b37d-686cc8e32a8d','folderlink','巡更路线添加','',1,'/patrolRouteController/addPage','a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7','2'),('af341173-02a8-44d8-8a38-95a492fb7f90',NULL,'站点管理修改','',2,'/tagController/edit','200ee674-e4b4-4c6e-be8f-3b61cc147150','2'),('bff4bb97-2d90-4104-a463-06be60d2174b',NULL,'人员管理修改','',5,'/patrolPersonController/editPage','25a6df1d-69a0-4a05-b600-d893ee8898e5','2'),('c6229b60-bcdd-4302-84c2-8c49614ee00b','folderlink','查看系统操作日志详情','',1,'/userlogController/search','6bd6b64d-f394-49d3-9793-fa5ac41d0658','2'),('c86bf4a0-1767-4da6-a0fc-07242c180b67','wrench','系统参数删除','',3,'/systemConfigController/delete','0eeb6e4a-5900-41e1-8026-bd8a3b35df8b','2'),('e2f124a1-7256-4fc2-a4ef-a6f8da21d813',NULL,'人员管理添加','',4,'/patrolPersonController/addPage','25a6df1d-69a0-4a05-b600-d893ee8898e5','2'),('e7465120-7f19-4e0e-bf96-23a5239171a0','folderlink','巡更路线删除','',3,'/patrolRouteController/delete','a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7','2'),('e83effde-6a73-4a32-9269-27a63ef1ba73','folderlink','巡更任务修改','',1,'/patrolTaskController/editPage','410582bb-7ca2-43b9-ae95-d8cb3c833405','2'),('ec2840db-5e25-4743-b699-f50ed3e6c791','folderlink','巡更计划管理','',3,'/patrolPlanController/manager','3c403869-e149-4b1d-b03e-8c509f659644','1'),('ff4ce28d-c5c1-4322-92a2-7680fe2513c4',NULL,'巡更计划添加','',1,'/patrolPlanController/add','ec2840db-5e25-4743-b699-f50ed3e6c791','2'),('jsgl','tux','角色管理',NULL,2,'/roleController/manager','xtgl','1'),('jsglAdd','wrench','添加角色','',1,'/roleController/addPage','jsgl','2'),('jsglDelete','wrench','删除角色','',3,'/roleController/delete','jsgl','2'),('jsglEdit','wrench','编辑角色','',2,'/roleController/editPage','jsgl','2'),('jsglGrant','wrench','角色授权','',4,'/roleController/grantPage','jsgl','2'),('sjygl','server_database','数据源管理',NULL,5,'/druidController/druid','xtgl','1'),('xtgl','plugin','系统管理',NULL,0,NULL,NULL,'1'),('yhgl','status_online','用户管理',NULL,3,'/userController/manager','xtgl','1'),('yhglAdd','wrench','添加用户','',1,'/userController/addPage','yhgl','2'),('yhglDelete','wrench','删除用户','',3,'/userController/delete','yhgl','2'),('yhglEdit','wrench','编辑用户','',2,'/userController/editPage','yhgl','2'),('zygl','database_gear','资源管理','管理系统中所有的菜单或功能',1,'/resourceController/manager','xtgl','1'),('zyglAdd','wrench','添加资源','',1,'/resourceController/addPage','zygl','2'),('zyglDelete','wrench','删除资源','',3,'/resourceController/delete','zygl','2'),('zyglEdit','wrench','编辑资源','',2,'/resourceController/editPage','zygl','2');


/*Data for the table `t_resource_type` */

insert  into `t_resource_type`(`ID`,`NAME`) values ('1','菜单'),('2','功能');


/*Data for the table `t_role` */

insert  into `t_role`(`ID`,`NAME`,`REMARK`,`SEQ`,`PID`) values ('0','超管','超级管理员角色，拥有系统中所有的资源访问权限',0,NULL),('38bfae60-e840-4471-b2d8-b1f9a1801899','业务管理','',NULL,NULL),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','数据源管理','',NULL,NULL),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','最高权限','',NULL,NULL),('guest','Guest','只拥有只看的权限',1,NULL);


/*Data for the table `t_role_tresource` */

insert  into `t_role_tresource`(`TROLE_ID`,`TRESOURCE_ID`) values ('0','0eeb6e4a-5900-41e1-8026-bd8a3b35df8b'),('0','1127f1c9-df69-4637-9680-f597ef7fa423'),('0','1e3c419b-204a-4a61-af77-1699da10d737'),('0','298313bc-9c8c-4457-a9f7-b270f4d4b2f2'),('0','6bd6b64d-f394-49d3-9793-fa5ac41d0658'),('0','6c6f6e82-ae0d-4481-8dcb-c9dd0bc1bc61'),('0','71c58564-ac29-4681-a55c-4dd61349f2fe'),('0','833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3'),('0','87bd5cf0-3071-46e9-8b9f-be80e9db1f11'),('0','8ecd66a3-e5a1-4dd3-baa7-f017fc50dc60'),('0','c6229b60-bcdd-4302-84c2-8c49614ee00b'),('0','c86bf4a0-1767-4da6-a0fc-07242c180b67'),('0','ec2840db-5e25-4743-b699-f50ed3e6c791'),('0','ff4ce28d-c5c1-4322-92a2-7680fe2513c4'),('0','jsgl'),('0','jsglAdd'),('0','jsglDelete'),('0','jsglEdit'),('0','jsglGrant'),('0','sjygl'),('0','xtgl'),('0','yhgl'),('0','yhglAdd'),('0','yhglDelete'),('0','yhglEdit'),('0','zygl'),('0','zyglAdd'),('0','zyglDelete'),('0','zyglEdit'),('38bfae60-e840-4471-b2d8-b1f9a1801899','105f9e02-0c0d-4bd4-92ea-2a35079a8c5a'),('38bfae60-e840-4471-b2d8-b1f9a1801899','200ee674-e4b4-4c6e-be8f-3b61cc147150'),('38bfae60-e840-4471-b2d8-b1f9a1801899','25a6df1d-69a0-4a05-b600-d893ee8898e5'),('38bfae60-e840-4471-b2d8-b1f9a1801899','3c403869-e149-4b1d-b03e-8c509f659644'),('38bfae60-e840-4471-b2d8-b1f9a1801899','40d98aa9-6621-4aa3-8c3d-daa991c95285'),('38bfae60-e840-4471-b2d8-b1f9a1801899','6dfa0a5a-14a2-4f81-8858-8e1bd4030417'),('38bfae60-e840-4471-b2d8-b1f9a1801899','6dfa66d1-3ed8-4dd4-825e-e21f7eae3a4c'),('38bfae60-e840-4471-b2d8-b1f9a1801899','704ba7bc-3717-436f-bba0-24ae1e901e58'),('38bfae60-e840-4471-b2d8-b1f9a1801899','7d82e9ea-2711-4fe9-ac64-f142d8d9b81a'),('38bfae60-e840-4471-b2d8-b1f9a1801899','8097abd8-e20b-47d9-b3a7-d4a5cd73caef'),('38bfae60-e840-4471-b2d8-b1f9a1801899','af341173-02a8-44d8-8a38-95a492fb7f90'),('38bfae60-e840-4471-b2d8-b1f9a1801899','bff4bb97-2d90-4104-a463-06be60d2174b'),('38bfae60-e840-4471-b2d8-b1f9a1801899','e2f124a1-7256-4fc2-a4ef-a6f8da21d813'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','105f9e02-0c0d-4bd4-92ea-2a35079a8c5a'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','1127f1c9-df69-4637-9680-f597ef7fa423'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','1e3c419b-204a-4a61-af77-1699da10d737'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','200ee674-e4b4-4c6e-be8f-3b61cc147150'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','25a6df1d-69a0-4a05-b600-d893ee8898e5'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','298313bc-9c8c-4457-a9f7-b270f4d4b2f2'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','3c403869-e149-4b1d-b03e-8c509f659644'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','40d98aa9-6621-4aa3-8c3d-daa991c95285'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','6c6f6e82-ae0d-4481-8dcb-c9dd0bc1bc61'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','6dfa0a5a-14a2-4f81-8858-8e1bd4030417'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','6dfa66d1-3ed8-4dd4-825e-e21f7eae3a4c'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','704ba7bc-3717-436f-bba0-24ae1e901e58'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','7d82e9ea-2711-4fe9-ac64-f142d8d9b81a'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','8097abd8-e20b-47d9-b3a7-d4a5cd73caef'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','af341173-02a8-44d8-8a38-95a492fb7f90'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','bff4bb97-2d90-4104-a463-06be60d2174b'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','e2f124a1-7256-4fc2-a4ef-a6f8da21d813'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','ec2840db-5e25-4743-b699-f50ed3e6c791'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','ff4ce28d-c5c1-4322-92a2-7680fe2513c4'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','sjygl'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','0eeb6e4a-5900-41e1-8026-bd8a3b35df8b'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','105f9e02-0c0d-4bd4-92ea-2a35079a8c5a'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','1127f1c9-df69-4637-9680-f597ef7fa423'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','1e3c419b-204a-4a61-af77-1699da10d737'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','200ee674-e4b4-4c6e-be8f-3b61cc147150'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','25a6df1d-69a0-4a05-b600-d893ee8898e5'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','298313bc-9c8c-4457-a9f7-b270f4d4b2f2'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','37fc2e08-9bba-4fe3-a3dd-3a5cde265dab'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','3c403869-e149-4b1d-b03e-8c509f659644'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','3ec341d3-e4f5-42b6-b3a6-f9b05d314387'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','40d98aa9-6621-4aa3-8c3d-daa991c95285'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','410582bb-7ca2-43b9-ae95-d8cb3c833405'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','6bd6b64d-f394-49d3-9793-fa5ac41d0658'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','6c6f6e82-ae0d-4481-8dcb-c9dd0bc1bc61'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','6dfa0a5a-14a2-4f81-8858-8e1bd4030417'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','6dfa66d1-3ed8-4dd4-825e-e21f7eae3a4c'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','704ba7bc-3717-436f-bba0-24ae1e901e58'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','71c58564-ac29-4681-a55c-4dd61349f2fe'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','7d82e9ea-2711-4fe9-ac64-f142d8d9b81a'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','8097abd8-e20b-47d9-b3a7-d4a5cd73caef'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','87bd5cf0-3071-46e9-8b9f-be80e9db1f11'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','89699dcf-7a15-4c11-8799-a4e1e39f1cca'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','8ecd66a3-e5a1-4dd3-baa7-f017fc50dc60'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','ad457a51-7a25-4288-b37d-686cc8e32a8d'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','af341173-02a8-44d8-8a38-95a492fb7f90'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','bff4bb97-2d90-4104-a463-06be60d2174b'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','c6229b60-bcdd-4302-84c2-8c49614ee00b'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','c86bf4a0-1767-4da6-a0fc-07242c180b67'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','e2f124a1-7256-4fc2-a4ef-a6f8da21d813'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','e7465120-7f19-4e0e-bf96-23a5239171a0'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','e83effde-6a73-4a32-9269-27a63ef1ba73'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','ec2840db-5e25-4743-b699-f50ed3e6c791'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','ff4ce28d-c5c1-4322-92a2-7680fe2513c4'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','jsgl'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','jsglAdd'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','jsglDelete'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','jsglEdit'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','jsglGrant'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','sjygl'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','xtgl'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','yhgl'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','yhglAdd'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','yhglDelete'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','yhglEdit'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','zygl'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','zyglAdd'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','zyglDelete'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','zyglEdit'),('guest','0eeb6e4a-5900-41e1-8026-bd8a3b35df8b'),('guest','105f9e02-0c0d-4bd4-92ea-2a35079a8c5a'),('guest','1127f1c9-df69-4637-9680-f597ef7fa423'),('guest','1e3c419b-204a-4a61-af77-1699da10d737'),('guest','200ee674-e4b4-4c6e-be8f-3b61cc147150'),('guest','25a6df1d-69a0-4a05-b600-d893ee8898e5'),('guest','298313bc-9c8c-4457-a9f7-b270f4d4b2f2'),('guest','37fc2e08-9bba-4fe3-a3dd-3a5cde265dab'),('guest','3c403869-e149-4b1d-b03e-8c509f659644'),('guest','3ec341d3-e4f5-42b6-b3a6-f9b05d314387'),('guest','40d98aa9-6621-4aa3-8c3d-daa991c95285'),('guest','410582bb-7ca2-43b9-ae95-d8cb3c833405'),('guest','6bd6b64d-f394-49d3-9793-fa5ac41d0658'),('guest','6c6f6e82-ae0d-4481-8dcb-c9dd0bc1bc61'),('guest','6dfa0a5a-14a2-4f81-8858-8e1bd4030417'),('guest','6dfa66d1-3ed8-4dd4-825e-e21f7eae3a4c'),('guest','704ba7bc-3717-436f-bba0-24ae1e901e58'),('guest','71c58564-ac29-4681-a55c-4dd61349f2fe'),('guest','7d82e9ea-2711-4fe9-ac64-f142d8d9b81a'),('guest','8097abd8-e20b-47d9-b3a7-d4a5cd73caef'),('guest','833eb4c0-2f00-4e9c-b5a2-9f4935a4c5c3'),('guest','87bd5cf0-3071-46e9-8b9f-be80e9db1f11'),('guest','89699dcf-7a15-4c11-8799-a4e1e39f1cca'),('guest','8ecd66a3-e5a1-4dd3-baa7-f017fc50dc60'),('guest','a7d7c1ff-0c4a-4e5e-a7ea-013c91a8bce7'),('guest','ad457a51-7a25-4288-b37d-686cc8e32a8d'),('guest','af341173-02a8-44d8-8a38-95a492fb7f90'),('guest','bff4bb97-2d90-4104-a463-06be60d2174b'),('guest','c6229b60-bcdd-4302-84c2-8c49614ee00b'),('guest','c86bf4a0-1767-4da6-a0fc-07242c180b67'),('guest','e2f124a1-7256-4fc2-a4ef-a6f8da21d813'),('guest','e7465120-7f19-4e0e-bf96-23a5239171a0'),('guest','e83effde-6a73-4a32-9269-27a63ef1ba73'),('guest','ec2840db-5e25-4743-b699-f50ed3e6c791'),('guest','ff4ce28d-c5c1-4322-92a2-7680fe2513c4'),('guest','jsgl'),('guest','xtgl'),('guest','yhgl'),('guest','zygl');


/*Data for the table `t_system_config` */

insert  into `t_system_config`(`CONF_ID`,`CONF_NAME`,`CONF_CONTEXT`,`CONF_DESC`,`UPDATE_TIME`,`ADMIN_NAME`,`DATA_VER_FLAG`) values ('MAIL_NOTIFICATION','账户锁定后是否邮件通知','1','1:开启   0:关闭','2016-01-11 13:19:06','admin',1),('OPERATE_TIMEOUT','用户操作超时时间','20','单位为分钟(最大为180)，用户超过规定时间不操作将自动退出','2016-01-11 13:20:04','liyunxia',2),('REMAINING_LOGINS','账户剩余登录次数','5','允许用户每天连续输入密码的错误次数','2016-01-11 13:21:51','admin',1),('TO_ADDRESS','账户锁定后邮件接收人邮箱','liyx@bjleisen.com',NULL,'2016-01-11 13:20:54','admin',1);

/*Data for the table `t_user` */

insert  into `t_user`(`ID`,`CREATEDATETIME`,`EMAIL`,`LOCK_SYMBOL`,`MODIFYDATETIME`,`NAME`,`PWD`,`REMAINING_LOGINS`,`VALIDDATETIME`) values ('0','2015-12-25 11:19:51','zhangzq@bjleisen.com',0,NULL,'admin','5B42403537626463656162:30DE21804EA6806A325E4A708172D50C51DEE323FA9987DFE8B0DBD4C3E17BE8',5,NULL),('451f140b-d1b2-4607-b6c2-31ede8e48daa','2015-12-25 11:44:17','zhangzq@bjleisen.com',0,'2016-03-07 10:30:44','zhangziqi','5B42403431346435343762:72F4AE8102E281B79B452B79BF1465D26AC62EC237DEE97523656192BB73C9FF',5,'2019-12-31'),('5b072f38-6f61-40d2-93bc-27ae64cecb07','2016-05-25 16:34:08','fanpp@bjleisen.com',0,'2016-05-25 16:36:02','fanpanpan','5B42403232323238653438:5284C7367BE6CCDE50CE4F9EEF42F75F35C75EC71177E75B0565954C73BC839D',5,NULL),('5b4c01ff-7be0-4eff-84b1-b7ddfdcf45fe','2016-06-23 15:06:43','ningzy@bjleisen.com',0,'2016-06-23 15:07:26','ningzhaoyun','5B424034313761396339:FC711358BDE7CA4DFBDF3ACC05D2A27F247EB796A82122750E55E3516F5851C1',5,NULL),('676a82b0-aeb7-4570-a7b9-cfbdbca130d8','2016-07-26 09:22:28','liyx@bjleisen.com',0,'2016-07-26 09:25:01','zhaoqiaoning','5B424039623133666631:7529B4F95654ACDCAF039DC46BCBE581AEA6D66309FAA98487EB38D5D14E2195',5,NULL),('8d619a6e-ba32-4e29-8759-0d361a9d2ecc','2016-03-07 13:08:20','chenjp@bjleisen.com',0,'2016-03-07 13:10:37','chenjinpeng','5B42403438363165343337:DB215BF0B3F41E929D121358D671E816B6209E2474BCB074A9ACA335AD2A23DC',5,NULL),('a51139b5-bf94-4576-a0d3-bf60f297433d','2016-05-23 17:06:57','linjw@bjleisen.com',0,'2016-05-23 17:21:43','linjingwu','5B424062353738343939:606785DFD25071816C2D8337AB5A2CE9D8838AF95C0AD884DF8721AAA08FC67A',5,NULL),('af23f125-9d12-4aec-9d96-ea518d19bf86','2015-12-28 17:44:01','zhangxh@bjleisen.com',0,'2016-08-18 14:07:44','zhangxiaohui','5B42403537626463656162:30DE21804EA6806A325E4A708172D50C51DEE323FA9987DFE8B0DBD4C3E17BE8',5,NULL),('ca232b3b-7d5a-4859-884f-32e16beeb4e3','2016-03-07 14:20:58','chenjp@bjleisen.com',0,'2016-08-24 13:33:33','chenjp','5B42403537626463656162:30DE21804EA6806A325E4A708172D50C51DEE323FA9987DFE8B0DBD4C3E17BE8',5,NULL),('ca5a9f16-b040-4c7f-b76b-85886bf7ef01','2016-05-06 11:23:14','hanxk@bjleisen.com',0,'2016-05-06 11:23:37','hanxk','5B42403630333934626665:B4961A75957A5E5973CC29DCD44AEC2BD56049CB2547B1995314174B2A38C484',5,NULL),('e2bb3f51-1b3c-4797-9d4c-f5118fedf805','2016-07-19 17:33:14','songzq@bjleisen.com',0,'2016-07-21 10:52:06','songzhiqiang','5B424035333839643633:6E1E32F1FC3B6A27527F4B008644A37F0BC981BEF422B02E30F76642D75B0E26',5,NULL),('f6dd51df-b9c8-49a3-95ff-be3304ec829e','2015-12-28 16:55:32','liyx@bjleisen.com',0,'2016-07-26 09:30:18','liyunxia','5B42403734386266653135:3869CED78FCA9955C41A7A0FCD608553551B1EB07B6A6D9E95D2243C27F81F98',5,NULL),('fd6bd97a-2eb9-4d2a-95a4-d81cf8a2607e','2016-01-15 16:18:51','mamz@bjleisen.com',0,'2016-01-15 16:22:54','mamingzhi','5B42403334363637356239:A2EA5A0A8F9822082A5381ED1CB536447E061902ED4A5501D1F375B80417067A',5,NULL),('guest','2015-12-25 11:19:51','zhangzq@bjleisen.com',0,'2015-12-27 12:05:28','guest','5B42403537626463656162:30DE21804EA6806A325E4A708172D50C51DEE323FA9987DFE8B0DBD4C3E17BE8',5,NULL);


/*Data for the table `t_user_trole` */

insert  into `t_user_trole`(`TROLE_ID`,`TUSER_ID`) values ('0','0'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','0'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','0'),('guest','0'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','451f140b-d1b2-4607-b6c2-31ede8e48daa'),('38bfae60-e840-4471-b2d8-b1f9a1801899','5b072f38-6f61-40d2-93bc-27ae64cecb07'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','5b072f38-6f61-40d2-93bc-27ae64cecb07'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','5b072f38-6f61-40d2-93bc-27ae64cecb07'),('guest','5b072f38-6f61-40d2-93bc-27ae64cecb07'),('38bfae60-e840-4471-b2d8-b1f9a1801899','5b4c01ff-7be0-4eff-84b1-b7ddfdcf45fe'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','5b4c01ff-7be0-4eff-84b1-b7ddfdcf45fe'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','5b4c01ff-7be0-4eff-84b1-b7ddfdcf45fe'),('guest','5b4c01ff-7be0-4eff-84b1-b7ddfdcf45fe'),('38bfae60-e840-4471-b2d8-b1f9a1801899','676a82b0-aeb7-4570-a7b9-cfbdbca130d8'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','676a82b0-aeb7-4570-a7b9-cfbdbca130d8'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','676a82b0-aeb7-4570-a7b9-cfbdbca130d8'),('guest','676a82b0-aeb7-4570-a7b9-cfbdbca130d8'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','8d619a6e-ba32-4e29-8759-0d361a9d2ecc'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','a51139b5-bf94-4576-a0d3-bf60f297433d'),('38bfae60-e840-4471-b2d8-b1f9a1801899','af23f125-9d12-4aec-9d96-ea518d19bf86'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','af23f125-9d12-4aec-9d96-ea518d19bf86'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','af23f125-9d12-4aec-9d96-ea518d19bf86'),('guest','af23f125-9d12-4aec-9d96-ea518d19bf86'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','ca232b3b-7d5a-4859-884f-32e16beeb4e3'),('38bfae60-e840-4471-b2d8-b1f9a1801899','ca5a9f16-b040-4c7f-b76b-85886bf7ef01'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','ca5a9f16-b040-4c7f-b76b-85886bf7ef01'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','ca5a9f16-b040-4c7f-b76b-85886bf7ef01'),('guest','ca5a9f16-b040-4c7f-b76b-85886bf7ef01'),('38bfae60-e840-4471-b2d8-b1f9a1801899','e2bb3f51-1b3c-4797-9d4c-f5118fedf805'),('61de65bf-ced1-4cb9-be0e-27962a8e2a73','e2bb3f51-1b3c-4797-9d4c-f5118fedf805'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','e2bb3f51-1b3c-4797-9d4c-f5118fedf805'),('guest','e2bb3f51-1b3c-4797-9d4c-f5118fedf805'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','f6dd51df-b9c8-49a3-95ff-be3304ec829e'),('guest','f6dd51df-b9c8-49a3-95ff-be3304ec829e'),('734d68bf-3a81-47cb-927a-1d6a31f97b5d','fd6bd97a-2eb9-4d2a-95a4-d81cf8a2607e'),('guest','guest');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
