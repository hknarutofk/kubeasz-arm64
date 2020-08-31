#!/bin/bash
export KUBEASZ_VER=2.2.1
export K8S_BIN_VER=v1.18.3
export EXT_BIN_VER=0.5.2

(
	cd reference/cfssl-1.4.1
	docker build -f Dockerfile.alpine -t registry.cn-hangzhou.aliyuncs.com/hknaruto/cloudflare-cfssl:1.4.1 .
)

(
	cd kubeasz
	docker build -t registry.cn-hangzhou.aliyuncs.com/hknaruto/easzlab-kubeasz:${KUBEASZ_VER} .
)

(
	cd kubeasz-ext-bin
	docker build -t registry.cn-hangzhou.aliyuncs.com/hknaruto/easzlab-kubeasz-ext-bin:${EXT_BIN_VER} .
)

(
	cd kubeasz-k8s-bin
	docker build -t registry.cn-hangzhou.aliyuncs.com/hknaruto/easzlab-kubeasz-k8s-bin:${K8S_BIN_VER} .
)

docker push registry.cn-hangzhou.aliyuncs.com/hknaruto/cloudflare-cfssl:1.4.1 .
docker push registry.cn-hangzhou.aliyuncs.com/hknaruto/easzlab-kubeasz:${KUBEASZ_VER}
docker push registry.cn-hangzhou.aliyuncs.com/hknaruto/easzlab-kubeasz-ext-bin:${EXT_BIN_VER}
docker push registry.cn-hangzhou.aliyuncs.com/hknaruto/easzlab-kubeasz-k8s-bin:${K8S_BIN_VER}
