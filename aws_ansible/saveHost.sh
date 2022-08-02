#!/bin/bash 

dir="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"

if grep -Fxq "$1" inventory
then
    echo "Host already exits"
else
    if [[ -z ${2} ]];
    then
        echo $1 >> ${dir}/inventory
    else
        echo $1 >> ${dir}/$2
    fi
fi