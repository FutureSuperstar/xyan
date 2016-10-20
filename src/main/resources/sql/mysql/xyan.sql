/*
Navicat MySQL Data Transfer

Source Server         : xyan
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : xyan

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-10-20 14:34:35
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
INSERT INTO `xy_article` VALUES ('1', 'Web之路，经历了心酸之后', '<p>清理电脑里的时候，看到以前专业课的作业。看修改日期最早的一个压缩包还是06年的，7年的时间就这样过去了，这3年的学习成果就是这电脑里面的7个压缩包。</p>\r\n<p>“什么是母校？母校就是那个你一天骂他八遍却不许别人骂一遍的地方”当听到不少学弟学妹在抱怨学校差的时候，至今我也没后悔过，因为我经历了我认为最苦的那一段时期。</p><p>校园时代总是美好的，少男少女，纵情欢笑。<br></p><p><br></p>', '1', '2016-05-10 10:15:12', '2016-10-19 15:40:17', '99999', 'web,心酸', '<p>清理电脑里的时候，看到以前专业课的作业。看修改日期最早的一个压缩包还是06年的，7年的时间就这样过去了，这3年的学习成果就是这电脑里面的7个压缩包。</p>', '123', '224', '<p>“什么是母校？母校就是那个你一天骂他八遍却不许别人骂一遍的地方”当听到不少学弟学妹在抱怨学校差的时候，至今我也没后悔过，因为我经历了我认为最苦的那一段时期。</p>', '/img/2016-10-19/638eda10-eb84-4857-8f9b-08095ca28f0b.jpg');
INSERT INTO `xy_article` VALUES ('14', '正则表达式集合', '<strong>一、校验数字的表达式</strong><p><img style=\"max-width:100%;\" src=\"http://p1.pstatp.com/large/7fc000340e0f4fe0b57\"></p><strong>二、校验字符的表达式<br><img style=\"max-width:100%;\" src=\"http://p3.pstatp.com/large/7fc000340ff43420eeb\"><br></strong><strong>三、特殊需求表达式</strong><p><img style=\"max-width:100%;\" src=\"http://p3.pstatp.com/large/7fc000341457d2f3cce\"></p><p><img style=\"max-width:100%;\" src=\"http://p3.pstatp.com/large/7f900033f7b8e976067\"></p><p><br></p>', '1', '2016-06-17 14:30:42', '2016-10-19 15:33:07', '99997', '', '', '1', '1', '', '/img/2016-10-19/f1a22019440f9cfc7d3984a537a7719900f55fd57e18f-bJurIE_fw658.png');
INSERT INTO `xy_article` VALUES ('15', '感言', '<p>什么也么有啊</p>', '1', '2016-07-27 21:53:41', '2016-10-19 15:32:39', '99999', '无聊啊,你好说', '这是一个快速流转的社会', '1', '1', '', '/img/2016-10-19/image-1.jpg');
INSERT INTO `xy_article` VALUES ('17', '孙允珠', '<p><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=47550782800201463.jpg\" alt=\"567b5d831bc8e0f50c000090_640\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=4401975850036871.png\" alt=\"5cce509787000baaa06edea21eb60c5272d5d8cca8cd4-EVD8QL_fw658\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=05989625891640804.jpg\" alt=\"5b1f3abaa4f067b87ad124a40ed0820b7426ab9646d1b-3HZret_fw658\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=5949647366025395.png\" alt=\"baaeff3617faf77442048287c4d977b0bd73f86b84cd4-VxUZju_fw658\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=31085409660851004.png\" alt=\"6a7d23342c8b3319d9bf742eec745a68515e062f6a2b6-K0lrB7_fw658\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=6457376527389597.png\" alt=\"f1a22019440f9cfc7d3984a537a7719900f55fd57e18f-bJurIE_fw658\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=3832520199305778.png\" alt=\"bcf76844d370aff9bcf97a7f5816339bf34959eb7cf99-3ndWJE_fw658\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=9748525276530429.png\" alt=\"1e84ab70300d2f310942f6f79ac7ed9f06063a0671798-5CXdyR_fw658\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=6906515154307121.jpg\" alt=\"9f7124e810ed80b2f2921d5612905b5d8ee25dd34c930-2sDPBW_fw658\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=7321776415451398.png\" alt=\"bec0fec611a8a3e4f2be31ca21d39ffc2110ef885af9a-DHmzkQ_fw658\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=4785769866185494.jpg\" alt=\"77d664161c9d48792cd11a83f23b835523d0982a43ef3-SEJkbM_fw658\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=4701028876792944.jpeg\" alt=\"20150728131238_ZV5Jr\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-20&name=4502976770163809.jpg\" alt=\"37d12f2eb9389b50c1aa27708135e5dde7116ebf\" style=\"max-width:100%;\"></p><p><br></p>', '1', '2016-10-20 14:03:42', '2016-10-20 14:26:47', '6', '美女,孙允珠', '美女就是养眼，看起来舒服。', '1', '1', '', '/img/2016-10-20/5de301d0-166c-4fab-9c93-a0f8ff643e33.jpg');

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
INSERT INTO `xy_article_type` VALUES ('4', '后端分享', '99998');
INSERT INTO `xy_article_type` VALUES ('5', '2016年十月', '-1');
INSERT INTO `xy_article_type` VALUES ('6', '美女', '99997');
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
INSERT INTO `xy_code` VALUES ('ArticleModel', '17');
INSERT INTO `xy_code` VALUES ('ArticleTypeModel', '6');
INSERT INTO `xy_code` VALUES ('DictModel', '14');
INSERT INTO `xy_code` VALUES ('LogModel', '1576');
INSERT INTO `xy_code` VALUES ('MailModel', '4');
INSERT INTO `xy_code` VALUES ('MessageModel', '82');
INSERT INTO `xy_code` VALUES ('PageModel', '425');
INSERT INTO `xy_code` VALUES ('ResourceModel', '45');
INSERT INTO `xy_code` VALUES ('TestModel', '2');

-- ----------------------------
-- Table structure for xy_dict
-- ----------------------------
DROP TABLE IF EXISTS `xy_dict`;
CREATE TABLE `xy_dict` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  `TYPE` varchar(255) DEFAULT NULL COMMENT '类别',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='归档';

-- ----------------------------
-- Records of xy_dict
-- ----------------------------
INSERT INTO `xy_dict` VALUES ('1', '201610', '2016年十月', 'GD');
INSERT INTO `xy_dict` VALUES ('2', '201609', '2016年九月', 'GD');
INSERT INTO `xy_dict` VALUES ('3', '201608', '2016年八月', 'GD');
INSERT INTO `xy_dict` VALUES ('4', '201607', '2016年七月', 'GD');
INSERT INTO `xy_dict` VALUES ('5', '201606', '2016年六月', 'GD');
INSERT INTO `xy_dict` VALUES ('6', '201605', '2016年五月', 'GD');

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
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `LOG_DATE` datetime DEFAULT NULL COMMENT 'log时间',
  `CONTENT` text COMMENT '记录内容',
  `LOG_TYPE` varchar(3) DEFAULT NULL COMMENT '日志类别',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xy_log
-- ----------------------------
INSERT INTO `xy_log` VALUES ('00338eee-fa83-488c-aee2-07421277ef4f', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\7321776415451398.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('00569e88-d484-4d6f-bb4a-2baf6abb9f6f', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('00625eb5-1f65-4db7-824a-3e872fded283', '2016-10-20 14:30:27', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('00b61fa8-ca64-405d-80d1-c5987a72393a', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\7321776415451398.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('022eebb3-d743-48cd-89dc-499edb819da3', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\4502976770163809.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('0271e452-ecb6-4c19-b522-049bb44358bf', '2016-10-20 14:27:54', '10.60.140.212【访问】/xyan/page/400', 'LV');
INSERT INTO `xy_log` VALUES ('0360667d-01e0-462a-ae98-e508fdb25477', '2016-10-20 14:30:29', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('05f86ed4-a1ea-4fc9-95f7-fbcff7d5c3f2', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('06ca6ea6-c40a-4896-b213-dc8a4005da84', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('0717716e-cbba-438e-8173-5a809891fccd', '2016-10-20 14:31:27', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('0832c604-e2d2-4609-a61c-40c05a59dcef', '2016-10-20 14:33:32', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('092c82c3-b804-4e86-be72-8809b1008668', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\9748525276530429.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('0a1221fb-fccd-4648-ba4f-e2abc8165413', '2016-10-20 14:27:05', '10.60.140.212【访问】/xyan/index', 'LV');
INSERT INTO `xy_log` VALUES ('0a2adf24-f7c5-4afb-8e90-e1dd308bdd4c', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\05989625891640804.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('0a9e9902-32fb-4ef0-9d72-c19aae8f21d5', '2016-10-20 14:16:59', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('0b62c9ac-78a5-4dcc-9785-895b0ec2ca6c', '2016-10-20 14:24:16', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('0b94913e-dad2-4b49-b398-923c47d0e41a', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\4401975850036871.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('0ba073d2-b2a0-423d-ae39-8d8cc2639542', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('0bccc4f9-562e-4607-b3b1-7f5a98aeb19e', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('0bd6e9da-a3f5-4107-b8ac-3df2ab8de790', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('0bd8fd86-3d68-4a5d-972c-b6605a4afff3', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\31085409660851004.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('0c186661-6904-4093-9766-56d3131aed69', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\4401975850036871.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('0c5d50c0-7768-4097-b665-6fdd4fbe9a11', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('0cbd04b1-7576-4fd8-af67-c9de3121bd28', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('0d035eb6-0a57-4c31-9059-89eb463810b6', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('0ef60908-ef1e-4c23-a966-d53557960f76', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\6906515154307121.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('1120bf72-64ed-40f8-a11e-cf0811283080', '2016-10-20 14:25:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('11d4a68d-5f79-4566-b065-ac814ae296ae', '2016-10-20 14:25:37', '【异常】d:\\tmp\\2016-10-20\\4401975850036871.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('13629e61-e300-4eaa-8fdd-6853e4b1ea3a', '2016-10-20 14:25:38', '【异常】d:\\tmp\\2016-10-20\\4785769866185494.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('13ea3752-363b-43fa-9791-4a1e2216f17f', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('13fdf669-1e56-40e1-aac9-818f1ea34f41', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\05989625891640804.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('15c6e88a-5940-4134-8d8b-6c22a0fbbccb', '2016-10-20 14:13:54', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('179fb806-2852-424a-b37e-c1a99370bbd6', '2016-10-20 14:33:32', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('19a9a1f3-d4bd-4669-bf80-360eb823d1d9', '2016-10-20 14:27:47', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('1b8287fb-b9e5-47c4-bea7-44adbf411be6', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\4785769866185494.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('1be835c8-c2fa-4896-a805-370f7cd70972', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('1c7ca485-2b8c-48ce-acf1-e66ffe049521', '2016-10-20 14:30:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('1cd73e4c-661a-48bf-9038-a2cbc132261e', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('1ce86613-489c-4b03-a77f-bebde80cc6a4', '2016-10-20 14:18:07', '10.60.140.212【访问】/xyan/index', 'LV');
INSERT INTO `xy_log` VALUES ('1e342c45-f327-4660-8bc9-1bcfd4642b67', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('1e34ac2f-535b-49d8-9bee-dc63cc09c537', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\7321776415451398.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('1f71f65a-9fce-4345-be85-16d637835759', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\4785769866185494.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('1fe4e3e9-2965-4683-813f-6c0612f3c0c5', '2016-10-20 14:33:32', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('202c79fe-872e-480a-ad99-c878030449f0', '2016-10-20 14:27:50', '10.60.140.212【访问】/xyan/blog/article', 'LV');
INSERT INTO `xy_log` VALUES ('2087476d-3fce-4e89-b239-c536ce30f19e', '2016-10-20 14:18:08', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('20a56c6a-85e3-4af8-8232-819b49d142f3', '2016-10-20 14:30:51', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('226f65e6-8aac-4c29-afc4-d399884b62e1', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\4502976770163809.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('22d7b55b-5031-4d0b-bbc0-17603ad410a3', '2016-10-20 14:24:44', '10.60.140.212【访问】/xyan/admin/article/dialog/open', 'LV');
INSERT INTO `xy_log` VALUES ('22f7cfe5-ec46-4dc5-8573-4cdbfe343c5e', '2016-10-20 14:25:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('230d37f4-36dd-407f-b2b1-d61c2993f09e', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\4701028876792944.jpeg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('23256c21-1b4d-4b6f-b22f-fb3b4e556909', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('23539e80-cd72-4eec-a7b6-29d2e7217c14', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('2358534f-8bb0-4672-9c59-633f832623f7', '2016-10-20 14:18:11', '10.60.140.212【访问】/xyan/page/400', 'LV');
INSERT INTO `xy_log` VALUES ('24d307dd-cb3a-415f-a3ec-cf134dbc9064', '2016-10-20 14:25:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('250bed70-fbeb-474e-8e58-13736e89082d', '2016-10-20 14:33:32', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('25630f3b-f58d-47c6-ab03-9982a671fd47', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\4701028876792944.jpeg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('2564f6bd-3d75-432a-92e9-c16302dc01ac', '2016-10-20 14:25:37', '【异常】d:\\tmp\\2016-10-20\\31085409660851004.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('25e05ada-6066-4806-ab93-c69bc661bb62', '2016-10-20 14:27:54', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('260ebe8b-00a4-4cc6-bb7d-e08cbae147b1', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('278a16b2-40c3-47c5-a2da-a48aa4f3b715', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\3832520199305778.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('27c78358-3654-4f57-a411-e56d39def6c6', '2016-10-20 14:24:10', '10.60.140.212【访问】/xyan/admin/gallery', 'LV');
INSERT INTO `xy_log` VALUES ('2837eaa7-2cb3-4429-97a3-69251e15ab02', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\6906515154307121.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('28e729ab-518f-4d4b-9630-95150f91447a', '2016-10-20 14:30:30', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('29b89312-484e-4990-b1dd-51d51ead0ee3', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('2a165245-a0b5-40c4-8e18-18e801c097f1', '2016-10-20 14:30:55', '10.60.140.212【访问】/xyan/admin/index', 'LV');
INSERT INTO `xy_log` VALUES ('2a6a4f28-8a99-49de-8c68-d53cfaca3f16', '2016-10-20 14:26:46', '10.60.140.212【访问】/xyan/attach/wangEditor/upload', 'LV');
INSERT INTO `xy_log` VALUES ('2b9e0333-9987-4bfe-a54c-aced0da24820', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('2c54021c-e90d-434c-99db-d9b408e9e5f6', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\31085409660851004.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('2cec9b67-7afe-44b5-b9f9-6f4c9ac0c46f', '2016-10-20 14:25:38', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('2d579859-3e1c-4288-99d2-7fd9cc7d46fb', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\5949647366025395.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('2ddcac09-476c-450c-a226-ba2a54c188a7', '2016-10-20 14:24:11', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('2ef1b70a-352f-48c0-b2ff-fa57b2ad5e11', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('2f3c415c-60fd-4f1a-a3d4-2c87dba58d70', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\3832520199305778.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('302ece45-c299-4b5e-9e51-5a6491b838fa', '2016-10-20 14:23:46', '10.60.140.212【访问】/xyan/blog/article/view/emotions.data', 'LV');
INSERT INTO `xy_log` VALUES ('30718ca8-faef-456c-b9a0-c25e3c4f0229', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\4701028876792944.jpeg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('30867646-d49e-44df-b1bf-8dabdf24c287', '2016-10-20 14:25:37', '【异常】d:\\tmp\\2016-10-20\\6457376527389597.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('30ebfce3-a1ec-4566-9fc0-6600327fa17a', '2016-10-20 14:17:16', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('3122c36f-3479-4eb5-b931-ad758f566cec', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('31e23854-0b8a-4a8f-892e-d01e91c063b8', '2016-10-20 14:23:44', '10.60.140.212【访问】/xyan/blog/article/view/17', 'LV');
INSERT INTO `xy_log` VALUES ('3205aa53-aaf8-4764-9ebb-9d2dfb2d3166', '2016-10-20 14:26:52', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('33e870f5-1752-4cd7-9709-84e628cdcced', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\6457376527389597.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('350b7bd3-002a-433d-9042-a7003aeb39f5', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\6457376527389597.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('352bf223-f938-440c-b00c-8ba2e8fb12ce', '2016-10-20 14:30:43', '10.60.140.212【访问】/xyan/admin/article', 'LV');
INSERT INTO `xy_log` VALUES ('36a31669-c834-4b05-8a6a-0c1738a05b98', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\6906515154307121.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('3757adcb-7319-4e1b-bb80-3e21f2804d0b', '2016-10-20 14:25:38', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('37c64941-5a8e-407c-a85a-e84cf6b208e3', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\9748525276530429.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('37ff79b1-78b2-415c-b1f9-0fb5c76b5a9c', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\05989625891640804.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('3ad32260-d829-49e1-a930-5bb556f21242', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('3af57e8c-52df-48a2-95b3-eab4a9811b3c', '2016-10-20 14:25:51', '10.60.140.212【访问】/xyan/admin/article/dialog/img', 'LV');
INSERT INTO `xy_log` VALUES ('3b2aafc9-378f-4558-a315-3116771842c8', '2016-10-20 14:14:31', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('3c6debe7-c967-4d8c-99cd-9cfda52c4206', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\5949647366025395.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('3ea851e1-b805-43b1-bc07-0be6ce782e8d', '2016-10-20 14:25:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('403eb11f-aa8a-45f9-9029-69d71c18a569', '2016-10-20 14:16:09', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('42f763d5-e44c-4180-b89f-f32aca769180', '2016-10-20 14:25:37', '【异常】d:\\tmp\\2016-10-20\\3832520199305778.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('431adfb1-4c51-4d86-bc39-a6e40f91b77d', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\6457376527389597.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('43653efa-2cb1-4f2d-b065-9c5070ca7051', '2016-10-20 14:30:43', '10.60.140.212【访问】/xyan/admin/article/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('43cab4ef-8a91-461d-b5ec-d542847aa587', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('44ae6f48-9f62-4bdb-abff-009ce85caf97', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\4502976770163809.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('45289cb5-641c-4b5b-ba50-a5007759336d', '2016-10-20 14:25:37', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('475ed68b-cc80-46a3-8014-e1c7b2049bca', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('47d349ce-b5ca-4600-b031-127200a8a539', '2016-10-20 14:16:59', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('4ab68de5-179a-42c2-a9c2-9925a743be85', '2016-10-20 14:30:25', '10.60.140.212【访问】/xyan/blog/talk', 'LV');
INSERT INTO `xy_log` VALUES ('4b19c5ec-38e1-469b-9f92-711b7e21bf46', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\4502976770163809.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('4b91fbac-3bfb-48ab-9e01-a0783ca6b7b0', '2016-10-20 14:33:50', '10.60.140.212【访问】/xyan/admin/gallery', 'LV');
INSERT INTO `xy_log` VALUES ('4bf2340a-790e-415c-a2ce-20294a6d4235', '2016-10-20 14:25:40', '10.60.140.212【访问】/xyan/admin/article/dialog/open', 'LV');
INSERT INTO `xy_log` VALUES ('4dc9bfea-2b03-4318-a252-308de877b902', '2016-10-20 14:14:11', '10.60.140.212【访问】/xyan/admin/widgets', 'LV');
INSERT INTO `xy_log` VALUES ('4eaa0efa-a972-4643-8ff9-749f6fa1ac06', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('4ed0c89e-384d-47ac-aa47-3ea3b3afa7d8', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\4785769866185494.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('4f19232e-0665-4921-baec-a3af82560eb5', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('4f2018c0-c864-4584-bda9-5792edbdb2d1', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('50671afe-2709-451f-a37e-56d64776e3f4', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('50b044fd-6e64-4246-9993-791a51bbefab', '2016-10-20 14:14:02', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('529476cf-fedf-4995-ba83-bc12b99adda3', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\4401975850036871.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('536487f9-368d-4776-8ef3-d37c3bab267e', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('53e5ea11-9022-4ee3-b569-e9eb2384515c', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('55168b73-d260-4bce-93da-64b7fda53a40', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\4502976770163809.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('56a7baed-fbf8-44c7-a013-a004e879d9ff', '2016-10-20 14:26:54', '10.60.140.212【访问】/xyan/', 'LV');
INSERT INTO `xy_log` VALUES ('575dab21-642c-4167-a46f-65e48c90025e', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\6457376527389597.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('579ef524-ba66-48e4-8ab6-0b100750e8d3', '2016-10-20 14:14:21', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('58becc9f-5161-4f0b-830d-06dc9b1c3d92', '2016-10-20 14:14:21', '10.60.140.212【访问】/xyan/admin/gallery', 'LV');
INSERT INTO `xy_log` VALUES ('58ea0c07-5669-43d9-af5d-3ecb8539b963', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('5a984c1c-69e4-47df-ac34-81a8b52c944c', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('5c373556-41fc-4ca3-accf-ef4b194d238e', '2016-10-20 14:30:44', '10.60.140.212【访问】/xyan/admin/preference', 'LV');
INSERT INTO `xy_log` VALUES ('5c774d67-0aba-45d9-aba4-d94611263d76', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('5cd49b78-d0f6-4762-96dd-e7aaa062f7b0', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('6196aad6-7b66-4efe-be3a-5f306b8c878c', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('621655f1-bcac-4e2a-97bc-04bf418cbb4c', '2016-10-20 14:24:10', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('62890d64-48d5-42c1-920a-db8d524cfe42', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('62d7e389-edf3-490f-b46e-7ebe89fd7f72', '2016-10-20 14:25:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('6315b8dd-9089-4663-b4fe-8efa4d3514b3', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('637e3df1-cd68-49d4-9548-2a0cc7a996d6', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\4401975850036871.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('63fbf2a0-8d46-4e98-8351-16222f26072d', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\47550782800201463.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('6530264b-7b63-4cd6-a57f-d7e868c87fc0', '2016-10-20 14:25:37', '【异常】d:\\tmp\\2016-10-20\\05989625891640804.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('65fbb723-8e03-4e86-abe7-0b83891405f1', '2016-10-20 14:30:51', '【异常】d:\\tmp\\2016-10-18\\8932863669185714.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('66cc415d-2f80-444c-bbce-586bcc7e7a1e', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('688ef669-495c-4072-b8a6-93eeebf51b15', '2016-10-20 14:18:11', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('68fd2f53-0237-4310-92ca-8900e608f13d', '2016-10-20 14:25:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('6ce52a79-b8fc-4344-922e-ea6a5712aef0', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\05989625891640804.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('6e49a45f-3623-49db-a298-a39cabe2a718', '2016-10-20 14:13:54', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('6e5f0ece-7347-4606-a4ff-c690b94b11ef', '2016-10-20 14:30:32', '10.60.140.212【访问】/xyan/blog/board', 'LV');
INSERT INTO `xy_log` VALUES ('6e6644aa-f316-4192-950c-0f6517fa384f', '2016-10-20 14:25:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('70915514-e1c2-4930-b5aa-085182560a8d', '2016-10-20 14:24:01', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('711c7488-8937-420a-8f3c-13402e9ff836', '2016-10-20 14:18:03', '10.60.140.212【访问】/xyan/blog/life', 'LV');
INSERT INTO `xy_log` VALUES ('712298b3-92be-4be3-8425-9c870f11925f', '2016-10-20 14:24:46', '10.60.140.212【访问】/xyan/admin/article/getChildren', 'LV');
INSERT INTO `xy_log` VALUES ('71d22a1e-ba7b-4411-b89e-65551feac110', '2016-10-20 14:25:37', '10.60.140.212【访问】/xyan/admin/article/edit', 'LV');
INSERT INTO `xy_log` VALUES ('71e3076d-dce4-4ec6-84c0-e5ff9c5e1bc5', '2016-10-20 14:30:48', '10.60.140.212【访问】/xyan/admin/article/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('72d5412b-9d6f-4d48-a7b9-dd2fa57c9c67', '2016-10-20 14:25:38', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('72dfbfc7-d259-4864-95b9-f1ff682e3e23', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('7411e62d-e5db-43ae-b3ba-ae40f6622e84', '2016-10-20 14:25:38', '【异常】d:\\tmp\\2016-10-20\\6906515154307121.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('741e83b1-239f-462a-88cf-6d90f8030c47', '2016-10-20 14:27:48', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('760688cc-1b33-407d-b115-770cee61ff87', '2016-10-20 14:23:46', '10.60.140.212【访问】/xyan/page/400', 'LV');
INSERT INTO `xy_log` VALUES ('76f43d64-7479-4bb3-be2e-96025ccefe8d', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\4785769866185494.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('772a1899-2245-4113-a78a-3d8c715371f9', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('773a075a-160e-4b52-a40f-f1fe9ec2d1db', '2016-10-20 14:18:11', '10.60.140.212【访问】/xyan/blog/article/view/emotions.data', 'LV');
INSERT INTO `xy_log` VALUES ('77748479-1288-4f96-8553-894419895b84', '2016-10-20 14:30:26', '10.60.140.212【访问】/xyan/blog/article', 'LV');
INSERT INTO `xy_log` VALUES ('783dabbc-9f36-484d-9df6-f5fdacbcafc4', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('7ac8c0fe-2dc7-439c-afc0-0da0bde8f59d', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('7b66b2b1-fc2c-4443-b679-337fadc45ee1', '2016-10-20 14:33:31', '10.60.140.212【访问】/xyan/admin/typography', 'LV');
INSERT INTO `xy_log` VALUES ('7cbb845c-b0e2-4e2f-a393-38dbfa854fb0', '2016-10-20 14:30:51', '10.60.140.212【访问】/xyan/admin/mail', 'LV');
INSERT INTO `xy_log` VALUES ('7dd50020-0a7e-470c-864d-f747a302c64c', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('7efc9767-cea8-44d4-9838-8fdc94a9c1c4', '2016-10-20 14:17:11', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('7f3b057b-dff5-4f9d-9a89-fe44cf9aed1d', '2016-10-20 14:17:11', '10.60.140.212【访问】/xyan/blog/life', 'LV');
INSERT INTO `xy_log` VALUES ('7fb0c5e0-b744-4c13-8b61-2906cdb01b23', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\4785769866185494.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('807acdbb-481f-4e4c-b4eb-978d40d67400', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('82a10a8d-5fec-4bb2-8ad8-b1cc875e5e3c', '2016-10-20 14:14:12', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('8350d186-eade-4edf-a50e-e2699574684d', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\7321776415451398.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('83b55396-8ca2-40db-81c2-3c615840d1ad', '2016-10-20 14:14:31', '10.60.140.212【访问】/xyan/admin/mail', 'LV');
INSERT INTO `xy_log` VALUES ('853c99cd-3642-4be8-8815-e88ed25708c5', '2016-10-20 14:18:07', '10.60.140.212【访问】/xyan/', 'LV');
INSERT INTO `xy_log` VALUES ('8564945c-b3de-4997-b50a-7c4950aa959b', '2016-10-20 14:30:48', '10.60.140.212【访问】/xyan/admin/article', 'LV');
INSERT INTO `xy_log` VALUES ('87a3e863-200f-458e-a8be-651db51fc81f', '2016-10-20 14:14:03', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('884fc066-49b8-4f10-b64e-d60ead0432c9', '2016-10-20 14:27:51', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('8892625b-49f7-42d1-b1e4-f171772479bf', '2016-10-20 14:24:01', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('889d4cb3-9640-4022-9c0b-b0f309b65beb', '2016-10-20 14:23:53', '10.60.140.212【访问】/xyan/index', 'LV');
INSERT INTO `xy_log` VALUES ('8a762175-936b-43c5-9c50-22a7a5b89813', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\4401975850036871.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('8bc91e94-0123-4458-acd9-2529835ac449', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('8ce058cd-91e3-4aa3-a368-e7cc7bd24c12', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('8ec5b8a1-6ba0-47e6-9b3e-b2b018b534dc', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('8f35872a-4751-41dc-9ee0-99403db3cab8', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('8fbd720a-886c-46eb-ac38-5b9d4d92e803', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\31085409660851004.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('8fe9c37f-d10a-4f31-b4c0-a9eb24eb5bf0', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\9748525276530429.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('902f8e61-6537-4f57-874f-9d1f8b53d0ea', '2016-10-20 14:14:02', '10.60.140.212【访问】/xyan/admin/gallery', 'LV');
INSERT INTO `xy_log` VALUES ('90306290-c3c9-4217-88ff-52eab51e0141', '2016-10-20 14:26:54', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('903ac929-4456-4bce-9c97-119070934bd0', '2016-10-20 14:30:40', '10.60.140.212【访问】/xyan/admin/article/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('91a75a4d-ddc4-46cf-8098-301623d9eb24', '2016-10-20 14:27:53', '10.60.140.212【访问】/xyan/blog/article/view/14', 'LV');
INSERT INTO `xy_log` VALUES ('92d2fd7e-b93d-4f8d-9b8b-a58cbead031a', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/blog/article/view/17', 'LV');
INSERT INTO `xy_log` VALUES ('94a72883-ab18-41c7-a48e-ff82bcefeef7', '2016-10-20 14:25:37', '【异常】d:\\tmp\\2016-10-20\\47550782800201463.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('94f64c46-37c6-468c-b2d3-1854d55f179c', '2016-10-20 14:30:31', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('96924575-eb14-45e5-80f4-1a36a8a67869', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\05989625891640804.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('96b72daa-9d10-4fe5-bde2-904fa1ccc329', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\47550782800201463.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('983072aa-137a-427c-aa91-36f866b1f510', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('98404677-9b06-4ab2-abe7-4e71b50a9166', '2016-10-20 14:25:38', '【异常】d:\\tmp\\2016-10-20\\4701028876792944.jpeg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('99c349b0-16be-4ff6-a484-df9b48043c4f', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\31085409660851004.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('9b1a285e-3699-4c77-a93c-d896338b5c22', '2016-10-20 14:16:08', '10.60.140.212【访问】/xyan/admin/gallery', 'LV');
INSERT INTO `xy_log` VALUES ('9c4aff55-786d-4b5d-9b74-f3ce5a45f8f2', '2016-10-20 14:25:38', '【异常】d:\\tmp\\2016-10-20\\4502976770163809.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('9c9c9fc6-225a-43be-b88d-5fd7f3a263e1', '2016-10-20 14:27:51', '10.60.140.212【访问】/xyan/blog/talk', 'LV');
INSERT INTO `xy_log` VALUES ('9d9d9c21-3d0a-47d6-9415-90b9b046ee6c', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\6906515154307121.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('9e7b6491-b215-45e0-98bb-50a3e40d69e5', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\47550782800201463.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('9ffe4717-40c7-4bce-9e41-c3d58f9ff6da', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('a0a07c50-69cb-491a-bdd7-996f98473522', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\47550782800201463.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('a1369ecf-ecaf-45eb-8dcd-495707fd35ea', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('a44b0f6a-020d-432a-a97c-82f562885d42', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\3832520199305778.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('a4bef19f-9309-453d-9f77-cdeb8465b8f1', '2016-10-20 14:30:40', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('a8de0f42-e0f9-49b0-9574-35362340353d', '2016-10-20 14:25:37', '【异常】d:\\tmp\\2016-10-20\\5949647366025395.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('a91f5471-4fdf-4c7c-a758-ecd3ca51dd0c', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\4401975850036871.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('a92ccbf9-0767-4019-a5c2-f3ab06adf810', '2016-10-20 14:26:52', '10.60.140.212【访问】/xyan/page/400', 'LV');
INSERT INTO `xy_log` VALUES ('a957524f-5c0f-4cbb-926b-645225d27a03', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\5949647366025395.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('a96fef26-ebb4-4b64-b3f5-054c8acfb396', '2016-10-20 14:30:31', '10.60.140.212【访问】/xyan/blog/talk', 'LV');
INSERT INTO `xy_log` VALUES ('a98979e6-9b24-49c4-92d4-57a99dddf076', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('aa27cf63-31f9-4f2c-af74-15cd6bb67f49', '2016-10-20 14:30:33', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('aa562ca8-14d6-49ca-a92c-f631d8557150', '2016-10-20 14:30:28', '10.60.140.212【访问】/xyan/', 'LV');
INSERT INTO `xy_log` VALUES ('aa591430-f3f3-45bf-bc3b-984f03c8fcf7', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\05989625891640804.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('aa9ac09b-5801-4b81-9829-6cc4478d25f4', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\4701028876792944.jpeg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('ab4a567b-87e5-4396-ae2d-04bfae6a3ab1', '2016-10-20 14:18:02', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('ac44584c-257f-4e32-a7a0-40bb808d9449', '2016-10-20 14:33:51', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('acb4825a-14f0-4a69-891b-7e5de64f5290', '2016-10-20 14:23:46', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('acc6bdce-cafc-491e-abf7-498535b17d33', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('ae2f8495-4dc1-44e3-9ce5-6069ed562c32', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\4701028876792944.jpeg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('af3a65cf-d864-4196-b5bf-1523c1474f82', '2016-10-20 14:14:04', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('b0a989b7-c7db-4c3a-b014-a28de4f64a74', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('b0af64b1-84a2-4690-80a1-a6c9c56aa85e', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('b1cbed14-a031-4fb3-9529-9df931ea4897', '2016-10-20 14:18:02', '10.60.140.212【访问】/xyan/blog/article', 'LV');
INSERT INTO `xy_log` VALUES ('b254f9fa-77ba-4d96-b4a8-d28aa0102dd8', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('b290e664-eb09-4d5f-ade5-2e44ab4dd13c', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\47550782800201463.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('b3120126-a567-42f5-b328-4e6b68b12f76', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\7321776415451398.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('b3a04588-9c9a-41d3-acf5-58a7c195312b', '2016-10-20 14:27:50', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('b3ed6cd6-9e40-4f24-ac35-b849585bebb5', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('b4b0af62-c57f-4227-b83a-14a97733978d', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('b500b274-105c-460c-884c-6eddcf54f816', '2016-10-20 14:25:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('b542675d-3528-40bf-867b-ce0908380cfe', '2016-10-20 14:25:37', '【异常】d:\\tmp\\2016-10-20\\9748525276530429.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('b57ce8b0-4809-4ee5-a9bb-cccec1fec429', '2016-10-20 14:30:33', '10.60.140.212【访问】/xyan/blog/board/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('b66854e3-61a1-4c09-8046-0f0a3be892d4', '2016-10-20 14:30:30', '10.60.140.212【访问】/xyan/blog/life', 'LV');
INSERT INTO `xy_log` VALUES ('b87f3344-ba91-45c7-ade6-b5fe6efdc502', '2016-10-20 14:26:54', '10.60.140.212【访问】/xyan/index', 'LV');
INSERT INTO `xy_log` VALUES ('b8887b6e-dfb7-4380-a6ea-2ca546f5fc61', '2016-10-20 14:26:47', '10.60.140.212【访问】/xyan/admin/article/save', 'LV');
INSERT INTO `xy_log` VALUES ('b92acfce-59ac-471f-b1ab-80e28c145029', '2016-10-20 14:14:42', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('b9a7bdca-dafc-4a23-8a3c-cf090855ec5b', '2016-10-20 14:30:28', '10.60.140.212【访问】/xyan/index', 'LV');
INSERT INTO `xy_log` VALUES ('ba642029-c4fd-4fa0-a77a-e8f45386416c', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\5949647366025395.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('ba8b9c5c-1c86-4b77-90a7-3b6eeeb799f3', '2016-10-20 14:16:58', '10.60.140.212【访问】/xyan/blog/board', 'LV');
INSERT INTO `xy_log` VALUES ('bd75c355-27f6-4f29-b3ff-ac74f1bd2e2f', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\31085409660851004.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('bdd10cb1-8efd-48f5-b358-ccdfca82a84a', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('bdef8512-a2da-43b0-8e1d-5401999dc0aa', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('be5c6e13-7e62-487d-bf5f-9807e01cf8a3', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('bf9e7025-e9d8-4b36-bbc8-ea69f950e053', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('bff81841-d0e4-4435-bcd3-52ff3a36caa8', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\6457376527389597.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('c20d13d7-d7d5-4552-993b-9dfe0b9e33bc', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/blog/article/view/17', 'LV');
INSERT INTO `xy_log` VALUES ('c35a4a8c-e727-4057-b242-044d99f6f0f1', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\4502976770163809.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('c515a7e3-746d-44c4-96fd-eaad0c84c4ca', '2016-10-20 14:30:45', '10.60.140.212【访问】/xyan/admin/preference/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('c5665ab4-6f41-4c54-b5ae-b0112ef36649', '2016-10-20 14:26:48', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('c60a5a64-9452-44c9-946b-7de9a3e7f247', '2016-10-20 14:24:16', '10.60.140.212【访问】/xyan/admin/article', 'LV');
INSERT INTO `xy_log` VALUES ('c6a9da29-db9d-4ec9-b1c5-6305c0951ffe', '2016-10-20 14:18:03', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('c6b0c163-9482-4af8-84f8-e869a9a8ef5a', '2016-10-20 14:26:47', '10.60.140.212【访问】/xyan/admin/article', 'LV');
INSERT INTO `xy_log` VALUES ('c6b73b60-c391-4b6d-9418-61b48d7affad', '2016-10-20 14:30:51', '【异常】d:\\tmp\\2016-10-18\\8932863669185714.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('c6e07176-d652-4c2b-8f63-1cd4f4ca81f2', '2016-10-20 14:16:59', '10.60.140.212【访问】/xyan/blog/board/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('c8f1298e-7ee2-4fe1-b497-5e0725ba57f4', '2016-10-20 14:26:48', '10.60.140.212【访问】/xyan/admin/article/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('cb166e04-ba18-412c-91a7-57eed415e8e0', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('cb1ebdb8-de00-468f-9cd1-653870f8fcda', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\4785769866185494.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('cbeae99f-90b6-4d7f-9dcb-726b016c4f02', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\3832520199305778.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('cccc21b7-c496-44ea-9b91-5a53d7dfdf5c', '2016-10-20 14:30:26', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('cd2a1c09-cf0e-48f7-bf9c-ff435ddf7405', '2016-10-20 14:13:58', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('ce09fcbf-eec7-4d66-a834-090cb4816dcf', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('ce94f610-5d79-42c2-b705-b85d5f477474', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('cf200107-7960-4e03-b77b-b6f1570c0548', '2016-10-20 14:30:48', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('cf52aa6b-27e8-4249-9f29-ef395ecba11d', '2016-10-20 14:26:52', '10.60.140.212【访问】/xyan/blog/article/view/emotions.data', 'LV');
INSERT INTO `xy_log` VALUES ('d0a19524-ae89-4b29-8ea2-2f3c9ae2061b', '2016-10-20 14:31:27', '10.60.140.212【访问】/xyan/admin/widgets', 'LV');
INSERT INTO `xy_log` VALUES ('d0ac0071-93b0-4a2a-bc63-b162ef2c714b', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\9748525276530429.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('d3cc9df8-3fd8-416f-817c-1a6013659f13', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('d4070b93-0b11-4d76-bb25-1502f42145fc', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\5949647366025395.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('d5ecadff-da8d-4ffb-b724-7872e447dd3c', '2016-10-20 14:17:15', '10.60.140.212【访问】/xyan/blog/article', 'LV');
INSERT INTO `xy_log` VALUES ('d60e8332-d069-4cd2-8b7b-e905da4f4dcd', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\9748525276530429.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('d77702d3-1b78-4fcd-9d6f-52bf708686d0', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('d7db32ac-2fb0-4b8b-af87-0998d0e56c59', '2016-10-20 14:27:54', '10.60.140.212【访问】/xyan/blog/article/view/emotions.data', 'LV');
INSERT INTO `xy_log` VALUES ('d88a9568-c98d-426e-94c4-62b847af2457', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('d8ca2e04-4752-4047-a31b-b62468c1da0d', '2016-10-20 14:30:25', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('d96e1147-2115-47b7-8c7d-109ecf9a7359', '2016-10-20 14:14:04', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('d96f6439-83e0-4427-bd66-99580b55337f', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('da942c5e-b9a9-4234-bf41-a9f7956d9bb7', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('daa788fc-37a7-4ecd-94de-1c0db1e5ba26', '2016-10-20 14:24:16', '10.60.140.212【访问】/xyan/admin/article/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('db975434-4d61-4689-b145-979d7bbb1d01', '2016-10-20 14:25:38', '【异常】d:\\tmp\\2016-10-20\\7321776415451398.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('dc804e18-1de1-4d03-ba63-bf08576a4db7', '2016-10-20 14:33:32', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('dcbbccc6-79eb-4d17-ae71-6f2b5eddb454', '2016-10-20 14:30:55', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('ddce916f-fa63-420f-9f25-295afb4667eb', '2016-10-20 14:27:06', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('def20be9-7cb3-41f6-887c-0256b519665f', '2016-10-20 14:25:38', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('df644803-186a-48ee-9ab0-3ad9bafeb96e', '2016-10-20 14:24:19', '10.60.140.212【访问】/xyan/admin/article/edit', 'LV');
INSERT INTO `xy_log` VALUES ('df908463-8932-4a6c-bf9a-2dc46d215c1d', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\6906515154307121.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('e0788af5-851b-44ee-a64c-b5f3411c14ae', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\7321776415451398.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('e0c867ce-a095-427a-a87e-dc7cdc14ee39', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('e2bb8dd3-b16f-4bb6-9369-220a8b628184', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('e437cc24-b090-4afc-96bd-6a02e7dda93d', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('e4dfd31d-27f1-4f4c-be64-7b72e710d9e2', '2016-10-20 14:25:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('e55d041d-562c-42ce-bc00-afaf432ff507', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('e76515b0-55d8-400b-99cd-5c5478053c4f', '2016-10-20 14:30:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('e99d7516-2190-43c5-b8ef-45fde8c67799', '2016-10-20 14:27:48', '10.60.140.212【访问】/xyan/blog/talk', 'LV');
INSERT INTO `xy_log` VALUES ('eb1ec27f-a90b-41f5-8203-638e14ec74a0', '2016-10-20 14:18:10', '【异常】d:\\tmp\\2016-10-20\\3832520199305778.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('eb23443e-a0cf-47c9-adfc-7690657ea196', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\6906515154307121.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('eb93b768-3a51-4bc5-b90c-45a999049b28', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('ed4b3476-d1a3-453a-9feb-6e62d67da653', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('ef31cd41-2af5-4c6a-bf0f-affc2925b247', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('ef8b8cf3-2377-45d4-8682-8cfe83f717b6', '2016-10-20 14:26:51', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('f0395160-51d2-4a0e-bc00-e024b752af6d', '2016-10-20 14:24:44', '10.60.140.212【访问】/xyan/admin/article/getChildren', 'LV');
INSERT INTO `xy_log` VALUES ('f0663063-d7ad-421f-8360-1fce5806720a', '2016-10-20 14:30:33', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('f138e956-d17e-4123-8fe3-2d7fd2397ff4', '2016-10-20 14:30:27', '10.60.140.212【访问】/xyan/blog/life', 'LV');
INSERT INTO `xy_log` VALUES ('f181a186-1929-4a91-b45f-34512612fe93', '2016-10-20 14:14:41', '10.60.140.212【访问】/xyan/admin/gallery', 'LV');
INSERT INTO `xy_log` VALUES ('f2a1f802-8390-430b-8db6-4e0ab3268cbc', '2016-10-20 14:14:31', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('f2bdb7e0-1b9d-4620-bf1a-48c6e56315ff', '2016-10-20 14:25:38', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('f392c7de-ab1a-481d-9388-a1abc1887878', '2016-10-20 14:26:51', '【异常】d:\\tmp\\2016-10-20\\5949647366025395.png (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('f3c264f4-d8aa-4232-9aba-7b4b37ecb226', '2016-10-20 14:23:53', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('f6dedf08-c288-478a-ae8c-ce75a13c8ace', '2016-10-20 14:25:41', '10.60.140.212【访问】/xyan/admin/article/getChildren', 'LV');
INSERT INTO `xy_log` VALUES ('f6faa9f6-2a11-4e44-aa81-a9b252f26f42', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\47550782800201463.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('f83a4a57-cb67-4714-89e0-29dc5e85390f', '2016-10-20 14:30:43', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('f95c2268-26be-4620-a309-ba3babb859d5', '2016-10-20 14:24:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('f9d3f153-8116-4b52-b7a8-a5cdf0e5b6c8', '2016-10-20 14:30:45', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('fa02035f-6cc4-42a1-a8d9-cfee324e88e9', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\4701028876792944.jpeg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('fb90a9ce-27af-47de-9725-41d16c949070', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\31085409660851004.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('fbb350e7-88c3-485e-a539-f8060f36f923', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\3832520199305778.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('fcdd1165-e963-4d5f-b98f-d21d130e5de2', '2016-10-20 14:23:45', '【异常】d:\\tmp\\2016-10-20\\6457376527389597.png (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('fd898ad3-6eba-4cde-9940-2de2f90c59d7', '2016-10-20 14:30:40', '10.60.140.212【访问】/xyan/admin/article', 'LV');
INSERT INTO `xy_log` VALUES ('fdd8d084-d530-444c-9c51-51361d7e8316', '2016-10-20 14:23:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('fe9aef94-3580-4500-b2cd-d819acdc12d8', '2016-10-20 14:27:46', '10.60.140.212【访问】/xyan/blog/article', 'LV');
INSERT INTO `xy_log` VALUES ('feaebed8-f5ad-4cb6-906a-b4071adfd764', '2016-10-20 14:18:10', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('fecb0403-4467-4af2-aa9d-1c3296f2cec8', '2016-10-20 14:24:20', '【异常】d:\\tmp\\2016-10-20\\9748525276530429.png (系统找不到指定的路径。)', 'LE');

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
  `STATE` char(2) DEFAULT NULL COMMENT '状态 00 初始化，10已发送',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件';

-- ----------------------------
-- Records of xy_mail
-- ----------------------------
INSERT INTO `xy_mail` VALUES ('0', '1255321142@qq.com', '网站', '您有紧急留言啦<p><p>erwerwer<br></p>', '网站留言', '10', '2016-10-20 13:25:07');
INSERT INTO `xy_mail` VALUES ('1', '1255321142@qq.com', '网站', '您有紧急留言啦<p><p>您好<br></p>', '网站留言', '10', '2016-10-20 13:24:59');
INSERT INTO `xy_mail` VALUES ('2', '1255321142@qq.com', '网站', '您有紧急留言啦<p><p>博主您好？看看这个？</p><p><img src=\"/xyan/attach/viewPic?path=2016-10-18&name=8932863669185714.jpg\" alt=\"150104纯白大翻领羊毛外套 (21)\" style=\"max-width:100%;\"></p><p><br></p>', '网站留言', '10', '2016-10-20 13:25:01');
INSERT INTO `xy_mail` VALUES ('3', '1255321142@qq.com', '网站', '您有紧急留言啦<p><p>测试<br></p>', '网站留言', '10', '2016-10-20 13:25:04');
INSERT INTO `xy_mail` VALUES ('4', '1255321142@qq.com', '网站', '您有紧急留言啦<p><p>试试邮件效果<br></p><p><img src=\"/img/2016-10-20/5b06a29d-59ee-4e46-8714-75adf34d16bf.jpg\" alt=\"2DCF3618246FBAEC6B79EB93202CF1FD\" style=\"max-width:100%;\"></p><p><br></p>', '网站留言', '10', '2016-10-20 14:10:41');

-- ----------------------------
-- Table structure for xy_message
-- ----------------------------
DROP TABLE IF EXISTS `xy_message`;
CREATE TABLE `xy_message` (
  `ID` bigint(11) NOT NULL COMMENT '主键',
  `SOURCE` bigint(255) NOT NULL COMMENT '发自',
  `DEST` bigint(20) DEFAULT NULL COMMENT '目标，公共发言为-1',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CONTENT` text COMMENT '内容',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MERGE_` varchar(5) DEFAULT NULL COMMENT '是否紧急留言',
  `READ_` varchar(5) DEFAULT NULL COMMENT '是否已阅读',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息';

-- ----------------------------
-- Records of xy_message
-- ----------------------------
INSERT INTO `xy_message` VALUES ('75', '1', '15', '感言', '<p>就是喜欢看美女<br></p>', '2016-10-19 16:17:42', null, 'false');
INSERT INTO `xy_message` VALUES ('76', '1', '15', '感言', '<p>123123123<br></p>', '2016-10-19 16:23:20', null, 'false');
INSERT INTO `xy_message` VALUES ('77', '1', '-1', '测试留言', '<p>12312<img src=\"/img/2016-10-19/517f2130-8b4f-4ca6-b0a7-0b406866d009.png\" alt=\"6a7d23342c8b3319d9bf742eec745a68515e062f6a2b6-K0lrB7_fw658\" style=\"max-width:100%;\"></p><p><br></p>', '2016-10-19 16:34:09', null, 'false');
INSERT INTO `xy_message` VALUES ('78', '1', '-1', '【留言版】', '<p><img src=\"/img/2016-10-19/27587319-33d6-4fad-8d51-c2a85338d0df.jpg\" alt=\"77d664161c9d48792cd11a83f23b835523d0982a43ef3-SEJkbM_fw658\" style=\"max-width:100%;\"></p><p><br></p>', '2016-10-19 16:36:24', null, 'false');
INSERT INTO `xy_message` VALUES ('79', '1', '17', '【评论】孙允珠', '<p>上面的美女看起来确实不错，赞一个<br></p>', '2016-10-20 14:04:14', null, 'false');
INSERT INTO `xy_message` VALUES ('80', '1', '-1', '【留言版】', '<p>试试邮件效果<br></p>', '2016-10-20 14:06:19', null, 'false');
INSERT INTO `xy_message` VALUES ('81', '1', '-1', '【留言版】', '<p>试试邮件效果<br></p><p><img src=\"/img/2016-10-20/5b06a29d-59ee-4e46-8714-75adf34d16bf.jpg\" alt=\"2DCF3618246FBAEC6B79EB93202CF1FD\" style=\"max-width:100%;\"></p><p><br></p>', '2016-10-20 14:08:35', null, 'false');
INSERT INTO `xy_message` VALUES ('82', '1', '-1', '【留言版】', '<p>试试邮件效果<br></p><p><img src=\"/img/2016-10-20/5b06a29d-59ee-4e46-8714-75adf34d16bf.jpg\" alt=\"2DCF3618246FBAEC6B79EB93202CF1FD\" style=\"max-width:100%;\"></p><p><br></p>', '2016-10-20 14:10:41', 'true', 'false');

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
-- Table structure for xy_preference
-- ----------------------------
DROP TABLE IF EXISTS `xy_preference`;
CREATE TABLE `xy_preference` (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `NAME` varchar(255) DEFAULT NULL COMMENT '名称',
  `KIND` varchar(255) DEFAULT NULL COMMENT '类别',
  `VALUE` varchar(255) DEFAULT NULL COMMENT '值',
  `REMARK` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置信息';

-- ----------------------------
-- Records of xy_preference
-- ----------------------------
INSERT INTO `xy_preference` VALUES ('1', 'log', 'switch', 'true', '是否记录日志');
INSERT INTO `xy_preference` VALUES ('2', 'mail', 'mail', '1255321142@qq.com', '紧急留言发送的目的地');

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
  `HEAD` varchar(250) DEFAULT NULL COMMENT '头像地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of xy_user
-- ----------------------------
INSERT INTO `xy_user` VALUES ('1', '王明', '5F1D7A84DB00D2FCE00B31A7FC73224F', '123456', '1255321142@qq.com', '18136442251', 'admin', '0', '2016-10-19 16:02:15', '/xyan/static/img/head/girl-1.jpg');

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
