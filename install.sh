#!/bin/bash
#determine OS

uname -a |grep -i linux

if [ $? -ne 0 ]; then 
	OS="osx"
else
	OS="linux"
fi

# setup rereq dir
if [ ! -d ./prereq ]; then 
	mkdir ./prereq
	mkdir ./prereq/terraform
	mkdir ./prereq/packer
else
	rm -rf ./prereq/*
	mkdir ./prereq/terraform
	mkdir ./prereq/packer
fi

#setup urls 
GATLINGURL="https://oss.sonatype.org/content/repositories/snapshots/io/gatling/highcharts/gatling-charts-highcharts-bundle/2.2.0-SNAPSHOT/gatling-charts-highcharts-bundle-2.2.0-20150317.093647-1-bundle.zip "

if [[ $OS == "osx" ]] ; then
	TERRAFORMURL="https://dl.bintray.com/mitchellh/terraform/terraform_0.3.7_darwin_amd64.zip"
	PACKERURL="https://dl.bintray.com/mitchellh/packer/packer_0.7.5_darwin_amd64.zip"
else 
	TERRAFORMURL="https://dl.bintray.com/mitchellh/terraform/terraform_0.3.7_linux_amd64.zip"
	PACKERURL="https://dl.bintray.com/mitchellh/packer/packer_0.7.5_linux_amd64.zip"
fi

cd ./prereq
#install terraform 
echo "installing terraform"

curl -L ${TERRAFORMURL} |tar -xf- -C ./terraform

#install packer
echo "installing packer"
curl -L ${PACKERURL} | tar -xf- -C ./packer

#install gatling
echo "installing gatling"

if [ ! -d "./gatling" ];then
	curl "${GATLINGURL}" | tar -xf- -C ./
	mv gatling-charts-highcharts-bundle-* gatling
fi

cd ../

# write profile file
echo "writing profile_additions to file"

cat <<EOF > profile_addition.sh
#!/bin/bash
export PATH=${PWD}/prereq/terraform:${PWD}/prereq/packer:${PWD}/prereq/gatling/bin:${PATH}
EOF

chmod +x ./profile_addition.sh
