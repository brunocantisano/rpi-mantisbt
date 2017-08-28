# Mantis Bug Tracker

![docker_logo](https://raw.githubusercontent.com/brunocantisano/rpi-mantisbt/master/files/docker.png)![docker_mantisbt_logo](https://raw.githubusercontent.com/brunocantisano/rpi-mantisbt/master/files/logo-mantis.png)![docker_paperinik_logo](https://raw.githubusercontent.com/brunocantisano/rpi-mantisbt/master/files/docker_paperinik_120x120.png)

This Docker container implements a `MantisBT`. It's an open source issue tracker that provides a delicate balance between simplicity and power.

 * Raspbian base image.
 
### Installation from [Docker registry hub](https://registry.hub.docker.com/u/paperinik/rpi-mantisbt/).

You can download the image with the following command:

```bash
docker pull paperinik/rpi-mantisbt
```

# How to use this image

Exposed ports
----

The image exposes port `80`.

Use cases

You can use `mariadb`/`postgres` instead of `mysql`.

----

1) Install

```
$ firefox http://localhost:9400/admin/install.php
>>> username: administrator
>>> password: root
```

2) Installation Options

* Type of Database                                        MySQL/MySQLi
* Hostname (for Database Server)                          mysql
* Username (for Database)                                 mantisbt
* Password (for Database)                                 mantisbt
* Database name (for Database)                            bugtracker
* Admin Username (to create Database if required)         root
* Admin Password (to create Database if required)         root
* Print SQL Queries instead of Writing to the Database    [ ]
* Attempt Installation                                    [Install/Upgrade Database]

3) Email

Append following to `/var/www/html/config_inc.php`

```
$g_phpMailer_method = PHPMAILER_METHOD_SMTP;
$g_administrator_email = 'admin@example.org';
$g_webmaster_email = 'webmaster@example.org';
$g_return_path_email = 'mantisbt@example.org';
$g_from_email = 'mantisbt@example.org';
$g_smtp_host = 'smtp.example.org';
$g_smtp_port = 25;
$g_smtp_connection_mode = 'tls';
$g_smtp_username = 'mantisbt';
$g_smtp_password = '********';
```