package {'memcached':
 ensure => present,
}
file {'/etc/sysconfig/memcached':
 ensure => file,
 owner =>  'root',
 group =>  'root',
 mode => '0664'
 source => 'puppet:///modules/memcached/sysconfig',
 requires => Package ['memcached'],
 }
service {'memcached':
 ensure => running,
 enable => true,
 subscribe => File ['/etc/sysconfig/memcached'],
}
    
