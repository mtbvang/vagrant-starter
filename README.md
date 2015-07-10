# vagrant-starter

A quick way to add a local development environment that uses vagrant, docker and shell provisioning. 

Contains a Vagrantfile template for node projects and the scripts to provision and setup the containers for node development. 

Add this project as a submodule to a project. 

From the root of your project run:

```sh
git submodule add https://github.com/mtbvang/vagrant-starter.git vagrant
cp vagrant/Vagrantfile.template Vagrantfile
```
Update the variables under "# UPDATE these project specific details." and vagrant up.

```sh
vagrant up
```

