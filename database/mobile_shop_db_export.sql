-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: mobile_store
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `productId` bigint NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `productId` (`productId`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `dienthoai` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dienthoai`
--

DROP TABLE IF EXISTS `dienthoai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dienthoai` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `MaHangSX` varchar(5) NOT NULL,
  `TenDT` varchar(50) NOT NULL,
  `DonGia` float NOT NULL,
  `RAM` int NOT NULL,
  `DungLuong` varchar(6) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) NOT NULL,
  `ChiTiet` text,
  `s_image` varchar(255) DEFAULT 'images/products/60.jpg',
  PRIMARY KEY (`id`),
  KEY `MaHangSX` (`MaHangSX`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dienthoai`
--

LOCK TABLES `dienthoai` WRITE;
/*!40000 ALTER TABLE `dienthoai` DISABLE KEYS */;
INSERT INTO `dienthoai` VALUES (1,'IPH','iPhone 13 Pro Max',27490000,6,'512GB','images/products/iphone-13-pro-xanh-xa-2.jpg','images/products/iphone-13-pro-xanh-xa-2(1).jpg','Điện thoại iPhone 13 Pro Max 128 GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.','images/products/60.jpg'),(2,'IPH','iPhone 12',15000000,6,'128GB','images/products/637420740222831702_iphone-12-12-mini-5.jpg','images/products/637420740222831702_iphone-12-12-mini-5(1).jpg','Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB.','images/products/60.jpg'),(3,'IPH','iPhone 14 Pro Max',33490000,6,'1TB','images/products/637985700630020572_ip-14-pro-max-tim.jpg','images/products/637985700630020572_ip-14-pro-max-tim(1).jpg','iPhone 14 Pro Max là chiếc iPhone màn hình lớn nhất khi sở hữu màn hình 6.7 inch LTPO hiện đại, có khả năng điều tiết tần số quét tự động từ 1Hz đến 120Hz linh hoạt nhằm tăng độ mượt mà và vẫn tiết kiệm pin. Chiếc iPhone này cũng có màn hình mới với phần Dynamic Island linh hoạt.','images/products/60.jpg'),(4,'XIA','Xiaomi 12 series',15990000,8,'256GB','images/products/Xiaomi-12-xam-thumb-mau-200x200.jpg','images/products/Xiaomi-12-xam-thumb-mau-200x200(1).jpg','Với Xiaomi 12 trong tay, bạn sẽ dễ dàng làm chủ mọi cuộc vui của riêng mình. Dù là chụp ảnh, chơi game hay đắm chìm trong những bộ phim, điện thoại sẽ luôn cho bạn những trải nghiệm hàng đầu. Chiếc flagship này sẽ là một trong những lựa chọn cực hot dành cho bạn ngay hôm nay. ','images/products/60.jpg'),(5,'XIA','Xiaomi 11T Pro',13990000,8,'256GB','images/products/637816720015839542_xiaomi-11t-pro-xanh-dd-2.jpg','images/products/637816720015839542_xiaomi-11t-pro-xanh-dd-2(1).jpg','Điện thoại Xiaomi 11T Pro 5G 8GB sử dụng con chip Snapdragon 888 mạnh mẽ, camera chính 108 MP, hỗ trợ sạc nhanh 120 W, màn hình rộng với tốc độ làm tươi lên đến 120 Hz, tận hưởng trải nghiệm tuyệt vời trong từng khoảnh khắc.','images/products/60.jpg'),(6,'XIA','POCO C40',2990000,4,'64GB','images/products/xiaomi-poco-c40-thumb-vang-200x200.jpg','images/products/xiaomi-poco-c40-thumb-vang-200x200(1).jpg','Tháng 06/2022 điện thoại POCO C40 đã chính thức được cho ra mắt tại thị trường Việt Nam, sở hữu cho một mình màn hình kích thước lớn, viên pin dung lượng khủng và một con chip JR510 mới lạ trên thị trường công nghệ hiện nay.','images/products/60.jpg'),(7,'SAM','Samsung Galaxy Z Fold4',40990000,12,'256GB','images/products/samsung-galaxy-z-fold4-den-256gb-200x200.jpg','images/products/samsung-galaxy-z-fold4-den-256gb-200x200(1).jpg','Tại sự kiện Samsung Unpacked thường niên thì một cái tên được mong đợi rất nhiều cũng đã chính thức lộ diện mang tên Samsung Galaxy Z Fold4 256GB, sở hữu màn hình lớn cùng cơ chế có thể gấp gọn độc đáo. Hứa hẹn sẽ là sản phẩm phù hợp dành cho những khách hàng làm các công việc sáng tạo nội dung, doanh nhân.','images/products/60.jpg'),(8,'SAM','Samsung Galaxy A03',2790000,3,'32GB','images/products/samsung-galaxy-a03-xanh-thumb-200x200.jpg','images/products/samsung-galaxy-a03-xanh-thumb-200x200(1).jpg','Samsung Galaxy A03 là chiếc điện thoại Galaxy A đầu tiên của nhà Samsung trong năm 2022 tại thị trường Việt Nam. Đây là sản phẩm có mức giá dễ tiếp cận, có camera chính đến 48 MP, pin 5000 mAh thoải mái sử dụng cả ngày.','images/products/60.jpg'),(9,'OPP','OPPO Reno7 series',9990000,8,'128GB','images/products/oppo-reno7-z-5g-thumb-1-1-600x600.jpg','images/products/oppo-reno7-z-5g-thumb-1-1-600x600(1).jpg','OPPO đã trình làng mẫu Reno7 Z 5G với thiết kế OPPO Glow độc quyền, camera mang hiệu ứng như máy DSLR chuyên nghiệp cùng viền sáng kép, máy có một cấu hình mạnh mẽ và đạt chứng nhận xếp hạng A về độ mượt.','images/products/60.jpg'),(10,'OPP','OPPO Find X5 Pro 5G',30990000,6,'256GB','images/products/oppo-find-x5-pro-den-thumb-600x600.jpg','images/products/oppo-find-x5-pro-den-thumb-600x600(1).jpg','OPPO Find X5 Pro 5G có lẽ là cái tên sáng giá được xướng tên trong danh sách điện thoại có thiết kế ấn tượng trong năm 2022. Máy được hãng cho ra mắt với một diện mạo độc lạ chưa từng có, cùng với đó là những nâng cấp về chất lượng ở camera nhờ sự hợp tác với nhà sản xuất máy ảnh Hasselblad. ','images/products/60.jpg'),(11,'VIV','Vivo Y01',2790000,2,'32GB','images/products/vivi-y01-đen-thumb-600x600.jpg','images/products/vivi-y01-đen-thumb-600x600(1).jpg','Vivo Y01 được trình làng với một bộ thông số kỹ thuật ấn tượng trong tầm giá, sở hữu những ưu điểm như: Màn hình kích thước lớn, hiệu năng ổn định và thời gian sử dụng lâu dài, được xem là thiết bị phù hợp với những bạn học sinh - sinh viên cho các công việc học tập hay giải trí nhẹ nhàng sau những phút giây căng thẳng.','images/products/60.jpg'),(12,'VIV','Vivo V23 series',7990000,8,'128GB','images/products/Vivo-V23e-1-2-600x600.jpg','images/products/Vivo-V23e-1-2-600x600(1).jpg','Vivo V23e - sản phẩm tầm trung được đầu tư lớn về khả năng selfie cùng ngoại hình mỏng nhẹ, bên cạnh thiết kế vuông vức theo xu hướng hiện tại thì V23e còn có hiệu năng tốt và một viên pin có khả năng sạc cực nhanh.','images/products/60.jpg'),(13,'ASU','ASUS ROG Phone 6',25000000,12,'256GB','images/products/637944507138520994_asus-rog-6-12gb-256gb-dd.jpg','images/products/637944507138520994_asus-rog-6-12gb-256gb-dd(1).jpg','Là thế hệ mới nhất của dòng smartphone gaming lừng danh toàn cầu, Asus ROG Phone 6 đem lại nguồn sức mạnh ấn tượng nhờ chip Qualcomm Snapdragon 8+ Gen 1 kết hợp cùng tản nhiệt GameCool 6 đẳng cấp. Màn hình 165Hz và viên pin 6.000 mAh ấn tượng sẽ phá vỡ mọi rào cản để mang lại trải nghiệm game đẳng cấp nhất.','images/products/60.jpg'),(14,'ASU','Asus ROG Phone 5S 5G',18490000,16,'64GB','images/products/637874590274064371_asus-rog-5s-dd-1.jpg','images/products/637874590274064371_asus-rog-5s-dd-1(1).jpg','Với chip xử lý Qualcomm Snapdragon 888+ 5G cực mạnh, màn hình AMOLED tần số quét 144Hz/1ms và viên pin dung lượng pin 6.000 mAh, chiếc điện thoại Asus ROG 5S 5G sẽ đem đến trải nghiệm gaming mà không một mẫu smartphone nào trên thị trường có thể đạt được. Ngoài ra, loạt tính năng như AirTrigger 5 kết hợp cùng âm thanh GameFX cao cấp cũng hứa hẹn những trải nghiệm hàng đầu thế giới hiện tại.','images/products/60.jpg'),(15,'NOK','Nokia C21 Plus',2790000,3,'32GB','images/products/Nokia-C21-Plus-Gray-200x200.jpg','images/products/Nokia-C21-Plus-Gray-200x200(1).jpg','Tiếp nối sự thành công của những sản phẩm gần đây tại thị trường Việt Nam, lần này hãng Nokia đã mang đến mẫu điện thoại Nokia C21 Plus - sở hữu trong mình viên pin mang lại thời gian trải nghiệm lâu dài và sử dụng an tâm hơn với 2 năm cập nhật bảo mật.','images/products/60.jpg'),(16,'NOK','Nokia G21',3890000,4,'128GB','images/products/nokia-g21-xanh-thumb-600x600.jpg','images/products/nokia-g21-xanh-thumb-600x600(1).jpg','Nokia G21 là thế hệ tiếp theo thuộc G series do Nokia sản xuất với những cải tiến nổi bật như màn hình kích thước lớn, hiệu năng ổn định mang đến trải nghiệm mượt mà trên các tác vụ hằng ngày cùng thời gian sử dụng lâu dài nhờ viên pin khủng được tích hợp trên điện thoại.','images/products/60.jpg');
/*!40000 ALTER TABLE `dienthoai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hangsanxuat`
--

DROP TABLE IF EXISTS `hangsanxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hangsanxuat` (
  `MaHangSX` varchar(5) NOT NULL,
  `TenHangSX` varchar(10) NOT NULL,
  PRIMARY KEY (`MaHangSX`),
  CONSTRAINT `fk_dienthoai_hangsanxuat` FOREIGN KEY (`MaHangSX`) REFERENCES `dienthoai` (`MaHangSX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hangsanxuat`
--

LOCK TABLES `hangsanxuat` WRITE;
/*!40000 ALTER TABLE `hangsanxuat` DISABLE KEYS */;
INSERT INTO `hangsanxuat` VALUES ('ASU','Asus'),('IPH','iPhone'),('NOK','Nokia'),('OPP','Oppo'),('SAM','Samsung'),('VIV','Vivo'),('XIA','Xiaomi');
/*!40000 ALTER TABLE `hangsanxuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderId` bigint NOT NULL,
  `productId` bigint NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `productId` (`productId`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `dienthoai` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `createdDate` datetime NOT NULL,
  `paymentMethod` varchar(50) NOT NULL,
  `shippingAddress` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `status` int NOT NULL,
  `totalPrice` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Ho` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Ten` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `SDT` varchar(11) DEFAULT NULL,
  `MatKhau` varchar(32) NOT NULL,
  `NgaySinh` date DEFAULT NULL,
  `DiaChi` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `role` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `SDT` (`SDT`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nguyễn Văn','Định','nvdinh2003@gmail.com','0357798421','123456789','2003-04-04','Quang Thọ, Vũ Quang, Hà Tĩnh',1),(2,'John','Wíth','admin@chappie.com','0123888999','456789','2000-12-12','Thị trấn, Vũ Quang, Hà Tĩnh',1),(3,'Trần','A','abc@gmail.com','0123444555','444555','2005-06-07','Phường 5, Quận 3, TP.Hồ Chí Minh',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-20 22:39:01
