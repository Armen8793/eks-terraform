# 07.08.22-classwork-eks-terraform

When you pull the terraform code and execute commands terraform init and terraform apply, terraform will create an EKS cluster with its network and iam roles..

after that you must do the following commands:

aws eks update-kubeconfig --name ${YOUR CLUSTER NAME} --region ${YOUR REGION}

pip3 install awscli --upgrade --user

then when your kube config map is ready, do:

kubectl apply -f ${YOUR CONFIG YAML FILE FULL PATH}

kubectl get svc

then copy the ip address or dns, paste in browser and get your website

bye:)))
