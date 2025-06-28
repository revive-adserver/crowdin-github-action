FROM crowdin/cli:4.0.0

RUN apk --no-cache add curl git git-lfs jq gnupg bash gettext;

COPY . .
COPY entrypoint.sh /entrypoint.sh

RUN apk --no-cache add php83 php83-common php83-ctype php83-curl php83-dom php83-fileinfo php83-iconv php83-intl php83-mbstring php83-openssl php83-phar php83-simplexml php83-tokenizer php83-xml php83-xmlwriter php83-zip

COPY --from=composer/composer:2-bin /composer /usr/bin/composer

ENTRYPOINT ["/entrypoint.sh"]
