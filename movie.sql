/*
*list of tables*
1. movieinfo
2. played_by
3. halls
4. screenings(场次)
5. snacks

PS: 1. 可设计电影排名
	2. 不同影院同一电影票价不同 后期设计（目前只在release_info里）

问题：
1. movieinfo片长的数据类型？时间or整数
2. 电影票信息通过select from movieinfo,user可直接打印？
3. 用户登陆调用影院信息
4. ID（PK）无法自增长:(
5. 引入外键时JOIN两个表会不会自动识别外键匹配？

*/
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

# Basic information of the movie
DROP TABLE IF EXISTS `movieinfo`;
CREATE TABLE `movieinfo`  (
   #`Mid` int(10) NOT NULL,
  `Mid` int auto_increment,
  `Mname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Director` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  #`Awards` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MType` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, #type of the movie
  `Lanuage` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Country` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReleaseDate` date NOT NULL,
  `RunningTime` int(11) NULL DEFAULT NULL,
  `Intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
  `poster` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, # store file path
   PRIMARY KEY (`Mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

# INSERT INTO `movieinfo` VALUES (NULL, '想见你',NULL,'爱情悬疑', 'Chinese', '中国台湾', '2020-02-02', 120, '李子维黄雨萱', NULL);
# INSERT INTO `movieinfo` VALUES (NULL, 'melo体质','Byeong-Heon Lee','爱情搞笑', 'Korean', '韩国', '2020-02-02', 120, '世界上最好的东西', NULL);
# SELECT * FROM movieinfo;


# actors who play in the movie
# use the forein key
DROP TABLE IF EXISTS `played_by`;
CREATE TABLE `played_by`  (
  `Mid` int NOT NULL,
  `Actor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`Mid`, `Actor`) USING BTREE,
  FOREIGN KEY (`Mid`) REFERENCES `movieinfo` (`Mid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `played_by` VALUES (1,'许光汉');
INSERT INTO `played_by` VALUES (2,'Cheon Woo-Hee');
INSERT INTO `played_by` VALUES (2,'Jeon Yeo-bin');
INSERT INTO `played_by` VALUES (1,'柯佳嬿');
INSERT INTO `played_by` VALUES (2,'Han Ji Eun');

#select * from played_by;
#select movieinfo.Mname, movieinfo.Director, played_by.Actor  from movieinfo INNER JOIN played_by;

#放映厅
DROP TABLE IF EXISTS `halls`;
CREATE TABLE `halls`  (
  `Hid` int(3),
  `ScreenType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RowNum` int(5) NOT NULL,
  `ColNum` int(5) NOT NULL,
  PRIMARY KEY (`Hid`) USING BTREE
  ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `halls` VALUES(1, 'standard', 10, 10);
INSERT INTO `halls` VALUES(4, 'IMAX', 12, 15);
  
  
# 场次  
DROP TABLE IF EXISTS `screenings`;
CREATE TABLE `screenings`  (
  `Sid` int AUTO_INCREMENT,
  `Mid` int,
  `Hid` int,
  `DateTime` TIMESTAMP NOT NULL,
  `MPrice` double(10, 2) NULL DEFAULT NULL,
  
  PRIMARY KEY (`Sid`) USING BTREE,
  FOREIGN KEY (`Mid`) REFERENCES `movieinfo` (`Mid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (`Hid`) REFERENCES `halls` (`Hid`) ON DELETE RESTRICT ON UPDATE CASCADE
  ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
  
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-1-19 11:14:07', 40);  
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-1-20 11:14:07', 80);  
select * from screenings;
  

# display of snacks
DROP TABLE IF EXISTS `snacks`;
CREATE TABLE `snacks`  (
  `SnackName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SnackPrice` double(5, 2) NOT NULL,
  `Pic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  
  `Quantity`  int(3) DEFAULT NULL,
  
  PRIMARY KEY (`SnackName`) USING BTREE
  ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;




#SELECT * FROM snacks;  

  
SET FOREIGN_KEY_CHECKS = 1;


