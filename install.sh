multipass launch --name master1 -m 2G -c 2 -d 15G
multipass launch --name slave1 -m 2G -c 2 -d 15G

multipass transfer ./setup_docker.sh master1:setup_docker.sh
multipass transfer ./setup_docker.sh slave1:setup_docker.sh

multipass exec master1 -- sudo apt-get update && sudo apt-get install -y net-tools
multipass exec slave1 -- sudo apt-get update && sudo apt-get install -y net-tools

multipass exec master1 -- bash setup_docker.sh
multipass exec slave1 -- bash setup_docker.sh