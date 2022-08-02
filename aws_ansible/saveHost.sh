#!/bin/bash 

# dir="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
dir=aws_ansible


if [[ ! -f ${dir}/inventory ]]
then
    exit 1
fi

if grep -Fxq "$1" ${dir}/inventory
then
    echo "Host already exits" \
    && exit 1
else
    if [[ -z ${2} ]];
    then
        echo $1 >> ${dir}/inventory
    else
        echo $1 >> ${dir}/$2
    fi
fi