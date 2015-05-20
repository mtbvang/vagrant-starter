#!/usr/bin/env bash

apt-get install -y gcc make build-essential
cd /vagrant
npm install
cd /vagrant/node_modules/mongodb/node_modules/bson/
npm install -g node-gyp
node-gyp rebuild

cd /vagrant && npm install
nohup mongod &