git config --global user.name "oussemabh99"
git config --global user.email "oussema.benhdid@etudiant-enit.utm.tn"
echo "--- creating ingress --- "
cd  ingress-controller-files
kubectl create -f .
kubectl create -f .
cd ..
echo "--- creating local registry --- "
kubectl create -f $(pwd)/pods/namespace.yaml;
kubectl create -f $(pwd)/secrets/secret1.yaml;
kubectl create -f $(pwd)/Deployments/kube-registry-2.yaml;
kubectl create -f $(pwd)/Service/kube-regitry.yaml;
kubectl create -f $(pwd)/Volume/pv-local.yaml
kubectl create -f $(pwd)/Volume/pvc-local.yaml
echo "--sleeping for 20s -- "
sleep 20 ;
if ( curl -v  localhost:5000); then
   if (docker login localhost:5000); then
    echo "---building and pulling images ---"
    docker pull oussemabh999/glpi:v1.2
    docker build -t localhost:5000/flask:v2 ./python_app/ && 
    docker tag oussemabh999/glpi:v1.2  localhost:5000/glpi:v1 && docker rmi oussemabh999/glpi:v1.2 &&
    echo "--- pushing images to registry--- "
    docker push localhost:5000/flask:v2 && docker rmi localhost:5000/flask:v2
    docker push localhost:5000/glpi:v1 && docker rmi localhost:5000/glpi:v1
    kubectl create secret generic auth --from-file .dockerconfigjson=/root/.docker/config.json --type kubernetes.io/dockerconfigjson -n devops && 
    kubectl create secret generic auth --from-file .dockerconfigjson=/root/.docker/config.json --type kubernetes.io/dockerconfigjson &&
    kubectl create -f $(pwd)/python_app/pod && kubectl create -f $(pwd)/python_app/ingress.yaml
    sleep 20 && curl -v localhost/home
    echo "-----deploying glpi------"
    cd glpi
    sh glpi-install.sh
   else 
    echo "ereur";
   fi
   
fi

