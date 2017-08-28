<?php

$dsn=$_ENV['DATABASE_URL'];
preg_match( '|([a-z0-9]+)://([^:]*)(:(.*))?@([A-Za-z0-9\.-]*)(:([0-9]*))?(/([0-9a-zA-Z_/\.-]*))|', $dsn, $matches);

$g_hostname             = $matches[5];
$g_db_username          = $matches[2];
$g_db_password          = $matches[4];
$g_database_name        = $matches[9];

$g_db_type              = 'mysql';

//$g_file_upload_method   = DISK;
