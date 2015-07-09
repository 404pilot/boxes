FROM jenkins:1.609.1
# https://github.com/jenkinsci/docker
USER root

# install maven
ENV MAVEN_VERSION="3.3.3" \
    MAVEN_HOME="/usr/share/maven"

RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
    && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven

# install git :  /usr/bin/git
RUN apt-get update \
    && apt-get install software-properties-common -y \
    && add-apt-repository ppa:git-core/ppa -y \
    && apt-get install git -y \
    && rm -rf /var/lib/apt/lists/*

# change jenkins home directory
RUN mkdir /home/jenkins \
    && chown -R jenkins /home/jenkins \
    && usermod -d /home/jenkins jenkins

USER jenkins

# git config
RUN git config --global user.name "auditservice-jenkins" \
    ; git config --global user.email "auditservice-jenkins@users.noreply.github.rackspace.com"

# generate ssh key
RUN ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
