#/bin/bash
docker pull oussemabh999/glpi:v1.2
docker tag oussemabh999/glpi:v1.2  localhost:5000/glpi:v1
docker rmi oussemabh999/glpi:v1.2
mkdir -p /srv/files /srv/config /srv/config /srv/marketplace /srv/login/ /srv/mysql /srv/plugin
mkdir -p /srv/files/_cron /srv/files/_dumps /srv/files/_graphs /srv/files/_lock /srv/files/_pictures /srv/files/_plugins
mkdir -p /srv/files/_rss /srv/files/_sessions /srv/files/_tmp /srv/files/_uploads
chown -R 33:33 /srv/
cd pv
kubectl create -f .
cd ../pvc
kubectl create -f .
cd ../deployments
kubectl create -f .
cd ../.
kubectl create -f .
cd ingress
kubectl create -f .
