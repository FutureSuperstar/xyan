/*
Navicat MySQL Data Transfer

Source Server         : xyan
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : xyan

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-05-26 16:57:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xy_article
-- ----------------------------
DROP TABLE IF EXISTS `xy_article`;
CREATE TABLE `xy_article` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `TITLE` varchar(255) NOT NULL COMMENT '标题',
  `CONTENT` text COMMENT '内容',
  `USER_ID` bigint(20) NOT NULL COMMENT '作者',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime NOT NULL COMMENT '最后修改时间',
  `TYPE_ID` bigint(20) DEFAULT NULL COMMENT '类型',
  `KEY_WORD` varchar(255) DEFAULT NULL COMMENT '关键词（多个用，隔开）',
  `PRODUCE1` varchar(255) DEFAULT NULL COMMENT '介绍1',
  `READ_COUNT` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `COMMENT_COUNT` int(11) NOT NULL DEFAULT '0' COMMENT '评论次数',
  `PRODUCE2` varchar(255) DEFAULT NULL COMMENT '介绍2',
  `IMG_URL` varchar(255) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章（博客）';

-- ----------------------------
-- Table structure for xy_article_type
-- ----------------------------
DROP TABLE IF EXISTS `xy_article_type`;
CREATE TABLE `xy_article_type` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `NAME` varchar(255) NOT NULL COMMENT '名称',
  `PID` bigint(20) NOT NULL COMMENT '父级ID(根为-1)',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xy_code
-- ----------------------------
DROP TABLE IF EXISTS `xy_code`;
CREATE TABLE `xy_code` (
  `MODEL_NAME` varchar(20) NOT NULL COMMENT '实体类名称',
  `VALUE` varchar(20) DEFAULT NULL COMMENT '主键值',
  PRIMARY KEY (`MODEL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主键生成表';

-- ----------------------------
-- Table structure for xy_head
-- ----------------------------
DROP TABLE IF EXISTS `xy_head`;
CREATE TABLE `xy_head` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `NAME` varchar(255) DEFAULT NULL COMMENT '头名称',
  `VALUE` varchar(255) DEFAULT NULL COMMENT '值',
  `PAGE_ID` bigint(11) DEFAULT NULL COMMENT '关联页面的ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xy_job
-- ----------------------------
DROP TABLE IF EXISTS `xy_job`;
CREATE TABLE `xy_job` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `JOB_NAME` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `JOB_GROUP` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `JOB_STATUS` varchar(255) DEFAULT NULL COMMENT '任务状态 0禁用 1启用 2删除',
  `CRON_EXPRESSION` varchar(255) DEFAULT NULL COMMENT '表达式',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Table structure for xy_log
-- ----------------------------
DROP TABLE IF EXISTS `xy_log`;
CREATE TABLE `xy_log` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `LOG_DATE` datetime DEFAULT NULL COMMENT 'log时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '记录内容',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xy_message
-- ----------------------------
DROP TABLE IF EXISTS `xy_message`;
CREATE TABLE `xy_message` (
  `ID` bigint(11) NOT NULL COMMENT '主键',
  `FROM` bigint(255) NOT NULL COMMENT '发自',
  `TO` bigint(20) DEFAULT NULL COMMENT '目标，公共发言为-1',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息';

-- ----------------------------
-- Table structure for xy_page
-- ----------------------------
DROP TABLE IF EXISTS `xy_page`;
CREATE TABLE `xy_page` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `URL` varchar(255) DEFAULT NULL COMMENT '抓取的url地址',
  `STATUS` int(11) DEFAULT NULL COMMENT '抓取的状态码',
  `RESULT` varchar(21500) DEFAULT NULL COMMENT '抓取到的页面内容',
  `GRAB_DATE` datetime DEFAULT NULL COMMENT '抓取时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抓取的页面';

-- ----------------------------
-- Table structure for xy_resource
-- ----------------------------
DROP TABLE IF EXISTS `xy_resource`;
CREATE TABLE `xy_resource` (
  `ID` bigint(20) NOT NULL,
  `PID` bigint(20) NOT NULL COMMENT '父级ID',
  `RESOURCE_NAME` varchar(50) NOT NULL COMMENT '资源名称',
  `ICON` varchar(50) DEFAULT NULL,
  `URL` varchar(50) DEFAULT NULL,
  `AVAILABLE` varchar(1) DEFAULT '1' COMMENT '是否可用，1 可用 0 不可用',
  `PERMISSION` varchar(30) DEFAULT NULL COMMENT '权限字符串',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源表';

-- ----------------------------
-- Table structure for xy_role
-- ----------------------------
DROP TABLE IF EXISTS `xy_role`;
CREATE TABLE `xy_role` (
  `ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(50) NOT NULL COMMENT '角色名称',
  `PID` bigint(20) NOT NULL COMMENT '父级ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Table structure for xy_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `xy_role_resource`;
CREATE TABLE `xy_role_resource` (
  `ID` bigint(20) NOT NULL,
  `RESOURCE_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源中间表';

-- ----------------------------
-- Table structure for xy_test
-- ----------------------------
DROP TABLE IF EXISTS `xy_test`;
CREATE TABLE `xy_test` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='测试表';

-- ----------------------------
-- Table structure for xy_user
-- ----------------------------
DROP TABLE IF EXISTS `xy_user`;
CREATE TABLE `xy_user` (
  `ID` bigint(255) NOT NULL COMMENT '主键',
  `USER_NAME` varchar(30) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(40) NOT NULL COMMENT '密码',
  `SALT` varchar(10) NOT NULL COMMENT '盐值',
  `EMAIL` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(15) DEFAULT NULL COMMENT '手机号',
  `LOGIN_NAME` varchar(30) NOT NULL COMMENT '登陆名',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for xy_user_role
-- ----------------------------
DROP TABLE IF EXISTS `xy_user_role`;
CREATE TABLE `xy_user_role` (
  `ID` bigint(20) NOT NULL,
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色中间表';
