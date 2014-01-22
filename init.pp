
###############################################################################
# Defaults
###############################################################################

Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }

file { "/vagrant_www/home":
    ensure => directory,
    mode => 0775,
}


###############################################################################
# Apache
###############################################################################

class { 'apache':
  mpm_module => 'prefork',
}

include 'apache::mod::php'

apache::vhost { 'home.pushpath.dev':
    port => '80',
    docroot => '/vagrant_www/home'
}

###############################################################################
# PHP
###############################################################################

class { 'php': }

php::module { "pgsql": }
php::module { "pdo": }
php::module { "common": }
php::module { "devel": }

###############################################################################
# IPTables
###############################################################################
resources { "firewall":
  purge => true
}

class { 'firewall': }

firewall { '100 allow http and https access':
  port   => [80, 443],
  proto  => tcp,
  action => accept,
}
