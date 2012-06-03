class riak {
  define download(
        $site="",
        $cwd="",
        $creates="",
        $user="") {                                                                                         

    exec { $name:                                                                                                                    
        command => "/usr/bin/wget --content-disposition ${site}/${name}",                                                         
        cwd => $cwd,
        creates => "${cwd}/${creates}",                                                              
        user => $user,                                                                                                        
    }
  }

  download{ "riak/CURRENT/riak_1.1.2-1_amd64.deb":
    creates => "riak_1.1.2-1_amd64.deb",
    site => "http://downloads.basho.com",
    cwd => "/tmp",
    user => "vagrant"
  }

  exec { "install": 
    command => "/usr/bin/dpkg --install /tmp/riak_1.1.2-1_amd64.deb"
  }

  file {"/etc/riak/vm.args":
    content => template("riak/etc/riak/vm.args.erb"),
    require => Exec["install"]
  }

  file {"/etc/riak/app.config":
    content => template("riak/etc/riak/app.config.erb"),
    require => Exec["install"]
  }

  file {"/etc/riak/cert.pem":
    source => "puppet:///modules/riak/etc/riak/cert.pem",
    require => Exec["install"]
  }

  file {"/etc/riak/key.pem":
    source => "puppet:///modules/riak/etc/riak/key.pem",
    require => Exec["install"]
  }

  service {"riak":
    enable => true,
    ensure => "running",
    subscribe => [File["/etc/riak/vm.args"], File["/etc/riak/app.config"], File["/etc/riak/cert.pem"], File["/etc/riak/key.pem"]],
  }

  package {"libssl0.9.8":
    ensure => present
  }
  
  Download["riak/CURRENT/riak_1.1.2-1_amd64.deb"] -> Package["libssl0.9.8"] -> Exec["install"] -> Service["riak"]
}