CREATE TABLE `cliente`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `Apellido` VARCHAR(255) NOT NULL,
    `Documento` VARCHAR(255) NOT NULL,
    `TipoDoc` ENUM('("CC"', '"TI"', '"Pasaporte")') NULL,
    `email` VARCHAR(255) NOT NULL,
    `Telefono` VARCHAR(255) NOT NULL,
    `Direccion` VARCHAR(255) NOT NULL,
    `FechReegistro` DATE NOT NULL,
    `estado` ENUM('("Activo"', '"Inactivo")') NOT NULL
);
CREATE TABLE `servicios`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cuenta_id` BIGINT NOT NULL,
    `tipo_servicio` ENUM('(recarga o pago)') NOT NULL,
    `numero_celular` VARCHAR(255) NOT NULL,
    `operador` VARCHAR(255) NOT NULL,
    `referencia_pago` VARCHAR(255) NOT NULL,
    `monto` DECIMAL(8, 2) NOT NULL,
    `fecha_hora` DATETIME NOT NULL,
    `descripcion` TEXT NOT NULL
);
ALTER TABLE
    `servicios` ADD INDEX `servicios_cuenta_id_index`(`cuenta_id`);
CREATE TABLE `tranferencia`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cliente_id` BIGINT NOT NULL,
    `servicio_id` BIGINT NOT NULL,
    `monto` DECIMAL(8, 2) NOT NULL,
    `fecha_horabigint` DATETIME NOT NULL,
    `referencia_pagbiginto` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `tranferencia` ADD INDEX `tranferencia_cliente_id_index`(`cliente_id`);
ALTER TABLE
    `tranferencia` ADD INDEX `tranferencia_servicio_id_index`(`servicio_id`);
CREATE TABLE `cuenta`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cliente_id` BIGINT NOT NULL,
    `numero_cuenta` VARCHAR(255) NOT NULL,
    `tipo_cuenta` VARCHAR(255) NOT NULL,
    `saldo` DECIMAL(8, 2) NOT NULL,
    `fecha_creacion` DATE NOT NULL
);
ALTER TABLE
    `cuenta` ADD CONSTRAINT `cuenta_cliente_id_foreign` FOREIGN KEY(`cliente_id`) REFERENCES `cliente`(`id`);
ALTER TABLE
    `tranferencia` ADD CONSTRAINT `tranferencia_servicio_id_foreign` FOREIGN KEY(`servicio_id`) REFERENCES `servicios`(`id`);
ALTER TABLE
    `servicios` ADD CONSTRAINT `servicios_cuenta_id_foreign` FOREIGN KEY(`cuenta_id`) REFERENCES `cuenta`(`id`);
ALTER TABLE
    `tranferencia` ADD CONSTRAINT `tranferencia_cliente_id_foreign` FOREIGN KEY(`cliente_id`) REFERENCES `cuenta`(`id`);