# Step1: Set control Plane host as apiserver-advertise-address
master_host = ifconfig eth0 | grep 'inet ' | sed 's/^.*inet //g' | sed 's/ *netmask.*$//g'
# sudo kubeadm init --apiserver-advertise-address=$master_host  --pod-network-cidr=192.168.0.0/16
sudo kubeadm init --control-plane-endpoint=$master_host --pod-network-cidr=192.168.0.0/16 --cri-socket=/run/cri-dockerd.sock

# Step2: let user can use kubectl without root privileges
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Step3: Installing a Pod network add-on
curl https://raw.githubusercontent.com/projectcalico/calico/v3.24.1/manifests/calico.yaml -O
kubectl apply -f calico.yaml
