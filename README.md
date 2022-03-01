# swarm-digital-ocean
Ukraine is under fire. Need help

[Digital Ocean](https://cloud.digitalocean.com/projects)

1. Provision Docker Droplet Node 1 with UserData from [UserDataNode1.sh](digital_ocean/UserDataNode1.sh)
2. Get join-token for managers
    -  SSH to node1
        -  `ssh -i ~\.ssh\digital_ocean root@134.122.71.93`
    -  get join-token
        -  `docker swarm join-token worker` -> save it
        -  **OR** manager
        -  `docker swarm join-token manager` -> save it
3. Provision 2 another nodes Docker Droplet with UserData from [UserDataNode23_manager.sh](digital_ocean/UserDataNode23_manager.sh)
    - replace line with join token by token from step 2
4. Provision 2 another nodes Docker Droplet with UserData from [UserDataNode45_worker.sh](digital_ocean/UserDataNode45_worker.sh)
    - replace line with join token by token from step 2
5. Portainer console
    -  on `serverPublicIP:9000` - `http://134.122.71.93:9000`
    -  deploy stack
6. Test it
    -  use IP something like this
    -  http://134.122.71.93:8080
