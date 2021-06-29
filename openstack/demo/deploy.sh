#! /bin/bash
. demo-opensrc
export NET_ID=$(openstack network list | awk '/ provider / { print $2 }')
echo $NET_ID
openstack stack create -t hello.yaml --parameter "NetID=$NET_ID" teststack
openstack stack list
openstack stack output show --all teststack
openstack server list
