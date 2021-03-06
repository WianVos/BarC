#!/bin/bash
. ./credentials.txt

PACKERBUILDLOG="../packer_build.log"
TERRAFORMBUILDLOG="../terraform_build.log"
#$PACKERCMD="packer build  -var aws_access_key=${AWS_ACCESS_KEY} -var ""aws_secret_key=${AWS_SECRET_KEY}"" ubuntu_tomcat.json"

#cd ./packer
#$PACKERCMD 2>&1 | tee ${PACKERBUILDLOG}
#$AMI=`tail -2 ${PACKERBUILDLOG} | head -2 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }'`

#echo "created $AMI"

#cd ../

cd ./terraform

AMI="ami-20e1cc48"

terraform destroy \
 -var "aws_ami=${AMI}" \
 -var "aws_access_key=${AWS_ACCESS_KEY}" \
 -var "aws_secret_key=${AWS_SECRET_KEY}" \
 2>&1 | tee ${TERRAFORMBUILDLOG}
