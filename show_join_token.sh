$join_cmd = multipass exec master -- kubeadm token create --print-join-command
$join_cmd = "sudo " + $join_cmd + "--cri-socket=/run/cri-dockerd.sock"
echo "Run this command on slave to join the cluster:"
echo $join_cmd