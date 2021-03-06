FROM resin/rpi-raspbian:latest
MAINTAINER Bruno Cardoso Cantisano <bruno.cantisano@gmail.com>

# This dockerfile is suitable for installing MantisBT
# for production use. The script will also look for /data volume
# where it would move permanent files MantisBT creates (attachments)
#
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install \
    mysql-client \
    apache2 \
    libapache2-mod-php5 \
    php5-mysql  \
    php5-ldap \
    php5-gd \
    php5-curl \
    wget \
    php-pear && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/cli/php.ini && \
    a2enmod rewrite && \
    a2enmod headers && \
    mkdir -p /app && \
    rm -fr /var/www/html && \
    ln -s /app /var/www/html && \
# Install vanilla MantisBT \
    wget http://sourceforge.net/projects/mantisbt/files/mantis-stable/1.2.19/mantisbt-1.2.19.tar.gz/download -O /mantisbt.tar.gz && \
    tar -zvxf /mantisbt.tar.gz && \
    cp -aR /mantisbt-*/* /app && \
    rm -rf /mantisbt* && \
    mkdir /data && \
    chown -R www-data:www-data /app

# Use our default config
COPY files/config_inc.php /app/config_inc.php

# Initialize custom config from volume
COPY files/volume-init.sh files/run-mantis.sh /

# Configure and start apache
COPY files/vhost.conf /etc/apache2/sites-enabled/000-default.conf

WORKDIR /app

RUN chmod 755 /volume-init.sh && \
    chmod 755 /run-mantis.sh && \
    chmod 755 -R /data

EXPOSE 80

CMD ["/run-mantis.sh"]
