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

cacert 'cacert.org.pem' do
  # Using chr4.org mirror, as cacert.org is down as of 2014-04-23
  source 'http://chr4.org/cacert.org.pem'
  hash   '99d0fa06'
end
