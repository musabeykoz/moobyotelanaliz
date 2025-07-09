-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 09 Tem 2025, 16:51:23
-- Sunucu sürümü: 9.1.0
-- PHP Sürümü: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `moobycom_partner`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bildirim`
--

DROP TABLE IF EXISTS `bildirim`;
CREATE TABLE IF NOT EXISTS `bildirim` (
  `bildirim_id` int NOT NULL AUTO_INCREMENT,
  `bildirilen_kullanici_id` int DEFAULT NULL,
  `bildiren_aciklama` text COLLATE utf8mb4_general_ci,
  `bildirim_tarihi` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bildirim_id`),
  KEY `bildirilen_kullanici_id` (`bildirilen_kullanici_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `bildirim`
--

INSERT INTO `bildirim` (`bildirim_id`, `bildirilen_kullanici_id`, `bildiren_aciklama`, `bildirim_tarihi`) VALUES
(1, 1, 'ge34wh', '2025-05-01 09:57:20'),
(2, 1, 'wgg4', '2025-05-01 09:57:20'),
(3, 1, 'vbıwkvbuwwev\r\n', '2025-05-01 09:57:20'),
(4, 2, 'olmadı', '2025-05-01 10:05:31');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gelirler`
--

DROP TABLE IF EXISTS `gelirler`;
CREATE TABLE IF NOT EXISTS `gelirler` (
  `gelir_id` int NOT NULL AUTO_INCREMENT,
  `gelir_tarihi` date DEFAULT NULL,
  `gelir_konaklayan_tur_id` int DEFAULT NULL,
  `gelir_konaklayan_adi` text COLLATE utf8mb4_general_ci,
  `gelir_giris_tarihi` date DEFAULT NULL,
  `gelir_cikis_tarihi` date DEFAULT NULL,
  `odeme_tipi_id` int DEFAULT NULL,
  `gelir_tahsil_tutari` int DEFAULT NULL,
  `ilgili_otel_id` int DEFAULT NULL,
  `gelir_rezervasyon_tipi_id` int DEFAULT NULL,
  `kullanici_rutbe` tinyint(1) DEFAULT NULL,
  `oda_id` int DEFAULT NULL,
  `oda_fiyati` int DEFAULT NULL,
  `onay` int NOT NULL,
  `gelir_kullanici_id` int NOT NULL,
  PRIMARY KEY (`gelir_id`),
  KEY `gelir_konaklayan_tur_id` (`gelir_konaklayan_tur_id`),
  KEY `odeme_tipi_id` (`odeme_tipi_id`),
  KEY `ilgili_otel_id` (`ilgili_otel_id`),
  KEY `gelir_rezervasyon_tipi_id` (`gelir_rezervasyon_tipi_id`),
  KEY `oda_id` (`oda_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `gelirler`
--

INSERT INTO `gelirler` (`gelir_id`, `gelir_tarihi`, `gelir_konaklayan_tur_id`, `gelir_konaklayan_adi`, `gelir_giris_tarihi`, `gelir_cikis_tarihi`, `odeme_tipi_id`, `gelir_tahsil_tutari`, `ilgili_otel_id`, `gelir_rezervasyon_tipi_id`, `kullanici_rutbe`, `oda_id`, `oda_fiyati`, `onay`, `gelir_kullanici_id`) VALUES
(1, '2025-05-07', 1, 'utcjcjgvjg', '2025-05-07', '2025-05-10', 4, 3000, 1, 2, 2, 39, 120000, 3, 1),
(2, '2025-05-09', 1, 'umut dede', '2025-05-09', '2025-05-10', 1, 3000, 1, 2, 2, 28, 1200, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gelir_konaklayan_tur`
--

DROP TABLE IF EXISTS `gelir_konaklayan_tur`;
CREATE TABLE IF NOT EXISTS `gelir_konaklayan_tur` (
  `gelir_konaklayan_tur_id` int NOT NULL AUTO_INCREMENT,
  `gelir_konaklayan_ad` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`gelir_konaklayan_tur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `gelir_konaklayan_tur`
--

INSERT INTO `gelir_konaklayan_tur` (`gelir_konaklayan_tur_id`, `gelir_konaklayan_ad`) VALUES
(1, 'İZNİKSPOR'),
(2, 'WALKİN'),
(3, 'VAKIFBANK'),
(4, 'AKSOY'),
(6, 'TATİLBUDUR'),
(7, 'OTELZ'),
(8, 'NCYAPI');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gelir_rezervasyon_tipi`
--

DROP TABLE IF EXISTS `gelir_rezervasyon_tipi`;
CREATE TABLE IF NOT EXISTS `gelir_rezervasyon_tipi` (
  `gelir_rezervasyon_tipi_id` int NOT NULL AUTO_INCREMENT,
  `gelir_rezervasyon_tipi_ad` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`gelir_rezervasyon_tipi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `gelir_rezervasyon_tipi`
--

INSERT INTO `gelir_rezervasyon_tipi` (`gelir_rezervasyon_tipi_id`, `gelir_rezervasyon_tipi_ad`) VALUES
(1, 'ÖNREZERVASYON'),
(2, 'REZERVASYON'),
(3, 'DAYUSE'),
(4, 'SEÇİLMEMİŞ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `giderler`
--

DROP TABLE IF EXISTS `giderler`;
CREATE TABLE IF NOT EXISTS `giderler` (
  `gider_id` int NOT NULL AUTO_INCREMENT,
  `gider_tarihi` date DEFAULT NULL,
  `gider_tipi_id` int DEFAULT NULL,
  `gider_firma_id` int DEFAULT NULL,
  `gider_odeme_tarihi` date DEFAULT NULL,
  `odeme_tipi_id` int DEFAULT NULL,
  `gider_odeme_tutar` int DEFAULT NULL,
  `gider_odeme_durum` tinyint(1) DEFAULT NULL,
  `ilgili_otel_id` int DEFAULT NULL,
  `giderler_dekont` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Dekont dosyasının yolu',
  `onay` int NOT NULL,
  `gider_kullanici_id` int NOT NULL,
  PRIMARY KEY (`gider_id`),
  KEY `gider_tipi_id` (`gider_tipi_id`),
  KEY `gider_firma_id` (`gider_firma_id`),
  KEY `odeme_tipi_id` (`odeme_tipi_id`),
  KEY `ilgili_otel_id` (`ilgili_otel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `giderler`
--

INSERT INTO `giderler` (`gider_id`, `gider_tarihi`, `gider_tipi_id`, `gider_firma_id`, `gider_odeme_tarihi`, `odeme_tipi_id`, `gider_odeme_tutar`, `gider_odeme_durum`, `ilgili_otel_id`, `giderler_dekont`, `onay`, `gider_kullanici_id`) VALUES
(18, '2025-05-05', 2, 1, '2025-05-05', 3, 1212, 1, 1, 'gider_dekont/gider_18.png', 1, 2),
(19, '2025-05-05', 2, 1, '2025-05-05', 2, 22222, 1, 1, 'gider_dekont/gider_19.png', 1, 1),
(20, '2025-05-05', 2, 1, '2025-05-09', 7, 444, 1, 1, 'gider_dekont/gider_20.png', 0, 2),
(22, '2025-05-05', 2, 1, '2025-05-07', 1, 1200, 0, 1, 'gider_dekont/gider_22.png', 0, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gider_firma`
--

DROP TABLE IF EXISTS `gider_firma`;
CREATE TABLE IF NOT EXISTS `gider_firma` (
  `gider_firma_id` int NOT NULL AUTO_INCREMENT,
  `gider_firma_ad` text COLLATE utf8mb4_general_ci NOT NULL,
  `gider_firma_yetkili_ad` text COLLATE utf8mb4_general_ci NOT NULL,
  `gider_firma_yetkili_no` bigint DEFAULT NULL,
  `gider_firma_adres` text COLLATE utf8mb4_general_ci NOT NULL,
  `gider_firma_belge` text COLLATE utf8mb4_general_ci NOT NULL,
  `gider_firma_iban` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gider_firma_iban_ad` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`gider_firma_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `gider_firma`
--

INSERT INTO `gider_firma` (`gider_firma_id`, `gider_firma_ad`, `gider_firma_yetkili_ad`, `gider_firma_yetkili_no`, `gider_firma_adres`, `gider_firma_belge`, `gider_firma_iban`, `gider_firma_iban_ad`) VALUES
(1, 'deneme otel', 'musa', 111, 'aaa', '1.jpg', 'tr', 'as');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gider_tipi`
--

DROP TABLE IF EXISTS `gider_tipi`;
CREATE TABLE IF NOT EXISTS `gider_tipi` (
  `gider_tipi_id` int NOT NULL AUTO_INCREMENT,
  `gider_tipi_ad` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`gider_tipi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `gider_tipi`
--

INSERT INTO `gider_tipi` (`gider_tipi_id`, `gider_tipi_ad`) VALUES
(1, 'Vergi'),
(2, 'Kredi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilgili_otel`
--

DROP TABLE IF EXISTS `ilgili_otel`;
CREATE TABLE IF NOT EXISTS `ilgili_otel` (
  `ilgili_otel_id` int NOT NULL AUTO_INCREMENT,
  `ilgili_otel_adi` text COLLATE utf8mb4_general_ci NOT NULL,
  `ilgili_otel_telefon` bigint NOT NULL,
  `ilgili_otel_adres` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ilgili_otel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `ilgili_otel`
--

INSERT INTO `ilgili_otel` (`ilgili_otel_id`, `ilgili_otel_adi`, `ilgili_otel_telefon`, `ilgili_otel_adres`) VALUES
(1, 'EKİNOKS OTEL', 7777, 'Beyler, Atatürk Cd. No:132, 16860 İzni̇k/Bursa'),
(2, 'KAYNARCA OTEL', 6666, 'Mehmet Gündem Sokakx, Yeni, İznik, Bursa'),
(4, 'IŞIK LAKESİDE OTEL', 7777, 'Zeytin Bahçesi Otel İznik/Bursa'),
(7, 'HELİKORE STONE HOUSE', 44444, 'Bursa - İznik - Elbeyli Köyü');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

DROP TABLE IF EXISTS `kullanicilar`;
CREATE TABLE IF NOT EXISTS `kullanicilar` (
  `kullanici_id` int NOT NULL AUTO_INCREMENT,
  `kullanici_adi` text COLLATE utf8mb4_general_ci,
  `kullanici_telefon` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ilgili_otel_id` int DEFAULT NULL,
  `sifre` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `rutbe_id` int DEFAULT NULL,
  PRIMARY KEY (`kullanici_id`),
  KEY `ilgili_otel_id` (`ilgili_otel_id`),
  KEY `rutbe_id` (`rutbe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`kullanici_id`, `kullanici_adi`, `kullanici_telefon`, `ilgili_otel_id`, `sifre`, `rutbe_id`) VALUES
(1, 'Bolge_sorumlu', '532773', NULL, '$2y$10$shesAnWJZCPm/pouHRyLaOgBfs7A9VzVnIGWBst4NCcXm/YIbydiS', 2),
(2, 'otel_sorumlu', '2222', 1, '$2y$10$bhQS5zNpzh2IOtdyrzj5xeEcKgWWxW9w2RaIDhDCXVYJrEH8Nl0pS', 3),
(3, 'yatirimci', '2112', 1, '$2y$10$1AMdxDIMaZRAqJSVaBLuluLy7Bs8PRtAP.YeP7SzM2CtbGGB1xO/i', 1),
(4, 'resepsiyon', '1111', 1, '$2y$10$6xtWGCuRb1vn8TZqqAlK8e/3QsrRVEkSsTY3JOefty2nPL9B/Ks.G', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odalar`
--

DROP TABLE IF EXISTS `odalar`;
CREATE TABLE IF NOT EXISTS `odalar` (
  `oda_id` int NOT NULL AUTO_INCREMENT,
  `oda_numarasi` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `oda_tipi` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ilgili_otel_id` int NOT NULL,
  `yatak_tipi_id` int DEFAULT NULL,
  PRIMARY KEY (`oda_id`),
  KEY `ilgili_otel_id` (`ilgili_otel_id`),
  KEY `yatak_tipi_id` (`yatak_tipi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `odalar`
--

INSERT INTO `odalar` (`oda_id`, `oda_numarasi`, `oda_tipi`, `ilgili_otel_id`, `yatak_tipi_id`) VALUES
(5, '101', 'standart', 2, 3),
(6, '102', 'standart', 2, 3),
(7, '103', 'standart', 2, 3),
(8, '104', 'standart', 2, 3),
(9, '105', 'standart', 2, 3),
(10, '106', 'standart', 2, 3),
(11, '201', 'standart', 2, 3),
(12, '202', 'standart', 2, 3),
(13, '203', 'standart', 2, 3),
(14, '204', 'standart', 2, 3),
(15, '205', 'standart', 2, 3),
(16, '206', 'standart', 2, 3),
(17, '101', 'Standart', 4, 2),
(18, '102', 'Standart', 4, 2),
(19, '103', 'Standart', 4, 2),
(20, '104', 'Standart', 4, 2),
(21, '105', 'Standart', 4, 2),
(22, '201', 'Standart', 4, 2),
(23, '202', 'Standart', 4, 2),
(24, '203', 'Standart', 4, 2),
(25, '204', 'Standart', 4, 2),
(26, '205', 'Standart', 4, 2),
(27, '501', 'Ekstra Ödenen', 2, 3),
(28, '101', 'Standart', 1, 2),
(29, '102', 'Standart', 1, 2),
(30, '103', 'Standart', 1, 2),
(31, '104', 'Standart', 1, 2),
(32, '105', 'Standart', 1, 2),
(33, '106', 'Standart', 1, 2),
(34, '107', 'Standart', 1, 2),
(35, '108', 'Standart', 1, 2),
(36, '109', 'Standart', 1, 2),
(37, '201', 'Standart', 1, 2),
(38, '202', 'Standart', 1, 2),
(39, '203', 'Standart', 1, 2),
(40, '204', 'Standart', 1, 2),
(41, '205', 'Standart', 1, 2),
(42, '206', 'Standart', 1, 2),
(43, '207', 'Standart', 1, 2),
(44, '208', 'Standart', 1, 2),
(45, '209', 'Standart', 1, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odeme_tipi`
--

DROP TABLE IF EXISTS `odeme_tipi`;
CREATE TABLE IF NOT EXISTS `odeme_tipi` (
  `odeme_tipi_id` int NOT NULL AUTO_INCREMENT,
  `odeme_tipi_ad` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`odeme_tipi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `odeme_tipi`
--

INSERT INTO `odeme_tipi` (`odeme_tipi_id`, `odeme_tipi_ad`) VALUES
(1, 'NAKİT'),
(2, 'KREDİ KARTI'),
(3, 'CARİ'),
(4, 'HAVALE'),
(5, 'ÖNCEKİ GÜN DEVREDEN'),
(6, 'MİSAFİR'),
(7, 'ACENTA ÖDEMELİ');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `rutbe`
--

DROP TABLE IF EXISTS `rutbe`;
CREATE TABLE IF NOT EXISTS `rutbe` (
  `rutbe_id` int NOT NULL AUTO_INCREMENT,
  `rutbe_adi` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`rutbe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `rutbe`
--

INSERT INTO `rutbe` (`rutbe_id`, `rutbe_adi`) VALUES
(1, 'yatirimci'),
(2, 'bolge_sorumlu'),
(3, 'otel_sorumlu'),
(4, 'resepsiyon');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `rutbe_sayfa_izinleri`
--

DROP TABLE IF EXISTS `rutbe_sayfa_izinleri`;
CREATE TABLE IF NOT EXISTS `rutbe_sayfa_izinleri` (
  `izin_id` int NOT NULL AUTO_INCREMENT,
  `rutbe_id` int NOT NULL,
  `sayfa_adi` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `sayfa_url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`izin_id`),
  KEY `rutbe_id` (`rutbe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `rutbe_sayfa_izinleri`
--

INSERT INTO `rutbe_sayfa_izinleri` (`izin_id`, `rutbe_id`, `sayfa_adi`, `sayfa_url`) VALUES
(14, 1, 'ANALİZ', '../analiz/analiz.php'),
(15, 2, 'ANALİZ', '../analiz/analiz.php'),
(16, 2, 'GELİR İŞLEMLERİ', '../eklentiler/gelir_islem_onayli.php'),
(17, 2, 'GİDER İŞLEMLERİ', '../eklentiler/gider_islem_onayli.php'),
(19, 3, 'GELİR İŞLEMLERİ', '../eklentiler/gelir_islem_otel_sorumlu.php'),
(20, 3, 'GİDER İŞLEMLERİ', '../eklentiler/gider_islem_otel_sorumlu.php'),
(21, 1, 'GELİR İŞLEMLERİ', '../eklentiler/gelir_islem_yatirimci.php'),
(22, 4, 'GELİR İŞLEMLERİ', '../eklentiler/gelir_islem_resepsiyon.php');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `wiki_kategori`
--

DROP TABLE IF EXISTS `wiki_kategori`;
CREATE TABLE IF NOT EXISTS `wiki_kategori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kategori_adi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aciklama` text COLLATE utf8mb4_unicode_ci,
  `sira` int DEFAULT '0',
  `aktif` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `wiki_kategori`
--

INSERT INTO `wiki_kategori` (`id`, `kategori_adi`, `aciklama`, `sira`, `aktif`, `created_at`, `updated_at`) VALUES
(1, 'Eğitim', 'Eğitim videoları', 1, 1, '2025-05-01 12:22:51', '2025-05-01 12:22:51'),
(2, 'Tanıtım', 'Tanıtım videoları', 2, 1, '2025-05-01 12:22:51', '2025-05-01 12:22:51'),
(3, 'Dokümantasyon', 'Dokümantasyon videoları', 3, 1, '2025-05-01 12:22:51', '2025-05-01 12:22:51');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `wiki_video`
--

DROP TABLE IF EXISTS `wiki_video`;
CREATE TABLE IF NOT EXISTS `wiki_video` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kategori_id` int NOT NULL,
  `baslik` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aciklama` text COLLATE utf8mb4_unicode_ci,
  `sira` int DEFAULT '0',
  `aktif` tinyint(1) DEFAULT '1',
  `goruntulenme` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `kategori_id` (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `wiki_video`
--

INSERT INTO `wiki_video` (`id`, `kategori_id`, `baslik`, `video_url`, `video_thumbnail`, `aciklama`, `sira`, `aktif`, `goruntulenme`, `created_at`, `updated_at`) VALUES
(1, 1, 'Temel Eğitim', 'https://www.youtube.com/watch?v=VIDEO_ID', NULL, 'Temel eğitim videosu', 1, 1, 0, '2025-05-01 12:22:51', '2025-05-01 12:22:51'),
(2, 2, 'Ürün Tanıtımı', 'https://www.youtube.com/watch?v=VIDEO_ID', NULL, 'Ürün tanıtım videosu', 1, 1, 0, '2025-05-01 12:22:51', '2025-05-01 12:22:51'),
(3, 3, 'Kullanım Kılavuzu', 'https://www.youtube.com/watch?v=VIDEO_ID', NULL, 'Kullanım kılavuzu videosu', 1, 1, 0, '2025-05-01 12:22:51', '2025-05-01 12:22:51'),
(5, 1, 'sf', 'https://youtu.be/fARhNFnuVPU?si=VBxlW0i6gJy3FuJ6', NULL, 'a', 0, 1, 0, '2025-05-01 13:00:57', '2025-05-01 13:00:57');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yatak_tipi`
--

DROP TABLE IF EXISTS `yatak_tipi`;
CREATE TABLE IF NOT EXISTS `yatak_tipi` (
  `yatak_tipi_id` int NOT NULL AUTO_INCREMENT,
  `yatak_tipi_ad` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`yatak_tipi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `yatak_tipi`
--

INSERT INTO `yatak_tipi` (`yatak_tipi_id`, `yatak_tipi_ad`) VALUES
(1, 'Tek Kişilik'),
(2, 'Çift Kişilik'),
(3, 'Seçilmemiş');

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `bildirim`
--
ALTER TABLE `bildirim`
  ADD CONSTRAINT `bildirim_ibfk_1` FOREIGN KEY (`bildirilen_kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`);

--
-- Tablo kısıtlamaları `gelirler`
--
ALTER TABLE `gelirler`
  ADD CONSTRAINT `gelirler_ibfk_1` FOREIGN KEY (`gelir_konaklayan_tur_id`) REFERENCES `gelir_konaklayan_tur` (`gelir_konaklayan_tur_id`),
  ADD CONSTRAINT `gelirler_ibfk_2` FOREIGN KEY (`odeme_tipi_id`) REFERENCES `odeme_tipi` (`odeme_tipi_id`),
  ADD CONSTRAINT `gelirler_ibfk_3` FOREIGN KEY (`ilgili_otel_id`) REFERENCES `ilgili_otel` (`ilgili_otel_id`),
  ADD CONSTRAINT `gelirler_ibfk_4` FOREIGN KEY (`gelir_rezervasyon_tipi_id`) REFERENCES `gelir_rezervasyon_tipi` (`gelir_rezervasyon_tipi_id`),
  ADD CONSTRAINT `gelirler_ibfk_5` FOREIGN KEY (`oda_id`) REFERENCES `odalar` (`oda_id`);

--
-- Tablo kısıtlamaları `giderler`
--
ALTER TABLE `giderler`
  ADD CONSTRAINT `giderler_ibfk_1` FOREIGN KEY (`gider_tipi_id`) REFERENCES `gider_tipi` (`gider_tipi_id`),
  ADD CONSTRAINT `giderler_ibfk_2` FOREIGN KEY (`gider_firma_id`) REFERENCES `gider_firma` (`gider_firma_id`),
  ADD CONSTRAINT `giderler_ibfk_3` FOREIGN KEY (`odeme_tipi_id`) REFERENCES `odeme_tipi` (`odeme_tipi_id`),
  ADD CONSTRAINT `giderler_ibfk_4` FOREIGN KEY (`ilgili_otel_id`) REFERENCES `ilgili_otel` (`ilgili_otel_id`);

--
-- Tablo kısıtlamaları `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD CONSTRAINT `kullanicilar_ibfk_1` FOREIGN KEY (`ilgili_otel_id`) REFERENCES `ilgili_otel` (`ilgili_otel_id`),
  ADD CONSTRAINT `kullanicilar_ibfk_2` FOREIGN KEY (`rutbe_id`) REFERENCES `rutbe` (`rutbe_id`);

--
-- Tablo kısıtlamaları `odalar`
--
ALTER TABLE `odalar`
  ADD CONSTRAINT `odalar_ibfk_1` FOREIGN KEY (`ilgili_otel_id`) REFERENCES `ilgili_otel` (`ilgili_otel_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `odalar_ibfk_2` FOREIGN KEY (`yatak_tipi_id`) REFERENCES `yatak_tipi` (`yatak_tipi_id`) ON DELETE SET NULL;

--
-- Tablo kısıtlamaları `rutbe_sayfa_izinleri`
--
ALTER TABLE `rutbe_sayfa_izinleri`
  ADD CONSTRAINT `rutbe_sayfa_izinleri_ibfk_1` FOREIGN KEY (`rutbe_id`) REFERENCES `rutbe` (`rutbe_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `wiki_video`
--
ALTER TABLE `wiki_video`
  ADD CONSTRAINT `wiki_video_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `wiki_kategori` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
