Vagrant::Config.run do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "lucid64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port "http", 80, 8080

  # Setting the hostname of the vm
  config.vm.host_name = "mobyle.localdomain"

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  config.vm.customize do |vm|
    vm.memory_size = 1024
    vm.name = "Mobyle Development"
  end
  
  # Enable provisioning with chef solo, specifying a cookbooks path (relative
  # to this Vagrantfile), and adding some recipes and/or roles.
  config.vm.provision :chef_solo do |chef|
    # Configuration parameters
    chef.log_level = :debug
    chef.cookbooks_path = ["cookbooks/local", "cookbooks/opscode"]

    # Requirements for sane Ubuntu
    chef.add_recipe "apt"

    # Requirements for Mobyle
    chef.add_recipe "python"
    chef.add_recipe "apache2"

    # Mobyle
    chef.add_recipe "mobyle"
  end
end
