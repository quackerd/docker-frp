#!/bin/sh
cd /opt/frp

if [ -z $SERVER ] ; then
	./frpc -c ./frpc.ini
else
	./frps -c ./frps.ini
fi

