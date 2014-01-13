#
# Cookbook Name:: cacert
# Provider:: default
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

action :create do
  r = directory "#{new_resource.cert_dir}" do
    mode      00755
    recursive true
    not_if { ::File.exist? "#{new_resource.cert_dir}" }
  end
  new_resource.updated_by_last_action(true) if r.updated_by_last_action?

  r = remote_file "#{new_resource.cert_dir}/#{new_resource.cert}" do
    mode   00644
    source new_resource.source
    action new_resource.action
  end
  new_resource.updated_by_last_action(true) if r.updated_by_last_action?

  r = cacert_hash new_resource.cert do
    cert_dir new_resource.cert_dir
    hash     new_resource.hash
  end
  new_resource.updated_by_last_action(true) if r.updated_by_last_action?
end
