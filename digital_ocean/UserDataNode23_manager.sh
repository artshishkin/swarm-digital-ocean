#!/bin/bash

ufw allow in on eth1 to any port 2377 proto tcp
ufw allow in on eth1 to any port 7946
ufw allow in on eth1 to any port 4789 proto udp

apt install docker.io -y
service docker start
#usermod -a -G docker ec2-user
chkconfig docker on

# You need to SSH into node1 and `docker swarm join-token worker` to get join-token
docker swarm join --token SWMTKN-1-1x0e1lvaz26etx32ey0441d5206dp700a5zsz87hshhjq9ts1w-0clv06m9cswvrsly7jhhfl3nv 10.114.0.2:2377
