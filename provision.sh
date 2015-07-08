#!/usr/bin/env bash

sudo npm install -g sails gulp
sudo npm install -g yo                                # Install Yeoman (if you don't have it yet)...
sudo npm install -g generator-react-gulp-browserify   # ...then install this generator...
sudo npm install -g sails-generate-reactjs
mkdir -p /vagrant/react-gulp-browserify
mkdir -p /vagrant/sails-generate-reactjs

# sails-generate-angular-gulp

sudo npm install -g sails-generate-backend-gulp
sudo npm install -g sails-generate-gulpfile
sudo npm install -g sails-generate-frontend-gulp
sudo npm install -g sails-generate-new-gulp
sudo npm install -g sails-generate-bower-gulp
sudo npm install -g sails-generate-angular-gulp
sudo npm install -g sails-generate-angular-gws

# copy over .sailsrc file


# generate react or gulp front end
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh