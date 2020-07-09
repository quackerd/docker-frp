#!/bin/sh

if [ -z $SERVER ] ; then
	frpc -c frpc.ini
else
	frps -c frps.ini
fi

