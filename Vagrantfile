Vagrant::Config.run do |config|
  config.vm.define :mobyle do |mobyle|		   
    # vagrant box add mobyle <url to package.box>
    mobyle.vm.box = "mobyle"
    mobyle.vm.box_url = "http://files.vagrantup.com/lucid64.box"
    mobyle.vm.forward_port "http", 80, 8080
    mobyle.vm.host_name = "mobyle.localdomain"

    mobyle.vm.customize do |vm|
      vm.memory_size = 1024
      vm.name = "Mobyle Development"
    end
    
    mobyle.vm.provision :chef_solo do |chef|
      chef.log_level = :debug
      chef.cookbooks_path = ["cookbooks", "cookbooks/opscode"]

      chef.add_recipe "apt"
      chef.add_recipe "python"
      chef.add_recipe "apache2"
      chef.add_recipe "mobyle"
    end
  end

  config.vm.define :ldapclient do |ldapclient|
    ldapclient.vm.box = "lucid32"
    ldapclient.vm.box_url = "http://files.vagrantup.com/lucid32.box"
    ldapclient.vm.host_name = "ldaptest.cns.montana.edu"

    ldapclient.vm.customize do |vm|
      vm.memory_size = 1024
      vm.name = "LDAP Client Test"
    end

    ldapclient.vm.provision :chef_solo do |chef|

    chef.json.merge!({ 
                         :openldap => { :basedn => 'dc=montana,dc=edu', 
                           :server => 'ds.montana.edu',
                           :binddn => 'cn=acg,dc=montana,dc=edu' 
                         }
                       })
      chef.log_level = :debug
      chef.cookbooks_path = [ "cookbooks", "cookbooks/opscode" ]
      chef.add_recipe "apt"
#      chef.add_recipe "openldap::auth"
#      chef.add_recipe "ldapclient"
    end
  end
end
