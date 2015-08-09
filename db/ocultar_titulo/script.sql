ALTER TABLE `construirtv`.`titulos` 
ADD COLUMN `oculto` TINYINT(4) NULL DEFAULT NULL COMMENT '' AFTER `destacado`;

UPDATE titulos SET oculto = 0;
