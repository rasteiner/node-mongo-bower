#!/usr/bin/env bash

sudo su

apt-get install -y git curl build-essential python-software-properties
add-apt-repository ppa:chris-lea/node.js 
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list

apt-get -y update
apt-get -y upgrade

apt-get install -y nodejs mongodb-org
start mongod

npm config set registry http://registry.npmjs.org/
npm install -g bower

echo "Machine is ready"
echo "These are my IP Addresses: "

ifconfig | awk -F':' '/inet addr/&&!/127.0.0.1/{split($2,_," ");print _[1]}' 