#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "usage: ${0} <database user> <database password> <PDB name>";
  exit -1;
fi

dbuser=${1}
dbpassword=${2}
pdb=${3}

#sqlplus system/Welcome1#@localhost:1521/PDB1 <<EOF
sqlplus ${dbuser}/${dbpassword}@${pdb} <<EOF
 create user medrec identified by medrec;
 grant DBA to medrec;
 exit;
EOF

#sqlplus medrec/medrec@localhost:1521/PDB1 <<EOF
sqlplus medrec/medrec@PDB1 <<EOF
 @Medrec.sql
 exit;
EOF
