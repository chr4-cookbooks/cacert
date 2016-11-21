#
# Cookbook Name:: cacert
# Recipe:: cacert.org
#
# Copyright 2013, Chris Aumann
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Class 1 PKI key
cacert 'cacert.org.pem' do
  source    'http://www.cacert.org/certs/root.crt'
  checksum  'c0e0773a79dceb622ef6410577c19c1e177fb2eb9c623a49340de3c9f1de2560'
  cert_hash '99d0fa06'
end

# Class 3 PKI key
cacert 'cacert.org.class3.pem' do
  source    'http://www.cacert.org/certs/class3.crt'
  checksum  'f5badaa5da1cc05b110a9492455a2c2790d00c7175dcf3a7bcb5441af71bf84f'
  cert_hash '590d426f'
end
