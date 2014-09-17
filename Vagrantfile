# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box     = 'base'
  config.vm.box_url = 'http://puppet-vagrant-boxes.puppetlabs.com/debian-73-x64-virtualbox-puppet.box' 
  config.vm.synced_folder 'hiera', '/etc/puppet/hiera'
  config.vm.provision 'puppet' do |puppet|
    puppet.manifests_path    = 'manifests'
    puppet.module_path       = 'modules'
    puppet.hiera_config_path = 'hiera/hiera.yaml'
    puppet.manifest_file     = 'site.pp'
  end
end
