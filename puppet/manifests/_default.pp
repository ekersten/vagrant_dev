Exec {
	path => "/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
}

group {"puppet":
	ensure => "present"
}

exec { "update-apt":
	command => "sudo apt-get update",
	#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
	#refreshonly => true,
}

Exec {
	require => Exec["update-apt"],
}

File {
	require => Exec["update-apt"],
}

Package {
	require => Exec["update-apt"],
}

class {"python":
	
}