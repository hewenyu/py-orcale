FROM oraclelinux:7-slim
LABEL maintainer="hewenyu"

RUN set -eux && \
    yum -y install oracle-release-el7 && yum-config-manager --enable ol7_oracle_instantclient && \
    yum -y install oracle-instantclient${release}.${update}-basic oracle-instantclient${release}.${update}-devel oracle-instantclient${release}.${update}-sqlplus crudini wget vixie-cron crontabs