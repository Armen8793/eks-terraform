# eks-terraform

When you pull the terraform code and execute commands terraform init and terraform apply, terraform will create an EKS cluster with its network and iam roles..

after that you must do the following commands:

```
aws eks update-kubeconfig --name ${YOUR CLUSTER NAME} --region ${YOUR REGION}
```
##Then run
```
kubectl get nodes --show-labels
```
##Your nodes are without labels, no worker no master..and to label some of them as workers, run 
```
kubectl label nodes <node-name> node-role.kubernetes.io/worker=worker
```
##ANd for masters run
```
kubectl label nodes <node-name> node-role.kubernetes.io/master=master
```
##Install Helm
```
curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
helm version
```
##Nginx ingress controller
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
```

##ArgoCD
```
kubectl create namespace argocd
kubectl create secret generic argocd-github-ssh-key   --from-file=sshPrivateKey=/home/armen/.ssh/argocd_github_key   --namespace=argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd --namespace argocd
kubectl get pods -n argocd
kubectl apply -f argocd-ingress.yaml
```

##When you do all this, write
kubectl get svc -n ingress-nginx
##You will see the external dns, ping it, see its ip and put it as a lb ip (in my case i put it in cloudflare) and you will get it
##Do not forget to have nginx config in /etc/nginx/sites-avalable/ and link it to /etc/nginx/sites-enabled and restart nginx service
##To get your argocd password
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
