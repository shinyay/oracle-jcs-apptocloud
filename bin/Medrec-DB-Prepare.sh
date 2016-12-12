#!/bin/sh

if [ -z "$1" ]; then
  echo "usage: ${0} <ipaddress>";
  exit -1;
fi

./DB-Prepare.sh system Welcome1# $1
