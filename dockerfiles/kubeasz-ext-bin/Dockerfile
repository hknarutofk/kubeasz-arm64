# Download extral binaries needed by 'kubeasz'
#
# @author:  gjmzj
# @repo:    https://github.com/kubeasz/dockerfiles/kubeasz-ext-bin
# @ref:     https://github.com/easzlab/kubeasz
# 由于访问国外网络较为困难，方案调整为容器内保留资源，方便国内用户从容器中获得对应程序文件

FROM alpine:3.9

ENV ETCD_VER=v3.4.3 \
    CNI_VER=v0.8.6 \
    HELM_VER=v3.2.1 \
    DOCKER_COMPOSE_VER=1.23.2 \
    CALICOCTL_VER=v3.8.8 \
    EXT_BIN_VER=0.5.2

ADD bandwidth bandwidth
ADD bridge bridge
ADD calicoctl-linux-arm64 calicoctl-linux-arm64
ADD cfssl-certinfo cfssl-certinfo
ADD cfssljson cfssljson
ADD cfssl cfssl
ADD dhcp dhcp
ADD docker-compose-Linux-aarch64 docker-compose-Linux-aarch64
ADD etcd etcd
ADD etcdctl etcdctl
ADD firewall firewall
ADD flannel flannel
ADD helm helm
ADD host-device host-device
ADD host-local host-local
ADD ipvlan ipvlan
ADD loopback loopback
ADD macvlan macvlan
ADD portmap portmap
ADD ptp ptp
ADD sbr sbr
ADD static static
ADD tuning tuning
ADD vlan vlan
     
RUN mkdir -p /extra && \
    \
    cp etcd /extra/etcd && \
    cp etcdctl /extra/etcdctl && \
    \    
    cp cfssl /extra/cfssl && \
    cp cfssljson /extra/cfssljson && \
    cp cfssl-certinfo /extra/cfssl-certinfo && \
    \    
    cp bridge flannel host-local loopback portmap tuning /extra && \
    \
    cp helm /extra && \
    \    
    cp docker-compose-Linux-aarch64 /extra/docker-compose && \
    \
    cp calicoctl-linux-arm64 /extra/calicoctl

CMD [ "sleep", "360000000" ]

