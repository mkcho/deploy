#!/bin/bash
#
# Install Heartbeat 

sudo apt-get update -fy
sudo apt-get upgrade -fy
sudo apt-get install -fy heartbeat

sudo echo '10.0.3.101 haproxy1' >> /etc/hosts
sudo echo '10.0.3.102 haproxy2' >> /etc/hosts

#Active vip
sudo echo 'haproxy1 10.0.3.100' > /etc/ha.d/haresources

#Create ha.cf
sudo cat > /etc/ha.d/ha.cf << EOF
keepalive 2
deadtime 10
baud 19200
ucast eth1 10.0.3.101
ucast eth1 10.0.3.101
logfacility local0
auto_failback on
node haproxy1
node haproxy2
EOF

sudo cat > /etc/ha.d/authkeys << EOF
auth 3
3 md5 "bms.kt.com-auth" 
EOF

sudo chmod 600 /etc/ha.d/authkeys
sudo service heartbeat restart
