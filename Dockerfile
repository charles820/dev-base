FROM nginx:alpine

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk update && apk add --update \
	php7 \
	php7-fpm

RUN	mkdir -p /run/nginx /run/php5

ADD src/ /usr/share/nginx/html/
ADD etc/ /etc/

EXPOSE 80
WORKDIR /usr/share/nginx/html/

CMD ["sh", "-c", "php-fpm7 && sleep 3 && nginx -g \"daemon off;\" "]