ARG MONGODB_VERSION=alpine
ARG MONGODB_PORT=27017

FROM mongo:${MONGODB_VERSION}

LABEL Sysdomotic <sysdomotic@gmail.com>

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mongod", "--smallfiles", "--logpath=/dev/null"]

EXPOSE ${MONGODB_PORT}