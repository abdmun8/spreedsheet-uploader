CREATE TABLE `kmt_asset_master` (
	`id_item` INT(11) NOT NULL AUTO_INCREMENT,
	`code_asset` VARCHAR(20) NOT NULL,
	`id_shop` INT(11) NOT NULL,
	`id_cabang` INT(11) NOT NULL DEFAULT '0',
	`id_category_asset` INT(11) NOT NULL,
	`id_unit` INT(11) NOT NULL,
	`asset_name` VARCHAR(350) NOT NULL,
	`nilai_buku` DECIMAL(12,0) NOT NULL,
	`status` ENUM('Active','Non Active') NOT NULL DEFAULT 'Active',
	`timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`user_update` INT(11) NOT NULL,
	`keterangan` VARCHAR(1000) NULL DEFAULT NULL,
	PRIMARY KEY (`id_item`, `code_asset`, `id_shop`, `id_cabang`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;


CREATE TABLE `kmt_asset_maintenance` (
	`maintenance_id` INT(11) NOT NULL AUTO_INCREMENT,
	`id_inv` INT(11) NULL DEFAULT NULL,
	`pic` VARCHAR(20) NULL DEFAULT NULL,
	`pengirim` VARCHAR(30) NULL DEFAULT NULL,
	`date_receipt` DATE NULL DEFAULT NULL,
	`lama_pengerjaan` VARCHAR(2) NULL DEFAULT NULL,
	`created_at` DATETIME NULL DEFAULT NULL,
	`status` VARCHAR(30) NULL DEFAULT NULL,
	`qty` INT(11) NULL DEFAULT '1',
	`no_maintenance` VARCHAR(30) NULL DEFAULT NULL,
	`remark` TEXT NULL,
	`is_deleted` INT(1) NULL DEFAULT '0',
	PRIMARY KEY (`maintenance_id`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;

CREATE TABLE `kmt_asset_inventory` (
	`id_inv` INT(11) NOT NULL AUTO_INCREMENT,
	`id_item` INT(11) NOT NULL,
	`barcode` VARCHAR(25) NOT NULL,
	`branch_lokasi` INT(11) NOT NULL,
	`po_number` VARCHAR(25) NOT NULL,
	`pr_number` VARCHAR(20) NOT NULL,
	`user_req` VARCHAR(45) NOT NULL,
	`remark_pr` VARCHAR(45) NULL DEFAULT NULL,
	`qty` FLOAT NULL DEFAULT '1',
	`harga_beli` DECIMAL(18,2) NOT NULL DEFAULT '0.00',
	`nilai_buku` DECIMAL(18,2) NOT NULL DEFAULT '0.00',
	`id_shop` INT(11) NOT NULL,
	`id_cabang` INT(11) NOT NULL,
	`timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`user_update` INT(11) NOT NULL,
	`status_dokumen` ENUM('PR','PO','Received','Distribusi','Maintenance') NULL DEFAULT 'PR',
	`status_asset` ENUM('PENDING','ASSET','SCRAP') NULL DEFAULT 'PENDING',
	`pr_date` DATE NULL DEFAULT NULL,
	`po_date` DATE NULL DEFAULT NULL,
	`in_date` DATE NULL DEFAULT NULL,
	`co_date` DATE NULL DEFAULT NULL,
	`code_asset` VARCHAR(100) NULL DEFAULT NULL,
	`remark_po` VARCHAR(500) NULL DEFAULT NULL,
	`remark_check_in` VARCHAR(500) NULL DEFAULT NULL,
	`remark_check_out` VARCHAR(500) NULL DEFAULT NULL,
	`penerima_in` VARCHAR(45) NULL DEFAULT NULL,
	`pengirim_in` VARCHAR(45) NULL DEFAULT NULL,
	`pengirim_out` VARCHAR(45) NULL DEFAULT NULL,
	`penerima_out` VARCHAR(45) NULL DEFAULT NULL,
	`out_date` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id_inv`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;


CREATE TABLE `kmt_asset_inventory_detail` (
	`id_inventory_detail` INT(11) NOT NULL AUTO_INCREMENT,
	`id_inventory` INT(11) NOT NULL,
	`barcode_detail` VARCHAR(150) NOT NULL,
	`id_shop` INT(11) NOT NULL,
	`id_cabang` INT(11) NOT NULL,
	PRIMARY KEY (`id_inventory_detail`),
	INDEX `id_inventory` (`id_inventory`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
;


CREATE TABLE `kmt_asset_category` (
	`id_category_asset` INT(11) NOT NULL AUTO_INCREMENT,
	`category_asset_name` VARCHAR(350) NOT NULL,
	`umur_ekonomis` INT(11) NOT NULL,
	`penyusutuan` INT(11) NOT NULL,
	`timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`user_update` INT(11) NOT NULL,
	PRIMARY KEY (`id_category_asset`)
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;
