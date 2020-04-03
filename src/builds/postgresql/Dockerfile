FROM postgres:11.5

LABEL Sysdomotic <sysdomotic@gmail.com>

#-----------------------------------------------------------------------------------------------#
# Ajusta a configuração do PostgreSQL para ser possível fazer conexão remota ao banco de dados. #
#-----------------------------------------------------------------------------------------------#
RUN echo "host all  all  0.0.0.0/0  md5" >> /var/lib/postgresql/data/pg_hba.conf

# this 777 will be replaced by 700 at runtime (allows semi-arbitrary "--user" values)
RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA";

CMD ["postgres"]

EXPOSE 5432