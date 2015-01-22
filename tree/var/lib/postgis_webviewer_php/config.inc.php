<?php $conn = array(
	'dbname' => 'postgis',
	'host' => 'localhost',
	'port' => '5432',
	'user' => 'postgres',
	'password' => 'postgres',
	'options' => ''
);
/** use this one if you are running PostgreSQL 9.0+ and have an older driver **/
//$bytea_output_setting = "set bytea_output='escape';"
/** use database default **/
$bytea_output_setting = "";
?>