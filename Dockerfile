FROM oraclelinux:7-slim
LABEL maintainer="hewenyu"

WORKDIR /etc/zabbix/

COPY Python-3.5.4.tar.xz .

RUN set -eux && \
    yum -y install oracle-release-el7 && yum-config-manager --enable ol7_oracle_instantclient && \
    yum -y install oracle-instantclient18.3-basic oracle-instantclient18.3-devel \
    oracle-instantclient18.3-jdbc oracle-instantclient18.3-sqlplus \
    wget readline readline-devel readline-static penssl openssl-devel \
    vixie-cron crontabs  openssl-static  bzip2-devel bzip2-libs wget gcc make \
    xz tar crudini autoconf automake libcurl-devel openldap-devel git && \
    xz -d Python-3.5.4.tar.xz && tar xvf Python-3.5.4.tar && \
    mkdir -p /var/lib/python35 && cd Python-3.5.4 && \
    ./configure --prefix=/var/lib/python35 --enable-shared && \
    make && make install && \
    sh -c "echo /var/lib/python35/lib > /etc/ld.so.conf.d/py35.conf" && ldconfig