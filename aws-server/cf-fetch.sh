#!/bin/bash 
dir="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
echo "--- Started processing on $(date '+%Y-%m-%d %H:%M:%S') ---" >> ${dir}/logs/$1_fetch.log
aws cloudformation describe-stacks --profile $1 >> ${dir}/logs/$1_fetch.log
echo "--- Finished processing on $(date '+%Y-%m-%d %H:%M:%S') --- \n " >> ${dir}/logs/$1_fetch.log