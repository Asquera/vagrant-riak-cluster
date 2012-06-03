Vagrant::Config.run do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.ssh.forward_agent = true
  
  servers = {
    :riak1 => {:network => "33.33.33.220", :nodename => "riak3@33.33.33.220"},
    :riak2 => {:network => "33.33.33.221", :nodename => "riak3@33.33.33.221"},
    :riak3 => {:network => "33.33.33.222", :nodename => "riak3@33.33.33.222"},
    :riak4 => {:network => "33.33.33.223", :nodename => "riak4@33.33.33.223"}
  }
  
  servers.each do |name, opts|
    config.vm.define name do |riak|
      # uncomment the following line if you want the basebox to start in gui mode
      riak.vm.boot_mode = :gui
      riak.vm.network :hostonly, opts[:network]

      riak.dns.tld = "dev"
      riak.dns.patterns = [/#{name}.dev$/]

      riak.vm.provision :puppet, :facter => { "riak_node_name" => "riak@#{opts[:network]}" } do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file = "riakbox.pp"
        puppet.module_path = ["modules"]
        puppet.options = "--verbose --debug"
      end      
    end
  end
end
