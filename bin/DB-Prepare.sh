#!/bin/sh

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "usage: ${0} <db user> <db password> <ipaddress> [<sshkey> <pdb>]";
  exit -1;
fi

dbuser=${1}
dbpassword=${2}
ipaddress=${3}

if [ $# -eq 3 ]; then
  sshkey="/home/syanagih/.ssh/id_rsa"
  pdb="PDB1"
else
  sshkey="${4}"
  if [ $# -eq 5 ]; then
    pdb=${5}
  else
    pdb="PDB1"
  fi
fi


echo "${ipaddress}----------------------------------------------------------"
	
scp -o StrictHostKeyChecking=no -i ${sshkey} Medrec.sh Medrec.sql oracle@${ipaddress}:~
ssh -o StrictHostKeyChecking=no -i ${sshkey} oracle@${ipaddress} "sh Medrec.sh ${dbuser} ${dbpassword} ${pdb}"
