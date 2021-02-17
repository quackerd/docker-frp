#!/bin/sh
cd /opt/frp

if [ -z $SERVER ] ; then
	exec ./frpc -c ./frpc.ini
else
	exec ./frps -c ./frps.ini
fi

