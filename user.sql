/*
1. user
2. ticket_order
3. snack_cart
4. snack_order
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `Username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CardAccount` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Pay_Password` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,  
  PRIMARY KEY (`Username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

# ticket orders for movies
DROP TABLE IF EXISTS `ticket_order`;
CREATE TABLE `ticket_order`  (
  `TOid` int AUTO_INCREMENT,
  # get the name of the movie, start time of the movie, screen type, and name of the hall 
  `Sid` int,
  `Username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `StartTime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  #seat
  `Row` int(3) NOT NULL,
  `Colum` int(3) NOT NULL,
  
  `TicketType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TicketPrice` double(10,2) NOT NULL,
  PRIMARY KEY (`TOid`) USING BTREE,
  FOREIGN KEY (`Sid`) REFERENCES `screenings` (`Sid`) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '' ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `snack_cart`;
CREATE TABLE `snack_cart`  (
  `Username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SnackName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Quantity`  int(3) DEFAULT NULL,
  PRIMARY KEY (`Username`,`SnackName`) USING BTREE,
  FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (`SnackName`) REFERENCES `snacks` (`SnackName`) ON DELETE RESTRICT ON UPDATE CASCADE
  ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `snack_order`;
CREATE TABLE `snack_order`  (
  `SOid` int AUTO_INCREMENT,
  `Username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SnackName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Quantity`  int(3) DEFAULT NULL,
  `OrderTime` TIMESTAMP NOT NULL,
  `Price` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`SOid`) USING BTREE,
  FOREIGN KEY (`Username`) REFERENCES `users` (`Username`) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (`SnackName`) REFERENCES `snacks` (`SnackName`) ON DELETE RESTRICT ON UPDATE CASCADE
  ) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

#INSERT INTO `snack_order` VALUES(NULL, 'Ruby', 'Ice Cream', 2, '2020-1-20 11:14:07', 80);  

SET FOREIGN_KEY_CHECKS = 1;