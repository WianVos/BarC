#!/bin/bash

HTTP_STATUS="000"
while [ $HTTP_STATUS != "200" ] 
	do
		HTTP_STATUS=$(curl -w "%{http_code}" -o >(cat >&3) "http://allaccess:supersecret@ec2-54-211-219-230.compute-1.amazonaws.com:8080/manager/text")
		echo $HTTP_STATUS
		sleep 10
	done
