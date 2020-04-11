ARG POSTGRES_VERSION=11.5

FROM postgres:${POSTGRES_VERSION}

LABEL Sysdomotic <sysdomotic@gmail.com>

RUN echo "host all  all  0.0.0.0/0  md5" >> /var/lib/postgresql/data/pg_hba.conf

RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA";

CMD ["postgres"]

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 5432