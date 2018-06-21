/*
Navicat MySQL Data Transfer

Source Server         : server_database
Source Server Version : 80011
Source Host           : 10.205.3.122:3306
Source Database       : weibo_db

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2018-06-21 16:36:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for my_user
-- ----------------------------
DROP TABLE IF EXISTS `my_user`;
CREATE TABLE `my_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of my_user
-- ----------------------------
INSERT INTO `my_user` VALUES ('1', '15608068781', 'hh123456', '3677513777');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userid` varchar(20) NOT NULL,
  `username` varchar(40) DEFAULT NULL,
  `realname` varchar(40) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `relation_ship` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `blood` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `register_time` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1371731565', 'Miss', null, '上海 黄浦区', '女', null, '1989年5月21日', null, 'Miss外设店：missgame.taobao.com 商务合作邮箱：miss@missstudio.cn', '2010-12-07', null, null, '英雄联盟 游戏冠军 古灵精怪 爱笑');
INSERT INTO `userinfo` VALUES ('1646218964', 'IT技术博客大学习', null, '北京 海淀区', '男', null, null, null, '欢迎原创作者私信我投稿。另，关注我，没Bug : )', '2009-10-16', 'blogread.cn@gmail.com', null, '网站 程序员 PHP MySQL Linux Apache 系统架构 JavaScrip CSS 用户研究');
INSERT INTO `userinfo` VALUES ('1691944374', '葫芦娃-流浪芒戈如归', '程馨仪', '四川 成都', '女', '单身', '11月1日', 'B', '只要不期待，也就无所谓伤害', '2011-05-28', 'cxyworth@sina.com', '2639023679', null);
INSERT INTO `userinfo` VALUES ('1744816787', '李大梦Lee', null, '四川 成都', '女', null, '1993年9月1日', null, '常年少女 偶尔疯癫', '2010-05-21', '', '605467113', '吃货一枚 海绵宝宝 学生一枚 宅女');
INSERT INTO `userinfo` VALUES ('1753224871', 'MarsMobile', null, '北京 海淀区', '男', null, null, null, 'I have a dream!', '2010-06-11', null, null, 'IT Android Java 培训');
INSERT INTO `userinfo` VALUES ('1817764657', '二呆呆呆呆子', null, '浙江 杭州', '女', null, '1994年6月11日', null, '大本命【五月天】博爱【孙燕姿‖山下智久‖村田充‖SLH‖永远的喘厨‖翔太厨】', '2010-09-11', null, null, '港剧 五月天');
INSERT INTO `userinfo` VALUES ('1920672943', '行总在这里', null, '四川 成都', '男', '单身', '12月4日', 'O', '摄影 羽毛球 唱歌 理科生兼伪文艺 狂吃狂吃。。。', '2011-01-14', '657153274@qq.com', '657153274', '学生一族 旅游美食爱好者 吃 搞笑 电影迷');
INSERT INTO `userinfo` VALUES ('1945823557', '不想做火线', null, '四川 成都', '女', null, '6月3日', null, '沈昌珉的死忠饭', '2011-02-20', null, null, '萧敬腾 所长 青峰 昌珉 仙后 vxq 东方神起 茶茶');
INSERT INTO `userinfo` VALUES ('1947158497', '绮心心心_', null, '上海 闸北区', '女', '恋爱中', '双子座', 'B', null, '2011-02-02', 'zhouqixin0609@126.com', '719156299', null);
INSERT INTO `userinfo` VALUES ('1967342935', 'wide-eyes-gaze', null, '四川 成都', '女', null, '1994年8月3日', null, null, '2011-02-13', '654066373@qq.com', null, '娱乐 音乐 美剧 欧美 mileycyrus aylorswif');
INSERT INTO `userinfo` VALUES ('1976724535', 'cage黑人毅', null, '上海 宝山区', '男', null, '1982年10月31日', null, '斗鱼TV健身主播 BioTechUSA倍肽签约明星。淘宝补给店搜索“斗鱼黑人毅” “鲁大师健身”个人品牌服装搜索“MuscleStalker”', '2011-02-18', null, null, '時尚 汽车 运动 IT數碼 Fashion 體育');
INSERT INTO `userinfo` VALUES ('2043708800', '欣仔_请勇敢向前', null, '山东 青岛', '女', null, null, null, '莫强求', '2011-05-21', '13419321040@sina.cn', null, '健康 文艺 旅游 星座命理 美食');
INSERT INTO `userinfo` VALUES ('2079282633', '我弄丢了一只猫QAQ', null, '上海 松江区', '男', null, '11月24日', null, '最心爱的猫走丢了…', '2011-04-10', '554797539@qq.com', '554797539', '新闻趣事 微博奇葩 美食 搞笑幽默 吃货 自由 旅行 听歌 电影 音乐');
INSERT INTO `userinfo` VALUES ('2093492691', '程序员的那些事', null, '北京 朝阳区', '男', null, null, null, '关注程序员相关话题；吐槽、投稿、合作、招聘请私信联系', '2011-04-18', null, null, '前端开发 测试工程师 软件工程师 IT 互联网 程序设计 编程 软件开发 程序员');
INSERT INTO `userinfo` VALUES ('2290507007', '成都新事儿', null, '四川 成都', '男', null, '1995年11月3日', null, '精准引流，商务合作询VX：xfnh1995', '2011-08-07', null, null, '教育 成都美食 新媒体传播 成都生活 成都理工大学 四川生活 成都人');
INSERT INTO `userinfo` VALUES ('2342812024', 'Jason_请叫我J先森', null, '上海 浦东新区', '男', null, '1994年10月3日', null, 'hard to say', '2011-08-25', '407692422@qq.com', '407692422', '旅游 新闻趣事 搞笑幽默 视频音乐 校园生活');
INSERT INTO `userinfo` VALUES ('2502719702', 'Rachllllllll', null, '海外 美国', '女', '单身', '1994年10月8日', 'A', null, '2011-10-31', null, null, '吃货 宅女 爱笑 平常心 摄影 旅行 自由 听歌 电影');
INSERT INTO `userinfo` VALUES ('2531718422', '凝晨若曦', null, '四川 成都', '男', null, null, null, '面向显示屏编程', '2011-11-13', '490846530@qq.com', null, null);
INSERT INTO `userinfo` VALUES ('2567007317', '阿眉_Ceiba', null, '海外', '女', null, '1995年3月5日', 'O', '爱心、包容、厚德', '2012-01-18', null, null, '小辫儿张云雷 东方神起 旅游 允在死忠饭');
INSERT INTO `userinfo` VALUES ('2612037145', '江江江小鱼儿丶', null, '四川', '男', null, '1994年9月5日', null, null, '2012-02-07', '15881284435@sina.cn', null, '旅游');
INSERT INTO `userinfo` VALUES ('2655299562', '莽子最近特别烦', null, '四川', '男', null, null, null, null, '2012-01-07', null, null, null);
INSERT INTO `userinfo` VALUES ('2681765773', 'YRaining', null, '四川 成都', '男', null, '1992年11月27日', null, '没有什么好说的~~想了解我就粉吧', '2012-03-25', null, null, 'IT数码');
INSERT INTO `userinfo` VALUES ('2690746764', '叶chuanchuan', null, '海外 法国', '女', null, '1994年2月24日', null, '坐标里昂 约片私信～', '2012-01-28', '1326430397@qq.com', '1326430397', null);
INSERT INTO `userinfo` VALUES ('2718103132', '科技控技术宅', null, '广东 深圳', '男', null, null, null, '科技控技术宅，这就是我！', '2012-02-14', null, null, null);
INSERT INTO `userinfo` VALUES ('2746334053', '_涵涵涵墨', null, '四川 攀枝花', '男', '恋爱中', '1994年2月9日', 'B', '你的好友很懒。。什么都有没有介绍。。', '2012-06-05', null, null, '旅游 微博奇葩 新闻趣事 搞笑幽默');
INSERT INTO `userinfo` VALUES ('2754693685', '另类GIF你懂的', null, '其他', '女', null, null, null, '微博内容联系博主Q：250564340 ：商务Q2851661283！！汇集各种内涵，搞笑，知性，亮点内容！女生爱看！男生必备！务必18岁以上方可关注！！', '2012-06-15', null, null, '小视频 幽默搞笑 搞笑 幽默 另类 GIF 时尚 内涵 动漫 漫画');
INSERT INTO `userinfo` VALUES ('2783936074', '红白情人', null, '四川 绵阳', '男', null, null, null, '他说你任何为人称道的美丽，不及他第一次遇见你。', '2012-06-09', '237021911@qq.com', '237021911', '足球 听歌');
INSERT INTO `userinfo` VALUES ('2840293530', 'IO不要停', null, '湖北 武汉', '男', null, '1993年10月5日', null, '。', '2012-06-20', '569230199@qq.com', '569230199', '文艺 IT数码 英语 交友 90后');
INSERT INTO `userinfo` VALUES ('2864539385', 'lxmahtt', null, '四川 成都', '男', null, '1993年10月26日', null, null, '2012-10-04', '1778923029@qq.com', '1778923029', '电脑 生活大爆炸 美食 旅游 搞笑幽默 新闻趣事');
INSERT INTO `userinfo` VALUES ('2871897250', 'Sober-Better', null, '四川 成都', '男', '恋爱中', null, 'B', '人无远虑必有近忧', '2012-07-16', '471448446@qq.com', '471448446', '文艺 教育就业 美食 军事 IT数码 体育 娱乐 改变');
INSERT INTO `userinfo` VALUES ('2879652787', 'Ly铫', null, '其他', '女', null, null, null, '她是戏子，永远只能在别人的故事里流自己的泪。只是想要有这样一个释放的位置……', '2012-07-09', null, null, null);
INSERT INTO `userinfo` VALUES ('2887904374', '花花扔掉也不给你', null, '四川 成都', '女', null, '1994年5月13日', null, '敲凶der～(˶‾᷄ ⁻̫ ‾᷅˵)', '2012-08-03', null, null, null);
INSERT INTO `userinfo` VALUES ('2944803551', '随便取个名而已', null, '重庆 渝中区', '女', null, '1993年8月21日', 'A', 'i miss u when i miss u', '2012-09-10', '444130931@qq.com', '444130931', '立志学好英语 美食 IT数码 娱乐 时尚');
INSERT INTO `userinfo` VALUES ('3001718472', '总差一点点就可以', null, '四川 成都', '男', null, '1994年1月16日', null, null, '2013-12-26', null, null, null);
INSERT INTO `userinfo` VALUES ('3006193723', '像风一样吹散远方', null, '江苏 南京', '男', null, '1994年5月19日', null, null, '2012-10-14', '574264922@qq.com', '574264922', null);
INSERT INTO `userinfo` VALUES ('3029718860', '攀枝花市第三高级中学', null, '四川 成都', '男', null, null, null, '攀枝花市第三高级中学校创建于1978年8月，1982年被四川省教育厅批准为首批办好的42所省重点中学之一，1993年底成为重新确认的全省30所重点中学之一。', '2012-12-17', null, null, '文艺');
INSERT INTO `userinfo` VALUES ('3033290121', '杨昕昕__要瘦瘦瘦哦', null, '四川 成都', '女', null, null, null, '要瘦哦！', '2012-10-23', null, null, '美食 微博奇葩 星座命理 旅游 穿衣美容');
INSERT INTO `userinfo` VALUES ('3127557915', '心绞的硝苯地平', null, '四川 成都', '男', '单身', null, null, null, '2012-11-18', null, null, '美食 旅游 文艺');
INSERT INTO `userinfo` VALUES ('3160016431', '李飞嘘个骆驼', null, '四川 成都', '男', null, null, null, null, '2012-11-22', '', '1520547238', '星座命理 游戏动漫 美女 汽车');
INSERT INTO `userinfo` VALUES ('3173825012', '清风泡菜香', null, '四川 成都', '女', null, '1994年8月26日', null, '苦逼研狗 一心一意林思意', '2013-02-18', null, null, null);
INSERT INTO `userinfo` VALUES ('3178086434', '枫枫c7', null, '四川 攀枝花', '女', null, null, null, null, '2013-02-04', null, null, null);
INSERT INTO `userinfo` VALUES ('3190706060', '何冠宏Schordingerseq', null, '北京', '男', null, null, null, 'Hψ=Εψ +Vψ', '2013-02-14', null, null, null);
INSERT INTO `userinfo` VALUES ('3201997603', '唐健虚个罗陀', null, '其他', '男', null, '1994年10月19日', null, null, '2012-12-10', null, null, null);
INSERT INTO `userinfo` VALUES ('3218540831', 'Se7eN_曼', null, '海外 法国', '女', null, '1995年3月24日', null, '若你喜欢怪人，其实我很美', '2013-01-11', null, null, '白羊女 穿衣美容 名人明星 搞笑幽默 微博奇葩 星座命理 时尚 投资理财 娱乐');
INSERT INTO `userinfo` VALUES ('3244669075', 'Jonarain灬陌', null, '四川 成都', '男', null, '1994年8月29日', null, null, '2013-03-17', null, null, null);
INSERT INTO `userinfo` VALUES ('3325779800', '李轲昕Christina', null, '辽宁 大连', '女', '单身', '1994年12月20日', null, '爱霉女 爱贾老板 爱看电影 爱看足球和其他各类体育转播 爱猫 更爱家里的小泰迪乖乖 生活很美好 需要我们去热爱（ins:christinaoops）', '2013-04-15', '290780363@qq.com', '290780363', '電影 宠物 音樂 美食');
INSERT INTO `userinfo` VALUES ('3465802150', 'DAKUAIRENXIN', null, '辽宁 大连', '男', null, '1994年11月2日', 'O', null, '2013-05-14', '530616370@qq.com', '530616370', '新闻趣事 视频音乐 微博奇葩 搞笑幽默 娱乐 IT数码');
INSERT INTO `userinfo` VALUES ('3777516704', '马尾健身', null, '北京 东城区', '女', null, null, 'O', '健身，就是为了撩汉', '2013-09-07', null, null, '瘦身控 瘦身美容 瘦身减肥 健康饮食 健康生活 健康养生');
INSERT INTO `userinfo` VALUES ('3856719705', '屈小斋', null, '上海 黄浦区', '男', null, '双鱼座', null, null, '2014-04-04', null, null, null);
INSERT INTO `userinfo` VALUES ('3876734080', '书画界', null, '北京', '男', null, null, null, '懂生活，是一种艺术，懂书画，是一种艺术 的生活。', '2013-10-27', null, null, '艺术');
INSERT INTO `userinfo` VALUES ('3888160469', '蓝兰蓝Ann9', null, '四川 攀枝花', '女', null, '1994年11月23日', null, null, '2013-11-05', '137027296@qq.com', '137027296', null);
INSERT INTO `userinfo` VALUES ('3954804657', '变态综艺节目', null, '河南 郑州', '男', null, '1992年4月1日', null, '记得要关注哦！', '2013-12-22', null, null, '搞笑幽默');
INSERT INTO `userinfo` VALUES ('3992121451', '苏黎阿夏', '李诗诗', '四川 成都', '女', '单身', '1995年7月11日', 'O', '人人都说你活该独自凄凉，其实无人懂你情长。', '2014-01-23', 'Sakura_muse@163.com', '1667592995', '美图摄影 星座运势 情感生活 成都生活 校园生活');
INSERT INTO `userinfo` VALUES ('5246957217', 'SNH48_迪奥布兰度', null, '其他', '男', null, null, null, '气人偶像团体SNH48替身使者迪奥布兰度', '2014-08-15', null, null, null);
INSERT INTO `userinfo` VALUES ('5260717816', 'edc向陈冠希学习', null, '广东 广州', '男', null, '1996年6月28日', null, null, '2014-08-19', null, null, '电影迷 动漫 新闻资讯 音乐 爱电影');
INSERT INTO `userinfo` VALUES ('5469345453', '四川校园资讯', null, '四川', '男', null, '2015年1月9日', null, '爆料/宣传/推广 QQ374901800', '2015-01-09', null, null, null);
INSERT INTO `userinfo` VALUES ('5887581312', '史蒂芬霍金_StephenHawking', null, '海外 英国', '男', null, '1942年1月8日', null, '欢迎来到霍金教授的官方微博。本微博由霍金团队以及社交媒体公司Stradella Road共同管理维护，落款SH的内容均来自于霍金教授本人。', '2016-03-23', null, null, 'Science');
