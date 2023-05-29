/*
Created: 21/01/2023
Modified: 23/01/2023
Model: MySQL 8.0
Database: MySQL 8.0
*/

-- Create tables section -------------------------------------------------

-- Table Materia_Prima_Categoria

CREATE TABLE `Materia_Prima_Categoria`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `desMatPriCat` Char(40),
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

-- Table Materia_Prima

CREATE TABLE `Materia_Prima`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `refCodMatPri` Char(7) NOT NULL,
  `idMatPriCat` Int NOT NULL,
  `idMed` Int NOT NULL,
  `nomMatPri` Char(20),
  `desMatPri` Char(60),
  `stock` Decimal(7,2) DEFAULT 0,
  `fecCreMatPri` Datetime,
  `fecActMatPri` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship2` ON `Materia_Prima` (`idMatPriCat`)
;

CREATE INDEX `IX_Relationship3` ON `Materia_Prima` (`idMed`)
;

-- Table Medida

CREATE TABLE `Medida`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `desMed` Char(10),
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

-- Table Proveedor

CREATE TABLE `Proveedor`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `refCodPro` Char(6) NOT NULL,
  `nomPro` Char(20),
  `apePro` Char(20),
  `desPro` Char(40),
  `fecCrePro` Datetime,
  `fecActPro` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

-- Table Entrada_Stock

CREATE TABLE `Entrada_Stock`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `codEntSto` Char(20) NOT NULL,
  `idMatPri` Int NOT NULL,
  `idPro` Int NOT NULL,
  `refCodMatPri` Char(7) NOT NULL,
  `refCodPro` Char(6) NOT NULL,
  `fecEntSto` Datetime,
  `letAniEntSto` Char(4),
  `diaJulEntSto` Char(3),
  `esSel` Bool DEFAULT false,
  `merTotEsSel` Decimal(7,2),
  `canTotSelEsSel` Decimal(7,2),
  `refNumIngEntSto` Char(5),
  `docEntSto` Char(20),
  `canTotEnt` Decimal(7,2),
  `cantResEnt` Decimal(7,2),
  `idEntStoEst` Int NOT NULL,
  `fecCreEntSto` Datetime,
  `fecActEntSto` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship4` ON `Entrada_Stock` (`idMatPri`)
;

CREATE INDEX `IX_Relationship5` ON `Entrada_Stock` (`idPro`)
;

CREATE INDEX `IX_Relationship21` ON `Entrada_Stock` (`idEntStoEst`)
;

-- Table Salida_Stock

CREATE TABLE `Salida_Stock`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `idEntSto` Int NOT NULL,
  `idReqLotDet` Int NOT NULL,
  `refIdReqLot` Int NOT NULL,
  `refCodEntSto` Char(20) NOT NULL,
  `refCodMatPri` Char(7) NOT NULL,
  `refNumReqLot` Char(6) NOT NULL,
  `docSalSto` Char(20),
  `canSalEntSto` Decimal(7,2),
  `fecSalSalSto` Datetime,
  `fecCreSalStoDet` Datetime,
  `fecActSalStoDet` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship7` ON `Salida_Stock` (`idEntSto`)
;

CREATE INDEX `IX_Relationship18` ON `Salida_Stock` (`idReqLotDet`)
;

-- Table Requisicion_Lote_Detalle

CREATE TABLE `Requisicion_Lote_Detalle`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `idMatPri` Int NOT NULL,
  `idReqLot` Int NOT NULL,
  `refNumReqLot` Char(6) NOT NULL,
  `refCodMatPri` Char(7) NOT NULL,
  `canReqLotDet` Decimal(7,2),
  `idReqLotDetEst` Int NOT NULL,
  `fecCreReqLotDet` Datetime,
  `fecActReqLotDet` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship8` ON `Requisicion_Lote_Detalle` (`idMatPri`)
;

CREATE INDEX `IX_Relationship10` ON `Requisicion_Lote_Detalle` (`idReqLot`)
;

CREATE INDEX `IX_Relationship27` ON `Requisicion_Lote_Detalle` (`idReqLotDetEst`)
;

-- Table Requisicion_Lote

