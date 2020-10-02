FROM existenz/webstack:7.4-codecasts

EXPOSE 80 443 2222

RUN apk -U --no-cache add \
    openssh \
    && echo "root:Docker!" | chpasswd \
    && rm  -rf /tmp/* /var/cache/apk/*

COPY files/ssh /

#make sure we get fresh keys
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

RUN apk -U --no-cache add \
        php7 \
        php7-cli \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-pdo_mysql \
        php7-ssh2 \
        npm

COPY --chown=php:nginx index.php /www/public

#RUN find /www -type d -exec chmod -R 555 {} \; \
#    && find /www -type f -exec chmod -R 444 {} \; \
#    && find /www/storage /www/bootstrap/cache -type d -exec chmod -R 755 {} \; \
#    && find /www/storage /www/bootstrap/cache -type f -exec chmod -R 644 {} \;

