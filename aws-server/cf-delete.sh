#!/bin/bash 
dir="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
echo "--- Started processing on $(date '+%Y-%m-%d %H:%M:%S') ---" >> ${dir}/logs/$2_delete.log
aws cloudformation delete-stack --stack-name $1 --profile $2 >> ${dir}/logs/$2_delete.log
echo "--- Finished processing on $(date '+%Y-%m-%d %H:%M:%S') --- \n " >> ${dir}/logs/$2_delete.log