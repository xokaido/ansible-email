#!/bin/bash

setup_file='run.yml'
cwd=$( dirname $0 )
cat setup.yml > ${setup_file}
if [[ ! -z "$1" ]]
then
cat >> ${setup_file} << XOK

- name: Setting up the hosts
  hosts: all 
  remote_user: root

XOK

  echo -ne "  roles: \n" >> ${setup_file}
  for i in $*
  do
    echo -e "    - $i" >> ${setup_file}
  done

fi

ansible-playbook -i ${cwd}/hosts ${setup_file}
rm -v  ${setup_file}
