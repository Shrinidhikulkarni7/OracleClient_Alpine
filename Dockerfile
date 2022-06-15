FROM alpine:latest

ENV LD_LIBRARY_PATH=/lib

RUN wget https://download.oracle.com/otn_software/linux/instantclient/216000/instantclient-basiclite-linux.x64-21.6.0.0.0dbru.zip && \
    unzip instantclient-basiclite-linux.x64-21.6.0.0.0dbru.zip && \
    cp -r instantclient_21_6/* /lib && \
    rm -rf instantclient-basiclite-linux.x64-21.6.0.0.0dbru.zip && \
    apk add libaio && \
    apk add libaio libnsl libc6-compat && \
    cd /lib && \
    # Linking ld-linux-x86-64.so.2 to the lib/ location (Update accordingly)
    ln -s /lib64/* /lib && \
    ln -s libnsl.so.2 /usr/lib/libnsl.so.1 && \
    ln -s libc.so /usr/lib/libresolv.so.2
