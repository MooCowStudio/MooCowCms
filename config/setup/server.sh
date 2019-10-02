#!/bin/bash -ex

yum -y update

# timezone
timedatectl set-timezone Asia/Tokyo

yum -y install wget git ImageMagick ImageMagick-devel

yum install -y https://yum.postgresql.org/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm
yum install -y postgresql96-server postgresql96-contrib postgresql96-devel
/usr/pgsql-9.6/bin/postgresql96-setup initdb

systemctl start postgresql-9.6.service
systemctl enable postgresql-9.6.service

export PATH=/usr/pgsql-9.6/bin:$PATH
