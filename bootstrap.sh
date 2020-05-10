sudo firewall-cmd --zone=public --permanent --add-port=443/tcp
yum install -y container-selinux selinux-policy-base
rpm -i https://rpm.rancher.io/k3s-selinux-0.1.1-rc1.el7.noarch.rpm
curl -sfL https://get.k3s.io | sh -
kubectl create namespace cert-manager
curl -sL \
https://github.com/jetstack/cert-manager/releases/download/v0.11.0/cert-manager.yaml |\
sed -r 's/(image:.*):(v.*)$/\1-arm:\2/g' > cert-manager-arm.yaml
kubectl apply -f cert-manager-arm.yaml
kubectl --namespace cert-manager get pods
