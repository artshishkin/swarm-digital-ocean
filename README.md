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

####  Digital Ocean CLI Commands

1.  Create droplet
   - `doctl compute ssh-key list` -> find key-id by name `digital_ocean` -> 29507433 (92:08:4c:8d:76:ee:1a:7e:00:d9:d2:d3:eb:44:ab:94 - FingerPrint)
   - `doctl compute droplet create m01 --region fra1 --image ubuntu-20-04-x64 --size s-1vcpu-2gb --ssh-keys 92:08:4c:8d:76:ee:1a:7e:00:d9:d2:d3:eb:44:ab:94 --user-data-file ./UserDataNode1.sh --enable-monitoring --tag-name manager --wait`
   - got droplet id: `290263803`
2. Add droplet to a project 
   - `doctl projects list` -> find project MyWar -> `f6b34af8-7a39-44f5-b6df-bbb4cbb3372a`
   - `doctl projects resources assign f6b34af8-7a39-44f5-b6df-bbb4cbb3372a --resource=do:droplet:290263803`
3. SSH to a droplet
   - `doctl compute ssh m01 --ssh-key-path ~\.ssh\digital_ocean`
4. Get join token
   - `docker swarm join-token manager`
   - or
   - `docker swarm join-token worker`
   - update UserDataNode...
5. Create droplets for managers
   - `doctl compute droplet create --region fra1 --image ubuntu-20-04-x64 --size s-1vcpu-2gb --ssh-keys 29507433 --user-data-file ./UserDataNode23_manager.sh --enable-monitoring --tag-name manager m02`
6. Create droplets for workers
   - `doctl compute droplet create --region fra1 --image ubuntu-20-04-x64 --size s-1vcpu-2gb --ssh-keys 29507433 --user-data-file ./UserDataNode45_worker.sh --enable-monitoring --tag-name worker w01`
7. Assign droplets to a project  
   - `doctl projects resources assign f6b34af8-7a39-44f5-b6df-bbb4cbb3372a --resource=do:droplet:290268588` 
8. Delete unused droplets
   - `doctl compute droplet delete m01 -f`
   

####  Use another account

1. Create another account
   - `doctl auth init --context dima`
   - enter token
2. Switch to new account
   - `doctl auth switch --context dima`

####  Kate's account

1.  Create droplet
   - `doctl compute ssh-key list` -> find key-id by name `digital_ocean` -> 92:08:4c:8d:76:ee:1a:7e:00:d9:d2:d3:eb:44:ab:94 (FingerPrint)
   - `doctl compute droplet create m01 --region fra1 --image ubuntu-20-04-x64 --size s-2vcpu-4gb --ssh-keys 92:08:4c:8d:76:ee:1a:7e:00:d9:d2:d3:eb:44:ab:94 --user-data-file ./UserDataNode1.sh --enable-monitoring --tag-name manager --wait`
2. SSH to a droplet
   - `doctl compute ssh m01 --ssh-key-path ~\.ssh\digital_ocean`
3. Get join token
   - `docker swarm join-token manager`
   - update UserDataNode... 
4. Create droplets for managers
   - `doctl compute droplet create --region fra1 --image ubuntu-20-04-x64 --size s-2vcpu-4gb --ssh-keys 92:08:4c:8d:76:ee:1a:7e:00:d9:d2:d3:eb:44:ab:94 --user-data-file ./UserDataNode23_manager.sh --enable-monitoring --tag-name manager m02`




