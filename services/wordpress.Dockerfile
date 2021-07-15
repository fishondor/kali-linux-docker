FROM wordpress

RUN sed -i 's/Listen 80/Listen 4500/' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:4500>/' /etc/apache2/sites-available/000-default.conf