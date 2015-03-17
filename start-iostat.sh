#!/bin/bash
#

interval=${1}
time=${2}
repeat=time/repeat
version=${3}

iostat -c ${interval} ${repeat} | awk '{now=strftime("%Y-%m-%d %T "); print now $0}' > files/iostat-${version}.out
