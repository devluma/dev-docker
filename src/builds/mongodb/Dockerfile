ARG MONGODB_VERSION=4.0.17

FROM mongo:${MONGODB_VERSION}

LABEL Sysdomotic <sysdomotic@gmail.com>

CMD ["mongod", "--smallfiles", "--logpath=/dev/null"]

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 27017