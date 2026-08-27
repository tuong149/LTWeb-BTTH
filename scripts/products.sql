CREATE TABLE `products` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `productName` nvarchar(255) DEFAULT NULL,
  `description` text,
  `price` double DEFAULT NULL,
  `images` nvarchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK_Category_Product` (`categoryId`),
  CONSTRAINT `FK_Category_Product` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
