#! /bin/bash

apt-get update
sudo apt-get install postgresql --yes

# geodb, test1 and test1 pass can be changed but be careful
source /home/vagrant/creds/credentials.sh

# creating a user for db to connect to
sudo -u postgres psql <<EOF
CREATE DATABASE "$DB_NAME";
CREATE USER "$DB_USER" WITH ENCRYPTED PASSWORD '$DB_PASS';
GRANT ALL PRIVILEGES ON DATABASE "$DB_NAME" TO "$DB_USER";
EOF
printf "Database '$DB_NAME' and user '$DB_USER' have been created and configured."

# adding necessary changes to db config files to allow connections
sudo sed -i 's/#listen_addresses = 'localhost'/listen_addresses = '*'/g' \
 "/etc/postgresql/14/main/postgresql.conf"
printf "host    all    all    $MAIN_IP    md5" >> "/etc/postgresql/14/main/pg_hba.conf"

# restarting db process and removing creds from system
sudo systemctl restart postgresql
rm /home/vagrant/creds/credentials.sh