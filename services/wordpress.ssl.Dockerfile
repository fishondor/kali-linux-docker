FROM wordpress

RUN mkdir /etc/apache2/ssl

COPY ssl_cert_config.cnf /etc/apache2/ssl

RUN openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -out /etc/apache2/ssl/server.crt -keyout /etc/apache2/ssl/server.key -config /etc/apache2/ssl/ssl_cert_config.cnf && \
    a2enmod ssl && \
    ln -s /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/000-default-ssl.conf && \
    sed -i 's/\/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/\/etc\/apache2\/ssl\/server.crt/' /etc/apache2/sites-enabled/000-default-ssl.conf && \
    sed -i 's/\/etc\/ssl\/private\/ssl-cert-snakeoil.key/\/etc\/apache2\/ssl\/server.key/' /etc/apache2/sites-enabled/000-default-ssl.conf

EXPOSE 80 443 22