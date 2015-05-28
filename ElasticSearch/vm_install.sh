#!/bin/bash

if [ $# -ne 1 ]
then
	echo "[Error] 1 parameters needed but only $# parameters found"
	echo "[Error]] $1 es download link"
	exit 1

fi

TAR_URI=${1}

echo "====================================================="
echo "                    Install Java                     "
echo "====================================================="
# sudo apt-get update > /dev/null \
# 	&& sudo apt-get autoclean \
# 	&& sudo apt-get install openjdk-7-jre -y > /dev/null

sudo apt-get install openjdk-7-jre -y > /dev/null

# echo "Java version: $(java -version)"
# echo $(java -version)

echo "====================================================="
echo "                Install Elastic Search               "
echo "====================================================="

echo "Download elastic search from ${TAR_URI}"

wget -q -O /tmp/elasticsearch.tar.gz ${TAR_URI} \
	&& tar -zx -f /tmp/elasticsearch.tar.gz -C ~/ \
	&& ES_FOLDER=$(ls ~ | grep elasticsearch) \
	&& echo "alias estart='~/${ES_FOLDER}/bin/elasticsearch -d'" >> ~/.bashrc

source ~/.bashrc

echo "====================================================="
echo "                Install Plugins for ES               "
echo "====================================================="

${ES_FOLDER}/bin/plugin -s -install royrusso/elasticsearch-HQ
${ES_FOLDER}/bin/plugin -s -i elasticsearch/marvel/latest

echo "====================================================="
echo "                Running Elastic Search               "
echo "====================================================="

${ES_FOLDER}/bin/elasticsearch -d

sleep 10s

\curl 'http://localhost:9200/?pretty'