# -*- mode: ruby -*-
# vi: set ft=ruby :

# Things all of my vagrant instances should do.

Vagrant.configure(2) do |config|
  config.vm.synced_folder "~/bin", "/home/vagrant/bin"

  config.vm.provision "shell", name: "set timezone to US/Arizona", privileged: false, inline: "if [ -e /usr/bin/timedatectl ] ; then sudo timedatectl set-timezone US/Arizona ; else echo 'glenn: could not set timezone to US/Arizona' ; fi"
  # config.vm.provision "shell", name: "set timezone to US/Arizona", privileged: false, inline: "sudo timedatectl set-timezone US/Arizona"

  config.vm.provision "shell", run: "always", privileged: false, inline: "echo 'glenn: added settings from ~/.vagrant.d/Vagrantfile'"
end
