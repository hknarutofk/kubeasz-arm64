#!/bin/bash

yum install git python36 python36-devel python36-pip zlib-devel -y
pip3.6 install tox==2.1.1
/usr/local/bin/tox --notest -i https://mirrors.aliyun.com/pypi/simple

TARGET=dist/docker-compose-$(uname -s)-$(uname -m)
VENV=.tox/py36
 
mkdir -p `pwd`/dist
chmod 777 `pwd`/dist
echo "b0c10cb" > compose/GITSHA
$VENV/bin/pip install -q -r requirements-build.txt
$VENV/bin/pyinstaller docker-compose.spec
mv dist/docker-compose $TARGET
$TARGET version

