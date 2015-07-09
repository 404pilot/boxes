#!/bin/bash
set -e

echo "##################################"
echo "Build auditservice/jenkins image"
echo "##################################"
docker build -t auditservice/jenkins .


echo "##################################"
echo "extract out initial configuration (Only run once at the very beginning)"
echo "##################################"

docker run -d --name jenkins_temp auditservice/jenkins
sleep 10s
docker cp jenkins_temp:/var/jenkins_home .
# "$PWD"
docker rm -f jenkins_temp


echo "##################################"
echo "Run jenkins"
echo "##################################"

docker rm -f as-jenkins

docker run -d --name as-jenkins \
	-p 8080:8080 -p 50000:50000 \
	-v "$PWD/jenkins_home":/var/jenkins_home \
	auditservice/jenkins
