FROM redis:6.0-rc

LABEL Sysdomotic <sysdomotic@gmail.com>

COPY redis.conf /usr/local/etc/redis/redis.conf

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

EXPOSE 6379