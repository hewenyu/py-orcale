FROM oraclelinux:7-slim
LABEL maintainer="hewenyu"

RUN set -eux && \
    yum -y install oracle-release-el7 && yum-config-manager --enable ol7_oracle_instantclient && \
    yum -y install oracle-instantclient18.3-basic oracle-instantclient18.3-devel \
    oracle-instantclient18.3-jdbc oracle-instantclient18.3-sqlplus \
    wget vixie-cron crontabs