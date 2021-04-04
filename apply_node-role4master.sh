#!/bin/bash

kubectl label node `hostname` node-role.kubernetes.io/master=''
kubectl label node `hostname` node-role.kubernetes.io/control-plane=''
kubectl label node `hostname` node-role.kubernetes.io/etcd=''
kubectl taint node `hostname` node-role.kubernetes.io/master=:NoSchedule

exit 0
