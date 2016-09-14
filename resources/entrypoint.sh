#!/bin/bash
#set -e

MODULE="sysdig_probe"
SYSDIG_HOST_ROOT=/host

if lsmod | grep "$MODULE" &> /dev/null ; then
  echo "Module $MODULE is loaded!"
else
  echo "Module $MODULE is not loaded!, loading"
  insmod /export/sysdig-probe.ko
fi

exec "/export/$@"
