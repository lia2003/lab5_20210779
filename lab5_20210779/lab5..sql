-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Areas` (
  `idAreas` INT NOT NULL,
  `nombreArea` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAreas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sedes` (
  `idSedes` INT NOT NULL,
  `nombreSede` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSedes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profesionales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Profesionales` (
  `idProfesionales` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `descripcionProfesional` VARCHAR(90) NOT NULL,
  `idArea` INT NOT NULL,
  `idSede` INT NOT NULL,
  PRIMARY KEY (`idProfesionales`),
  INDEX `fk_Profesionales_Areas_idx` (`idArea` ASC) VISIBLE,
  INDEX `fk_Profesionales_Sedes1_idx` (`idSede` ASC) VISIBLE,
  CONSTRAINT `fk_Profesionales_Areas`
    FOREIGN KEY (`idArea`)
    REFERENCES `mydb`.`Areas` (`idAreas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesionales_Sedes1`
    FOREIGN KEY (`idSede`)
    REFERENCES `mydb`.`Sedes` (`idSedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fechas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fechas` (
  `idFechas` INT NOT NULL,
  `fechaDisponibilidad` DATE NOT NULL,
  `idProfesional` INT NOT NULL,
  PRIMARY KEY (`idFechas`, `idProfesional`),
  INDEX `fk_Fechas_Profesionales1_idx` (`idProfesional` ASC) VISIBLE,
  CONSTRAINT `fk_Fechas_Profesionales1`
    FOREIGN KEY (`idProfesional`)
    REFERENCES `mydb`.`Profesionales` (`idProfesionales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pacientes` (
  `idPacientes` INT NOT NULL AUTO_INCREMENT,
  `nombrePaciente` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `Edad` INT NULL,
  `Pacientescol` VARCHAR(45) NULL,
  PRIMARY KEY (`idPacientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Riesgos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Riesgos` (
  `idRiesgos` INT NOT NULL,
  `Bajo` INT NOT NULL,
  `Moderado` INT NOT NULL,
  `Alto` INT NOT NULL,
  `Muy Alto` INT NOT NULL,
  PRIMARY KEY (`idRiesgos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Citas` (
  `idCitas` INT NOT NULL AUTO_INCREMENT,
  `motivoConsulta` VARCHAR(45) NOT NULL,
  `idPaciente` INT NOT NULL,
  `idArea` INT NOT NULL,
  `idProfesional` INT NOT NULL,
  `idSede` INT NOT NULL,
  `idFechaConsulta` INT NOT NULL,
  `idRiesgo` INT NOT NULL,
  `precio` DECIMAL NULL,
  `Citascol` VARCHAR(45) NULL,
  PRIMARY KEY (`idCitas`),
  INDEX `fk_Citas_Fechas1_idx` (`idFechaConsulta` ASC, `idProfesional` ASC) VISIBLE,
  INDEX `fk_Citas_Areas1_idx` (`idArea` ASC) VISIBLE,
  INDEX `fk_Citas_Sedes1_idx` (`idSede` ASC) VISIBLE,
  INDEX `fk_Citas_Pacientes1_idx` (`idPaciente` ASC) VISIBLE,
  INDEX `fk_Citas_Riesgos1_idx` (`idRiesgo` ASC) VISIBLE,
  CONSTRAINT `fk_Citas_Fechas1`
    FOREIGN KEY (`idFechaConsulta` , `idProfesional`)
    REFERENCES `mydb`.`Fechas` (`idFechas` , `idProfesional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Areas1`
    FOREIGN KEY (`idArea`)
    REFERENCES `mydb`.`Areas` (`idAreas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Sedes1`
    FOREIGN KEY (`idSede`)
    REFERENCES `mydb`.`Sedes` (`idSedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Pacientes1`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `mydb`.`Pacientes` (`idPacientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Riesgos1`
    FOREIGN KEY (`idRiesgo`)
    REFERENCES `mydb`.`Riesgos` (`idRiesgos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Foro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Foro` (
  `idForo` INT NOT NULL,
  `comentario` VARCHAR(45) NOT NULL,
  `nombrePersona` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idForo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Recursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Recursos` (
  `idRecursos` INT NOT NULL,
  PRIMARY KEY (`idRecursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Frases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Frases` (
  `idFrases` INT NOT NULL,
  `frase` VARCHAR(45) NULL,
  `idRecurso` INT NOT NULL,
  PRIMARY KEY (`idFrases`, `idRecurso`),
  INDEX `fk_Frases_Recursos1_idx` (`idRecurso` ASC) VISIBLE,
  CONSTRAINT `fk_Frases_Recursos1`
    FOREIGN KEY (`idRecurso`)
    REFERENCES `mydb`.`Recursos` (`idRecursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Canciones` (
  `idCanciones` INT NOT NULL,
  `nombreCancion` VARCHAR(45) NOT NULL,
  `tipoCancion` INT NOT NULL,
  `idRecurso` INT NOT NULL,
  PRIMARY KEY (`idCanciones`, `idRecurso`),
  INDEX `fk_Canciones_Recursos1_idx` (`idRecurso` ASC) VISIBLE,
  CONSTRAINT `fk_Canciones_Recursos1`
    FOREIGN KEY (`idRecurso`)
    REFERENCES `mydb`.`Recursos` (`idRecursos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `mydb`.`Areas` (`idAreas`, `nombreArea`) VALUES
(1, 'Psiquiatría'),
(2, 'Neurología'),
(3, 'Psicología'),
(4, 'Terapia Ocupacional');
INSERT INTO `mydb`.`Sedes` (`idSedes`, `nombreSede`) VALUES
(1, 'San Martín'),
(2, 'Lima'),
(3, 'Arequipa'),
(4, 'Trujillo'),
(5, 'Ayacucho');
INSERT INTO `mydb`.`Profesionales` (`idProfesionales`, `nombre`, `imagen`, `descripcionProfesional`, `idArea`, `idSede`) VALUES
(1, 'Leonardo Campos', 'imagen1.jpg', 'Psiquiatra', 1, 1),
(2, 'Ronald Boyer', 'imagen2.jpg', 'Psiquiatra', 1, 2),
(3, 'Karla Pezo', 'imagen3.jpg', 'Psiquiatra', 1, 3),
(4, 'Mayra Gonzales', 'imagen4.jpg', 'Neuróloga', 2, 1),
(5, 'Franco Lazo', 'imagen5.jpg', 'Neurólogo', 2, 2),
(6, 'Victor Guerra', 'imagen6.jpg', 'Psicólogo', 3, 1),
(7, 'Paolo Valiente', 'imagen7.jpg', 'Psicólogo', 3, 2),
(8, 'Alonso Llanos', 'imagen8.jpg', 'Psicólogo', 3, 3),
(9, 'Diego Torres', 'imagen9.jpg', 'Terapeuta', 4, 4),
(10, 'Piero Mendoza', 'imagen10.jpg', 'Terapeuta', 4, 5),
(11, 'Hellen Aranda', 'imagen11.jpg', 'Terapeuta', 4, 2);
INSERT INTO `mydb`.`Fechas` (`idFechas`, `fechaDisponibilidad`, `idProfesional`) VALUES
(1, '2023-10-01', 1),
(2, '2023-10-05', 2),
(3, '2023-10-10', 3),
(4, '2023-10-12', 4),
(5, '2023-10-15', 5),
(6, '2023-10-18', 6),
(7, '2023-10-20', 7),
(8, '2023-10-22', 8),
(9, '2023-10-25', 9),
(10, '2023-10-28', 10),
(11, '2023-10-30', 11);
