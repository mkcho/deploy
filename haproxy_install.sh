#!/bin/bash
#
# haproxy Insall

sudo apt-get install -fy haproxy

# Set Enabled.
sudo sed -i -e "s,\(ENABLED\)=.*,\1=1,g" /etc/default/haproxy

sudo cat > /etc/haproxy/haproxy.cfg << EOF
global
        log 127.0.0.1   local0
        log 127.0.0.1   local1 notice
        #log loghost    local0 info
        maxconn 4096
        #chroot /usr/share/haproxy
        user haproxy
        group haproxy
        daemon
        stats socket /var/run/haproxy.sock mode 0600 level admin

# MGMT Port (for test)
listen stats 0.0.0.0:80
        #Listen on all IP's on port 80
        mode http
        balance
        timeout client 5000
        timeout connect 4000
        timeout server 30000

        #This is the virtual URL to access the stats page
        stats uri /haproxy_stats        

        #Authentication realm. This can be set to anything. Escape space characters with a backslash.
        stats realm HAProxy\ Statistics 

	# Insert Backend Web-Server List
        server web1 10.0.3.201:8080 maxconn 5000 check inter 500ms
        server web2 10.0.3.202:8080 maxconn 5000 check inter 500ms

EOF

sudo update-rc.d haproxy enable
sudo service haproxy restart

