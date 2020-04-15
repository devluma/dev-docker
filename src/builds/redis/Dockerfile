ARG REDIS_VERSION=6.0-rc3
ARG REDIS_PORT=6379

FROM redis:${REDIS_VERSION}

LABEL Sysdomotic <sysdomotic@gmail.com>

COPY ./configs/redis.conf /usr/local/etc/redis/redis.conf

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

EXPOSE 6379