#
# Cookbook Name:: cacert
# Recipe:: default
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

node['cacert']['certs'].each do |name, opts|
	Chef::Log.debug "Creating cacerts #{name} from attributes"
	cacert name do
		source   opts['source']        if opts['source']
		cert_dir opts['cert_dir']      if opts['cert_dir']
		hash     opts['hash']          if opts['hash']
		action   (opts['action']? opts['action'].to_sym: :create)
	end
end
