-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.1.0 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for quanlykhoahoccuoikhoa
CREATE DATABASE IF NOT EXISTS `quanlykhoahoccuoikhoa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `quanlykhoahoccuoikhoa`;

-- Dumping structure for table quanlykhoahoccuoikhoa.bomon
CREATE TABLE IF NOT EXISTS `bomon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenbomon` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `idkhoa` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3vth1tmcv0r5ytmrli8qf486q` (`tenbomon`),
  KEY `FKiwndftejy2croofk0hg9bkc0i` (`idkhoa`),
  CONSTRAINT `FKiwndftejy2croofk0hg9bkc0i` FOREIGN KEY (`idkhoa`) REFERENCES `khoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quanlykhoahoccuoikhoa.capdetai
CREATE TABLE IF NOT EXISTS `capdetai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tencapdetai` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `tongsogio` float NOT NULL,
  `xdiemthanhvien` float NOT NULL,
  `xdiemtruongnhom` float NOT NULL,
  `ydiemtruongnhom` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6wi3w1vmy14a9dd58srvdvd56` (`tencapdetai`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quanlykhoahoccuoikhoa.detai
CREATE TABLE IF NOT EXISTS `detai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filedinhkem` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fileluutru` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kinhphi` float DEFAULT NULL,
  `maso` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `tendetai` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `thoigianbatdau` date NOT NULL,
  `thoigianketthuc` date NOT NULL,
  `thongtindetai` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_cap_de_tai` int NOT NULL,
  `iddonvichutri` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5ybbatixjoh97exoh06ocysbd` (`maso`),
  UNIQUE KEY `UK_dak17rglrdwf0gb79ktvkr08a` (`tendetai`),
  KEY `FKtqwfyjgvo6vqn0jdteaugwk00` (`id_cap_de_tai`),
  KEY `FK3h4k9i33vww7ltjk3qpyvk8ou` (`iddonvichutri`),
  CONSTRAINT `FK3h4k9i33vww7ltjk3qpyvk8ou` FOREIGN KEY (`iddonvichutri`) REFERENCES `donvichutri` (`id`),
  CONSTRAINT `FKtqwfyjgvo6vqn0jdteaugwk00` FOREIGN KEY (`id_cap_de_tai`) REFERENCES `capdetai` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quanlykhoahoccuoikhoa.donvichutri
CREATE TABLE IF NOT EXISTS `donvichutri` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diachi` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tendonvi` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_hpygp7h6uocxibrytkuvg0ty2` (`tendonvi`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quanlykhoahoccuoikhoa.khoa
CREATE TABLE IF NOT EXISTS `khoa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenkhoa` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4l0de1e8tbml1bpk158m2lm6k` (`tenkhoa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quanlykhoahoccuoikhoa.nguoidung
CREATE TABLE IF NOT EXISTS `nguoidung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `donvicongtac` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `hovaten` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `manguoidung` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `matkhau` varchar(215) COLLATE utf8mb4_general_ci NOT NULL,
  `ngaysinh` date DEFAULT NULL,
  `sodienthoai` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idbomon` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fypgm4q7hwro4gipdmwew5f33` (`email`),
  UNIQUE KEY `UK_lod8o3evosk7dk1ebr4etf5kh` (`manguoidung`),
  KEY `FKp1cip9yjh838uk16q6r4fsim2` (`idbomon`),
  CONSTRAINT `FKp1cip9yjh838uk16q6r4fsim2` FOREIGN KEY (`idbomon`) REFERENCES `bomon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quanlykhoahoccuoikhoa.nguoidung_vaitro
CREATE TABLE IF NOT EXISTS `nguoidung_vaitro` (
  `nguoidung_id` int NOT NULL,
  `vaitro_id` int NOT NULL,
  PRIMARY KEY (`nguoidung_id`,`vaitro_id`),
  KEY `FKnyd5p3gsmyqm2b2j7hna2him8` (`vaitro_id`),
  CONSTRAINT `FK242r0rbdnvjuubkn51dfpbr9b` FOREIGN KEY (`nguoidung_id`) REFERENCES `nguoidung` (`id`),
  CONSTRAINT `FKnyd5p3gsmyqm2b2j7hna2him8` FOREIGN KEY (`vaitro_id`) REFERENCES `vaitro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quanlykhoahoccuoikhoa.quanlydetai
CREATE TABLE IF NOT EXISTS `quanlydetai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diemthanhvien` float DEFAULT NULL,
  `iddetai` int NOT NULL,
  `idnguoidung` int NOT NULL,
  `vaitrodetai` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKdgxmontkd28vosl2d8pa5ybux` (`iddetai`,`idnguoidung`),
  KEY `FK5jqof7qw2hojxq857inw7h13y` (`idnguoidung`),
  KEY `FK3e5386lw1hha8k94ywipo3v02` (`vaitrodetai`),
  CONSTRAINT `FK1d7uwxh0ka4ccw4dsqg5kclls` FOREIGN KEY (`iddetai`) REFERENCES `detai` (`id`),
  CONSTRAINT `FK3e5386lw1hha8k94ywipo3v02` FOREIGN KEY (`vaitrodetai`) REFERENCES `vaitrodetai` (`id`),
  CONSTRAINT `FK5jqof7qw2hojxq857inw7h13y` FOREIGN KEY (`idnguoidung`) REFERENCES `nguoidung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quanlykhoahoccuoikhoa.vaitro
CREATE TABLE IF NOT EXISTS `vaitro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fp9sgvf5ydd1myhp1p0ujfb43` (`ten`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table quanlykhoahoccuoikhoa.vaitrodetai
CREATE TABLE IF NOT EXISTS `vaitrodetai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vaitro` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cjgy1myfs6ts8stvx8gvj5n9q` (`vaitro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
