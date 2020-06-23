#!/bin/sh

cd /lib
ln -s /lib64/* /lib
ln -s libnsl.so.2 /usr/lib/libnsl.so.1
ln -s libc.so /usr/lib/libresolv.so.2
