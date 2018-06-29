https://kyup.com/tutorials/introduction-puppet-configure-mysql-instances-puppet/


root@c2710:~# puppet module install puppetlabs-mysql

puppet parser validate  /etc/puppet/manifests/site.pp

puppet apply --noop /etc/puppet/manifests/init.pp

puppet apply  /etc/puppet/manifests/init.pp
