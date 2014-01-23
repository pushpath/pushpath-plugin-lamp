#/*
# *
# * Licensed to the Apache Software Foundation (ASF) under one
# * or more contributor license agreements.  See the NOTICE file
# * distributed with this work for additional information
# * regarding copyright ownership.  The ASF licenses this file
# * to you under the Apache License, Version 2.0 (the
# * "License"); you may not use this file except in compliance
# * with the License.  You may obtain a copy of the License at
# *
# *   http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing,
# * software distributed under the License is distributed on an
# * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# * KIND, either express or implied.  See the License for the
# * specific language governing permissions and limitations
# * under the License.
# *
#*/

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
