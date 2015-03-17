#!/bin/bash
#

interval=${1}
time=${2}
repeat=time/interval
version=${3}

vmstat -n ${interval} ${repeat} | awk '{now=strftime("%Y-%m-%d %T "); print now $0}' > files/vmstat-${version}.out
