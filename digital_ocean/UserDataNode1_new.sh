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


docker swarm init --advertise-addr eth1:2377

curl -L https://downloads.portainer.io/portainer-agent-stack.yml \
    -o portainer-agent-stack.yml

docker stack deploy -c portainer-agent-stack.yml portainer

##Old portainer service
#docker service create \
#--name portainer \
#--publish 9000:9000 \
#--constraint 'node.role == manager' \
#--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
#portainer/portainer-ce \
#-H unix:///var/run/docker.sock