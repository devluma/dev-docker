ARG MONGODB_VERSION=4.0.17

FROM mongo:${MONGODB_VERSION}

LABEL Sysdomotic <sysdomotic@gmail.com>

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mongod", "--smallfiles", "--logpath=/dev/null"]

EXPOSE 27017