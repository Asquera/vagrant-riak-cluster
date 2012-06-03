vagrant-riak-cluster
====================

Usage:
  
  $ gem install vagrant
  $ vagrant up
  
This fires up 4 vms with riak installed and configured.

All you have to do is to join them together. Navigate to:

  https://33.33.33.220:8068/admin/ui/index.html
  
Click on "cluster" and enter the following additional nodes to the cluster:

* `riak@33.33.33.221`
* `riak@33.33.33.222`
* `riak@33.33.33.223`