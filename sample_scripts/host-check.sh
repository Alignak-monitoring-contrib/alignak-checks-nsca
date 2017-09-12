#!/bin/sh
set -e
host="passive-01"
svc="nsca_cpu"
return="My result is Ok"
output=0

nsca_host="demo.alignak.net"
nsca_bin="/usr/sbin/send_nsca"
nsca_cfg="/etc/send_nsca.cfg"

#send nsca
exitstatus=`/bin/echo -e "$host\t$return\t$output\n" |  $nsca_bin -H $nsca_host -c $nsca_cfg`
