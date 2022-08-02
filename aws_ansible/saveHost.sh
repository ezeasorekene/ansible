#!/bin/bash 

# dir="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
# dir=aws_ansible
dir=~
file=inventory.txt


if [[ ! -f ${dir}/${file} ]]
then
    exit 1
fi

if grep -Fxq "$1" ${dir}/${file}
then
    echo "Host already exits" \
    && exit 1
else
    if [[ -z ${2} ]];
    then
        echo $1 >> ${dir}/${file} \
        cat ${dir}/${file}
    else
        echo $1 >> ${dir}/$2 \
        && cat ${dir}/$2
    fi
fi