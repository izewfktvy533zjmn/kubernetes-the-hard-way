#!/bin/bash

MASTER1_HOSTNAME=k8s-master1
MASTER2_HOSTNAME=k8s-master2
MASTER3_HOSTNAME=k8s-master3

for instance in ${MASTER1_HOSTNAME} ${MASTER2_HOSTNAME} ${MASTER3_HOSTNAME}; do
    scp \
        cert/etcd-ca.pem \
        cert/etcd-ca-key.pem \
        cert/kube-etcd-${instance}.pem \
        cert/kube-etcd-${instance}-key.pem \
        cert/kube-etcd-peer-${instance}.pem \
        cert/kube-etcd-peer-${instance}-key.pem \
        cert/kube-apiserver-etcd-client.pem \
        cert/kube-apiserver-etcd-client-key.pem \
        cert/kube-etcd-healthcheck-client.pem \
        cert/kube-etcd-healthcheck-client-key.pem \
        cert/kube-etcd-flanneld-client.pem \
        cert/kube-etcd-flanneld-client-key.pem \
        cert/kubernetes-ca.pem \
        cert/kubernetes-ca-key.pem \
        cert/kube-apiserver-${instance}.pem \
        cert/kube-apiserver-${instance}-key.pem \
        cert/kube-apiserver-kubelet-client.pem \
        cert/kube-apiserver-kubelet-client-key.pem \
        cert/kubernetes-front-proxy-ca.pem \
        cert/front-proxy-client.pem \
        cert/front-proxy-client-key.pem \
        cert/service-account.pem \
        cert/service-account-key.pem \
        cert/k8s-worker1.pem \
        cert/k8s-worker1-key.pem \
        kubeconfig/admin.kubeconfig \
        kubeconfig/kube-controller-manager.kubeconfig \
        kubeconfig/kube-scheduler.kubeconfig \
        kubeconfig/kube-proxy.kubeconfig
        kubeconfig/k8s-worker1.kubeconfig \
        manifest/master/encryption-config.yaml \
        manifest/master/kube-scheduler.yaml \
        service/${instance}/etcd.service \
        service/${instance}/kube-apiserver.service \
        service/${instance}/kube-controller-manager.service \
        service/${instance}/kube-scheduler.service \
        ubuntu@${instance}:/home/ubuntu
done

exit 0
