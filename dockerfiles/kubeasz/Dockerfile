# Dockerfile for building images to run kubeasz in a container
#
# @author:  gjmzj
# @repo:    https://github.com/kubeasz/dockerfiles/kubeasz
# @ref:     https://github.com/easzlab/kubeasz
FROM alpine:3.9

ENV KUBEASZ_VER=2.2.1 \
    ANSIBLE_VER=2.6.18 \
    NETADDR_VER=0.7.19

RUN echo "https://mirrors.aliyun.com/alpine/v3.9/main" > /etc/apk/repositories && \
    echo "https://mirrors.aliyun.com/alpine/v3.9/community" >> /etc/apk/repositories && \
    echo "===> Adding Python runtime..."                                    && \
    apk --update add python py-pip openssl ca-certificates                  && \
    apk --update add --virtual build-dependencies \
        python-dev libffi-dev openssl-dev build-base                        && \
    pip install -i https://mirrors.aliyun.com/pypi/simple --upgrade pip cffi                                          && \
    \
    echo "===> Installing Ansible/netaddr..."                               && \
    pip install -i https://mirrors.aliyun.com/pypi/simple ansible=="$ANSIBLE_VER" netaddr=="$NETADDR_VER"             && \
    \
    echo "===> Installing handy tools..."                                   && \
    pip install -i https://mirrors.aliyun.com/pypi/simple --upgrade pycrypto                                          && \
    apk --update add bash openssh-client rsync                              && \
    \
    echo "===> Downloading kubeasz..."                                      && \
    wget https://github.com/easzlab/kubeasz/archive/"$KUBEASZ_VER".tar.gz   && \
    tar zxf ./"$KUBEASZ_VER".tar.gz                                         && \
    mv kubeasz-"$KUBEASZ_VER" /etc/ansible                                  && \
    ln -s /etc/ansible/tools/easzctl /usr/bin/easzctl                       && \
    \
    echo "===> Removing package list..."                                    && \
    apk del build-dependencies                                              && \
    rm -rf /var/cache/apk/*                                                 && \
    rm -rf /root/.cache                                                     && \
    rm -rf ./"$KUBEASZ_VER".tar.gz

CMD [ "sleep", "360000000" ]
