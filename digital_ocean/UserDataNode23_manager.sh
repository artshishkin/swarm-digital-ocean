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
docker swarm join --token SWMTKN-1-2xta074ay4076wkwsmu727ff8lhbyigp09p0hey0nhxz7tssx4-3qvec8efp3bgeo1causz4uk9g 10.114.0.2:2377
