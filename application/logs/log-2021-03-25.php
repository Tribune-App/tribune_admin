ERROR - 2021-03-25 13:13:47 --> Query error: Table 'tribune_redsocial.Wo_users' doesn't exist - Invalid query: SELECT `Wo_Posts`.*, `Wo_Users`.`first_name`, `Wo_Users`.`last_name`, `Wo_Users`.`username`
FROM `Wo_Posts`
JOIN `Wo_users` ON `Wo_Users`.`user_id` = `Wo_Posts`.`user_id`
GROUP BY `time`
ERROR - 2021-03-25 13:13:47 --> Severity: error --> Exception: Call to a member function num_rows() on bool /home/tribune/public_html/tribune_admin/application/models/Publicacion_model.php 20
ERROR - 2021-03-25 18:14:49 --> 404 Page Not Found: Images/favicon.ico
ERROR - 2021-03-25 18:37:44 --> 404 Page Not Found: Faviconico/index
ERROR - 2021-03-25 18:42:16 --> 404 Page Not Found: Images/favicon.ico
