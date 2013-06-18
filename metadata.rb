name             'cacert'
maintainer       'Chris Aumann'
maintainer_email 'me@chr4.org'
license          'GNU Public License 3.0'
description      'Installs/Configures cacert'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
recipe           'cacert::cacert.org', 'Installs cacert.org root certificate'

attribute        'cacert/cert_dir',
  :description => 'Installation directory for SSL certificates',
  :default     => '/etc/ssl/certs'

%w{ ubuntu debian redhat centos fedora amazon suse scientific }.each do |os|
  supports os
end
