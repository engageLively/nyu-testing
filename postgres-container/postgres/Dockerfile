FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gnupg2 \
    ca-certificates \
    wget

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && \
    wget --no-check-certificate -qO - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get install -y --no-install-recommends \
    postgresql-14 postgresql-contrib-14

RUN mkdir -p /var/lib/postgresql/data && \
    chown -R postgres:postgres /var/lib/postgresql

USER postgres
ENV PGDATA /var/lib/postgresql/data
ENV PATH="/usr/lib/postgresql/14/bin:${PATH}"

COPY ./data/setup_db.sql /docker-entrypoint-initdb.d/
COPY ./data/lines.csv /docker-entrypoint-initdb.d/

CMD ["/usr/lib/postgresql/14/bin/postgres", "-D", "/var/lib/postgresql/data"]
