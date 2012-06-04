vagrant-riak-cluster
====================

Usage:
  
    $ git clone https://github.com/asquera/vagrant-riak-cluster.git
    $ gem install vagrant
    $ vagrant up
  
This fires up 4 vms with riak installed and configured. If you want less vms, just start them by hand:

    $ vagrant up riak1 riak2 riak3

All you have to do is to join them together. Navigate to:

  https://33.33.33.220:8068/admin/ui/index.html
  
Click on "cluster" and enter the following additional nodes to the cluster:

* `riak@33.33.33.221`
* `riak@33.33.33.222`
* `riak@33.33.33.223`

All nodes are bound to 0.0.0.0, using the following port mapping:

* `http`: `8098`
* `https`: `8068`
* `protocol buffers`: `8087`
* `handoff`: `8099`
