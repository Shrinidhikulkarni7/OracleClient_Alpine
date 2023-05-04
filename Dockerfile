FROM alpine:latest

RUN apk --no-cache add libaio libc6-compat gcompat && \
    cd /tmp && \
    wget -qO instantclient-basiclite.zip https://download.oracle.com/otn_software/linux/instantclient/instantclient-basiclite-linuxx64.zip && \
    wget -qO instantclient-odbc.zip https://download.oracle.com/otn_software/linux/instantclient/instantclient-odbc-linuxx64.zip && \
    unzip -q instantclient-basiclite.zip && \
    unzip -q instantclient-odbc.zip && \
    mv instantclient*/ /usr/lib/instantclient && \
    rm instantclient-basiclite.zip instantclient-odbc.zip && \
    ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 && \
    /usr/lib/instantclient/odbc_update_ini.sh / /usr/lib/instantclient
# TODO: libresolv fixed by gcompat in Alpine 3.18

ENV LD_LIBRARY_PATH /usr/lib/instantclient