CREATE TABLE `Requisicion_Lote`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `numReqLot` Char(6) NOT NULL,
  `idProd` Int NOT NULL,
  `canReqLot` Decimal(7,2),
  `klgReqLot` Decimal(5,0),
  `fetPedReqLot` Datetime,
  `fetTerReqLot` Datetime,
  `idReqLotEst` Int NOT NULL,
  `fecCreReqLot` Datetime,
  `fecActReqLot` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship11` ON `Requisicion_Lote` (`idProd`)
;

CREATE INDEX `IX_Relationship26` ON `Requisicion_Lote` (`idReqLotEst`)
;

-- Table Producto

CREATE TABLE `Producto`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `idProdCat` Int NOT NULL,
  `nomProd` Char(40),
  `desProd` Char(60),
  `stoProd` Decimal(8,2),
  `fecCreProd` Datetime,
  `fecActProd` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship12` ON `Producto` (`idProdCat`)
;

-- Table Producto_Categoria

CREATE TABLE `Producto_Categoria`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `desProdCat` Char(20),
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

-- Table Formula

CREATE TABLE `Formula`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `idProd` Int NOT NULL,
  `nomFor` Char(30),
  `desFor` Char(40),
  `lotKgrFor` Decimal(5,0),
  `fecCreFor` Datetime,
  `fecActFor` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship13` ON `Formula` (`idProd`)
;

-- Table Formula_Detalle

CREATE TABLE `Formula_Detalle`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `idFor` Int NOT NULL,
  `idMatPri` Int NOT NULL,
  `refCodMatPri` Char(7) NOT NULL,
  `canMatPriFor` Decimal(7,2),
  `fecCreFor` Datetime,
  `fecActFor` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship14` ON `Formula_Detalle` (`idFor`)
;

CREATE INDEX `IX_Relationship15` ON `Formula_Detalle` (`idMatPri`)
;

-- Table Salida_Entrada_Seleccion

CREATE TABLE `Salida_Entrada_Seleccion`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `idEntSto` Int NOT NULL,
  `idReqSelDet` Int NOT NULL,
  `refIdReqSel` Int NOT NULL,
  `refCodEnt` Char(20) NOT NULL,
  `refCodMatPri` Char(7) NOT NULL,
  `canSalReqSel` Decimal(7,2),
  `canEntReqSel` Decimal(7,2),
  `merSalEntReqSel` Decimal(7,2),
  `fecSalReqSel` Datetime,
  `fecEntReqSel` Datetime,
  `idSalEntSelEst` Int NOT NULL,
  `fecCreSalEntSel` Datetime,
  `fecActSalEntSel` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship19` ON `Salida_Entrada_Seleccion` (`idEntSto`)
;

CREATE INDEX `IX_Relationship20` ON `Salida_Entrada_Seleccion` (`idReqSelDet`)
;

CREATE INDEX `IX_Relationship22` ON `Salida_Entrada_Seleccion` (`idSalEntSelEst`)
;

-- Table Requisicion_Seleccion

CREATE TABLE `Requisicion_Seleccion`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `numReqSel` Char(6),
  `fecPedReqSel` Datetime,
  `fecEntReqSel` Datetime,
  `idReqSelEst` Int NOT NULL,
  `fecCreReqSel` Datetime,
  `fecActReqSel` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship23` ON `Requisicion_Seleccion` (`idReqSelEst`)
;

-- Table Requisicion_Seleccion_Detalle

CREATE TABLE `Requisicion_Seleccion_Detalle`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `idReqSel` Int NOT NULL,
  `idMatPri` Int NOT NULL,
  `refNumReqSel` Char(6) NOT NULL,
  `refCodMatPri` Char(7) NOT NULL,
  `canReqSelDet` Decimal(7,2),
  `idReqSelDetEst` Int NOT NULL,
  `fecCreReqSelDet` Datetime,
  `fecActReqSelDet` Datetime,
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

CREATE INDEX `IX_Relationship16` ON `Requisicion_Seleccion_Detalle` (`idReqSel`)
;

CREATE INDEX `IX_Relationship17` ON `Requisicion_Seleccion_Detalle` (`idMatPri`)
;

CREATE INDEX `IX_Relationship25` ON `Requisicion_Seleccion_Detalle` (`idReqSelDetEst`)
;

-- Table Entrada_Stock_Estado

CREATE TABLE `Entrada_Stock_Estado`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `desEntStoEst` Char(20),
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

-- Table Salida_Entrada_Seleccion_Estado

CREATE TABLE `Salida_Entrada_Seleccion_Estado`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `desSalEntSalEst` Char(20),
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

-- Table Requisicion_Seleccion_Estado

CREATE TABLE `Requisicion_Seleccion_Estado`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `desReqSelEst` Char(20),
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

-- Table Requisicion_Lote_Estado

