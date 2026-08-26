CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `roleid` int DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `createdDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Thêm một tài khoản mặc định để bạn test đăng nhập ngay lập tức
INSERT INTO `user` (`email`, `username`, `fullname`, `password`, `avatar`, `roleid`, `phone`, `createdDate`) 
VALUES ('admin@example.com', 'admin', 'Quản trị viên', '123456', NULL, 1, '0123456789', CURDATE());
