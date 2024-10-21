FROM nginx:alpine

RUN apk --no-cache add iputils bash

COPY ./test_connectivity.sh /usr/local/bin/test_connectivity.sh

RUN chmod +x /usr/local/bin/test_connectivity.sh

COPY ./lind_nginx_static/nginx.conf /etc/nginx/nginx.conf
