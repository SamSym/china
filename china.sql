/*
Navicat MySQL Data Transfer

Source Server         : 120.26.231.80
Source Server Version : 50547
Source Host           : 120.26.231.80:3306
Source Database       : china

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-09-19 23:25:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `zs` int(11) DEFAULT NULL,
  `display` varchar(255) DEFAULT NULL,
  `collection_photo_path` varchar(255) DEFAULT NULL,
  `collection_cd` varchar(255) DEFAULT NULL,
  `c_no` varchar(255) DEFAULT NULL,
  `c_weight` varchar(255) DEFAULT NULL,
  `c_js` text,
  `create_man` varchar(255) DEFAULT NULL,
  `update_man` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('1', '青白釉带盖执壶', '4', '景德镇民窑博物馆', 'http://120.26.231.80/jdz_project/upload/f3fe2b62-2295-41bc-bf55-550675da884c.jpg', '宋代', '2', '610(g）', '高15厘米，口径6.5厘米，宋代，社会征集，景德镇民窑博物馆藏。 其特征：圆形盖，盖中带月形纽，盖边粘一镂空圆形物，以便用绳系住盖柄上的圆环，避免壶盖分离摔破。长颈。曲流', null, null, '2016-09-17 13:38:13', '2016-09-19 18:36:05');
INSERT INTO `collection` VALUES ('2', '青白釉高圈足碗', '5', '景德镇民窑博物馆', 'http://120.26.231.80/jdz_project/upload/3f6df1ea-cf9a-49de-991f-e6deb62cad5e.jpg', '宋代', '1', '130（g）', '高6.3厘米，口径12厘米，底径3.9厘米，宋代，社会征集，景德镇民窑博物馆藏。 其特征；撇口，弧腹，高足。足内无釉，有粘渣现象，为仰烧工艺所致。除足内涩胎外，通体施以青白釉', null, null, '2016-09-17 14:23:44', '2016-09-19 17:50:32');
INSERT INTO `collection` VALUES ('4', '青釉瓜棱执壶', '3', '景德镇民窑博物馆', 'http://120.26.231.80/jdz_project/upload/1293d70d-b3c2-47fc-bc41-82691b5129ff.jpg', '五代', '3', '905(g)', '高22.8厘米，口径9.8厘米，底径6.3厘米，五代，社会征集，景德镇民窑博物馆藏。 其特征：瓷质，喇叭口，长流，瓜棱腹，曲柄，圈足，有支钉叠烧痕迹，胎质坚硬，器型端庄，如此完', null, null, '2016-09-18 09:41:26', '2016-09-19 18:35:55');
INSERT INTO `collection` VALUES ('5', '青白釉盘口壶', '4', '景德镇民窑博物馆', 'http://120.26.231.80/jdz_project/upload/3e5cc48f-740d-4d21-ac12-6fed8f28f907.jpg', '宋代', '4', '210（g）', '高11.2厘米，口径5.7厘米，底径6.1厘米，宋代，社会征集，景德镇民窑博物馆藏。 其特征；盘口，长柄，双系，弯流，鼓腹，圈足，足内涩胎，为匣钵仰烧所致。除圈足外，通体满釉，', null, null, '2016-09-18 09:43:36', '2016-09-19 18:35:35');
INSERT INTO `collection` VALUES ('6', '青白釉海水纹斗笠碗', '3', '景德镇民窑博物馆', 'http://120.26.231.80/jdz_project/upload/1fe4d000-ed28-4ba5-a8e5-8bfefe1a1eaf.jpg', '宋代', '5', '90（g）', '高5.6厘米，口径10.4厘米，底径3厘米，宋代，社会征集，景德镇民窑博物馆藏。 其特征；敞口，斜腹，小圈足，呈口大足小状。除足内涩胎外，内外满釉，釉色青白，且白中闪青。碗内', null, null, '2016-09-18 09:44:30', '2016-09-19 18:35:12');
INSERT INTO `collection` VALUES ('8', '青花墓志“李来泰立位', '3', '景德镇民窑博物馆', 'http://120.26.231.80/jdz_project/upload/0e7cce37-42aa-43d8-bd70-ceccedff31af.jpg', '明末', '6', '445（g）', '明末，社会征集，景德镇民窑博物馆藏。 其特征：长方形瓷板，下呈“V”字状，便于插入土中立起。施白釉，釉色白中泛青。上书青花“墓志”二字，中写青花“李来泰立位”五字，', null, null, '2016-09-18 09:45:04', '2016-09-19 18:35:02');
INSERT INTO `collection` VALUES ('9', '粉彩盘', '4', '景德镇民窑博物馆', 'http://120.26.231.80/jdz_project/upload/1e0ce003-c686-4ef3-b3db-4935119d5cc4.jpg', '清代', '4', '200（g）', '粉彩盘\r\n高2.5厘米，口径16.7厘米，底径10.7厘米，清代，社会征集，景德镇民窑博物馆藏。 其特征：敞口，弧腹，圈足，内外白釉，盘内饰以四朵彩绘花卉，材料明艳，构图精美；在四朵花卉之', null, null, '2016-09-18 09:45:39', '2016-09-19 18:35:43');
INSERT INTO `collection` VALUES ('10', '泥照', '5', '景德镇民窑博物馆', 'http://120.26.231.80/jdz_project/upload/4449fb90-81d0-4800-a108-d3745be9d38c.jpg', '宋代', '8', '5（g）', '泥照\r\n宋代，湖田古瓷窑遗址采集，景德镇民窑博物馆藏。 泥照是用来分析和验证制瓷原料耐火度和瓷质程度的试验品。因各地矿料存在优劣之别，其瓷质情况不尽相同，故而只有通过试烧才', null, null, '2016-09-18 09:46:11', '2016-09-19 18:34:56');
INSERT INTO `collection` VALUES ('11', '火照', '3', '景德镇民窑博物馆', 'http://120.26.231.80/jdz_project/upload/61416ae6-10ef-462f-81d5-51771e7e3b18.jpg', '宋代', '5', '30（g）', '火照\r\n宋代，湖田古瓷窑遗址采集，景德镇民窑博物馆藏。 其特征；长条形，中间镂以小孔，是测试窑火及瓷器烧造时生熟程度的窑具，又称“试火具”、“火标”或“火牌”等。南宋蒋祈', null, null, '2016-09-18 09:46:32', '2016-09-19 18:35:19');
INSERT INTO `collection` VALUES ('12', '青花鹿纹盘', '3', '景德镇民窑博物馆', 'http://120.26.231.80/jdz_project/upload/cde58db2-df56-41fe-8d08-898215c2e8e7.jpg', '明末', '10', null, '青花鹿纹盘\r\n高4.2厘米，口径20.9厘米，底径10.7厘米，明末，社会征集，景德镇民窑博物馆藏。 其特征：敞口，折腰，大圈，通体满釉，釉色泛灰，内外青花，料彩灰暗。其盘内心为主题纹饰，绘画', null, null, '2016-09-18 09:47:00', '2016-09-19 18:36:11');

-- ----------------------------
-- Table structure for distribution
-- ----------------------------
DROP TABLE IF EXISTS `distribution`;
CREATE TABLE `distribution` (
  `disid` int(11) NOT NULL AUTO_INCREMENT,
  `disphoto_path` varchar(255) DEFAULT NULL,
  `describes` text,
  `disname` varchar(255) DEFAULT NULL,
  `a` int(11) DEFAULT NULL,
  `b` varchar(255) DEFAULT NULL,
  `c` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`disid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of distribution
-- ----------------------------
INSERT INTO `distribution` VALUES ('1', 'http://120.26.231.80/jdz_project/upload/2f5c5cb7-8731-423a-828a-ed8ec1991765.png', '木泥岭为宋代至明代堆积，在湖田村内，保护范围以3400平米的窑包堆积为界。', '木泥岭', null, null, null);
INSERT INTO `distribution` VALUES ('4', 'http://120.26.231.80/jdz_project/upload/200f6201-58b6-480b-af8b-dd3128c3eccd.png', '刘家墩为明代中晚期堆积，保护范围以围墙为界，面积约1000平方米。', '刘家墩', null, null, null);
INSERT INTO `distribution` VALUES ('5', 'http://120.26.231.80/jdz_project/upload/e61f8d9d-452b-494e-93e2-136f8f3594d3.png', '乌鱼岭（马蹄窑）为明代窑遗址，保护范围以围墙为界，面积约1875平方米。', '乌鱼岭', null, null, null);
INSERT INTO `distribution` VALUES ('7', 'http://120.26.231.80/jdz_project/upload/2a3acf05-23ef-48e6-be0f-d714599f2514.png', '琵琶山为南宋至明代堆积，保护范围以围墙为界，面积约900平方米。', '琵琶山', null, null, null);
INSERT INTO `distribution` VALUES ('8', 'http://120.26.231.80/jdz_project/upload/2167abce-9305-4ae9-9ac0-1abf8c5cc3d1.png', '北望石坞为宋代至明代堆积，保护范围东，南两面以围墙为界限，西，北两面以山脚为界，面积约8500平米。', '北望石坞', null, null, null);
INSERT INTO `distribution` VALUES ('9', 'http://120.26.231.80/jdz_project/upload/3c53e152-6b04-4e0e-af01-a2bef770860e.png', '狮子山为宋代至元代堆积，保护范围南以等高线62.6米为界，西与龙头山相接，北面以602所24,25,27栋南侧挡土墙，26栋北墙，81,82,83，栋南侧挡土墙为界，东沿山势与豪猪岭相接，面积20000平方米', '狮子山', null, null, null);
INSERT INTO `distribution` VALUES ('10', 'http://120.26.231.80/jdz_project/upload/e12e9e8f-a92f-4ca0-b9d2-eec2379da989.png', '龙头山为南宋到元代堆积保护范围南，西两界以围墙为界，背面以中国直升机设计研究所（620所）21,23栋挡土墙为界，东与狮子山相接面积14000平米。', '龙头山', null, null, null);
INSERT INTO `distribution` VALUES ('11', 'http://120.26.231.80/jdz_project/upload/fb049629-3a38-458f-b916-fe5587462cb7.png', '南望石坞为宋至明代堆积保护范围以围墙为界面积约1800平米。', '南望石坞', null, null, null);
INSERT INTO `distribution` VALUES ('12', 'http://120.26.231.80/jdz_project/upload/24ea553a-379f-4a62-91d7-3e5455663ea5.png', '张家地为宋至明代堆积，保护范围东，西两面以山脚崖壁为界，西，南，两侧以天门沟东侧为界，面积约为3500平方米。', '张家地', null, null, null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `meid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `sname` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_man` varchar(255) DEFAULT NULL,
  `update_man` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`meid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('5', '9', 'Kevin-z', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7l1YQQx5RSGb1uj6KicC8Zkk8ueuC3e9rBUFVbkQH4jQGyjKVPwIadfpe7xsmWmuVYunkG9Mbe7SVXbmoxRAmRdZ2nm6rwBmHo/0', '哈哈', null, null, '2016-09-17 12:58:45', null);
INSERT INTO `message` VALUES ('8', '10', '孙宇', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6fzmnicpGFGr31n9UGN0wz4Be6jibzLwzZK7nDsq67wHNiboyJm7raqucWMCKTavT9picQOmibXicCOTobbiaFdFiboj8d9CTHBXHR2wI/0', '你好', null, null, '2016-09-19 14:50:51', null);

-- ----------------------------
-- Table structure for my_dh
-- ----------------------------
DROP TABLE IF EXISTS `my_dh`;
CREATE TABLE `my_dh` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) DEFAULT NULL,
  `d_sname` varchar(255) DEFAULT NULL,
  `zt_photo_path` varchar(255) DEFAULT NULL,
  `create_man` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_man` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_dh
-- ----------------------------
INSERT INTO `my_dh` VALUES ('1', '展厅名2', '次展厅名2', 'http://120.26.231.80/jdz_project/upload/642351fd-4335-41a6-976b-5e58d2e3ff3c.jpg', null, null, null, '2016-09-18 23:16:58');
INSERT INTO `my_dh` VALUES ('2', '展厅名1', '次展厅名1', 'http://120.26.231.80/jdz_project/upload/8bfa714b-825c-4e62-b011-f82799cfb32d.png', null, '2016-09-17 15:29:29', null, '2016-09-18 23:17:21');

-- ----------------------------
-- Table structure for my_info
-- ----------------------------
DROP TABLE IF EXISTS `my_info`;
CREATE TABLE `my_info` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `msub` varchar(255) DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `present` varchar(255) DEFAULT NULL,
  `detail` text,
  `sort` int(11) DEFAULT NULL,
  `create_man` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_man` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_info
-- ----------------------------
INSERT INTO `my_info` VALUES ('1', '景德镇湖田窑:修复重建进行时', 'http://120.26.231.80/jdz_project/upload/de9fcd3c-5ab2-4384-be82-f53570902293.jpg', '基本描述', '修复重建进行时\r\n景德镇湖田窑创烧于五代，鼎盛于宋元，结束于明代中期，是目前发现的我国陶瓷生产规模最大、延续烧造时间最长的一处遗址。其创烧的青白瓷，胎薄质坚、晶莹如玉，反映了宋代最高的制瓷水平，成为宋代青白瓷窑系中的杰出代表，是研究中国陶瓷发展史与中国古代陶瓷工艺的珍贵实物资料。该窑址被列为第二批全国重点文物保护单位。', '2', null, '2016-09-17 03:35:03', null, '2016-09-19 16:58:37');
INSERT INTO `my_info` VALUES ('3', '景德镇民窑博物馆揭牌', 'http://120.26.231.80/jdz_project/upload/jiepai1.jpg', '基本描述', '大江网讯[江西日报]　记者冯建和报道：9月25日，景德镇民窑博物馆正式揭牌，同时展出了数百件民窑瓷器珍品。景德镇民窑博物馆建于全国著名的湖田古瓷窑遗址文物保护区内。它清晰地反映了长达700多年陶瓷工艺史上的重大变革。', '1', null, '2016-09-17 03:21:41', null, '2016-09-18 20:45:16');
INSERT INTO `my_info` VALUES ('8', '景德镇出土历代白瓷珍品展出', 'http://120.26.231.80/jdz_project/upload/baiciping.jpg', '基本描述', '记者余晓玲报道：东莞市博物馆与景德镇御窑博物馆、景德镇民窑博物馆共同举办的《冰肌玉骨—景德镇出土历代白瓷珍品展》正在东莞市博物馆进行展出，展览将一直持续至7月9日。本次展览共精选了三馆收藏的118件（套）白釉瓷器展出，展品涵盖了景德镇五代至清代不同时期烧造的白瓷产品，从中可以看到景德镇白瓷烧造技术的演进以及各时期白瓷的不同特点，包括永乐时期白釉花口盘、宣德年间精美的白釉刻花碗，成化时期小巧精致、淡雅绚丽的白釉小杯等。全面展示了景德镇古代工匠高超的制瓷技术、严格的御窑管理制度和当时先进的制瓷工艺水平，同时向人们揭开官窑瓷器的神秘面纱和民窑瓷器的洒脱。', '3', null, '2016-09-18 10:41:15', null, '2016-09-18 20:50:20');
INSERT INTO `my_info` VALUES ('9', '触网可及 景德镇“网上博物馆”拉近世界与瓷都', 'http://120.26.231.80/jdz_project/upload/internet1.jpg', '基本描述', '江西网络广播电视台1月25日景德镇讯（记者 胡康林）在瓷都景德镇，坐落着多种不同类别、不同时期的陶瓷博物馆、古窑博览区。如今，随着网络时代的不断发展，“网上博物馆”、“网上博览区”已然成为一种与时俱进的传播载体。', '4', null, '2016-09-18 10:43:45', null, '2016-09-18 20:45:01');
INSERT INTO `my_info` VALUES ('10', '发掘保护陶瓷文明：景德镇遗址变迁纪实', 'http://120.26.231.80/jdz_project/upload/guomai.jpg', '基本描述', '景德镇制瓷历史始于汉，兴于唐宋，盛于明清，且至今仍以生产瓷器闻名世界，被西方誉为“世界上最早的一座工业城市”。她因瓷兴市、以瓷立市，与瓷器同名共荣。千年的陶瓷文化，历史的沧桑巨变，在这座城市里，留存了人类文明发展史上规模宏大、价值重大、影响深远的陶瓷文化遗产。', '6', null, '2016-09-18 10:44:05', null, '2016-09-18 20:44:35');
INSERT INTO `my_info` VALUES ('11', '国内古代最大民间窑场景德镇湖田窑出土遗物面', 'http://120.26.231.80/jdz_project/upload/yiwumian1.jpg', '基本描述', '新华网南昌10月8日电（记者张敏李兴文）在景德镇庆祝千年华诞之际，“千年遗韵”——湖田窑五代至明代出土遗物展在景德镇民窑博物馆正式开展，景德镇首次全面、系统地揭开了这个中国古代最大民间窑场的神秘面纱。\r\n　　据景德镇民窑博物馆介绍，经过重新整修，调整补充藏品，完善景点布局后，这次展出的湖田窑出土遗物达到160多件（套），时间跨度由五代延续到明朝。本次展览展出了碗、盏、壶、瓶等湖田窑各个历史阶段生产的各类典型标准器物，以及历次考古发掘出来的珍贵文物及标本，其中尤其以首次发现的一枚宋代瓷制印章最为别致；展览还展示了宋、元、明各个重要历史时期弥足珍贵的窑炉、制瓷作坊等遗迹，向人们展示了古代制瓷场景。', '5', null, '2016-09-18 10:45:26', null, '2016-09-18 20:44:54');

-- ----------------------------
-- Table structure for my_order
-- ----------------------------
DROP TABLE IF EXISTS `my_order`;
CREATE TABLE `my_order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `order_time` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_order
-- ----------------------------
INSERT INTO `my_order` VALUES ('1', '1', '2016-09-19', '22时21分', '张三', '1234567890', '16866668888', 'qwe@qq.com', '2016-09-19 22:22:07', '0');
INSERT INTO `my_order` VALUES ('3', '1', '2016-09-19', '22时22分', 'lisi', '123', '321', 'qwe@qq.com', '2016-09-19 23:20:15', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `age` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `passwords` varchar(255) DEFAULT NULL,
  `User_photo_path` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `create_man` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_man` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `dsname` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('4', null, null, null, 'http://wx.qlogo.cn/mmopen/zjKZVVl8985PicIiaianPXfUVIIQa0WibFaB6SwgZ3mGt6oJpGljT8Eiba7A37uCBRQciaZOS0VSaXMVodoFzib7peLV9nlErsReyOg/0', '回眸', null, null, null, null, '2016-09-18 12:53:50', null, null, 'oUWaov2bOHlaNcm7AwahuIH9gMYM', null);
INSERT INTO `user` VALUES ('7', null, null, null, 'http://qzapp.qlogo.cn/qzapp/1105564012/24BC768A2AE34ED3AF7C44D997EABF9E/100', '回眸', null, null, null, null, '2016-09-18 12:54:16', null, null, '24BC768A2AE34ED3AF7C44D997EABF9E', null);
INSERT INTO `user` VALUES ('9', null, null, null, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7l1YQQx5RSGb1uj6KicC8Zkk8ueuC3e9rBUFVbkQH4jQGyjKVPwIadfpe7xsmWmuVYunkG9Mbe7SVXbmoxRAmRdZ2nm6rwBmHo/0', 'Kevin-z', null, null, null, null, '2016-09-19 10:58:24', null, null, 'omimZv54Fmo3EOpIGEoaH_9-dpNk', null);
INSERT INTO `user` VALUES ('10', null, null, null, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6fzmnicpGFGr31n9UGN0wz4Be6jibzLwzZK7nDsq67wHNiboyJm7raqucWMCKTavT9picQOmibXicCOTobbiaFdFiboj8d9CTHBXHR2wI/0', '孙宇', null, null, null, null, '2016-09-19 11:17:56', null, null, 'oUWaov75PpUCGpUJ8cW5n2H9pv4A', null);
INSERT INTO `user` VALUES ('11', null, null, null, 'http://wx.qlogo.cn/mmopen/pxI9HZib0lX6EGMQVPV7YCbeTkavV4Fxia49LyW25fIKhdFpuZcrfTgWBPjSaDFBia7GdYoShzqEBbHPiacGlBSdraCdxia65uYWJ/0', 'Mark', null, null, null, null, '2016-09-19 12:49:11', null, null, 'omimZv3mDFLdD2cVUV5-tnZay7Fg', null);
INSERT INTO `user` VALUES ('12', null, null, null, 'http://q.qlogo.cn/qqapp/1105455017/1FB11E06AF4D03FA797EB10FBC138C3A/100', '帆♂浅笑°', null, null, null, null, '2016-09-19 21:44:05', null, null, '1FB11E06AF4D03FA797EB10FBC138C3A', null);
