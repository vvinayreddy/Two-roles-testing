MariaDB-Server
========

Playbook to install and configure MariaDB-Server on Redhat/Centos,Ubuntu

Requirement
-----------

Redhat/Centos,Ubuntu

Playbook Example
---------------

```

hosts: all
roles:
  - mariadb

```

Role Variables
--------------
mariadb/vars/main.yml

```

# Files to Install on redhat.yml

# Download source for Installing the RPM file for MariaDB-Server
mariadbserverrpmfile: http://downloads.mariadb.com/MariaDB/mariadb-10.1.21/yum/rhel/mariadb-10.1.21-rhel-7-x86_64-rpms.tar

# Destination var for downloading the file
destination-file: /opt/

#RPM-Key-File
rpmkey: https://yum.mariadb.org/RPM-GPG-KEY-MariaDB

-----------
# Files to Install on ubuntu.yml

#Repo add
xenialrepo: repo='deb [arch=amd64,i386,ppc64el] http://ftp.osuosl.org/pub/mariadb/repo/10.1/ubuntu xenial main'

#key file for repo ubuntu
keyfile: keyserver=keyserver.ubuntu.com id=0xF1656F24C74CD1D8

```
Dependencies
------------
 NONE
 
 
Author
-----
Mantri Goutam @gautam.mantri@gmail.com


