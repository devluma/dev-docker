ARG POSTGRES_VERSION=alpine
ARG POSTGRES_PORT=5432

FROM postgres:${POSTGRES_VERSION}

LABEL Sysdomotic <sysdomotic@gmail.com>

RUN echo "host all  all  0.0.0.0/0  md5" >> /var/lib/postgresql/data/pg_hba.conf

RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA";

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["postgres"]

EXPOSE ${POSTGRES_PORT}