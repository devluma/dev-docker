ARG REDIS_VERSION=6.0-rc3-alpine

FROM redis:${REDIS_VERSION}

LABEL Sysdomotic <sysdomotic@gmail.com>

COPY ./configs/redis.conf /usr/local/etc/redis/redis.conf

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379