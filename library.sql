-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema librarysystemm
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `librarysystemm` ;

-- -----------------------------------------------------
-- Schema librarysystemm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `librarysystemm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
SHOW WARNINGS;
USE `librarysystemm` ;

-- -----------------------------------------------------
-- Table `chi_tiet_phieu_muon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `chi_tiet_phieu_muon` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `chi_tiet_phieu_muon` (
  `MAPHIEU` INT NOT NULL,
  `MASACH` INT NOT NULL,
  `SOLUONG` INT NOT NULL,
  PRIMARY KEY (`MAPHIEU`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `phieu_muon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `phieu_muon` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `phieu_muon` (
  `MAPHIEU` INT NOT NULL,
  `TIENCOC` INT NOT NULL,
  `MANV` INT NOT NULL,
  `NGAYTHUE` DATE NULL DEFAULT NULL,
  `NGAYTRA` DATE NULL DEFAULT NULL,
  `TRANGTHAI` VARCHAR(50) NOT NULL,
  `chi_tiet_phieu_muon_MAPHIEU` INT NOT NULL,
  PRIMARY KEY (`MAPHIEU`),
  CONSTRAINT `fk_phieu_muon_chi_tiet_phieu_muon1`
    FOREIGN KEY (`chi_tiet_phieu_muon_MAPHIEU`)
    REFERENCES `chi_tiet_phieu_muon` (`MAPHIEU`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `fk_phieu_muon_chi_tiet_phieu_muon1_idx` ON `phieu_muon` (`chi_tiet_phieu_muon_MAPHIEU` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `doc_gia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `doc_gia` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `doc_gia` (
  `MADG` INT NOT NULL,
  `TENDG` VARCHAR(50) NOT NULL,
  `GIOITINH` VARCHAR(50) NOT NULL,
  `NGHENGHIEP` VARCHAR(50) NOT NULL,
  `CMND` TEXT NOT NULL,
  `SDT` VARCHAR(50) NOT NULL,
  `DIACHI` TEXT NOT NULL,
  `NGAYCAPTHE` DATE NOT NULL,
  `phieu_muon_MAPHIEU` INT NOT NULL,
  PRIMARY KEY (`MADG`),
  CONSTRAINT `fk_doc_gia_phieu_muon1`
    FOREIGN KEY (`phieu_muon_MAPHIEU`)
    REFERENCES `phieu_muon` (`MAPHIEU`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `fk_doc_gia_phieu_muon1_idx` ON `doc_gia` (`phieu_muon_MAPHIEU` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `sach`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sach` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `sach` (
  `MASACH` INT NOT NULL,
  `TENSACH` VARCHAR(50) NULL DEFAULT NULL,
  `SOTRANG` INT NULL DEFAULT NULL,
  `NGONNGU` VARCHAR(50) NULL DEFAULT NULL,
  `SOLUONGTON` INT NULL DEFAULT NULL,
  `MANXB` INT NULL DEFAULT NULL,
  `MATL` INT NULL DEFAULT NULL,
  `chi_tiet_phieu_muon_MAPHIEU` INT NOT NULL,
  PRIMARY KEY (`MASACH`),
  CONSTRAINT `fk_sach_chi_tiet_phieu_muon`
    FOREIGN KEY (`chi_tiet_phieu_muon_MAPHIEU`)
    REFERENCES `chi_tiet_phieu_muon` (`MAPHIEU`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `fk_sach_chi_tiet_phieu_muon_idx` ON `sach` (`chi_tiet_phieu_muon_MAPHIEU` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `nha_xb`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nha_xb` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `nha_xb` (
  `MANXB` INT NOT NULL,
  `DIACHI` VARCHAR(50) NULL DEFAULT NULL,
  `SDT` VARCHAR(50) NULL DEFAULT NULL,
  `TEN` VARCHAR(50) NULL DEFAULT NULL,
  `sach_MASACH` INT NOT NULL,
  PRIMARY KEY (`MANXB`),
  CONSTRAINT `fk_nha_xb_sach1`
    FOREIGN KEY (`sach_MASACH`)
    REFERENCES `sach` (`MASACH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `fk_nha_xb_sach1_idx` ON `nha_xb` (`sach_MASACH` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `nhan_vien`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `nhan_vien` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `nhan_vien` (
  `MANV` INT NOT NULL,
  `TENDANGNHAP` TEXT NOT NULL,
  `TENNV` VARCHAR(50) NOT NULL,
  `MATKHAU` VARCHAR(50) NOT NULL,
  `SDT` VARCHAR(50) NULL DEFAULT NULL,
  `DIACHI` VARCHAR(50) NOT NULL,
  `TUOI` INT NOT NULL,
  `CMND` VARCHAR(50) NOT NULL,
  `GIOITINH` VARCHAR(50) NOT NULL,
  `CAPBAC` VARCHAR(50) NOT NULL,
  `phieu_muon_MAPHIEU` INT NOT NULL,
  PRIMARY KEY (`MANV`),
  CONSTRAINT `fk_nhan_vien_phieu_muon1`
    FOREIGN KEY (`phieu_muon_MAPHIEU`)
    REFERENCES `phieu_muon` (`MAPHIEU`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `fk_nhan_vien_phieu_muon1_idx` ON `nhan_vien` (`phieu_muon_MAPHIEU` ASC) VISIBLE;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `the_loai`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `the_loai` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `the_loai` (
  `MATL` INT NOT NULL,
  `TENTL` VARCHAR(50) NULL DEFAULT NULL,
  `sach_MASACH` INT NOT NULL,
  PRIMARY KEY (`MATL`),
  CONSTRAINT `fk_the_loai_sach1`
    FOREIGN KEY (`sach_MASACH`)
    REFERENCES `sach` (`MASACH`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;
CREATE INDEX `fk_the_loai_sach1_idx` ON `the_loai` (`sach_MASACH` ASC) VISIBLE;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
