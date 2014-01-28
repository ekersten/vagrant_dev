# Global path config

Exec {
	path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

# Rpositories update
exec {'apt-get update':
	command => 'apt-get update',
}

Package {
	require => Exec['apt-get update'],
}

File {
	require => Exec['apt-get update'],
}

# Basic packages
package {'git':
	ensure => present
}

package {'vim':
	ensure => present
}

package {'mc':
	ensure => present
}

#### Python START ####
package{'python':
	ensure => present,
}

package {'python-pip':
	ensure => present,
	require => Package['python']
}

exec {'virtualenvwrapper':
	command => 'pip install virtualenvwrapper',
	require => Package['python-pip'],
}

file {'virtualenvwrapper_conf':
	path => '/etc/profile.d/virtualenvwrapper_conf.sh',
	content => 'WORKON_HOME=$HOME/.virtualenvs',
	require => Exec['virtualenvwrapper'],
}

file {'/etc/profile.d/virtualenvwrapper.sh':
	ensure => 'link',
	target => '/usr/local/bin/virtualenvwrapper.sh',
	require => File['virtualenvwrapper_conf'],
}
#### Python END ####