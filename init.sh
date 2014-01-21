#!/bin/bash

if [[ ! -d "/etc/puppet/modules/apache" ]]; then
    puppet module install puppetlabs/apache
fi

if [[ ! -d "/etc/puppet/modules/php" ]]; then
    puppet module install nodes/php
fi

if [[ ! -d "/etc/puppet/modules/mysql" ]]; then
    puppet module install puppetlabs/mysql
fi

if [[ ! -d "/etc/puppet/modules/phpmyadmin" ]]; then
    puppet module install --force --ignore-dependencies jlondon/phpmyadmin
fi

if [[ ! -d "/etc/puppet/modules/firewall" ]]; then
    puppet module install puppetlabs/firewall
fi