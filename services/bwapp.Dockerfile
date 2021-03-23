FROM raesene/bwapp

RUN sed -i 's/Listen 80/Listen 4600/' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:4600>/' /etc/apache2/sites-available/000-default.conf

RUN chmod 777 /var/www/html/images/