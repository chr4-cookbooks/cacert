#
# Cookbook Name:: cacert
# Provider:: hash
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
  hash = new_resource.hash

  # if hash is not specified, generate it using openssl
  unless hash
    cmd = Mixlib::ShellOut.new("openssl x509 -hash -noout -in #{new_resource.cert_dir}/#{new_resource.cert}")
    cmd.run_command
    hash = cmd.stdout.chomp if cmd.exitstatus
  end

  r = link new_resource.cert do
    target_file "#{new_resource.cert_dir}/#{hash}.0"
    to ::File.basename(new_resource.cert)
    only_if { hash }
  end

  new_resource.updated_by_last_action(true) if r.updated_by_last_action?
end
