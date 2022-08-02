#!/bin/bash 
# filedir=$(readlink -f "${BASH_SOURCE}")
dir="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"

# Fetch the host name and send to the saveHost.sh file
# The saveHost.sh file will check if the host already exists
if [[ -z ${2} ]] || [[ -z ${3} ]];
then
    aws ec2 describe-instances \
        --query 'Reservations[*].Instances[*].PublicIpAddress' \
        --output text | xargs ./aws_ansible/saveHost.sh
        # --profile $1 \
else
    aws ec2 describe-instances \
        --query 'Reservations[*].Instances[*].PublicIpAddress' \
        --filters "Name=tag:$2,Values=$3" \
        --output text | xargs ./aws_ansible/saveHost.sh
        # --profile $1 \
fi

# if [[ -z ${2} ]] || [[ -z ${3} ]];
# then
#     aws ec2 describe-instances \
#         --query 'Reservations[*].Instances[*].PublicIpAddress' \
#         --profile $1 \
#         --output text >> ${dir}/inventory.tmp
# else
#     aws ec2 describe-instances \
#         --query 'Reservations[*].Instances[*].PublicIpAddress' \
#         --profile $1 \
#         --filters "Name=tag:$2,Values=$3" \
#         --output text >> ${dir}/inventory.tmp
# fi
