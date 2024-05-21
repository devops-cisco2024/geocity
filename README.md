<<<<<<< HEAD
# ch-058, geocitizen

1. Download the vagrant file, startup_script.sh, db_server_script.sh and credentials example.sh files from repository
2. Rename the credentials exmaple.sh file to credentials.sh and fill it with your credentials for DB
3. deploy the servers with vagrant up command
4. after the deployment:

5. In config file [`~/Ch-058/src/main/resources/application.properties`](https://git.io/vA4Sw)
	you need to edit properties:
	 * [`db.username`](https://git.io/vARyo) & [`db.password`](https://git.io/vARyK) - db credentials, same as in credentials.sh file
  Also edit the liquidbase credentials and SMTP server credentials

  Build the backend and frontend with commands:
mvn clean install
sudo mv target/citizen.war /opt/tomcat/webapps/
sudo systemctl restart tomcat 

if you want to rebuild the backend, clear the webapps directory and build again.


Some necessary information for frontend part and app functionality:
[swagger](http://[input your IP]/citizen/swagger-ui.html)

[heroku](https://geocitizen.herokuapp.com)  
  

=======
# Geocitizen
>>>>>>> a3175f1c0fdab76be1cea3be0ec00b86a68e345b
