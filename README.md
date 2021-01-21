# kubeasz-arm64
https://github.com/easzlab/kubeasz kubeasz arm64 (aarch64) 平台迁移

# 操作步骤

```
git clone https://github.com/hknarutofk/kubeasz-arm64.git
# 国内用户可使用 https://gitee.com/hknarutofk/kubeasz-arm64.git

cd kubeasz-arm64
cp etc/ansible/ /etc/ -r
sh easzup -D
sh easzup -S
```

## 单机安装
```
docker exec -it kubeasz easzctl start-aio
```

## 集群安装
编辑/etc/ansible/hosts文件，然后执行
```
docker exec -it kubeasz easzctl setup
```
# 验证安装
如果提示kubectl: command not found，退出重新ssh登录一下，环境变量生效即可
```
$ kubectl version         # 验证集群版本     
$ kubectl get node        # 验证节点就绪 (Ready) 状态
$ kubectl get pod -A      # 验证集群pod状态，默认已安装网络插件、coredns、metrics-server等
$ kubectl get svc -A      # 验证集群服务状态
```


# 添加节点

https://github.com/easzlab/kubeasz/blob/master/docs/op/op-node.md

```
yum install -y epel-release
yum install -y ansible python-netaddr
/etc/ansible/tools/easzctl add-node 192.168.1.2
```
