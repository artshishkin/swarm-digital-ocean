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
docker swarm join --token SWMTKN-1-4lob2op2pnfjsrnbrt3oqw4kjuwjezrgwnn64de000rk9wjw58-3o91kj7lufpb5ow5djzi6n801 10.114.0.3:2377
