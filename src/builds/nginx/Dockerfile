ARG NGINX_VERSION=alpine
ARG NGINX_PORT_HTTP=80
ARG NGINX_PORT_HTTPS=443
ARG NGINX_APP_PORT=8081
ARG NGINX_API_PORT=8082
ARG NGINX_HOST_APP_NAME=app.local
ARG NGINX_HOST_API_NAME=api.local

FROM nginx:${NGINX_VERSION}

LABEL Sysdomotic <sysdomotic@gmail.com>

WORKDIR /var/www/html

# Add nginx dinamic configurations
ADD sites-available/ /etc/nginx/sites-enabled/
COPY sites-available/*.conf /etc/nginx/sites-enabled/*.conf

# Copy nginx.conf
COPY ./configs/nginx.conf /etc/nginx/nginx.conf

# RUN ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/example.com.conf

ENV HOST_APP_NAME=${NGINX_HOST_APP_NAME} 
ENV HOST_API_NAME=${NGINX_HOST_API_NAME}

EXPOSE ${NGINX_PORT_HTTP} ${NGINX_APP_PORT} ${NGINX_API_PORT} ${NGINX_PORT_HTTPS}