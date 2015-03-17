#!/bin/bash
#

host=${1}
lxc=${2}
version=${3}

scp root@${host}:/var/lib/lxc/lxc${lxc}/rootfs/root/iperf3.json files/iperf3-${version}.json
awk -f scripts/vmstat.awk files/vmstat-${version}.out > files/vmstat-${version}.txt
