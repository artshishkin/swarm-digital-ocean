#!/bin/bash

ufw allow in on eth1 to any port 2377 proto tcp
ufw allow in on eth1 to any port 7946
ufw allow in on eth1 to any port 4789 proto udp

apt install docker.io -y
service docker start
#usermod -a -G docker ec2-user
chkconfig docker on


docker swarm init --advertise-addr eth1:2377

docker service create \
--name portainer \
--publish 9000:9000 \
--constraint 'node.role == manager' \
--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
portainer/portainer \
-H unix:///var/run/docker.sock