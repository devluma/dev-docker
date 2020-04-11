ARG MARIADB_VERSION=10.4

FROM mariadb:${MARIADB_VERSION}

LABEL Sysdomotic <sysdomotic@gmail.com>

CMD ["mysqld", "--user=mysql", "--lower_case_table_names=1"]

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306