#
# Cookbook Name:: cacert
# Resource:: hash
#
# Copyright 2012, Chris Aumann
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

actions        :create
default_action :create

attribute :cert,     kind_of: String, name_attribute: true
attribute :cert_dir, kind_of: String, default: '/etc/ssl/certs/'
attribute :hash,     kind_of: String, default: nil
