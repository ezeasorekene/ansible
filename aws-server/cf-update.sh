#!/bin/bash 
dir="$(dirname -- "$(readlink -f "${BASH_SOURCE}")")"
echo "--- Started processing on $(date '+%Y-%m-%d %H:%M:%S') ---" >> ${dir}/logs/$4_create.log
aws cloudformation update-stack --stack-name $1 --template-body file://$2  --parameters file://$3 --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-east-1 --profile $4 >> ${dir}/logs/$4_update.log
echo "--- Finished processing on $(date '+%Y-%m-%d %H:%M:%S') --- \n " >> ${dir}/logs/$4_fetch.log
