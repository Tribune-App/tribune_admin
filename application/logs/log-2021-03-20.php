<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>

ERROR - 2021-03-20 22:11:47 --> 404 Page Not Found: Panel/perfil
ERROR - 2021-03-20 22:37:04 --> Query error: Unknown column 'pers.sexo' in 'field list' - Invalid query: SELECT `usuario`.*, `per`.`nombre` as `nombre_perfil`, `pers`.`nro_doc` as `nro_doc_personal`, `pers`.`nombres` as `nombres_personal`, `pers`.`apellido_paterno` as `apaterno_personal`, `pers`.`apellido_materno` as `amaterno_personal`, `pers`.`sexo`
FROM `usuario`
JOIN `perfil` AS `per` ON `per`.`id_perfil` = `usuario`.`id_perfil`
JOIN `personal` AS `pers` ON `pers`.`id_personal` = `usuario`.`id_personal`
ERROR - 2021-03-20 22:37:04 --> Severity: error --> Exception: Call to a member function num_rows() on bool C:\xampp\htdocs\admin_tribune\application\models\Usuario_model.php 73
ERROR - 2021-03-20 22:39:41 --> Query error: Table 'bd_tribune.empresa' doesn't exist - Invalid query: SELECT `personal`.*, `empresa`.`razon_social` as `razon_social_empresa`
FROM `personal`
LEFT JOIN `empresa` ON `empresa`.`id_empresa` = `personal`.`id_empresa`
ERROR - 2021-03-20 22:39:41 --> Severity: error --> Exception: Call to a member function num_rows() on bool C:\xampp\htdocs\admin_tribune\application\models\Personal_model.php 19
ERROR - 2021-03-20 22:39:43 --> Query error: Table 'bd_tribune.empresa' doesn't exist - Invalid query: SELECT `personal`.*, `empresa`.`razon_social` as `razon_social_empresa`
FROM `personal`
LEFT JOIN `empresa` ON `empresa`.`id_empresa` = `personal`.`id_empresa`
ERROR - 2021-03-20 22:39:43 --> Severity: error --> Exception: Call to a member function num_rows() on bool C:\xampp\htdocs\admin_tribune\application\models\Personal_model.php 19
ERROR - 2021-03-20 22:45:18 --> 404 Page Not Found: Panel/perfil
