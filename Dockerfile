FROM alpine:latest

RUN wget https://download.oracle.com/otn_software/linux/instantclient/193000/instantclient-basic-linux.x64-19.3.0.0.0dbru.zip

RUN unzip instantclient-basic-linux.x64-19.3.0.0.0dbru.zip && cp -r instantclient_19_3/* /lib

ENV LD_LIBRARY_PATH=/lib

RUN apk add libaio

ADD script.sh /root/script.sh

RUN /root/script.sh
