#!/bin/bash
. ./credentials.txt

#setup the environment

if [ ! -f ./profile_addition.sh ]; then
	./install.sh
	./profile_addition.sh
else
	./profile_addition.sh
fi	
# the Packer part
PACKERBUILDLOG="../packer_build.log"
TERRAFORMBUILDLOG="../terraform_build.log"
CURLLOG="./curl.log"
TMPDIR="tmp"

echo $1
if [[ $1 == ami-* ]] ; then
	echo "Found AMI"
	AMI=$1
	echo $AMI
else 
	echo "Running Packer"
	cd ./packer
	

	PACKERCMD="packer build  -var aws_access_key=${AWS_ACCESS_KEY} -var ""aws_secret_key=${AWS_SECRET_KEY}"" ubuntu_tomcat.json"
	$PACKERCMD 2>&1 | tee ${PACKERBUILDLOG}
	AMI=`tail -2 ${PACKERBUILDLOG} | head -2 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }'`

	echo "created $AMI"

	# Terraform piece
	cd ../
fi

cd ./terraform

TERRAFORMCMD="terraform apply \
 -no-color \
 -var ""aws_ami=${AMI}"" \
 -var ""aws_access_key=${AWS_ACCESS_KEY}"" \
 -var ""aws_secret_key=${AWS_SECRET_KEY}"" "
 
$TERRAFORMCMD 2>&1 | tee ${TERRAFORMBUILDLOG}

TOMCAT_HOST=`tail -1 ${TERRAFORMBUILDLOG} |awk '{print $3}'|tr -d '\n'`
echo "tomcat host:${TOMCAT_HOST}"
# download jspwiki from the apache site into a temporary directory
cd ../
#clean or create temporary directory
if [ ! -d $TMPDIR ]; then 
	mkdir ${TMPDIR}  
else
	rm -rf ${TMPDIR}/*
fi

#sleeping for 3 minutes

echo $PWD
#download a recent version of JSPWiki. The best wiki in the free world.
CURLDOWNLOADCMD="/usr/bin/curl -o ${TMPDIR}/jspwiki.war http://apache.claz.org/jspwiki/2.10.1/binaries/JSPWiki.war "

CURLUPLOADCMD="/usr/bin/curl -g -T ${TMPDIR}/jspwiki.war ""http://allaccess:supersecret@${TOMCAT_HOST}:8080/manager/text/deploy?path=/JSPWiki&update=true"""

if [[ ! -f "${TMPDIR}/jspwiki.war" ]]; then
	$CURLDOWNLOADCMD 2>&1 |tee ${CURLLOG}
fi

HTTP_STATUS="000"

while [[ $HTTP_STATUS != "200" ]] 
	do
		HTTP_STATUS=$(curl -w "%{http_code}" -o >(cat > "${CURLLOG}") "http://allaccess:supersecret@${TOMCAT_HOST}:8080/manager/html")
		echo $HTTP_STATUS
		sleep 10
	done

$CURLUPLOADCMD 2>&1 | tee ${CURLLOG}


#gatling stuff

#install gatling first 

#if [ ! -d "./gatling-bundle" ]
#	then
#	curl https://oss.sonatype.org/content/repositories/snapshots/io/gatling/highcharts/gatling-charts-highcharts-bundle/2.2.0-SNAPSHOT/gatling-charts-highcharts-bundle-2.2.0-20150317.093647-1-bundle.zip | tar -xf- -C ./
#	mv gatling-charts-highcharts-bundle-2.2.0-SNAPSHOT gatling-bundle
#fi

cd ./gatling

export JAVA_OPTS="-Duri=http://allaccess:supersecret@${TOMCAT_HOST}:8080/JSPWiki/ -Dbaseurl=http://allaccess:supersecret@${TOMCAT_HOST}:8080/"

gatling.sh -sf ./user-files/simulations/ --simulation barc1.RecordedSimulation -rf ./output/
