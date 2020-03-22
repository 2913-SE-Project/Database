/*
*list of tables*
1. movie_info
2. played_by
3. halls
4. screenings(场次)
5. snacks
6. manager

PS: 1. 可设计电影排名
	2. 不同影院同一电影票价不同 后期设计（目前只在release_info里）

问题：
1. movie_info片长的数据类型？时间or整数
2. 电影票信息通过select from movie_info,user可直接打印？
3. 用户登陆调用影院信息
4. ID（PK）无法自增长:(
5. 引入外键时JOIN两个表会不会自动识别外键匹配？

*/
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

# Basic information of the movie
DROP TABLE IF EXISTS `movie_info`;
CREATE TABLE `movie_info`  (
  `Mid` int auto_increment,
  `Mname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Director` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  #`Awards` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MType` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, #type of the movie
  `Lanuage` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Country` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ReleaseDate` date NOT NULL,
  `RunningTime` int(11) NULL DEFAULT NULL, #minutes
  `Dtype` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, #whether the movie is 2D or 3D
  `Intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL, 
  `Poster` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL, # store file path
   PRIMARY KEY (`Mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

#1.
INSERT INTO `movie_info` VALUES (NULL, 'Green Book', 'Peter Farrelly', 'Biography, Comedy, Drama', 'English', 'USA', '2020-03-01', 130, '2D',
'A working-class Italian-American bouncer becomes the driver of an African-American classical pianist on a tour of venues through the 1960s American South.', 'pics\\GreenBook.jpg');
#2.
INSERT INTO `movie_info` VALUES (NULL, 'Leon', 'Luc Besson', 'Action, Crime, Drama', 'French', 'France', '2020-03-01', 110, '2D',
'Mathilda, a 12-year-old girl, is reluctantly taken in by Léon, a professional assassin, after her family is murdered. An unusual relationship forms as she becomes his protégée and learns the assassin\'s trade.', 'pics\\Leon.jpg');
#3.
INSERT INTO `movie_info` VALUES (NULL, 'Titanic', 'James Cameron', 'Drama, Romance', 'English', 'USA', '2020-03-02', 194, '2D',
'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.', 'pics\\Titanic.jpg');
#4.
INSERT INTO `movie_info` VALUES (NULL, 'Forrest Gump', 'Robert Zemeckis', 'Drama, Romance', 'English', 'USA', '2020-03-02', 142, '2D',
'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other historical events unfold through the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart.', 'pics\\ForrestGump.jpg');
#5.
INSERT INTO `movie_info` VALUES (NULL, 'Coco', 'Lee Unkrich', 'Animation, Adventure, Family', 'English', 'USA', '2020-03-11', 105, '3D',
'Aspiring musician Miguel, confronted with his family\'s ancestral ban on music, enters the Land of the Dead to find his great-great-grandfather, a legendary singer.', 'pics\\Coco.jpg');
#6. 
INSERT INTO `movie_info` VALUES (NULL, 'Flipped', 'Rob Reiner', 'Comedy, Drama, Romance', 'English', 'USA', '2020-03-11', 90, '2D',
'Two eighth-graders start to have feelings for each other despite being total opposites.', 'pics\\Flipped.jpg');
#7.
INSERT INTO `movie_info` VALUES (NULL, 'Avengers: Age of Ultron', 'Joss Whedon', 'Action, Adventure, Sci-Fi', 'English', 'USA', '2020-03-13', 143, '3D',
'When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and it\'s up to Earth\'s mightiest heroes to stop the villainous Ultron from enacting his terrible plan.', 'pics\\Avengers2015.jpg');
#8. 
INSERT INTO `movie_info` VALUES (NULL, 'Avengers: Infinity War', 'Anthony Russo', 'Action, Adventure, Sci-Fi', 'English', 'USA', '2020-03-18', 149, '3D',
'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', 'pics\\Avengers2018.jpg');
#9.
INSERT INTO `movie_info` VALUES (NULL, 'Avengers: Endgame', 'Anthony Russo', 'Action, Adventure, Sci-Fi', 'English', 'USA', '2020-03-24', 181, '3D',
'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.', 'pics\\Avengers2019.jpg');
#10.
INSERT INTO `movie_info` VALUES (NULL, 'The Invisible Guest', 'Oriol Paulo', 'Crime, Mystery, Thriller', 'Spanish', 'Spain', '2020-03-25', 106, '3D',
'A successful entrepreneur accused of murder and a witness preparation expert have less than three hours to come up with an impregnable defence.', 'pics\\TheInisibleGuest.jpg');

SELECT * FROM movie_info;


# actors who play in the movie
# use the forein key
DROP TABLE IF EXISTS `played_by`;
CREATE TABLE `played_by`  (
  `Mid` int NOT NULL,
  `Actor` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`Mid`, `Actor`) USING BTREE,
  FOREIGN KEY (`Mid`) REFERENCES `movie_info` (`Mid`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `played_by` VALUES (1,'Viggo Mortensen');
INSERT INTO `played_by` VALUES (1,'Mahershala Ali');
INSERT INTO `played_by` VALUES (2,'Jean Reno');
INSERT INTO `played_by` VALUES (2,'Gary Oldman');
INSERT INTO `played_by` VALUES (2,'Natalie Portman');
INSERT INTO `played_by` VALUES (3,'Leonardo DiCaprio');
INSERT INTO `played_by` VALUES (3,'Kate Winslet');
INSERT INTO `played_by` VALUES (3,'Billy Zane');
INSERT INTO `played_by` VALUES (4,'Tom Hanks');
INSERT INTO `played_by` VALUES (4,'Robin Wright');
INSERT INTO `played_by` VALUES (4,'Gary Sinise');
INSERT INTO `played_by` VALUES (5,'Anthony Gonzalez');
INSERT INTO `played_by` VALUES (5,'Gael García Bernal');
INSERT INTO `played_by` VALUES (5,'Benjamin Bratt');
INSERT INTO `played_by` VALUES (6,'Madeline Carroll');
INSERT INTO `played_by` VALUES (6,'Callan McAuliffe');
INSERT INTO `played_by` VALUES (7,'Robert Downey Jr.');
INSERT INTO `played_by` VALUES (7,'Chris Evans');
INSERT INTO `played_by` VALUES (7,'Mark Ruffalo');
INSERT INTO `played_by` VALUES (7,'Scarlett Johansson');
INSERT INTO `played_by` VALUES (8,'Scarlett Johansson');
INSERT INTO `played_by` VALUES (8,'Robert Downey Jr.');
INSERT INTO `played_by` VALUES (8,'Chris Hemsworth');
INSERT INTO `played_by` VALUES (8,'Mark Ruffalo'); 
INSERT INTO `played_by` VALUES (9,'Robert Downey Jr.'); 
INSERT INTO `played_by` VALUES (9,'Chris Evans'); 
INSERT INTO `played_by` VALUES (9,'Mark Ruffalo'); 
INSERT INTO `played_by` VALUES (9,'Scarlett Johansson'); 
INSERT INTO `played_by` VALUES (10,'Mario Casas'); 
INSERT INTO `played_by` VALUES (10,'Ana Wagener'); 
INSERT INTO `played_by` VALUES (10,'Jose Coronado'); 

#select * from played_by;
#select movie_info.Mname, movie_info.Director, played_by.Actor  from movie_info INNER JOIN played_by;

#放映厅
DROP TABLE IF EXISTS `halls`;
CREATE TABLE `halls`  (
  `Hid` int(3),
  `HallType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RowNum` int(5) NOT NULL,
  `ColNum` int(5) NOT NULL,
  PRIMARY KEY (`Hid`) USING BTREE
  ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

# When the information of the movie is displayed, the type of the hall should be shown together with the ID.
INSERT INTO `halls` VALUES(1, NULL, 12, 15);
INSERT INTO `halls` VALUES(2, NULL, 12, 15);
INSERT INTO `halls` VALUES(3, NULL, 15, 18);
INSERT INTO `halls` VALUES(4, NULL, 15, 18);
INSERT INTO `halls` VALUES(5, NULL, 15, 18);
INSERT INTO `halls` VALUES(6, 'IMAX', 12, 15);
INSERT INTO `halls` VALUES(7, 'IMAX', 15, 18);
INSERT INTO `halls` VALUES(8, 'VIP', 10, 12);

  
# 场次  
DROP TABLE IF EXISTS `screenings`;
CREATE TABLE `screenings`  (
  `Sid` int AUTO_INCREMENT,
  `Mid` int,
  `Hid` int,
  `DateTime` TIMESTAMP NOT NULL,
  `Price` double(10, 2) NULL DEFAULT NULL,
  
  PRIMARY KEY (`Sid`) USING BTREE,
  FOREIGN KEY (`Mid`) REFERENCES `movie_info` (`Mid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (`Hid`) REFERENCES `halls` (`Hid`) ON DELETE RESTRICT ON UPDATE CASCADE
  ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
 
 #the screenings for the 1. GreenBook
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-01 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-01 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-01 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 1, 3, '2020-3-01 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 1, 8, '2020-3-01 19:40:00', 60);
  
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-02 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-02 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-02 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 1, 3, '2020-3-02 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 1, 8, '2020-3-02 19:40:00', 60);

INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-03 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-03 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-03 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 1, 3, '2020-3-03 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 1, 8, '2020-3-03 19:40:00', 60);

INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-04 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-04 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-04 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 1, 3, '2020-3-04 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 1, 8, '2020-3-04 19:40:00', 60);

INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-05 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-05 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-05 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 1, 3, '2020-3-05 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 1, 8, '2020-3-05 19:40:00', 60);

INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-06 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-06 17:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 1, 3, '2020-3-06 19:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 1, 8, '2020-3-06 19:40:00', 65);

INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-07 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-07 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 1, 3, '2020-3-07 19:20:00', 50);

INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-08 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-08 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 1, 3, '2020-3-08 19:20:00', 50);
 
INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-09 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 1, 3, '2020-3-09 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 1, 8, '2020-3-09 19:40:00', 60);

INSERT INTO `screenings` VALUES(NULL, 1, 1, '2020-3-10 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 1, 3, '2020-3-10 19:20:00', 50);

# the screenings for the 2. Leon
INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-01 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-01 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-01 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-01 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 2, 8, '2020-3-01 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-02 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-02 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-02 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-02 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 2, 8, '2020-3-02 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-03 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-03 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-03 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-03 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 2, 8, '2020-3-03 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-04 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-04 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-04 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-04 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 2, 8, '2020-3-04 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-05 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-05 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-05 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-05 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 2, 8, '2020-3-05 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-06 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-06 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-06 20:30:00', 42);

INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-07 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-07 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-07 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 2, 8, '2020-3-07 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-08 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-08 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-08 15:20:00', 40);

INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-09 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-09 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-09 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 2, 8, '2020-3-09 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 2, 2, '2020-3-10 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-10 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 2, 4, '2020-3-10 20:30:00', 42);

# the screenings for the 3. Titanic
INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-02 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-02 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-02 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 3, 8, '2020-3-02 16:10:00', 52);
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-02 22:00:00', 47);

INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-03 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-03 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-03 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 3, 8, '2020-3-03 16:10:00', 52);
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-03 22:00:00', 47);

INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-04 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-04 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-04 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 3, 8, '2020-3-04 16:10:00', 52);
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-04 22:00:00', 47);

INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-05 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-05 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-05 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 3, 8, '2020-3-05 16:10:00', 52);
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-05 22:00:00', 47);

INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-06 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-06 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 3, 8, '2020-3-06 16:10:00', 52);
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-06 22:00:00', 47);

INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-07 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-07 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-07 22:00:00', 47);

INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-08 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-08 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 3, 8, '2020-3-08 16:10:00', 52);
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-08 22:00:00', 47);

INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-09 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-09 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-09 22:00:00', 47);

INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-10 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-10 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 3, 8, '2020-3-10 16:10:00', 52);

INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-11 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-11 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-11 22:00:00', 47);

INSERT INTO `screenings` VALUES(NULL, 3, 3, '2020-3-12 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 3, 2, '2020-3-12 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 3, 8, '2020-3-12 16:10:00', 52);

# the screenings for the 4. Forrest Gump
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-02 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-02 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 4, 8, '2020-3-02 13:30:00', 50); 
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-02 17:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 4, 1, '2020-3-02 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-03 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-03 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 4, 8, '2020-3-03 13:30:00', 52); 
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-03 17:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 4, 1, '2020-3-03 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-04 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-04 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 4, 8, '2020-3-04 13:30:00', 52); 
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-04 17:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 4, 1, '2020-3-04 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-05 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-05 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 4, 8, '2020-3-05 13:30:00', 52); 
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-05 17:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 4, 1, '2020-3-05 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-06 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-06 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 4, 8, '2020-3-06 13:30:00', 52); 
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-06 17:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 4, 1, '2020-3-06 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-07 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-07 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 4, 8, '2020-3-07 13:30:00', 52); 
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-07 17:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 4, 1, '2020-3-07 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-08 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 4, 8, '2020-3-08 13:30:00', 52); 
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-08 17:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 4, 1, '2020-3-08 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-09 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 4, 8, '2020-3-09 13:30:00', 52); 
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-09 17:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 4, 1, '2020-3-09 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-10 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 4, 8, '2020-3-10 13:30:00', 52); 
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-10 17:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 4, 1, '2020-3-10 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-11 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-11 17:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 4, 1, '2020-3-11 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-12 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 4, 4, '2020-3-12 17:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 4, 1, '2020-3-12 19:40:00', 47);

# the screenings for the 5. Coco
INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-11 10:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 1, '2020-3-11 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-11 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 5, 7, '2020-3-11 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 8, '2020-3-11 19:40:00', 60);
  
INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-12 10:00:00', 48);
INSERT INTO `screenings` VALUES(NULL, 5, 1, '2020-3-12 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-12 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 5, 7, '2020-3-12 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 8, '2020-3-12 19:40:00', 60);

INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-13 10:00:00', 48);
INSERT INTO `screenings` VALUES(NULL, 5, 1, '2020-3-13 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-13 17:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 7, '2020-3-13 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 8, '2020-3-13 19:40:00', 60);

INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-14 10:00:00', 48);
INSERT INTO `screenings` VALUES(NULL, 5, 1, '2020-3-14 15:00:00', 45);  
INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-14 17:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 7, '2020-3-14 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 8, '2020-3-14 19:40:00', 60);

INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-15 10:00:00', 48);
INSERT INTO `screenings` VALUES(NULL, 5, 1, '2020-3-15 15:00:00', 48);  
INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-15 17:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 7, '2020-3-15 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 8, '2020-3-15 19:40:00', 60);

INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-16 15:00:00', 48);  
INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-16 17:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 7, '2020-3-16 19:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 5, 8, '2020-3-16 19:40:00', 65);

INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-17 15:00:00', 48);  
INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-17 17:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 3, '2020-3-17 19:20:00', 45);

INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-18 15:00:00', 48);  
INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-18 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 5, 3, '2020-3-18 19:20:00', 45);
 
INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-19 17:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 3, '2020-3-19 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 5, 8, '2020-3-19 19:40:00', 60);

INSERT INTO `screenings` VALUES(NULL, 5, 6, '2020-3-20 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 5, 3, '2020-3-20 19:20:00', 50);

# the screenings for the 6. Flipped
INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-11 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-11 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-11 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-11 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 6, 8, '2020-3-11 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-12 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-12 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-12 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-12 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 6, 8, '2020-3-12 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-13 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-13 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-13 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-13 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 6, 8, '2020-3-13 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-14 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-14 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-14 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-14 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 6, 8, '2020-3-14 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-15 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-15 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-15 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-15 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 6, 8, '2020-3-15 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-16 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-16 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-16 20:30:00', 42);

INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-17 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-17 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-17 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 6, 8, '2020-3-17 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-18 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-18 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-18 15:20:00', 40);

INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-19 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-19 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-19 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 6, 8, '2020-3-19 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 6, 2, '2020-3-20 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-20 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 6, 4, '2020-3-20 20:30:00', 42);

# the screenings for the 7. Avengers: Age of Ultron
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-13 10:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 7, 4, '2020-3-13 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 7, 8, '2020-3-13 13:30:00', 60); 
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-13 17:10:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 6, '2020-3-13 19:40:00', 52);

INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-14 10:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 4, '2020-3-14 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 7, 8, '2020-3-14 13:30:00', 60); 
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-14 17:10:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 6, '2020-3-14 19:40:00', 52);

INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-15 10:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 4, '2020-3-15 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 7, 8, '2020-3-15 13:30:00', 60); 
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-15 17:10:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 6, '2020-3-15 19:40:00', 52);

INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-16 10:00:00', 45);
INSERT INTO `screenings` VALUES(NULL, 7, 4, '2020-3-16 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 7, 8, '2020-3-16 13:30:00', 52); 
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-16 17:10:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 6, '2020-3-16 19:40:00', 52);

INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-17 10:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 4, '2020-3-17 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 7, 8, '2020-3-17 13:30:00', 60); 
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-17 17:10:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-17 19:40:00', 52);

INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-18 10:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 4, '2020-3-18 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 7, 8, '2020-3-18 13:30:00', 60); 
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-18 17:10:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-18 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 7, 4, '2020-3-19 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 7, 8, '2020-3-19 13:30:00', 60); 
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-19 17:10:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-19 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 7, 4, '2020-3-20 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 7, 8, '2020-3-20 13:30:00', 60); 
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-20 17:10:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-20 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 7, 4, '2020-3-21 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 7, 8, '2020-3-21 13:30:00', 60); 
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-21 17:10:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-21 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 7, 4, '2020-3-22 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-22 17:10:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-22 19:40:00', 47);

INSERT INTO `screenings` VALUES(NULL, 7, 4, '2020-3-23 12:40:00', 40); 
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-23 17:10:00', 50);
INSERT INTO `screenings` VALUES(NULL, 7, 7, '2020-3-23 19:40:00', 47);

# the screenings for the 8. Avengers: Infinity War
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-18 10:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 3, '2020-3-18 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 8, 2, '2020-3-18 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 8, 8, '2020-3-18 16:10:00', 57);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-18 19:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-18 22:00:00', 50);

INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-19 10:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 8, 3, '2020-3-19 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 8, 2, '2020-3-19 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 8, 8, '2020-3-19 16:10:00', 57);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-19 19:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-19 22:00:00', 50);

INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-20 10:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 8, 3, '2020-3-20 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 8, 2, '2020-3-20 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 8, 8, '2020-3-20 16:10:00', 57);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-20 19:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-20 22:00:00', 50);

INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-21 10:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 8, 3, '2020-3-21 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 8, 2, '2020-3-21 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 8, 8, '2020-3-21 16:10:00', 57);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-21 19:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-21 22:00:00', 50);

INSERT INTO `screenings` VALUES(NULL, 8, 3, '2020-3-22 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 8, 2, '2020-3-22 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 8, 8, '2020-3-22 16:10:00', 57);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-22 19:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-22 22:00:00', 50);

INSERT INTO `screenings` VALUES(NULL, 8, 3, '2020-3-23 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 8, 2, '2020-3-23 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-23 19:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-23 22:00:00', 50);

INSERT INTO `screenings` VALUES(NULL, 8, 3, '2020-3-24 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 8, 2, '2020-3-24 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 8, 8, '2020-3-24 16:10:00', 57);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-24 19:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-24 22:00:00', 50);

INSERT INTO `screenings` VALUES(NULL, 8, 3, '2020-3-25 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 8, 2, '2020-3-25 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-25 19:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-25 22:00:00', 50);

INSERT INTO `screenings` VALUES(NULL, 8, 3, '2020-3-26 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 8, 2, '2020-3-26 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-26 19:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 8, '2020-3-26 16:10:00', 57);

INSERT INTO `screenings` VALUES(NULL, 8, 3, '2020-3-27 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 8, 2, '2020-3-27 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-27 19:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-27 22:00:00', 47);

INSERT INTO `screenings` VALUES(NULL, 8, 3, '2020-3-28 13:30:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 8, 2, '2020-3-28 15:10:00', 42);
INSERT INTO `screenings` VALUES(NULL, 8, 6, '2020-3-28 19:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 8, 8, '2020-3-28 16:10:00', 57);

# the screenings for the 9. Avengers: Endgame
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-24 10:00:00', 55);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-24 15:00:00', 50);  
INSERT INTO `screenings` VALUES(NULL, 9, 1, '2020-3-24 17:20:00', 52);
INSERT INTO `screenings` VALUES(NULL, 9, 3, '2020-3-24 19:20:00', 55);
INSERT INTO `screenings` VALUES(NULL, 9, 8, '2020-3-24 19:40:00', 65);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-24 20:00:00', 55);

INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-25 10:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-25 15:00:00', 50);  
INSERT INTO `screenings` VALUES(NULL, 9, 1, '2020-3-25 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 9, 3, '2020-3-25 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 8, '2020-3-25 19:40:00', 60);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-25 20:00:00', 55);

INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-26 10:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-26 15:00:00', 50);  
INSERT INTO `screenings` VALUES(NULL, 9, 1, '2020-3-26 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 9, 3, '2020-3-26 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 8, '2020-3-26 19:40:00', 60);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-26 20:00:00', 55);

INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-27 10:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-27 15:00:00', 50);  
INSERT INTO `screenings` VALUES(NULL, 9, 1, '2020-3-27 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 9, 3, '2020-3-27 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 8, '2020-3-27 19:40:00', 60);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-27 20:00:00', 55);
  
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-28 15:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 3, '2020-3-28 19:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 9, 8, '2020-3-28 19:40:00', 65);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-28 20:00:00', 55);
 
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-29 15:00:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 3, '2020-3-29 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-29 20:00:00', 55);

INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-30 15:00:00', 50);  
INSERT INTO `screenings` VALUES(NULL, 9, 1, '2020-3-30 17:20:00', 47);
INSERT INTO `screenings` VALUES(NULL, 9, 3, '2020-3-30 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-30 20:00:00', 55);

INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-31 15:00:00', 50); 
INSERT INTO `screenings` VALUES(NULL, 9, 3, '2020-3-31 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 8, '2020-3-31 19:40:00', 60);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-3-31 20:00:00', 55);

INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-4-1 15:00:00', 50); 
INSERT INTO `screenings` VALUES(NULL, 9, 3, '2020-4-1 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-4-1 20:00:00', 55);

INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-4-1 15:00:00', 50); 
INSERT INTO `screenings` VALUES(NULL, 9, 3, '2020-4-2 19:20:00', 50);
INSERT INTO `screenings` VALUES(NULL, 9, 7, '2020-4-2 20:00:00', 55);

# the screenings for the 10. The Invisible Guest
INSERT INTO `screenings` VALUES(NULL, 10, 2, '2020-3-25 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-25 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-25 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-25 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 10, 8, '2020-3-25 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 10, 2, '2020-3-26 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-26 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-26 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-26 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 10, 8, '2020-3-26 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 10, 2, '2020-3-27 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-27 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-27 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-27 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 10, 8, '2020-3-27 22:00:00', 52);
INSERT INTO `screenings` VALUES(NULL, 10, 2, '2020-3-28 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-28 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-28 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-28 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 10, 8, '2020-3-28 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 10, 2, '2020-3-29 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-29 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-29 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 10, 5, '2020-3-29 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 10, 8, '2020-3-29 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 10, 2, '2020-3-30 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 10, 4, '2020-3-30 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 10, 4, '2020-3-30 20:30:00', 42);

INSERT INTO `screenings` VALUES(NULL, 10, 2, '2020-3-31 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 10, 4, '2020-3-31 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 10, 4, '2020-3-31 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 10, 8, '2020-3-31 22:00:00', 52);

INSERT INTO `screenings` VALUES(NULL, 10, 2, '2020-4-1 10:30:00', 45);
INSERT INTO `screenings` VALUES(NULL, 10, 2, '2020-4-1 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 10, 4, '2020-4-1 15:20:00', 40);

INSERT INTO `screenings` VALUES(NULL, 10, 2, '2020-4-2 13:00:00', 40);  
INSERT INTO `screenings` VALUES(NULL, 10, 4, '2020-4-2 15:20:00', 40);
INSERT INTO `screenings` VALUES(NULL, 10, 4, '2020-4-2 20:30:00', 42);
INSERT INTO `screenings` VALUES(NULL, 10, 8, '2020-4-2 22:00:00', 52);

select * from screenings;
  
/*
# display of snacks
DROP TABLE IF EXISTS `snacks`;
CREATE TABLE `snacks`  (
  `SnackName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SnackPrice` double(5, 2) NOT NULL,
  `Pic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  
  PRIMARY KEY (`SnackName`) USING BTREE
  ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
*/

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator`  (
  `AName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,  
  PRIMARY KEY (`AName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

  
SET FOREIGN_KEY_CHECKS = 1;