CREATE TABLE `Requisicion_Lote_Estado`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `desReqLotEst` Char(20),
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

-- Table Requisicion_Seleccion_Detalle_Estado

CREATE TABLE `Requisicion_Seleccion_Detalle_Estado`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `desReqSelDetEst` Char(20),
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

-- Table Requision_Lote_Detalle_Estado

CREATE TABLE `Requision_Lote_Detalle_Estado`
(
  `id` Int NOT NULL AUTO_INCREMENT,
  `desReqLotDetEst` Char(20),
  `estReg` Char(1) DEFAULT 'A',
  PRIMARY KEY (`id`)
)
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE `Materia_Prima` ADD CONSTRAINT `Relationship2` FOREIGN KEY (`idMatPriCat`) REFERENCES `Materia_Prima_Categoria` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Materia_Prima` ADD CONSTRAINT `Relationship3` FOREIGN KEY (`idMed`) REFERENCES `Medida` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Entrada_Stock` ADD CONSTRAINT `Relationship4` FOREIGN KEY (`idMatPri`) REFERENCES `Materia_Prima` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Entrada_Stock` ADD CONSTRAINT `Relationship5` FOREIGN KEY (`idPro`) REFERENCES `Proveedor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Salida_Stock` ADD CONSTRAINT `Relationship7` FOREIGN KEY (`idEntSto`) REFERENCES `Entrada_Stock` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Requisicion_Lote_Detalle` ADD CONSTRAINT `Relationship8` FOREIGN KEY (`idMatPri`) REFERENCES `Materia_Prima` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Requisicion_Lote_Detalle` ADD CONSTRAINT `Relationship10` FOREIGN KEY (`idReqLot`) REFERENCES `Requisicion_Lote` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Requisicion_Lote` ADD CONSTRAINT `Relationship11` FOREIGN KEY (`idProd`) REFERENCES `Producto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Producto` ADD CONSTRAINT `Relationship12` FOREIGN KEY (`idProdCat`) REFERENCES `Producto_Categoria` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Formula` ADD CONSTRAINT `Relationship13` FOREIGN KEY (`idProd`) REFERENCES `Producto` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Formula_Detalle` ADD CONSTRAINT `Relationship14` FOREIGN KEY (`idFor`) REFERENCES `Formula` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Formula_Detalle` ADD CONSTRAINT `Relationship15` FOREIGN KEY (`idMatPri`) REFERENCES `Materia_Prima` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Requisicion_Seleccion_Detalle` ADD CONSTRAINT `Relationship16` FOREIGN KEY (`idReqSel`) REFERENCES `Requisicion_Seleccion` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Requisicion_Seleccion_Detalle` ADD CONSTRAINT `Relationship17` FOREIGN KEY (`idMatPri`) REFERENCES `Materia_Prima` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Salida_Stock` ADD CONSTRAINT `Relationship18` FOREIGN KEY (`idReqLotDet`) REFERENCES `Requisicion_Lote_Detalle` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Salida_Entrada_Seleccion` ADD CONSTRAINT `Relationship19` FOREIGN KEY (`idEntSto`) REFERENCES `Entrada_Stock` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Salida_Entrada_Seleccion` ADD CONSTRAINT `Relationship20` FOREIGN KEY (`idReqSelDet`) REFERENCES `Requisicion_Seleccion_Detalle` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Entrada_Stock` ADD CONSTRAINT `Relationship21` FOREIGN KEY (`idEntStoEst`) REFERENCES `Entrada_Stock_Estado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Salida_Entrada_Seleccion` ADD CONSTRAINT `Relationship22` FOREIGN KEY (`idSalEntSelEst`) REFERENCES `Salida_Entrada_Seleccion_Estado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Requisicion_Seleccion` ADD CONSTRAINT `Relationship23` FOREIGN KEY (`idReqSelEst`) REFERENCES `Requisicion_Seleccion_Estado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Requisicion_Seleccion_Detalle` ADD CONSTRAINT `Relationship25` FOREIGN KEY (`idReqSelDetEst`) REFERENCES `Requisicion_Seleccion_Detalle_Estado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Requisicion_Lote` ADD CONSTRAINT `Relationship26` FOREIGN KEY (`idReqLotEst`) REFERENCES `Requisicion_Lote_Estado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Requisicion_Lote_Detalle` ADD CONSTRAINT `Relationship27` FOREIGN KEY (`idReqLotDetEst`) REFERENCES `Requision_Lote_Detalle_Estado` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

