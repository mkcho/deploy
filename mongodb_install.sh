#1. mongodb 10gen Repository 
sudo sh -c 'echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" \
> /etc/apt/sources.list'

#2. gpg key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

sudo apt-get update
sudo apt-get install mongodb-10gen

#--> 1, 2¸¦ sudo apt-get install -fy mongodb

#3. mongodb install

#4. config modify
#sudo vi /etc/mongodb.conf
#port = 27027
## Flag for a simple RESDT interface
#rest = true

#5. mongodb replica setup
#cfg = {
#"_id" : "bms",
#"members" : [
#{ "_id" : 0, "host" : "10.0.3.211" },
#{ "_id" : 1, "host" : "10.0.3.212" }
#]
#}
#rs.initiate(cfg)

