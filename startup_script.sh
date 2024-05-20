#!/bin/bash

# sudo apt update
# sudo apt-get install postgresql-client --yes
# # install Maven & jdk8

# sudo apt-get install openjdk-8-jdk -y
# wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
# tar xzvf apache-maven-3.9.6-bin.tar.gz
# sudo rm -rf apache-maven-3.9.6-bin.tar.gz
# sudo mv apache-maven-3.9.6 /opt/

# cat <<EOF >> ~/.bashrc

# # Maven environment variables

# export M2_HOME=/opt/apache-maven-3.9.6
# export PATH=\${M2_HOME}/bin:\${PATH}
# EOF

# source ~/.bashrc

# # Install Node 16

# curl -s https://deb.nodesource.com/setup_14.x | sudo bash
# sudo apt install nodejs -y

# # TomCat install

# sudo mkdir /opt/tomcat/
# sudo groupadd tomcat
# sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

# curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz
# sudo tar xzvf apache-tomcat-9.0.89.tar.gz -C /opt/tomcat/ --strip-component=1
# rm -rf apache-tomcat-9.0.89.tar.gz

# sudo chown -RH tomcat: /opt/tomcat/
# sudo sh -c 'chmod +x /opt/tomcat/bin/*.sh'

# sudo tee /etc/systemd/system/tomcat.service > /dev/null <<EOF
# [Unit]
# Description=Apache Tomcat
# After=network.target

# [Service]
# Type=forking
# User=tomcat
# Group=tomcat
# Environment="JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64"
# Environment="JAVA_OPTS=-Djava.security.egd=file:///dev/urandom -Djava.awt.headless=true"
# Environment="CATALINA_BASE=/opt/tomcat"
# Environment="CATALINA_HOME=/opt/tomcat"
# Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
# Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
# ExecStart=/opt/tomcat/bin/startup.sh
# ExecStop=/opt/tomcat/bin/shutdown.sh

# [Install]
# WantedBy=multi-user.target
# EOF

# sudo systemctl daemon-reload
# sudo systemctl start tomcat


#####################################

# git clone --branch ther-40-create-vagrant https://github.com/devops-cisco2024/geocity.git
cd /home/vagrant/geocity
source /home/vagrant/creds/credentials.sh

# editing application.properties file to adjust it to creds
APP_PATH=./src/main/resources/application.properties
sudo sed -i "s|jdbc:postgresql://localhost:5432/ss_demo_1|jdbc:postgresql://$DB_IP:5432/$DB_NAME|" $APP_PATH
sudo sed -i "s|db.username=postgres|db.username=$DB_USER|" $APP_PATH
sudo sed -i "s|db.password=postgres|db.password=$DB_PASS|" $APP_PATH
sudo sed -i "s|jdbc:postgresql://35.204.28.238:5432/ss_demo_1|jdbc:postgresql://$DB_IP:5432/$DB_NAME|" $APP_PATH
sudo sed -i "s|username=postgres|username=$DB_USER|" $APP_PATH
sudo sed -i "s|password=postgres|password=$DB_PASS|" $APP_PATH


# Back-end
# mvn clean install
# sudo mv target/citizen.war /opt/tomcat/webapps/

# sudo systemctl restart tomcat

# # Front-end
# cd ~/geocity/front-end

# npm install
# npm run dev