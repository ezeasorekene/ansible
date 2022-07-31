#!/bin/bash 
# filedir=$(readlink -f "${BASH_SOURCE}")
dir="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"

if [[ -z ${2} ]] || [[ -z ${3} ]];
then
    aws ec2 describe-instances \
        --query 'Reservations[*].Instances[*].PublicIpAddress' \
        --profile $1 \
        --output text >> ${dir}/inventory
else
    aws ec2 describe-instances \
        --query 'Reservations[*].Instances[*].PublicIpAddress' \
        --profile $1 \
        --filters "Name=tag:$2,Values=$3" \
        --output text >> ${dir}/inventory
fi