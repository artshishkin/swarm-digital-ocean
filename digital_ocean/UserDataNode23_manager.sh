#!/bin/bash

ufw allow in on eth1 to any port 2377 proto tcp
ufw allow in on eth1 to any port 7946
ufw allow in on eth1 to any port 4789 proto udp

apt-get update
apt-get upgrade -y

apt install docker.io -y
service docker start
#usermod -a -G docker ec2-user
chkconfig docker on

# You need to SSH into node1 and `docker swarm join-token manager` to get join-token
docker swarm join --token SWMTKN-1-0v5ew1zhpl0hbr5m3ery5dy0qpiwm7fgzq6etnbz9i13h2hfcn-4rwbfezn631047el0adjycwv0 10.106.0.2:2377
