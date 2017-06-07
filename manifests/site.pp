hiera_include('classes',[])

node 'raymond-puppetmaster.buildandrelease.org' {
	class { '::ntp':
 	servers => [ 'ntp1.corp.com', 'ntp2.corp.com' ],
	}
}

node 'raymond-puppetslave.buildandrelease.org' {
        #class { '::php': }
	#class { '::mysql::server': }
#	user { 'rbdabu':
#		ensure => 'present',
#		#password => sha1('password'),
#		password => pw_hash('password', 'SHA-512', 'mysalta'),
#	}
	class { 'profile::release_accounts':}
	#class { 'profile::apache':} can also be used.
	#include profile::apache
	include ::role::webserver
}

node 'raymond-wordpress-1.buildandrelease.org' {
	include role::amp
	include profile::wordpress
}

node 'raymond-wordpress-2.buildandrelease.org' {
        include role::amp
        include profile::wordpress
}
