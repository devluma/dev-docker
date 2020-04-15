ARG MARIADB_VERSION=10.4
ARG MARIADB_PORT=3306

FROM mariadb:${MARIADB_VERSION}

LABEL Sysdomotic <sysdomotic@gmail.com>

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld", "--user=mysql", "--lower_case_table_names=1"]

EXPOSE ${MARIADB_PORT}