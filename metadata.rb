name             'cacert'
maintainer       'Chris Aumann'
maintainer_email 'me@chr4.org'
license          'GNU Public License 3.0'
description      'Installs/Configures cacert'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.0'
recipe           'cacert::default',    'Installs certificates according to attributes'
recipe           'cacert::cacert.org', 'Installs cacert.org root certificates (Class 1 and 3 PKI)'

%w(ubuntu debian redhat centos fedora amazon suse scientific).each do |os|
  supports os
end
