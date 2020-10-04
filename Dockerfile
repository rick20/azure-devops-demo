FROM existenz/webstack:7.4-codecasts

EXPOSE 80 443 2222

RUN apk -U --no-cache add \
    openssh \
    && echo "root:Docker!" | chpasswd \
    && rm  -rf /tmp/* /var/cache/apk/*

COPY files/ssh /

RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key


# Install "PHP Extentions"
RUN apk -U --no-cache add \
        php7 \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-pdo_mysql \
        php7-zip

# Install composer and add its bin to the PATH.
RUN curl -s http://getcomposer.org/installer | php && \
    echo "export PATH=${PATH}:/var/www/vendor/bin" >> ~/.bashrc && \
    mv composer.phar /usr/local/bin/composer

#COPY --chown=php:nginx index.php /www/public

#RUN find /www -type d -exec chmod -R 555 {} \; \
#    && find /www -type f -exec chmod -R 444 {} \; \
#    && find /www/storage /www/bootstrap/cache -type d -exec chmod -R 755 {} \; \
#    && find /www/storage /www/bootstrap/cache -type f -exec chmod -R 644 {} \;

