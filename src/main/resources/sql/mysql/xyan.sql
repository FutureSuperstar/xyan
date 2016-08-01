/*
Navicat MySQL Data Transfer

Source Server         : xyan
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : xyan

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-08-01 22:28:56
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
  `PRODUCE1` varchar(2550) DEFAULT NULL COMMENT '介绍1',
  `READ_COUNT` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  `COMMENT_COUNT` int(11) NOT NULL DEFAULT '0' COMMENT '评论次数',
  `PRODUCE2` varchar(2550) DEFAULT NULL COMMENT '介绍2',
  `IMG_URL` varchar(255) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章（博客）';

-- ----------------------------
-- Records of xy_article
-- ----------------------------
INSERT INTO `xy_article` VALUES ('1', 'Web之路，经历了心酸之后', '<p>清理电脑里的时候，看到以前专业课的作业。看修改日期最早的一个压缩包还是06年的，7年的时间就这样过去了，这3年的学习成果就是这电脑里面的7个压缩包。</p>\r\n<p>“什么是母校？母校就是那个你一天骂他八遍却不许别人骂一遍的地方”当听到不少学弟学妹在抱怨学校差的时候，至今我也没后悔过，因为我经历了我认为最苦的那一段时期。</p><p>校园时代总是美好的，少男少女，纵情欢笑。<br></p><p><br></p>', '1', '2016-05-10 10:15:12', '2016-08-01 21:46:47', '99999', 'web,心酸', '<p>清理电脑里的时候，看到以前专业课的作业。看修改日期最早的一个压缩包还是06年的，7年的时间就这样过去了，这3年的学习成果就是这电脑里面的7个压缩包。</p>', '123', '224', '<p>“什么是母校？母校就是那个你一天骂他八遍却不许别人骂一遍的地方”当听到不少学弟学妹在抱怨学校差的时候，至今我也没后悔过，因为我经历了我认为最苦的那一段时期。</p>', '/xyan/attach/viewPic?path=2016-08-01&name=02.jpg');
INSERT INTO `xy_article` VALUES ('12', '实验成功！', '<p>呵呵哒<br></p><p><img src=\"/xyan/attach/viewPic?path=2016-06-13&name=2509619467090254.jpg\" alt=\"mm1\" style=\"max-width:100%;\"></p><p><br></p>', '1', '2016-06-07 15:55:15', '2016-08-01 21:47:32', '99997', '', '起风了，早上开始热闹了。', '1', '1', '人们忙着欢笑', '/xyan/attach/viewPic?path=2016-08-01&name=03.jpg');
INSERT INTO `xy_article` VALUES ('13', '生活总是会不经意的撩起往事', '<p>浮生往事，一起。<br></p>', '1', '2016-06-07 15:57:15', '2016-08-01 21:48:14', '99999', '', '往事如雨', '1', '1', '浮沉', '/xyan/attach/viewPic?path=2016-08-01&name=39efac717c2c9e9f23a5f01e8979e5597df10ffabe95-FM3nxU_fw658.jpg');
INSERT INTO `xy_article` VALUES ('14', '正则表达式集合', '<strong>一、校验数字的表达式</strong><p><img style=\"max-width:100%;\" src=\"http://p1.pstatp.com/large/7fc000340e0f4fe0b57\"></p><strong>二、校验字符的表达式<br><img style=\"max-width:100%;\" src=\"http://p3.pstatp.com/large/7fc000340ff43420eeb\"><br></strong><strong>三、特殊需求表达式</strong><p><img style=\"max-width:100%;\" src=\"http://p3.pstatp.com/large/7fc000341457d2f3cce\"></p><p><img style=\"max-width:100%;\" src=\"http://p3.pstatp.com/large/7f900033f7b8e976067\"></p><p><br></p>', '1', '2016-06-17 14:30:42', '2016-06-17 14:31:55', '99997', '', '', '1', '1', '', '/xyan/attach/viewPic?path=2016-06-17&name=mm1.jpg');
INSERT INTO `xy_article` VALUES ('15', '离职的感言', '<p>什么也么有啊</p>', '1', '2016-07-27 21:53:41', '2016-07-27 21:53:41', '99999', '无聊啊,你好说', '这是一个快速流转的社会', '1', '1', '', '/xyan/attach/viewPic?path=2016-07-27&name=8c1271fc5a8d12814f6aa2560539969d737394a1fb27-CBEKph_fw658.jpg');

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
-- Records of xy_article_type
-- ----------------------------
INSERT INTO `xy_article_type` VALUES ('2', 'n', '9998');
INSERT INTO `xy_article_type` VALUES ('3', '前端博客', '99998');
INSERT INTO `xy_article_type` VALUES ('99997', '闲言碎语', '0');
INSERT INTO `xy_article_type` VALUES ('99998', '技术探讨', '0');
INSERT INTO `xy_article_type` VALUES ('99999', '慢生活', '0');

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
-- Records of xy_code
-- ----------------------------
INSERT INTO `xy_code` VALUES ('ArticleModel', '15');
INSERT INTO `xy_code` VALUES ('ArticleTypeModel', '3');
INSERT INTO `xy_code` VALUES ('LogModel', '14');
INSERT INTO `xy_code` VALUES ('PageModel', '425');
INSERT INTO `xy_code` VALUES ('ResourceModel', '45');
INSERT INTO `xy_code` VALUES ('TestModel', '2');

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
-- Records of xy_head
-- ----------------------------

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
-- Records of xy_job
-- ----------------------------
INSERT INTO `xy_job` VALUES ('1', 'test1', 'xxx', '1', '0/5 * * * * ?', 'http://tieba.baidu.com/f?kw=%E6%9D%8E%E6%AF%85&ie=utf-8');
INSERT INTO `xy_job` VALUES ('2', 'test2', 'xxx', '1', '0/5 * * * * ?', 'http://tieba.baidu.com/f?kw=%E6%9D%8E%E6%AF%85&ie=utf-8');
INSERT INTO `xy_job` VALUES ('3', 'test3', 'xxx', '1', '0/5 * * * * ?', 'http://tieba.baidu.com/f?kw=%E6%9D%8E%E6%AF%85&ie=utf-8');
INSERT INTO `xy_job` VALUES ('4', 'test4', 'xxx', '1', '0/5 * * * * ?', 'http://tieba.baidu.com/f?kw=%E6%9D%8E%E6%AF%85&ie=utf-8');
INSERT INTO `xy_job` VALUES ('5', 'test5', 'xxx', '1', '0/5 * * * * ?', 'http://tieba.baidu.com/f?kw=%E6%9D%8E%E6%AF%85&ie=utf-8');

-- ----------------------------
-- Table structure for xy_log
-- ----------------------------
DROP TABLE IF EXISTS `xy_log`;
CREATE TABLE `xy_log` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `LOG_DATE` datetime DEFAULT NULL COMMENT 'log时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '记录内容',
  `LOG_TYPE` varchar(3) DEFAULT NULL COMMENT '日志类别',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xy_log
-- ----------------------------
INSERT INTO `xy_log` VALUES ('2', '2016-06-13 16:41:05', '10.60.140.98【访问】/xyan/', 'LV');
INSERT INTO `xy_log` VALUES ('3', '2016-06-13 16:41:06', '10.60.140.98【访问】/xyan/index', 'LV');
INSERT INTO `xy_log` VALUES ('4', '2016-06-13 16:41:06', '10.60.140.98【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('5', '2016-06-13 16:41:06', '10.60.140.98【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('6', '2016-06-13 16:41:06', '10.60.140.98【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('7', '2016-06-13 16:42:22', '10.60.140.98【访问】/xyan/page/500', 'LV');
INSERT INTO `xy_log` VALUES ('8', '2016-06-13 16:43:27', '10.60.140.98【访问】/xyan/admin/index', 'LV');
INSERT INTO `xy_log` VALUES ('9', '2016-06-13 16:43:35', '10.60.140.98【访问】/xyan/admin/authority/role', 'LV');
INSERT INTO `xy_log` VALUES ('10', '2016-06-13 16:43:36', '10.60.140.98【访问】/xyan/admin/authority/role', 'LV');
INSERT INTO `xy_log` VALUES ('11', '2016-06-13 16:43:40', '10.60.140.98【访问】/xyan/admin/article', 'LV');
INSERT INTO `xy_log` VALUES ('12', '2016-06-13 16:43:41', '10.60.140.98【访问】/xyan/admin/article/pageData', 'LV');

-- ----------------------------
-- Table structure for xy_mail
-- ----------------------------
DROP TABLE IF EXISTS `xy_mail`;
CREATE TABLE `xy_mail` (
  `ID` bigint(20) NOT NULL,
  `TO_USER` varchar(255) DEFAULT NULL COMMENT '目标,多个的时候用,隔开',
  `FROM_USER` varchar(255) DEFAULT NULL COMMENT '发送者，本系统为默认',
  `CONTENT` text COMMENT '内容',
  `SUBJECT` varchar(255) DEFAULT NULL COMMENT '主题',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件';

-- ----------------------------
-- Records of xy_mail
-- ----------------------------
INSERT INTO `xy_mail` VALUES ('123123', '', null, null, null);

-- ----------------------------
-- Table structure for xy_message
-- ----------------------------
DROP TABLE IF EXISTS `xy_message`;
CREATE TABLE `xy_message` (
  `ID` bigint(11) NOT NULL COMMENT '主键',
  `SOURCE` bigint(255) NOT NULL COMMENT '发自',
  `DEST` bigint(20) DEFAULT NULL COMMENT '目标，公共发言为-1',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息';

-- ----------------------------
-- Records of xy_message
-- ----------------------------

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
-- Records of xy_page
-- ----------------------------

-- ----------------------------
-- Table structure for xy_resource
-- ----------------------------
DROP TABLE IF EXISTS `xy_resource`;
CREATE TABLE `xy_resource` (
  `ID` bigint(20) NOT NULL,
  `PID` bigint(20) NOT NULL COMMENT '父级ID',
  `RESOURCE_NAME` varchar(50) NOT NULL COMMENT '资源名称',
  `RESOURCE_ICON` varchar(200) DEFAULT NULL COMMENT '图标',
  `RESOURCE_URL` varchar(50) DEFAULT NULL COMMENT '资源地址',
  `AVAILABLE` varchar(1) DEFAULT '1' COMMENT '是否可用，1 可用 0 不可用',
  `PERMISSION` varchar(30) DEFAULT NULL COMMENT '权限字符串',
  `ICON_BACK` varchar(200) DEFAULT NULL COMMENT '菜单后面的图标',
  `RESOURCE_TYPE` varchar(2) DEFAULT NULL COMMENT '资源类别',
  `RESOURCE_LEVEL` int(11) DEFAULT NULL COMMENT '层级',
  `LEAF` varchar(255) DEFAULT NULL COMMENT '是否叶子节点',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统资源表';

-- ----------------------------
-- Records of xy_resource
-- ----------------------------
INSERT INTO `xy_resource` VALUES ('1', '-1', '控制台', '<i class=\"icon-dashboard\"></i>', '/admin/index', '1', 'admin:index', '', 'RM', '1', '0');
INSERT INTO `xy_resource` VALUES ('3', '-1', '权限管理', '<i class=\"icon-certificate\"></i>', '', '1', '', '', 'RM', '1', '0');
INSERT INTO `xy_resource` VALUES ('4', '3', '资源', '', '', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('5', '3', '角色', '', '', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('6', '-1', '文章管理', '', '', '0', '', '', 'RM', '1', '1');
INSERT INTO `xy_resource` VALUES ('7', '-1', 'UI组件', '<i class=\"icon-desktop\"></i>', '', '1', 'xxx', '<b class=\"arrow icon-angle-down\"></b>', 'RM', '1', '0');
INSERT INTO `xy_resource` VALUES ('8', '7', '组件', '', '', '0', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('9', '7', '树菜单', '', '', '0', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('10', '7', '三级菜单', '', '', '0', '', '', 'RM', '2', '0');
INSERT INTO `xy_resource` VALUES ('11', '7', 'jQueryUI', '', '', '0', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('12', '10', '第一级', '<i class=\"icon-leaf\"></i>', '', '0', '', '', 'RM', '3', '1');
INSERT INTO `xy_resource` VALUES ('13', '10', '第四级', '<i class=\"icon-pencil\"></i>', '', '0', '', '<b class=\"arrow icon-angle-down\"></b>', 'RM', '3', '0');
INSERT INTO `xy_resource` VALUES ('14', '13', '添加产品', '<i class=\"icon-plus\"></i>', '', '1', '', '', 'RM', '4', '1');
INSERT INTO `xy_resource` VALUES ('15', '13', '查看商品', '<i class=\"icon-eye-open\"></i>', '', '1', '', '', 'RM', '4', '1');
INSERT INTO `xy_resource` VALUES ('16', '-1', '文字排版', '<i class=\"icon-text-width\"></i>', '/admin/typography', '1', 'xxx', '', 'RM', '1', '1');
INSERT INTO `xy_resource` VALUES ('17', '-1', '表格', '<i class=\"icon-list\"></i>', '', '1', '222', '<b class=\"arrow icon-angle-down\"></b>', 'RM', '1', '0');
INSERT INTO `xy_resource` VALUES ('18', '-1', '表单', '<i class=\"icon-edit\"></i>', '', '1', '', '', 'RM', '1', '0');
INSERT INTO `xy_resource` VALUES ('19', '-1', '插件', '<i class=\"icon-list-alt\"></i>', '', '1', '', '', 'RM', '1', '1');
INSERT INTO `xy_resource` VALUES ('20', '-1', '日历', '<i class=\"icon-calendar\"></i>', '/admin/calendar', '1', '', '', 'RM', '1', '1');
INSERT INTO `xy_resource` VALUES ('21', '-1', '相册', '<i class=\"icon-picture\"></i>', '/admin/gallery', '1', '', '', 'RM', '1', '1');
INSERT INTO `xy_resource` VALUES ('22', '-1', '更多页面', '<i class=\"icon-tag\"></i>', '', '1', '', '<b class=\"arrow icon-angle-down\"></b>', 'RM', '1', '0');
INSERT INTO `xy_resource` VALUES ('23', '-1', '其它页面<span class=\"badge badge-primary \">5</span>', '<i class=\"icon-file-alt\"></i>', '', '1', '', '<b class=\"arrow icon-angle-down\"></b>', 'RM', '1', '0');
INSERT INTO `xy_resource` VALUES ('24', '23', '帮助', '', '/admin/faq', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('26', '23', '404错误页面', '', '/admin/error-404', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('28', '23', '500错误页面', '', '/admin/error-500', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('29', '23', '网格', '', '/admin/grid', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('30', '23', '空白页面', '', '/admin/blank', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('31', '22', '用户信息', '', '/admin/profile', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('32', '22', '收件箱', '', '/admin/inbox', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('34', '22', '售价单', '', '/admin/pricing', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('35', '22', '购物车', '', '/admin/invoice', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('36', '22', '时间轴', '', '/admin/timeline', '1', '', '', 'RM', '2', '1');
INSERT INTO `xy_resource` VALUES ('37', '22', '登陆&注册', '', '/admin/login', '1', '', '', null, '2', '1');
INSERT INTO `xy_resource` VALUES ('38', '17', '简单&动态', '', '/admin/tables', '1', 'rrr', '', null, '2', '1');
INSERT INTO `xy_resource` VALUES ('39', '17', 'jqGrid plugin', '', '/admin/jqgrid', '1', '', '', null, '2', '1');
INSERT INTO `xy_resource` VALUES ('40', '18', '表单组件', '', '/admin/form-elements', '1', '', '', null, '2', '1');
INSERT INTO `xy_resource` VALUES ('41', '18', '向导提示 & 验证', '', '/admin/form-wizard', '1', '', '', null, '2', '1');
INSERT INTO `xy_resource` VALUES ('42', '18', '编辑器', '', '', '1', '', '', null, '2', '1');
INSERT INTO `xy_resource` VALUES ('43', '18', '文件上传', '', '', '1', '', '', null, '2', '1');
INSERT INTO `xy_resource` VALUES ('44', '7', '按钮&图表', '', '/admin/buttons', '1', '', '', null, '2', '1');
INSERT INTO `xy_resource` VALUES ('45', '7', '可拖拽列表', '', '/admin/nestable-list', '1', '', '', null, '2', '1');

-- ----------------------------
-- Table structure for xy_role
-- ----------------------------
DROP TABLE IF EXISTS `xy_role`;
CREATE TABLE `xy_role` (
  `ID` bigint(20) NOT NULL,
  `ROLE_NAME` varchar(50) NOT NULL COMMENT '角色名称',
  `PID` bigint(20) NOT NULL COMMENT '父级ID',
  `LEVEL` int(11) DEFAULT NULL COMMENT '层级',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- ----------------------------
-- Records of xy_role
-- ----------------------------

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
-- Records of xy_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for xy_statement
-- ----------------------------
DROP TABLE IF EXISTS `xy_statement`;
CREATE TABLE `xy_statement` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='闲言碎语';

-- ----------------------------
-- Records of xy_statement
-- ----------------------------
INSERT INTO `xy_statement` VALUES ('999', '生活总是在不经意之间给你惊喜', '宠辱不惊，咸淡适闻', '2016-06-16 15:26:32', '2016-06-16 15:26:35');
INSERT INTO `xy_statement` VALUES ('1000', '人生自有多痴情', '不必眷念，亦不必怀念', '2016-06-16 17:16:41', '2016-06-16 17:16:45');

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
-- Records of xy_test
-- ----------------------------
INSERT INTO `xy_test` VALUES ('1', '测试');
INSERT INTO `xy_test` VALUES ('2', '测试');

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
  `LOCK_TIME` int(11) DEFAULT '0' COMMENT '锁次数',
  `LOCK_DATE` datetime DEFAULT NULL COMMENT '锁日期',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of xy_user
-- ----------------------------
INSERT INTO `xy_user` VALUES ('1', '王明', '5F1D7A84DB00D2FCE00B31A7FC73224F', '123456', '1255321142@qq.com', '18136442251', 'admin', '0', '2016-07-30 22:16:18');

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

-- ----------------------------
-- Records of xy_user_role
-- ----------------------------
