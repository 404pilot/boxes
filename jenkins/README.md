# Guide
```
jenkins_box $ docker exec -it as-jenkins /bin/bash

root_container $ su - jenkins
```

## Install maven & git

1. install `git plugin`
2. specify maven and git in `Configure System`
    * maven home: `/usr/share/maven`
    * maven bin: `/usr/bin/mvn`
    * git location: `/usr/bin/git`

## Install LDAP
in `Configure Global Security`

```
Server:
root DN:

User search filter:
```

Remember to add yourself into authorization, otherwise you can't log into jenkins after saving ldap information.

## Github Credential

```
# get ssh key
docker exec -it as-jenkins cat /home/jenkins/.ssh/id_rsa.pub
```
