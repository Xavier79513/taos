-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Proyecto-IWEB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Proyecto-IWEB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Proyecto-IWEB` DEFAULT CHARACTER SET utf8 ;
USE `Proyecto-IWEB` ;

-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`Roles` (
  `idRoles` INT NOT NULL AUTO_INCREMENT,
  `nameRol` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idRoles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`Urbanizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`Urbanizacion` (
  `idUrbanizacion` INT NOT NULL AUTO_INCREMENT,
  `nameUrbanizacion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idUrbanizacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`TipoCoordinadora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`TipoCoordinadora` (
  `idTipoCoordinadora` INT NOT NULL AUTO_INCREMENT,
  `nameTipo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTipoCoordinadora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Roles_idRoles` INT NOT NULL,
  `correoUsuario` VARCHAR(100) NOT NULL,
  `passwordUsuario` VARCHAR(256) NOT NULL,
  `nombreUsuario` VARCHAR(100) NOT NULL,
  `apellidoUsuario` VARCHAR(100) NOT NULL,
  `dniUsuario` VARCHAR(8) NOT NULL,
  `direccionUsuario` VARCHAR(100) NOT NULL,
  `telefonoUsuario` VARCHAR(9) NOT NULL,
  `Urbanizacion_idUrbanizacion` INT NOT NULL,
  `activation_token` VARCHAR(255) NULL,
  `is_active` TINYINT NOT NULL DEFAULT 0,
  `nacimientoDate` DATE NULL,
  `TipoCoordinadora_idTipoCoordinadora` INT NULL,
  `EstadoVecinoEvento_idEstadoVecinoEvento` INT NULL,
  `is_bannedApp` TINYINT NOT NULL DEFAULT 0,
  `motivo_bannedApp` VARCHAR(255) NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `fk_Usuarios_Roles_idx` (`Roles_idRoles` ASC) VISIBLE,
  INDEX `fk_Usuarios_Urbanizacion1_idx` (`Urbanizacion_idUrbanizacion` ASC) VISIBLE,
  INDEX `fk_Usuarios_TipoCoordinadora1_idx` (`TipoCoordinadora_idTipoCoordinadora` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Roles`
    FOREIGN KEY (`Roles_idRoles`)
    REFERENCES `Proyecto-IWEB`.`Roles` (`idRoles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_Urbanizacion1`
    FOREIGN KEY (`Urbanizacion_idUrbanizacion`)
    REFERENCES `Proyecto-IWEB`.`Urbanizacion` (`idUrbanizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_TipoCoordinadora1`
    FOREIGN KEY (`TipoCoordinadora_idTipoCoordinadora`)
    REFERENCES `Proyecto-IWEB`.`TipoCoordinadora` (`idTipoCoordinadora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`Profesores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`Profesores` (
  `idProfesores` INT NOT NULL AUTO_INCREMENT,
  `nombreProfesor` VARCHAR(100) NOT NULL,
  `apellidoProfesor` VARCHAR(100) NOT NULL,
  `dniProfesor` INT NOT NULL,
  `cursoProfesor` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idProfesores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`TipoEvento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`TipoEvento` (
  `idTipoEvento` INT NOT NULL,
  `nameTipo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTipoEvento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`FrecuenciaEvento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`FrecuenciaEvento` (
  `idFrecuenciaEvento` INT NOT NULL AUTO_INCREMENT,
  `frecuenciaTipo` VARCHAR(100) NOT NULL,
  `day1` DATE NOT NULL,
  `day2` DATE NULL,
  PRIMARY KEY (`idFrecuenciaEvento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`EstadoEvento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`EstadoEvento` (
  `idEstadoEvento` INT NOT NULL AUTO_INCREMENT,
  `nameEstado` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEstadoEvento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`Eventos` (
  `idEventos` INT NOT NULL AUTO_INCREMENT,
  `nombreEvento` VARCHAR(100) NOT NULL,
  `fotosStart` LONGBLOB NOT NULL,
  `descriptionEvento` VARCHAR(255) NOT NULL,
  `vacantesDisp` INT NOT NULL,
  `lugarEvento` VARCHAR(100) NOT NULL,
  `fechaEventoStart` DATE NOT NULL,
  `fechaEventoEnd` DATE NOT NULL,
  `horaEventoStart` TIME NOT NULL,
  `horaEventoEnd` TIME NOT NULL,
  `materialesEvento` VARCHAR(255) NULL,
  `Profesores_idProfesores` INT NULL,
  `fotosEnd` LONGBLOB NULL,
  `TipoEvento_idTipoEvento` INT NOT NULL,
  `FrecuenciaEvento_idFrecuenciaEvento` INT NOT NULL,
  `EstadoEvento_idEstadoEvento` INT NOT NULL,
  `asistenciaCoordi` TINYINT NULL,
  `asistenciaLlegada` TIME NULL,
  `asistenciaSalida` TIME NULL,
  PRIMARY KEY (`idEventos`),
  INDEX `fk_Eventos_Profesores1_idx` (`Profesores_idProfesores` ASC) VISIBLE,
  INDEX `fk_Eventos_TipoEvento1_idx` (`TipoEvento_idTipoEvento` ASC) VISIBLE,
  INDEX `fk_Eventos_FrecuenciaEvento1_idx` (`FrecuenciaEvento_idFrecuenciaEvento` ASC) VISIBLE,
  INDEX `fk_Eventos_EstadoEvento1_idx` (`EstadoEvento_idEstadoEvento` ASC) VISIBLE,
  CONSTRAINT `fk_Eventos_Profesores1`
    FOREIGN KEY (`Profesores_idProfesores`)
    REFERENCES `Proyecto-IWEB`.`Profesores` (`idProfesores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Eventos_TipoEvento1`
    FOREIGN KEY (`TipoEvento_idTipoEvento`)
    REFERENCES `Proyecto-IWEB`.`TipoEvento` (`idTipoEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Eventos_FrecuenciaEvento1`
    FOREIGN KEY (`FrecuenciaEvento_idFrecuenciaEvento`)
    REFERENCES `Proyecto-IWEB`.`FrecuenciaEvento` (`idFrecuenciaEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Eventos_EstadoEvento1`
    FOREIGN KEY (`EstadoEvento_idEstadoEvento`)
    REFERENCES `Proyecto-IWEB`.`EstadoEvento` (`idEstadoEvento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`TipoSereno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`TipoSereno` (
  `idTipoSereno` INT NOT NULL,
  `nameTipo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTipoSereno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`Serenazgos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`Serenazgos` (
  `idSerenazgos` INT NOT NULL AUTO_INCREMENT,
  `nombreSereno` VARCHAR(100) NOT NULL,
  `apellidoSereno` VARCHAR(100) NOT NULL,
  `dniSereno` VARCHAR(8) NOT NULL,
  `turnoSereno` VARCHAR(100) NOT NULL,
  `direccionSereno` VARCHAR(100) NOT NULL,
  `telefonoSereno` VARCHAR(9) NOT NULL,
  `TipoSereno_idTipoSereno` INT NOT NULL,
  PRIMARY KEY (`idSerenazgos`),
  INDEX `fk_Serenazgos_TipoSereno1_idx` (`TipoSereno_idTipoSereno` ASC) VISIBLE,
  CONSTRAINT `fk_Serenazgos_TipoSereno1`
    FOREIGN KEY (`TipoSereno_idTipoSereno`)
    REFERENCES `Proyecto-IWEB`.`TipoSereno` (`idTipoSereno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`personalAmbulancia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`personalAmbulancia` (
  `idpersonalAmbulancia` INT NOT NULL AUTO_INCREMENT,
  `nombrePersonal` VARCHAR(100) NOT NULL,
  `apellidoPersonal` VARCHAR(100) NOT NULL,
  `dniPersonal` VARCHAR(8) NOT NULL,
  `turnoAmbulancia` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idpersonalAmbulancia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`EstadoIncidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`EstadoIncidencia` (
  `idEstadoIncidencia` INT NOT NULL,
  `nameEstado` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEstadoIncidencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`CriticidadIncidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`CriticidadIncidencia` (
  `idCriticidadIncidencia` INT NOT NULL AUTO_INCREMENT,
  `nameCriticidad` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCriticidadIncidencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`TipoIncidencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`TipoIncidencia` (
  `idTipoIncidencia` INT NOT NULL,
  `nameTipo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idTipoIncidencia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`Incidencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`Incidencias` (
  `idIncidencias` INT NOT NULL AUTO_INCREMENT,
  `nombreIncidencia` VARCHAR(100) NOT NULL,
  `lugarExacto` VARCHAR(100) NOT NULL,
  `referenciaIncidencia` VARCHAR(255) NOT NULL,
  `fotoIncidencia` LONGBLOB NOT NULL,
  `victimaIncidencia` VARCHAR(100) NOT NULL,
  `contactoIncidencia` INT NULL,
  `requiereAmbulancia` TINYINT NULL,
  `requierePolicia` TINYINT NULL,
  `requiereBombero` TINYINT NULL,
  `descriptionSolucion` VARCHAR(225) NULL,
  `Serenazgos_idSerenazgos` INT NULL,
  `personalAmbulancia_idpersonalAmbulancia` INT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  `EstadoIncidencia_idEstadoIncidencia` INT NOT NULL,
  `CriticidadIncidencia_idCriticidadIncidencia` INT NULL,
  `TipoIncidencia_idTipoIncidencia` INT NOT NULL,
  PRIMARY KEY (`idIncidencias`),
  INDEX `fk_Incidencias_Serenazgos1_idx` (`Serenazgos_idSerenazgos` ASC) VISIBLE,
  INDEX `fk_Incidencias_personalAmbulancia1_idx` (`personalAmbulancia_idpersonalAmbulancia` ASC) VISIBLE,
  INDEX `fk_Incidencias_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  INDEX `fk_Incidencias_EstadoIncidencia1_idx` (`EstadoIncidencia_idEstadoIncidencia` ASC) VISIBLE,
  INDEX `fk_Incidencias_CriticidadIncidencia1_idx` (`CriticidadIncidencia_idCriticidadIncidencia` ASC) VISIBLE,
  INDEX `fk_Incidencias_TipoIncidencia1_idx` (`TipoIncidencia_idTipoIncidencia` ASC) VISIBLE,
  CONSTRAINT `fk_Incidencias_Serenazgos1`
    FOREIGN KEY (`Serenazgos_idSerenazgos`)
    REFERENCES `Proyecto-IWEB`.`Serenazgos` (`idSerenazgos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencias_personalAmbulancia1`
    FOREIGN KEY (`personalAmbulancia_idpersonalAmbulancia`)
    REFERENCES `Proyecto-IWEB`.`personalAmbulancia` (`idpersonalAmbulancia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencias_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `Proyecto-IWEB`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencias_EstadoIncidencia1`
    FOREIGN KEY (`EstadoIncidencia_idEstadoIncidencia`)
    REFERENCES `Proyecto-IWEB`.`EstadoIncidencia` (`idEstadoIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencias_CriticidadIncidencia1`
    FOREIGN KEY (`CriticidadIncidencia_idCriticidadIncidencia`)
    REFERENCES `Proyecto-IWEB`.`CriticidadIncidencia` (`idCriticidadIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Incidencias_TipoIncidencia1`
    FOREIGN KEY (`TipoIncidencia_idTipoIncidencia`)
    REFERENCES `Proyecto-IWEB`.`TipoIncidencia` (`idTipoIncidencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto-IWEB`.`Usuarios_has_Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto-IWEB`.`Usuarios_has_Eventos` (
  `usuarioEventoInscrito` INT NOT NULL,
  `Usuarios_idUsuarios` INT NULL,
  `Eventos_idEventos` INT NULL,
  `is_bannedEvento` TINYINT NULL DEFAULT 0,
  `motivo_bannedEvento` VARCHAR(225) NULL,
  INDEX `fk_Usuarios_has_Eventos_Eventos1_idx` (`Eventos_idEventos` ASC) VISIBLE,
  INDEX `fk_Usuarios_has_Eventos_Usuarios1_idx` (`Usuarios_idUsuarios` ASC) VISIBLE,
  PRIMARY KEY (`usuarioEventoInscrito`),
  CONSTRAINT `fk_Usuarios_has_Eventos_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `Proyecto-IWEB`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Eventos_Eventos1`
    FOREIGN KEY (`Eventos_idEventos`)
    REFERENCES `Proyecto-IWEB`.`Eventos` (`idEventos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
