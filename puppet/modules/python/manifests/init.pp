package { ["python", "python-pip"]:
	ensure => present,
}

exec { "virtualenvwrapper_install":
	command => "sudo pip install virtualenvwrapper",
	require => Package["python-pip"],
}

file { "/etc/profile.d/virtualenvwrapper_conf.sh":
	content => "WORKON_HOME=$HOME/.virtualenvs",
	ensure => present,
	require => Package["python-pip"],
} -> 
file {"/etc/profile.d/virtualenvwrapper.sh":
	ensure => "link",
	target => "/usr/local/bin/virtualenvwrapper.sh",
	require => Package["python-pip"],
}