FROM existenz/webstack:7.4-codecasts

EXPOSE 80 443 2222

RUN apk -U --no-cache add \
    openssh \
    && rm  -rf /tmp/* /var/cache/apk/*

COPY files/ssh /

#make sure we get fresh keys
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

RUN apk -U --no-cache add \
        php \
        php-ctype \
        php-curl \
        php-dom \
        php-iconv \
        php-intl \
        php-json \
        php-mbstring \
        php-pdo_mysql \
        php-ssh2 \
        npm

COPY --chown=php:nginx index.php /www/public

#RUN find /www -type d -exec chmod -R 555 {} \; \
#    && find /www -type f -exec chmod -R 444 {} \; \
#    && find /www/storage /www/bootstrap/cache -type d -exec chmod -R 755 {} \; \
#    && find /www/storage /www/bootstrap/cache -type f -exec chmod -R 644 {} \;

