#!/usr/bin/env bash

# Remove leading and trailing whitespace chars.
trim() {
    local var=$@
    var="${var#"${var%%[![:space:]]*}"}"   # remove leading whitespace characters
    var="${var%"${var##*[![:space:]]}"}"   # remove trailing whitespace characters
    echo -n "$var"
}

installNode () {
	
	wget http://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz
	tar -C /usr/local --strip-components 1 -xzf node-v${NODE_VERSION}-linux-x64.tar.gz
	npm install -g express-generator
	npm install -g nodemon yo

}

installConsul () {
	wget https://dl.bintray.com/mitchellh/consul/${CONSUL_VERSION}_linux_amd64.zip	
	unzip -o ${CONSUL_VERSION}_linux_amd64.zip -d /usr/local/bin
	apt-get install -yq psmisc
	
	# Install System V service scripts and start agent
	cp /vagrant/vagrant/consulagent /etc/init.d/	
	chmod 755 /etc/init.d/consulagent
	update-rc.d consulagent defaults
	service consulagent start	
	sleep 5
	consul join 172.17.42.1
}

installMongo () {
	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv 7F0CEB10
	echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list
	apt-get update && apt-get install -y mongodb-org
	mkdir -p /data/db
}

installHerokuToolbelt() {
	wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
}

installGit() {
	apt-get install -yq git
}

NODE_VERSION=$(trim ${1:-0.12.2})
CONSUL_VERSION=$(trim ${2:-0.5.0})

installNode
installConsul
installMongo
installHerokuToolbelt
installGit
