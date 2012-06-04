include riak

package {"curl":
  ensure => present
}

package {"vim": 
  ensure => present
}

package {"git-core":
  ensure => present
}

package {"build-essential":
  ensure => present
}

package {"nfs-kernel-server":
  ensure => present
}