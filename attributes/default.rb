#
# Cookbook Name:: cacert
# Attributes:: default
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

default['cacert']['cert_dir'] = '/etc/ssl/certs'

# Hash of cacerts to install with the default recipe. Example of use:
# default['cacert']['certs'] = {
#    "my.ca.cert.org" => {
#       "source" => "https://my.ca.cert.org/certs/root.crt",
#       "cert_dir" => "/etc/ssl/certs",
#       "hash" => "492ffc07",
#       "action" => "create"
#    }
# }
default['cacert']['certs'] = {}
