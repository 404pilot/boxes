#!/bin/bash
if [[ $# != 3 ]]; then
	echo "[Error] there are 2 parameters needed but there are only $# parameters"
	echo "[Error] $1 cassandra download link, $2 config folder"
	exit 1
fi

CASSANDRA_DOWNLOAD_URL=${1}
CONFIG_FOLER=${2}

echo "parameters: ${1}, ${2}, ${3}"

echo "====================================================="
echo "                  Install Java"
echo "====================================================="

sudo apt-get -q=2 update && sudo apt-get -q=2 install openjdk-7-jre -y
echo "java version:"
echo $(java -version)

echo "====================================================="
echo "                  Install Cassandra"
echo "====================================================="

wget -q -O /tmp/cassandra.tar.gz ${CASSANDRA_DOWNLOAD_URL} \
	&& sudo tar -zx -f /tmp/cassandra.tar.gz -C /opt/ \
	&& CASSANDRA_FOLDER=$(ls /opt | grep cassandra) \
	&& echo export CASSANDRA_HOME="/opt/${CASSANDRA_FOLDER}" >> /etc/profile \
	&& echo export PATH='$PATH:${CASSANDRA_HOME}/bin' >> /etc/profile \
	&& source /etc/profile


# modify configuration
rm -rf /vagrant/.data
mkdir -p /vagrant/.data
mkdir -p /opt/${CASSANDRA_FOLDER}/data/data
mkdir -p /opt/${CASSANDRA_FOLDER}/data/commitlog
mkdir -p /opt/${CASSANDRA_FOLDER}/data/saved_caches
chmod 777 /opt/${CASSANDRA_FOLDER}/data/data
chmod 777 /opt/${CASSANDRA_FOLDER}/data/commitlog
chmod 777 /opt/${CASSANDRA_FOLDER}/data/saved_caches

cp /vagrant/config/${CONFIG_FOLER}/logback.xml /opt/${CASSANDRA_FOLDER}/conf/
cp /vagrant/config/${CONFIG_FOLER}/cassandra.yaml /opt/${CASSANDRA_FOLDER}/conf/

echo "~~~~~~~ Cassandra Version"
echo $(cassandra -v)
echo "~~~~~~~ Cqlsh Version:"
echo $(cqlsh --v)