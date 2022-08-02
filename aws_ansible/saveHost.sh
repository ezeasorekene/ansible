#!/bin/bash 

dir="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"

if grep -Fxq "$1" inventory
then
    echo "Host already exits"
    exit(1)
else
    if [[ -z ${2} ]];
    then
        echo $1 >> aws_ansible/inventory
    else
        echo $1 >> aws_ansible/$2
    fi
fi