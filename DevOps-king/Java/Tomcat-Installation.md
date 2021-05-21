__Install Tomcat On Linux/Unix Box & Configure with Jenkins__

__Step 1: Install Java__
    sudo apt-get update
    sudo apt-get install default-jdk

__Step 2: Install Tomcat__
    sudo apt install unzip wget
    cd /tmp
    wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.47/bin/apache-tomcat-8.5.47.zip
    unzip apache-tomcat-*.zip
    sudo mkdir -p /opt/tomcat
    sudo mv apache-tomcat-8.5.47 /opt/tomcat/

__Step 3: Change Tomcat Server Port__
Jenkins is running on Port 8080, and tomcat defalut port is also 8080. So we need to change the Tomcat port, I am changing it to 9090
Go to /opt/tomcat/apache-tomcat-8.5.47/conf/server.xml file
Search for Connector and change the Port Value, save the file.

__Step 4: Change Permission of Scripts in /bin__
    cd /opt/tomcat/apache-tomcat-8.5.47/bin
    ls -la
    sudo chmod +x *


__Step 5: Start tomcat server and accss via browser on port 9090__
    /opt/tomcat/apache-tomcat-8.5.47/bin/startup.sh

__Step 6: Configure Jenkins with Tomcat for Auto Deployment of Artifacts.__
Set Credentials of Tomcat that Jenkins use.
```cd /opt/tomcat/apache-tomcat-8.5.47/conf```
update tomcat-users.xml file.
roles : manager-script & admin-gui
Set password : tomcat

__Step 6 : Restart the tomcat server__
    /opt/tomcat/apache-tomcat-8.5.47/bin/shutdown.sh
    /opt/tomcat/apache-tomcat-8.5.47/bin/startup.sh