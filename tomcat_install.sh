#!/bin/bash
#
# Tomcat Insall
#  - Code by Jioh L. Jung (ziozzang@gmail.com)
#

JDK_XMX=${JDK_XMX:-"1024m"}

# get install tomcat
sudo apt-get install -fy tomcat7 tomcat7-admin

#export JAVA_HOME=/usr....
#export PATH=$JAVA_HOME/bin:$PATH
#export CLASSPATH=$JAVA_HOME/bin:$CLASSPATH

if [[ -d "/usr/lib/jvm/java-8-oracle" ]]; then
  JAVA_HOME="/usr/lib/jvm/java-8-oracle"
else
  echo "JAVA_HOME dir path  error "
  exit
fi

if [[ -e "/etc/oracle_jdk" ]]; then
  JAVA_HOME=`cat /etc/oracle_jdk`
fi

  ############################error##############
sudo sh -c echo '<user name="admin" password="admin" roles="admin-gui.manager-gui"/>' >> /etc/tomcat7/tomcat-users.xml

#JAVA_OPTS="-Djava.awt.headless=true -Xms512m -Xmx1024m -XX:+UseConcMarkSweepGC"
sudo sed -i -e "s,\(JAVA_OPTS\)=.*,\1=\"-Djava.awt.headless=true Xms512m -Xmx${JDK_XMX} -XX:+UseConcMarkSweepGC\",g" \
  /etc/default/tomcat7

flags=`grep "#JAVA_HOME" /etc/default/tomcat7 | wc -l`
if [[ $flag -ne "0" ]]; then
  sudo sed -i -e "s,#\(JAVA_HOME\)=.*,\1=${JAVA_HOME},g" \
    /etc/default/tomcat7
else
  ############################error##############
  sudo echo "JAVA_HOME=${JAVA_HOME}" >> /etc/default/tomcat7
fi

sudo update-rc.d tomcat7 enable

# /home/mk/sis/src/bms/bms-master/target/watch-1.0.0-null.war ./watch.war
sudo cp /vagrant/dist/watch-1.0.0-null.war /var/lib/tomcat7/webapps/watch.war
sudo cp /vagrant/dist/watch_web.xml /var/lib/tomcat7/webapps/watch/WEB-INF/web.xml

sudo service tomcat7 restart
