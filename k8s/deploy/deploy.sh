#!/bin/bash
# Script to call kubespray to deploy kubernetes cluster
ansible -i hosts all -m shell -a 'apt-get update && apt-get install net-tools'
ansible -i hosts all -m shell -a 'pip3 install -r requirements.txt'

# deploy k8s cluster with kubespray
docker run -v $(pwd)/inventory:/data quay.io/kubespray/kubespray:v2.15.0 cp -rf \
/kubespray/inventory/sample/ /data


ansible-playbook -i /data/inventory/inventory.ini --private-key /data/inventory/id_rsa cluster.yml