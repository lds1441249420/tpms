/*
Navicat MySQL Data Transfer

Source Server         : MECHREV
Source Server Version : 50549
Source Host           : localhost:3306
Source Database       : tpms

Target Server Type    : MYSQL
Target Server Version : 50549
File Encoding         : 65001

Date: 2019-12-24 09:38:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for att_record
-- ----------------------------
DROP TABLE IF EXISTS `att_record`;
CREATE TABLE `att_record` (
  `att_id` int(11) NOT NULL AUTO_INCREMENT,
  `att_date` varchar(255) DEFAULT NULL,
  `att_time` varchar(255) DEFAULT NULL,
  `att_emp_id` int(11) DEFAULT NULL,
  `att_type` int(11) DEFAULT NULL,
  `att_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`att_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of att_record
-- ----------------------------
INSERT INTO `att_record` VALUES ('1', '2019-12-19', '07:55:20', '7', '0', 'am');
INSERT INTO `att_record` VALUES ('2', '2019-12-19', '07:55:25', '8', '0', 'am');
INSERT INTO `att_record` VALUES ('4', '2019-12-19', '08:00:00', '11', '1', 'am');
INSERT INTO `att_record` VALUES ('5', '2019-12-19', '08:00:01', '12', '1', 'am');
INSERT INTO `att_record` VALUES ('6', '2019-12-19', '12:00:01', '7', '2', 'pm');
INSERT INTO `att_record` VALUES ('7', '2019-12-19', '17:59:59', '8', '2', 'pm');
INSERT INTO `att_record` VALUES ('8', '2019-12-19', '18:00:00', '9', '0', 'pm');
INSERT INTO `att_record` VALUES ('9', '2019-12-19', '18:00:01', '10', '0', 'pm');
INSERT INTO `att_record` VALUES ('10', '2019-12-20', '07:56:00', '8', '0', 'am');
INSERT INTO `att_record` VALUES ('11', '2019-12-20', '18:20:32', '7', '0', 'pm');
INSERT INTO `att_record` VALUES ('27', '2019-12-22', '20:31:54', '7', '0', 'pm');
INSERT INTO `att_record` VALUES ('28', '2019-12-23', '07:43:16', '7', '0', 'am');
INSERT INTO `att_record` VALUES ('29', '2019-12-23', '07:43:43', '8', '0', 'am');
INSERT INTO `att_record` VALUES ('31', '2019-12-24', '09:37:04', '7', '1', 'am');

-- ----------------------------
-- Table structure for att_repair
-- ----------------------------
DROP TABLE IF EXISTS `att_repair`;
CREATE TABLE `att_repair` (
  `repair_id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_emp_id` int(11) DEFAULT NULL,
  `repair_emp_no` varchar(255) DEFAULT NULL,
  `repair_emp_real_name` varchar(255) DEFAULT NULL,
  `repair_dept_id` int(11) DEFAULT NULL,
  `repair_record_date` varchar(255) DEFAULT NULL,
  `repair_record_at` varchar(255) DEFAULT NULL,
  `repair_desc` varchar(255) DEFAULT NULL,
  `repair_status` int(10) DEFAULT NULL,
  PRIMARY KEY (`repair_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of att_repair
-- ----------------------------
INSERT INTO `att_repair` VALUES ('3', '7', '02002', '巴基·巴恩斯', '2', '2019-12-16', '上午缺卡', '出差', '1');
INSERT INTO `att_repair` VALUES ('5', '7', '02002', '巴基·巴恩斯', '2', '2019-12-17', '上午缺卡', '旷工实锤', '2');
INSERT INTO `att_repair` VALUES ('7', '7', '02002', '巴基·巴恩斯', '2', '2019-12-23', '下午缺卡', '系统管理员调整了时间', '0');
INSERT INTO `att_repair` VALUES ('8', '7', '02002', '巴基·巴恩斯', '2', '2019-12-16', '下午缺卡', '123', '1');
INSERT INTO `att_repair` VALUES ('10', '7', '02002', '巴基·巴恩斯', '2', '2019-12-18', '上午缺卡', '大哥饶我一次！', '2');
INSERT INTO `att_repair` VALUES ('11', '7', '02002', '巴基·巴恩斯', '2', '2019-12-18', '下午缺卡', '啥也没说', '0');

-- ----------------------------
-- Table structure for att_rest
-- ----------------------------
DROP TABLE IF EXISTS `att_rest`;
CREATE TABLE `att_rest` (
  `rest_id` int(11) NOT NULL AUTO_INCREMENT,
  `begin_day` varchar(255) DEFAULT NULL,
  `end_day` varchar(255) DEFAULT NULL,
  `rest_desc` varchar(255) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of att_rest
-- ----------------------------
INSERT INTO `att_rest` VALUES ('3', '2019-05-01', '2019-05-03', '劳动节', '2');
INSERT INTO `att_rest` VALUES ('9', '2019-05-01', '2019-05-02', '劳动节', '4');
INSERT INTO `att_rest` VALUES ('10', '2020-01-13', '2020-02-14', '放寒假', '2');

-- ----------------------------
-- Table structure for att_time
-- ----------------------------
DROP TABLE IF EXISTS `att_time`;
CREATE TABLE `att_time` (
  `dept_id` int(11) NOT NULL,
  `time_work` varchar(255) DEFAULT NULL,
  `time_off` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of att_time
-- ----------------------------
INSERT INTO `att_time` VALUES ('1', '09:00:00', '18:00:00');
INSERT INTO `att_time` VALUES ('2', '09:00:00', '18:00:00');
INSERT INTO `att_time` VALUES ('3', '09:00:00', '18:00:00');
INSERT INTO `att_time` VALUES ('4', '09:00:00', '17:00:00');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `dept_id` int(3) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) DEFAULT NULL,
  `emp_no` varchar(255) DEFAULT NULL,
  `dept_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '综合部', '01001', '干杂活');
INSERT INTO `dept` VALUES ('2', '财务部', '02001', '管钱');
INSERT INTO `dept` VALUES ('3', '销售部', '03001', '推销');
INSERT INTO `dept` VALUES ('4', '市场部', '04001', '发现商机');
INSERT INTO `dept` VALUES ('5', '开发部', '', '写代码');

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `emp_id` int(3) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `emp_no` varchar(255) NOT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `emp_sex` int(1) DEFAULT NULL,
  `emp_type` varchar(255) DEFAULT NULL,
  `d_id` int(3) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `FK_U_D` (`d_id`),
  CONSTRAINT `FK_U_D` FOREIGN KEY (`d_id`) REFERENCES `dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', '灵魂画手', 'd6e091e96f91d4d96c791d91483c9243', '99999', '斯坦·李', '1', 'super', null);
INSERT INTO `emp` VALUES ('2', '钢铁侠', '95cd0992aca0889e33d993ea2cf32d47', '01001', '托尼·斯塔克', '1', 'admin', '1');
INSERT INTO `emp` VALUES ('3', '黑寡妇', 'b09a07a512b1bf3b5389bf349356c62f', '01002', '娜塔莎·诺曼诺夫', '0', 'staff', '1');
INSERT INTO `emp` VALUES ('4', '幻视', '7d58951a4151ed55a6ce5ce54a9b65c5', '01003', '埃德温·贾维斯', '1', 'staff', '1');
INSERT INTO `emp` VALUES ('5', '黑豹', '74e1f41453e804649c9e4c9c9b507e43', '01005', '特查拉', '1', 'staff', '1');
INSERT INTO `emp` VALUES ('6', '美国队长', 'b2303197d9e2d846db6acb1bcdd41c01', '02001', '史蒂夫', '1', 'admin', '2');
INSERT INTO `emp` VALUES ('7', '冬日战士', 'fbbfeb070db15bc80628f7778d0cfcad', '02002', '巴基·巴恩斯', '1', 'staff', '2');
INSERT INTO `emp` VALUES ('8', '绯红女巫', '77b77e6b2eb8aaf70855fdc02b3aa70c', '02003', '旺达·马克西莫夫', '0', 'staff', '2');
INSERT INTO `emp` VALUES ('9', '鹰眼', 'ecb8931cde9672153f86caf2b8c6eee0', '02004', '克林特·巴顿', '1', 'staff', '2');
INSERT INTO `emp` VALUES ('10', '雷神', '220da1f4924a51635f62d1413b837ce5', '03001', '索尔·奥丁森', '1', 'admin', '3');
INSERT INTO `emp` VALUES ('11', '诡计之神', '9d0458030e88190737da43bc4581019b', '03002', '洛基', '1', 'staff', '3');
INSERT INTO `emp` VALUES ('12', '女武神', '3cd6d6b6f1794d3e2abd3c141a9cf9eb', '03003', '瓦尔基里', '0', 'staff', '3');
INSERT INTO `emp` VALUES ('13', '绿巨人', '4f42b1de1876bd62c79fce1a22bc14eb', '03004', '布鲁斯·班纳', '1', 'staff', '3');
INSERT INTO `emp` VALUES ('14', '星爵', '329d762844583314cf1d6f1997d13d54', '04001', '彼得·奎尔', '1', 'admin', '4');
INSERT INTO `emp` VALUES ('15', '卡魔拉', 'da60f12aca8ab1ab55493bc70fc1c309', '04002', '小葛', '0', 'staff', '4');
INSERT INTO `emp` VALUES ('16', '火箭浣熊', 'e965b5f66ed0da7591e283f370734695', '04003', '浣熊', '1', 'staff', '4');
INSERT INTO `emp` VALUES ('17', '毁灭者', '185165bf3018ee28dc084d4e733ede36', '04004', '亚瑟·德拉克斯', '1', 'staff', '4');

-- ----------------------------
-- Table structure for leave
-- ----------------------------
DROP TABLE IF EXISTS `leave`;
CREATE TABLE `leave` (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_emp_id` int(11) DEFAULT NULL,
  `leave_emp_real_name` varchar(255) DEFAULT NULL,
  `leave_dept_id` int(11) DEFAULT NULL,
  `leave_begin` varchar(255) DEFAULT NULL,
  `leave_end` varchar(255) DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `leave_desc` varchar(255) DEFAULT NULL,
  `approval` int(1) DEFAULT NULL,
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave
-- ----------------------------
INSERT INTO `leave` VALUES ('3', '7', '巴基·巴恩斯', '2', '2019-12-24', '2019-12-24', '病假', '感冒发烧', '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `pid` int(2) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '个人信息', '0', 'super', null);
INSERT INTO `menu` VALUES ('2', '部门管理', '0', 'super', null);
INSERT INTO `menu` VALUES ('3', '编辑个人信息', '1', 'super', '/show/showEditInfo');
INSERT INTO `menu` VALUES ('4', '修改密码', '1', 'super', '/show/showUpdatePwd');
INSERT INTO `menu` VALUES ('5', '所有部门', '2', 'super', '/dept/selAllDept');
INSERT INTO `menu` VALUES ('6', '新增部门', '2', 'super', '/show/showAddDept');
INSERT INTO `menu` VALUES ('7', '设置部门管理员', '2', 'super', '/show/showAppoint');
INSERT INTO `menu` VALUES ('8', '个人信息', '0', 'admin', null);
INSERT INTO `menu` VALUES ('9', '添加员工', '2', 'super', '/show/showAddEmp');
INSERT INTO `menu` VALUES ('16', '编辑个人信息', '8', 'admin', '/show/showEditInfo');
INSERT INTO `menu` VALUES ('17', '修改密码', '8', 'admin', '/show/showUpdatePwd');
INSERT INTO `menu` VALUES ('18', '员工信息管理', '0', 'admin', null);
INSERT INTO `menu` VALUES ('19', '员工查询', '18', 'admin', '/emp/selAllEmpBydId');
INSERT INTO `menu` VALUES ('20', '新增员工', '18', 'admin', '/show/showAddEmp');
INSERT INTO `menu` VALUES ('21', '考勤时间管理', '0', 'admin', '');
INSERT INTO `menu` VALUES ('22', '上下班时间设置', '21', 'admin', '/show/showSetWorkTime');
INSERT INTO `menu` VALUES ('24', '查看休息日', '21', 'admin', '/att/selAllRestByDeptId');
INSERT INTO `menu` VALUES ('25', '员工签到情况', '0', 'admin', null);
INSERT INTO `menu` VALUES ('26', '本日签到情况', '25', 'admin', '/att/selRecordByDate');
INSERT INTO `menu` VALUES ('29', '员工补签审批', '30', 'admin', '/show/showRepairExamine');
INSERT INTO `menu` VALUES ('30', '审批', '0', 'admin', null);
INSERT INTO `menu` VALUES ('32', '个人信息', '0', 'staff', null);
INSERT INTO `menu` VALUES ('33', '编辑个人信息', '32', 'staff', '/show/showEditInfo');
INSERT INTO `menu` VALUES ('34', '修改密码', '32', 'staff', '/show/showUpdatePwd');
INSERT INTO `menu` VALUES ('35', '签到', '0', 'staff', null);
INSERT INTO `menu` VALUES ('36', '打卡', '35', 'staff', '/show/showAttend');
INSERT INTO `menu` VALUES ('37', '补签申请', '35', 'staff', '/show/showRepair');
INSERT INTO `menu` VALUES ('38', '请假', '0', 'staff', null);
INSERT INTO `menu` VALUES ('39', '我的请假', '38', 'staff', '/show/showLeave');
INSERT INTO `menu` VALUES ('40', '申请请假', '38', 'staff', '/show/showAddLeave');
INSERT INTO `menu` VALUES ('43', '请假审批', '30', 'admin', '/show/showLeaveExamine');
INSERT INTO `menu` VALUES ('45', '新增休息日', '21', 'admin', '/show/showAddRest');
