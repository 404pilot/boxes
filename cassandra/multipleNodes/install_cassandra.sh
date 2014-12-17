#!/bin/bash
if [[ $# != 3 ]]; then
	echo "[Error] there are 6 parameters needed but there are only $#"
	echo "[Error] $1 cassandra download link, $2 cassandra cluster name, $3 ip"
	exit 1
fi

CASSANDRA_DOWNLOAD_URL=${1}
CLUSTER_NAME=${2}
IP=${3}

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
# mkdir -p /vagrant/.data/data
# mkdir -p /vagrant/.data/commitlog
# mkdir -p /vagrant/.data/saved_caches
mkdir -p /opt/${CASSANDRA_FOLDER}/data/data
mkdir -p /opt/${CASSANDRA_FOLDER}/data/commitlog
mkdir -p /opt/${CASSANDRA_FOLDER}/data/saved_caches
chmod 777 /opt/${CASSANDRA_FOLDER}/data/data
chmod 777 /opt/${CASSANDRA_FOLDER}/data/commitlog
chmod 777 /opt/${CASSANDRA_FOLDER}/data/saved_caches

cp /vagrant/config/${CLUSTER_NAME}/logback.xml /opt/${CASSANDRA_FOLDER}/conf/
cp /vagrant/config/${CLUSTER_NAME}/cassandra.yaml /opt/${CASSANDRA_FOLDER}/conf/

# LOG_FILE_PLACEHOLDER = '<file>mamashuozhanweifuyaochang</file>';
# LOG_FILE = "/vagrant/.data/system_${CLUSTER_NAME}.log"

# LOG_FILE_ROLLFILE_PLACEHOLDER = '<fileNamePattern>mamashuozhanweifuyaochang</fileNamePattern>'
# LOG_FILE_ROLLFILE = "<fileNamePattern>/vagrant/.data/system_${CLUSTER_NAME}.log.%i.zip</fileNamePattern>"

# sed -i.origin "s/${LOG_FILE_PLACEHOLDER}/${LOG_FILE}/" /opt/${CASSANDRA_FOLDER}/conf/logback.xml
# sed -i.origin "s/${LOG_FILE_ROLLFILE_PLACEHOLDER}/${LOG_FILE_ROLLFILE}/" /opt/${CASSANDRA_FOLDER}/conf/logback.xml

#sed -i 's/<\/databaseChangeLog>/ /g' ${LIQUIBASE_CHANGELOG}
# replace ip

echo "~~~~~~~ Cassandra Version"
echo $(cassandra -v)
echo "~~~~~~~ Cqlsh Version:"
echo $(cqlsh --v)