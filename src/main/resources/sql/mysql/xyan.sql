/*
Navicat MySQL Data Transfer

Source Server         : xyan
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : xyan

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2016-10-18 16:00:56
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
INSERT INTO `xy_article` VALUES ('12', '实验成功！', '<p>呵呵哒<br></p><p><img src=\"/xyan/attach/viewPic?path=2016-06-13&name=2509619467090254.jpg\" alt=\"mm1\" style=\"max-width:100%;\"></p><p><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7323812045176356.jpeg\" alt=\"20160113233921_j8Y4f\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=08213796186931166.png\" alt=\"5691fb4fa5d68ef61acd5861caed06b8d06d2aa299751-7ZG57f_fw658\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3091214106685213.jpeg\" alt=\"20150728131238_ZV5Jr\" style=\"max-width:100%;\"></p><p><br></p>', '1', '2016-06-07 15:55:15', '2016-10-14 14:19:47', '99997', '', '起风了，早上开始热闹了。', '1', '1', '人们忙着欢笑', '/xyan/attach/viewPic?path=2016-10-14&name=77d664161c9d48792cd11a83f23b835523d0982a43ef3-SEJkbM_fw658.jpg');
INSERT INTO `xy_article` VALUES ('14', '正则表达式集合', '<strong>一、校验数字的表达式</strong><p><img style=\"max-width:100%;\" src=\"http://p1.pstatp.com/large/7fc000340e0f4fe0b57\"></p><strong>二、校验字符的表达式<br><img style=\"max-width:100%;\" src=\"http://p3.pstatp.com/large/7fc000340ff43420eeb\"><br></strong><strong>三、特殊需求表达式</strong><p><img style=\"max-width:100%;\" src=\"http://p3.pstatp.com/large/7fc000341457d2f3cce\"></p><p><img style=\"max-width:100%;\" src=\"http://p3.pstatp.com/large/7f900033f7b8e976067\"></p><p><br></p>', '1', '2016-06-17 14:30:42', '2016-10-14 14:12:07', '99997', '', '', '1', '1', '', '/xyan/attach/viewPic?path=2016-10-14&name=131026纯黑色拉线两边短款开衫 (3).jpg');
INSERT INTO `xy_article` VALUES ('15', '离职的感言', '<p>什么也么有啊</p>', '1', '2016-07-27 21:53:41', '2016-07-27 21:53:41', '99999', '无聊啊,你好说', '这是一个快速流转的社会', '1', '1', '', '/xyan/attach/viewPic?path=2016-07-27&name=8c1271fc5a8d12814f6aa2560539969d737394a1fb27-CBEKph_fw658.jpg');
INSERT INTO `xy_article` VALUES ('16', '美女合集', '<p><img src=\"/xyan/attach/viewPic?path=2016-10-14&name=9705655289493216.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6265877420662589.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=43661603416462946.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3381646371196023.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6430661886588426.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9004019497803981.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9563452480304553.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=10883956700967556.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8843759407132326.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4795413924939921.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=65946172037058.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5631117538195052.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8734651461388758.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6660531454446957.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7332240022645886.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9486957820753426.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8192543825191223.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3502879231170468.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4339549879364327.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=02470510986264729.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3130837855636084.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5998907926115943.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8137757676467821.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=17243436545117063.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2598775973135662.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7818115695308089.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6893174509396238.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7716578822250715.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2107555950020258.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9577191075064242.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6264205382694857.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7381860835027941.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2261585735424203.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=27919238285176207.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8243995043166128.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4226260086297401.jpg\" alt=\"131026纯黑色拉线两边短款开衫 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9074241761473641.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=01724412740363579.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6548247785744223.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4878394167898187.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6120546174946888.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4535345750560391.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=42367839676807695.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5690490277198351.jpg\" alt=\"131026名媛气质淑女收身混色上衣 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=15429470366549924.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3400431044388105.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8414797478749964.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2044617866543338.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5345709311990395.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3578503199303974.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8199359599387949.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5359319900615828.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=354730509082793.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=48627058807250345.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=33028386818827504.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (20)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5112093528754372.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2660992581500805.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=37879088976493225.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9934753568090804.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=31725488202876073.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3596090623896353.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4399495107387913.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6732748692510441.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (19)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=12374262330996533.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4886162717144198.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (20)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=02939866431517102.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (21)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=12026357720245695.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9665670588600909.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8975683298781739.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7226389946987385.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (19)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6947061020128533.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (20)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8303089777526362.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=22640418083396785.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6637765657460327.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=34876563377562253.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=20304925425242681.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=17138686933149905.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=06963517256429508.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (21)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5001685761482896.jpg\" alt=\"131029图质感暗纹荷叶摆OL金属领上衣 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=19604265501344664.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (23)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=329370210154617.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (22)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=12236364314689652.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=20987974261775155.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=507671130562995.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=37390795275423483.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=006143470555929675.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=38276869642630196.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=459122461367624.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6368490271421349.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=33483611062144436.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9787558575454824.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7823836674597624.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=026213635711534566.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3879358406456952.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=28311040682679256.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7886286867434912.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7262896103583241.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (20)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9764321281458281.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (22)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=40724763824552923.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (21)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7556241756542547.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=050677287703625895.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3133679337058086.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=23965098569417986.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6729636521392665.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=09992772578462583.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=21680353281380094.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6369576739209593.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5856293676570206.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=39259773700990985.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6734782471618466.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7785428028821121.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=0863249664718394.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6680354483127583.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6168711515279136.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8899666093293945.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (19)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6832440345725349.jpg\" alt=\"131103经典纯色简约薄款开衫 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4012152008333809.jpg\" alt=\"131103经典纯色简约薄款开衫 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5943211649356231.jpg\" alt=\"131103经典纯色简约薄款开衫 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=21436779826663654.jpg\" alt=\"131103经典纯色简约薄款开衫 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4056375015314534.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=756785545041429.jpg\" alt=\"131103经典纯色简约薄款开衫 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3468294777996199.jpg\" alt=\"131113纯白色淑女型长袖衫 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=37310096638038925.jpg\" alt=\"131113纯白色淑女型长袖衫 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4976444261648513.jpg\" alt=\"131113纯白色淑女型长袖衫 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=36844739123497905.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=026914917387667714.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=851286992737042.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5524426184087471.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7139603459809082.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9692923394712629.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7243238679189153.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=29696885627132186.jpg\" alt=\"131030简约纯色百搭韩版连衣裙 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5437700417168502.jpg\" alt=\"131113纯白色淑女型长袖衫 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7174903099572344.jpg\" alt=\"131103经典纯色简约薄款开衫 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=016776140042434773.jpg\" alt=\"131113纯白色淑女型长袖衫 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=16580715450952388.jpg\" alt=\"131113纯白色淑女型长袖衫 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6302123238330654.jpg\" alt=\"131113纯白色淑女型长袖衫 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=007621478669841197.jpg\" alt=\"131113纯白色淑女型长袖衫 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=24011630241261683.jpg\" alt=\"131103经典纯色简约薄款开衫 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2081749603677603.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=44214423030086947.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (19)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3417079822248962.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5356956033723478.jpg\" alt=\"131103经典纯色简约薄款开衫 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=011961431202325956.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=04536025265746624.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2867377785931734.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=36450189001554545.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4996552713556831.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6470258599989464.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=675789068170689.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=34316786990138604.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=27250908973820465.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7061906318371327.jpg\" alt=\"131113纯白色淑女型长袖衫 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3614542427853713.jpg\" alt=\"131113纯白色淑女型长袖衫 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=29308863263726914.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=02133462994883606.jpg\" alt=\"131113纯白色淑女型长袖衫 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=10937350382108513.jpg\" alt=\"131113纯白色淑女型长袖衫 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8075354450219043.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=12717859332112091.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5177414984152331.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=0017239537173681097.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=010801194618658805.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3393753121487658.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3369349176700611.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3925501078308957.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8893050530377079.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5457897746578335.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=1393961243786872.jpg\" alt=\"131113纯白色淑女型长袖衫 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=1349331659788453.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5352814278676578.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9689460910683545.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5041387598100244.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6138575257410771.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4121236360852787.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7289367066591455.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=19525861633757802.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=1781677247032193.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9861777008062618.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5661912234875818.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7359837582420895.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (19)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9274171767849857.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4267242295257554.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (20)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3524486892071661.jpg\" alt=\"131113深灰长袖毛毛边外套 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8184337442814058.jpg\" alt=\"131030暖调撞色宽条纹平肩针织上衣 (19)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=631518318576775.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=16005370939262953.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6815185413840081.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6653561924249701.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=13724161705029203.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8615412276777171.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=48896789959661613.jpg\" alt=\"131113纯白色淑女型长袖衫 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9687614291037644.jpg\" alt=\"131113黑色长袖长款英伦风格西装 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=12593295290036455.jpg\" alt=\"131113深灰长袖毛毛边外套 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6455376140997942.jpg\" alt=\"131113深灰长袖毛毛边外套 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2085567697304248.jpg\" alt=\"131113深灰长袖毛毛边外套 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5040991988919993.jpg\" alt=\"131113深灰长袖毛毛边外套 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=725780636694744.jpg\" alt=\"131113深灰长袖毛毛边外套 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5138951631365326.jpg\" alt=\"131113深灰长袖毛毛边外套 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=05377231317101183.jpg\" alt=\"131113驼色长袖西装外套 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5843378218527031.jpg\" alt=\"131030小绵羊毛翻领牛仔假两件外套 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=35468897887528605.jpg\" alt=\"131113驼色长袖西装外套 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5865364550169551.jpg\" alt=\"131113深灰长袖毛毛边外套 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9045533422307064.jpg\" alt=\"131113深灰长袖毛毛边外套 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9809556013703186.jpg\" alt=\"131113深灰长袖毛毛边外套 (20)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6171215090995624.jpg\" alt=\"131113深灰长袖毛毛边外套 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=632953031830331.jpg\" alt=\"131113深灰长袖毛毛边外套 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=591212447388942.jpg\" alt=\"131113深灰长袖毛毛边外套 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=10555066278956371.jpg\" alt=\"131113深灰长袖毛毛边外套 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2615522652125126.jpg\" alt=\"131113深灰长袖毛毛边外套 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=23417142961567794.jpg\" alt=\"131113深灰长袖毛毛边外套 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=13137759529986492.jpg\" alt=\"131113驼色长袖西装外套 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2293006911841906.jpg\" alt=\"131113驼色长袖西装外套 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=31655150938613574.jpg\" alt=\"131113驼色长袖西装外套 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=34209734085782884.jpg\" alt=\"131113驼色长袖西装外套 (20)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=018145993840943064.jpg\" alt=\"131113驼色长袖西装外套 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8250113545116303.jpg\" alt=\"131113驼色长袖西装外套 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9539231377633206.jpg\" alt=\"131113驼色长袖西装外套 (22)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=09704749134096824.jpg\" alt=\"131113驼色长袖西装外套 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=37067903484591325.jpg\" alt=\"131113驼色长袖西装外套 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6473024648166668.jpg\" alt=\"131113驼色长袖西装外套 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4075785585164371.jpg\" alt=\"131113驼色长袖西装外套 (19)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7241731492193427.jpg\" alt=\"131113驼色长袖西装外套 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8654620913476772.jpg\" alt=\"131113卡其色针织长袖毛毛外套 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6564761141289754.jpg\" alt=\"131113驼色长袖西装外套 (21)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=18944288799489983.jpg\" alt=\"131113驼色长袖西装外套 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=27275910975115636.jpg\" alt=\"131113驼色长袖西装外套 (23)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7808880943012624.jpg\" alt=\"131113驼色长袖西装外套 (24)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=849299225831732.jpg\" alt=\"131113深灰长袖毛毛边外套 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7673719903238326.jpg\" alt=\"131113深灰长袖毛毛边外套 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5138792357865694.jpg\" alt=\"131113深灰长袖毛毛边外套 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=39547928449127845.jpg\" alt=\"131113深灰长袖毛毛边外套 (19)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=16371477162835835.jpg\" alt=\"131113驼色长袖西装外套 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7075261145621812.jpg\" alt=\"131113驼色长袖西装外套 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=46374454609973037.jpg\" alt=\"131113驼色长袖西装外套 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=482583186357161.jpg\" alt=\"131113驼色长袖西装外套 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=717176489198449.jpg\" alt=\"131113驼色长袖西装外套 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=0577851953476789.jpg\" alt=\"131113驼色长袖西装外套 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8024042933477706.jpg\" alt=\"131027假两件缎面花摆收腰连衣裙 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8319095160129802.jpg\" alt=\"131113性感长袖连衣短裙 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=851690688904386.jpg\" alt=\"131113性感长袖连衣短裙 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4768100647931903.jpg\" alt=\"131113性感长袖连衣短裙 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3243113660704563.jpg\" alt=\"131113性感长袖连衣短裙 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=503860146595359.jpg\" alt=\"131113性感长袖连衣短裙 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=27300604374187565.jpg\" alt=\"131113性感长袖连衣短裙 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9772828286248748.jpg\" alt=\"131113性感长袖连衣短裙 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=755187970070699.jpg\" alt=\"131113性感长袖连衣短裙 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2582599580405379.jpg\" alt=\"131113性感长袖连衣短裙 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6033897459808041.jpg\" alt=\"131113性感长袖连衣短裙 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2842458052081037.jpg\" alt=\"131113性感长袖连衣短裙 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=47132980989814866.jpg\" alt=\"131113性感长袖连衣短裙 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=40440742828411114.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8875260541182747.jpg\" alt=\"131113性感长袖连衣短裙 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=1788297939755883.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=15647529076759348.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=13862693832116368.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8592941818460744.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7681430722207028.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8944580776050964.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=24979058848639812.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7626289319264562.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6193596782766592.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6733346713161226.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=47415015657749315.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8557019678674366.jpg\" alt=\"131124黑白仙人掌图案修身连衣裙 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6486390348194933.jpg\" alt=\"131103经典纯色简约薄款开衫 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9209124690230677.jpg\" alt=\"131124酒红色毛绒呢子直筒短裙 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5490947628148296.jpg\" alt=\"131124酒红色毛绒呢子直筒短裙 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2643856220744566.jpg\" alt=\"131124酒红色毛绒呢子直筒短裙 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9463600746389949.jpg\" alt=\"131124酒红色毛绒呢子直筒短裙 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9057478321992469.jpg\" alt=\"131124酒红色毛绒呢子直筒短裙 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2086168742833303.jpg\" alt=\"131124黑白两色长款羽绒背心 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=39534560115777817.jpg\" alt=\"131124酒红色毛绒呢子直筒短裙 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5949270164201077.jpg\" alt=\"131124黑白两色长款羽绒背心 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=0003220521835723966.jpg\" alt=\"131124黑白两色长款羽绒背心 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=44202550870083257.jpg\" alt=\"131124黑白两色长款羽绒背心 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3255956340226548.jpg\" alt=\"131124黑白两色长款羽绒背心 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=015613174228331084.jpg\" alt=\"131124黑白两色长款羽绒背心 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=32393791619463064.jpg\" alt=\"131124黑白两色长款羽绒背心 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5337552034186935.jpg\" alt=\"131124黑白两色长款羽绒背心 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8979181971505686.jpg\" alt=\"131124黑白两色长款羽绒背心 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8978791762399235.jpg\" alt=\"131124黑白两色长款羽绒背心 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=927903912978099.jpg\" alt=\"131124黑白两色长款羽绒背心 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=47140580052264147.jpg\" alt=\"131124黑白两色长款羽绒背心 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2359862344577418.jpg\" alt=\"131124黑白两色长款羽绒背心 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=23547908890761637.jpg\" alt=\"131124黑白两色长款羽绒背心 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=016891779255983064.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=04925270021762462.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=861955934995551.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5502658258760363.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2467204305102193.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7018559524428944.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9393175926985952.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9046721266919089.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6771065828815162.jpg\" alt=\"131201清新田园风满版波点衬衣OP (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9231347944947691.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=43840330554151163.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5893547311980598.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4822180377116888.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=18910542966973476.jpg\" alt=\"131201清新田园风满版波点衬衣OP (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=07783157865789858.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=010245679443256717.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5025437036574063.jpg\" alt=\"131201清新田园风满版波点衬衣OP (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5100494154159809.jpg\" alt=\"131201清新田园风满版波点衬衣OP (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7207377709514807.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=837024049918748.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5543697256137109.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9786551973990857.jpg\" alt=\"131201清新田园风满版波点衬衣OP (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=20894525734559466.jpg\" alt=\"131201经典百搭休闲收身牛仔衬衣 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9125239540605719.jpg\" alt=\"131201清新田园风满版波点衬衣OP (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=745476855561584.jpg\" alt=\"131201清新田园风满版波点衬衣OP (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6106322152344731.jpg\" alt=\"131201清新田园风满版波点衬衣OP (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=033727613770855314.jpg\" alt=\"131201清新田园风满版波点衬衣OP (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=19872290930396774.jpg\" alt=\"131201清新田园风满版波点衬衣OP (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=40560839568478047.jpg\" alt=\"131201清新田园风满版波点衬衣OP (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7957450430948574.jpg\" alt=\"131201清新田园风满版波点衬衣OP (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8216250781088852.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7497842238847527.jpg\" alt=\"131201清新田园风满版波点衬衣OP (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=222324634069768.jpg\" alt=\"131201清新田园风满版波点衬衣OP (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5128672534067125.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=00727433593391813.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9335789839887927.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=06483861057863072.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2513047796941491.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5011630119929619.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9673270443823412.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4952370469407088.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=14586561363313455.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9921249346968508.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=11038617523929561.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4925712690055659.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=16973580627869844.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=018997693996050113.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6026594513426249.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=18410673738161054.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=37274444382132077.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4222568125261744.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=1642361291952834.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=44454118810838705.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7777550693743206.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9279432563051574.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=13475439697474922.jpg\" alt=\"131207魅力四射连衣裙 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=1964661005886914.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3795550939198987.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=342384452932326.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=7917808959109658.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8301103939176327.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4411754859143354.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=05250016279593117.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8323185400994461.jpg\" alt=\"131207花灰色剪裁抹胸短裙 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=25132982968206197.jpg\" alt=\"131207魅力四射连衣裙 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=06351218220974209.jpg\" alt=\"131124酒红色毛绒呢子直筒短裙 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9847074927386635.jpg\" alt=\"131207魅力四射连衣裙 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5916842345691069.jpg\" alt=\"131207魅力四射连衣裙 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8900410539548824.jpg\" alt=\"131207魅力四射连衣裙 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6425705678571074.jpg\" alt=\"131207魅力四射连衣裙 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8991202561242746.jpg\" alt=\"131207魅力四射连衣裙 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=578774158454275.jpg\" alt=\"131207魅力四射连衣裙 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9359051440220233.jpg\" alt=\"131207魅力四射连衣裙 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4250719904591057.jpg\" alt=\"131207魅力四射连衣裙 (19)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=05830581024451231.jpg\" alt=\"131207魅力四射连衣裙 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8565491958989425.jpg\" alt=\"131207魅力四射连衣裙 (20)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8629905514934851.jpg\" alt=\"131207魅力四射连衣裙 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5636683390508885.jpg\" alt=\"131207魅力四射连衣裙 (21)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=1372600479492294.jpg\" alt=\"131207魅力四射连衣裙 (22)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=31003711880694973.jpg\" alt=\"131207魅力四射连衣裙 (23)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=11307189964269737.jpg\" alt=\"131207魅力四射连衣裙 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4449897676570165.jpg\" alt=\"131207魅力四射连衣裙 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5138574255701776.jpg\" alt=\"131207魅力四射连衣裙 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=27490039841540537.jpg\" alt=\"131207魅力四射连衣裙 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4524071511702753.jpg\" alt=\"131207魅力四射连衣裙 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=567012394961519.jpg\" alt=\"131207魅力四射连衣裙 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5398432497524461.jpg\" alt=\"131207魅力四射连衣裙 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=06398106939750348.jpg\" alt=\"131207荷兰风情格子V领连衣裙 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=24702614996894023.jpg\" alt=\"131201清新田园风满版波点衬衣OP (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=41126532587497544.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9196074519857692.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6688984368892463.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=17628098954124227.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (20)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=22700056787779932.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (21)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9213434205149141.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9759992829803257.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=21192168873858996.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=27238735083034105.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (22)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=029410584751051405.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4167103965525091.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (9)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4237244699596461.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8495904328081793.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2612924392823297.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=3128760478806695.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=822121445114883.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=023965606295718755.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=48037012948775426.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=27406649446152.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5163519922203589.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (17)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=1361985177143593.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (12)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=23117634105365958.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (19)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4119731430945631.jpg\" alt=\"131207气质毛呢粉色收身A字裙 (18)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5874971726952845.jpg\" alt=\"131113性感长袖连衣短裙 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=14718853646721208.jpg\" alt=\"131113性感长袖连衣短裙 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5055906759093525.jpg\" alt=\"131113性感长袖连衣短裙 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=42363042497177683.jpg\" alt=\"131124酒红色毛绒呢子直筒短裙 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8988102844738494.jpg\" alt=\"131124酒红色毛绒呢子直筒短裙 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=1728016459763343.jpg\" alt=\"131124酒红色毛绒呢子直筒短裙 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=40948378159251364.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (1)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=35778894687577223.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (11)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=46377023969683073.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (2)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=06874248521575077.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (10)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=48823281642266236.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (13)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9099436216715175.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (14)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=0916245563161402.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (15)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=4467967019362641.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (3)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=02323465876524866.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (16)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=2914616272379573.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (5)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=8549244889447541.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (4)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=5952557001176398.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (6)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=9163759346309587.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (7)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=6561833675249913.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (8)\" style=\"max-width:100%;\"><img src=\"/xyan/attach/viewPic?path=2016-10-14&amp;name=24895534026410726.jpg\" alt=\"131213黑色无袖收腰羽绒背心 (9)\" style=\"max-width:100%;\"></p><p><br></p>', '1', '2016-10-14 14:25:25', '2016-10-14 17:19:41', '3', '美女,好看', '', '1', '1', '', '/xyan/attach/viewPic?path=2016-10-14&name=39efac717c2c9e9f23a5f01e8979e5597df10ffabe95-FM3nxU_fw658.jpg');

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
INSERT INTO `xy_code` VALUES ('ArticleModel', '16');
INSERT INTO `xy_code` VALUES ('ArticleTypeModel', '5');
INSERT INTO `xy_code` VALUES ('DictModel', '14');
INSERT INTO `xy_code` VALUES ('LogModel', '188');
INSERT INTO `xy_code` VALUES ('MailModel', '3');
INSERT INTO `xy_code` VALUES ('MessageModel', '37');
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
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `LOG_DATE` datetime DEFAULT NULL COMMENT 'log时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '记录内容',
  `LOG_TYPE` varchar(3) DEFAULT NULL COMMENT '日志类别',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xy_log
-- ----------------------------
INSERT INTO `xy_log` VALUES ('4', '2016-10-17 09:24:55', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('5', '2016-10-17 09:24:57', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('6', '2016-10-17 09:24:57', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('7', '2016-10-17 09:24:57', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('8', '2016-10-17 09:25:59', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('9', '2016-10-17 09:26:00', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('10', '2016-10-17 09:26:01', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('11', '2016-10-17 09:26:02', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('12', '2016-10-17 10:28:39', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('13', '2016-10-17 10:29:19', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('14', '2016-10-17 10:29:19', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('15', '2016-10-17 10:29:19', '【异常】Index: 0, Size: 0', 'LE');
INSERT INTO `xy_log` VALUES ('16', '2016-10-17 10:30:16', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('17', '2016-10-17 10:30:17', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('18', '2016-10-17 10:30:17', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('19', '2016-10-17 10:30:17', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('20', '2016-10-17 10:30:37', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('21', '2016-10-17 10:30:37', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('22', '2016-10-17 10:30:37', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('23', '2016-10-17 10:30:38', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('24', '2016-10-17 10:31:39', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('25', '2016-10-17 10:31:40', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('26', '2016-10-17 10:31:41', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('27', '2016-10-17 10:31:41', '【异常】java.util.HashMap cannot be cast to com.xyan.admin.model.PreferenceModel', 'LE');
INSERT INTO `xy_log` VALUES ('28', '2016-10-17 10:39:59', '10.60.140.212【访问】/xyan/index', 'LV');
INSERT INTO `xy_log` VALUES ('29', '2016-10-17 10:40:00', '【异常】d:\\tmp\\2016-10-14\\131026纯黑色拉线两边短款开衫 (3).jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('30', '2016-10-17 10:40:01', '【异常】d:\\tmp\\2016-07-27\\8c1271fc5a8d12814f6aa2560539969d737394a1fb27-CBEKph_fw658.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('31', '2016-10-17 10:40:01', '【异常】d:\\tmp\\2016-08-01\\39efac717c2c9e9f23a5f01e8979e5597df10ffabe95-FM3nxU_fw658.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('32', '2016-10-17 10:40:02', '【异常】d:\\tmp\\2016-10-14\\77d664161c9d48792cd11a83f23b835523d0982a43ef3-SEJkbM_fw658.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('33', '2016-10-17 10:40:04', '【异常】d:\\tmp\\2016-08-01\\02.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('34', '2016-10-17 10:40:52', '【异常】Invalid bound statement (not found): com.xyan.frame.security.dao.UserDao.selectModelByExample', 'LE');
INSERT INTO `xy_log` VALUES ('35', '2016-10-17 10:42:55', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('36', '2016-10-17 10:53:03', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('37', '2016-10-17 11:10:07', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('38', '2016-10-18 13:55:46', '10.60.140.212【访问】/xyan/admin/cache/init', 'LV');
INSERT INTO `xy_log` VALUES ('39', '2016-10-18 13:56:20', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('40', '2016-10-18 13:56:54', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('41', '2016-10-18 13:57:28', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('42', '2016-10-18 13:58:24', '10.60.140.212【访问】/xyan/admin/cache/init', 'LV');
INSERT INTO `xy_log` VALUES ('43', '2016-10-18 14:11:15', '10.60.140.212【访问】/xyan/index', 'LV');
INSERT INTO `xy_log` VALUES ('44', '2016-10-18 14:11:19', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('45', '2016-10-18 14:11:19', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('46', '2016-10-18 14:11:19', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('47', '2016-10-18 14:11:19', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('48', '2016-10-18 14:11:20', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('49', '2016-10-18 14:11:20', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('50', '2016-10-18 14:11:21', '【异常】d:\\tmp\\2016-08-01\\02.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('51', '2016-10-18 14:11:21', '【异常】d:\\tmp\\2016-10-14\\131026纯黑色拉线两边短款开衫 (3).jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('52', '2016-10-18 14:11:22', '【异常】d:\\tmp\\2016-10-14\\77d664161c9d48792cd11a83f23b835523d0982a43ef3-SEJkbM_fw658.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('53', '2016-10-18 14:11:21', '【异常】d:\\tmp\\2016-07-27\\8c1271fc5a8d12814f6aa2560539969d737394a1fb27-CBEKph_fw658.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('54', '2016-10-18 14:41:52', '10.60.140.212【访问】/xyan/index', 'LV');
INSERT INTO `xy_log` VALUES ('55', '2016-10-18 14:42:07', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('56', '2016-10-18 14:42:06', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('57', '2016-10-18 14:42:06', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('58', '2016-10-18 14:42:06', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('59', '2016-10-18 14:42:08', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('60', '2016-10-18 14:42:08', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('61', '2016-10-18 14:42:10', '【异常】d:\\tmp\\2016-10-14\\131026纯黑色拉线两边短款开衫 (3).jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('62', '2016-10-18 14:42:20', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('63', '2016-10-18 14:42:24', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('64', '2016-10-18 14:42:24', '10.60.140.212【访问】/xyan/page/500', 'LV');
INSERT INTO `xy_log` VALUES ('65', '2016-10-18 14:42:25', '10.60.140.212【访问】/xyan/page/500', 'LV');
INSERT INTO `xy_log` VALUES ('66', '2016-10-18 14:42:25', '10.60.140.212【访问】/xyan/page/500', 'LV');
INSERT INTO `xy_log` VALUES ('67', '2016-10-18 14:42:25', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('68', '2016-10-18 14:42:27', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('69', '2016-10-18 14:42:34', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('70', '2016-10-18 14:42:39', '10.60.140.212【访问】/xyan/admin/article', 'LV');
INSERT INTO `xy_log` VALUES ('71', '2016-10-18 14:42:40', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('72', '2016-10-18 14:42:40', '10.60.140.212【访问】/xyan/admin/article/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('73', '2016-10-18 14:42:45', '10.60.140.212【访问】/xyan/admin/cache/init', 'LV');
INSERT INTO `xy_log` VALUES ('74', '2016-10-18 14:43:10', '10.60.140.212【访问】/xyan/admin/cache/init', 'LV');
INSERT INTO `xy_log` VALUES ('75', '2016-10-18 14:44:30', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('76', '2016-10-18 14:45:02', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('77', '2016-10-18 14:45:22', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('78', '2016-10-18 14:45:25', '10.60.140.212【访问】/xyan/admin/cache/init', 'LV');
INSERT INTO `xy_log` VALUES ('79', '2016-10-18 14:45:41', '10.60.140.212【访问】/xyan/admin/cache/init', 'LV');
INSERT INTO `xy_log` VALUES ('80', '2016-10-18 14:46:38', '10.60.140.212【访问】/xyan/blog/board', 'LV');
INSERT INTO `xy_log` VALUES ('81', '2016-10-18 14:46:42', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('82', '2016-10-18 14:46:42', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('83', '2016-10-18 14:46:42', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('84', '2016-10-18 14:46:42', '10.60.140.212【访问】/xyan/blog/board/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('85', '2016-10-18 14:46:42', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('86', '2016-10-18 14:46:52', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('87', '2016-10-18 14:47:01', '10.60.140.212【访问】/xyan/blog/board', 'LV');
INSERT INTO `xy_log` VALUES ('88', '2016-10-18 14:47:21', '10.60.140.212【访问】/xyan/blog/board', 'LV');
INSERT INTO `xy_log` VALUES ('89', '2016-10-18 14:47:33', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('90', '2016-10-18 14:47:33', '10.60.140.212【访问】/xyan/blog/board/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('91', '2016-10-18 14:47:33', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('92', '2016-10-18 14:47:33', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('94', '2016-10-18 14:47:35', '10.60.140.212【访问】/xyan/page/500', 'LV');
INSERT INTO `xy_log` VALUES ('95', '2016-10-18 14:47:38', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('96', '2016-10-18 14:47:50', '10.60.140.212【访问】/xyan/blog/board', 'LV');
INSERT INTO `xy_log` VALUES ('97', '2016-10-18 14:57:35', '10.60.140.212【访问】/xyan/blog/board', 'LV');
INSERT INTO `xy_log` VALUES ('98', '2016-10-18 14:57:49', '【异常】null', 'LE');
INSERT INTO `xy_log` VALUES ('99', '2016-10-18 14:57:51', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('101', '2016-10-18 14:59:05', '10.60.140.212【访问】/xyan/blog/board', 'LV');
INSERT INTO `xy_log` VALUES ('102', '2016-10-18 14:59:14', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('103', '2016-10-18 14:59:14', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('104', '2016-10-18 14:59:14', '10.60.140.212【访问】/xyan/blog/board/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('105', '2016-10-18 14:59:14', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('106', '2016-10-18 14:59:14', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('107', '2016-10-18 14:59:21', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('108', '2016-10-18 14:59:24', '【异常】null', 'LE');
INSERT INTO `xy_log` VALUES ('109', '2016-10-18 14:59:25', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('110', '2016-10-18 14:59:25', '【异常】null', 'LE');
INSERT INTO `xy_log` VALUES ('111', '2016-10-18 14:59:25', '【异常】null', 'LE');
INSERT INTO `xy_log` VALUES ('112', '2016-10-18 14:59:26', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('113', '2016-10-18 14:59:37', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('114', '2016-10-18 14:59:40', '【异常】null', 'LE');
INSERT INTO `xy_log` VALUES ('115', '2016-10-18 14:59:56', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('116', '2016-10-18 15:00:15', '【异常】null', 'LE');
INSERT INTO `xy_log` VALUES ('117', '2016-10-18 15:00:19', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('118', '2016-10-18 15:00:32', '【异常】null', 'LE');
INSERT INTO `xy_log` VALUES ('119', '2016-10-18 15:01:47', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('120', '2016-10-18 15:01:48', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('121', '2016-10-18 15:01:47', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('122', '2016-10-18 15:01:48', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('123', '2016-10-18 15:01:48', '10.60.140.212【访问】/xyan/admin/login', 'LV');
INSERT INTO `xy_log` VALUES ('125', '2016-10-18 15:02:27', '10.60.140.212【访问】/xyan/admin/article', 'LV');
INSERT INTO `xy_log` VALUES ('130', '2016-10-18 15:08:32', '10.60.140.212【访问】/xyan/page/404', 'LV');
INSERT INTO `xy_log` VALUES ('131', '2016-10-18 15:08:32', '10.60.140.212【访问】/xyan/admin/article/pageData', 'LV');
INSERT INTO `xy_log` VALUES ('132', '2016-10-18 15:11:45', '10.60.140.212【访问】/xyan/admin/cache/init', 'LV');
INSERT INTO `xy_log` VALUES ('133', '2016-10-18 15:14:12', '【异常】Could not read JSON: Stream closed; nested exception is java.io.IOException: Stream closed', 'LE');
INSERT INTO `xy_log` VALUES ('134', '2016-10-18 15:14:26', '10.60.140.212【访问】/xyan/admin/cache/init', 'LV');
INSERT INTO `xy_log` VALUES ('136', '2016-10-18 15:16:14', '10.60.140.212【访问】/xyan/admin/cache/init', 'LV');
INSERT INTO `xy_log` VALUES ('138', '2016-10-18 15:16:50', '10.60.140.212【访问】/xyan/admin/cache/init', 'LV');
INSERT INTO `xy_log` VALUES ('140', '2016-10-18 15:17:47', '10.60.140.212【访问】/xyan/admin/cache/init', 'LV');
INSERT INTO `xy_log` VALUES ('142', '2016-10-18 15:31:21', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('143', '2016-10-18 15:31:21', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('144', '2016-10-18 15:31:22', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('145', '2016-10-18 15:31:21', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('148', '2016-10-18 15:31:25', '10.60.140.212【访问】/xyan/page/500', 'LV');
INSERT INTO `xy_log` VALUES ('149', '2016-10-18 15:31:26', '10.60.140.212【访问】/xyan/page/500', 'LV');
INSERT INTO `xy_log` VALUES ('150', '2016-10-18 15:31:59', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('151', '2016-10-18 15:32:00', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('152', '2016-10-18 15:32:00', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('153', '2016-10-18 15:32:00', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('154', '2016-10-18 15:32:01', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('155', '2016-10-18 15:32:06', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('156', '2016-10-18 15:32:06', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('157', '2016-10-18 15:32:06', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('158', '2016-10-18 15:32:12', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('159', '2016-10-18 15:32:12', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('160', '2016-10-18 15:32:36', '10.60.140.212【访问】/xyan/', 'LV');
INSERT INTO `xy_log` VALUES ('161', '2016-10-18 15:32:36', '10.60.140.212【访问】/xyan/index', 'LV');
INSERT INTO `xy_log` VALUES ('162', '2016-10-18 15:32:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('163', '2016-10-18 15:32:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('164', '2016-10-18 15:32:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('165', '2016-10-18 15:32:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('166', '2016-10-18 15:32:37', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('167', '2016-10-18 15:32:37', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('168', '2016-10-18 15:32:38', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('169', '2016-10-18 15:32:38', '【异常】d:\\tmp\\2016-08-01\\02.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('170', '2016-10-18 15:32:38', '【异常】d:\\tmp\\2016-10-14\\77d664161c9d48792cd11a83f23b835523d0982a43ef3-SEJkbM_fw658.jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('171', '2016-10-18 15:32:38', '【异常】d:\\tmp\\2016-10-14\\131026纯黑色拉线两边短款开衫 (3).jpg (系统找不到指定的文件。)', 'LE');
INSERT INTO `xy_log` VALUES ('172', '2016-10-18 15:32:39', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('173', '2016-10-18 15:32:40', '10.60.140.212【访问】/xyan/page/500', 'LV');
INSERT INTO `xy_log` VALUES ('174', '2016-10-18 15:32:42', '10.60.140.212【访问】/xyan/blog/life', 'LV');
INSERT INTO `xy_log` VALUES ('175', '2016-10-18 15:32:42', '10.60.140.212【访问】/xyan/blog/getLastArticle', 'LV');
INSERT INTO `xy_log` VALUES ('176', '2016-10-18 15:32:42', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('177', '2016-10-18 15:32:42', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('178', '2016-10-18 15:32:44', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('179', '2016-10-18 15:32:45', '10.60.140.212【访问】/xyan/blog/article/view/15', 'LV');
INSERT INTO `xy_log` VALUES ('180', '2016-10-18 15:32:45', '【异常】d:\\tmp\\2016-07-27\\8c1271fc5a8d12814f6aa2560539969d737394a1fb27-CBEKph_fw658.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('182', '2016-10-18 15:32:45', '10.60.140.212【访问】/xyan/page/500', 'LV');
INSERT INTO `xy_log` VALUES ('183', '2016-10-18 15:32:45', '10.60.140.212【访问】/xyan/attach/viewPic', 'LV');
INSERT INTO `xy_log` VALUES ('184', '2016-10-18 15:32:46', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('185', '2016-10-18 15:32:45', '10.60.140.212【访问】/xyan/blog/getGdList', 'LV');
INSERT INTO `xy_log` VALUES ('186', '2016-10-18 15:32:46', '【异常】d:\\tmp\\2016-07-27\\8c1271fc5a8d12814f6aa2560539969d737394a1fb27-CBEKph_fw658.jpg (系统找不到指定的路径。)', 'LE');
INSERT INTO `xy_log` VALUES ('188', '2016-10-18 15:32:47', '10.60.140.212【访问】/xyan/page/500', 'LV');

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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件';

-- ----------------------------
-- Records of xy_mail
-- ----------------------------
INSERT INTO `xy_mail` VALUES ('0', '1255321142@qq.com', '网站', '您有紧急留言啦<p><p>erwerwer<br></p>', '网站留言', '10');
INSERT INTO `xy_mail` VALUES ('1', '1255321142@qq.com', '网站', '您有紧急留言啦<p><p>您好<br></p>', '网站留言', '10');
INSERT INTO `xy_mail` VALUES ('2', '1255321142@qq.com', '网站', '您有紧急留言啦<p><p>博主您好？看看这个？</p><p><img src=\"/xyan/attach/viewPic?path=2016-10-18&name=8932863669185714.jpg\" alt=\"150104纯白大翻领羊毛外套 (21)\" style=\"max-width:100%;\"></p><p><br></p>', '网站留言', '10');
INSERT INTO `xy_mail` VALUES ('3', '1255321142@qq.com', '网站', '您有紧急留言啦<p><p>测试<br></p>', '网站留言', '10');

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
  `MERGE` varchar(5) DEFAULT NULL COMMENT '是否紧急留言',
  `READ` varchar(5) DEFAULT NULL COMMENT '是否已阅读',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息';

-- ----------------------------
-- Records of xy_message
-- ----------------------------
INSERT INTO `xy_message` VALUES ('29', '1', '-1', '测试留言', '<p>博主您好？看看这个？</p><p><img src=\"/xyan/attach/viewPic?path=2016-10-18&name=8932863669185714.jpg\" alt=\"150104纯白大翻领羊毛外套 (21)\" style=\"max-width:100%;\"></p><p><br></p>', '2016-10-18 13:22:06', 'true', null);
INSERT INTO `xy_message` VALUES ('36', '1', '-1', '测试留言', '<p>2342234234<br></p>', '2016-10-18 14:47:01', null, null);
INSERT INTO `xy_message` VALUES ('37', '1', '-1', '测试留言', '<p>2342234234<br></p>', '2016-10-18 14:47:51', null, null);

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
INSERT INTO `xy_user` VALUES ('1', '王明', '5F1D7A84DB00D2FCE00B31A7FC73224F', '123456', '1255321142@qq.com', '18136442251', 'admin', '0', '2016-07-30 22:16:18', '/xyan/static/img/head/girl-1.jpg');

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
