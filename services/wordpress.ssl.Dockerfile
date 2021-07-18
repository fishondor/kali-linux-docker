FROM wordpress

RUN mkdir /etc/apache2/ssl

COPY ssl_cert_config.cnf /etc/apache2/ssl

RUN openssl req -x509 -out /etc/apache2/ssl/local.pentest.crt -keyout /etc/apache2/ssl/local.pentest.key \
    -newkey rsa:2048 -nodes -sha256 \
    -subj "/CN=local.pentest.com" -extensions EXT \
    -config /etc/apache2/ssl/ssl_cert_config.cnf

RUN a2enmod ssl

RUN ln -s /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/000-default-ssl.conf && \
    sed -i 's/\/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/\/etc\/apache2\/ssl\/local.pentest.crt/' /etc/apache2/sites-available/default-ssl.conf && \
    sed -i 's/\/etc\/ssl\/private\/ssl-cert-snakeoil.key/\/etc\/apache2\/ssl\/local.pentest.key/' /etc/apache2/sites-available/default-ssl.conf

EXPOSE 80 443 22