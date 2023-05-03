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

# You need to SSH into node1 and `docker swarm join-token worker` to get join-token
docker swarm join --token SWMTKN-1-6dbfr7xkfz4gsujt3felop0k3cg4l4hwhejmio82109p3t8u0x-8wq2n8w4dkpzx84tl8wvjm3no 10.114.0.2:2377
