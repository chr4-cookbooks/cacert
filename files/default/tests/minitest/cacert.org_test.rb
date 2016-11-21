#
# Cookbook Name:: cacert
# Test:: cacert.org
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

require File.expand_path('../support/helpers', __FILE__)

describe 'cacert::cacert.org' do
  include Helpers::Cacert

  it 'must create ca certificate (class 1)' do
    file("#{node['cacert']['cert_dir']}/cacert.org.pem").must_exist
  end

  it 'must create correct symlink (class 1)' do
    link("#{node['cacert']['cert_dir']}/99d0fa06.0").must_exist.with(
      :link_type, :symbolic).and(:to, 'cacert.org.pem')
  end

  it 'must create ca certificate (class 3)' do
    file("#{node['cacert']['cert_dir']}/cacert.org.class3.pem").must_exist
  end

  it 'must create correct symlink (class 3)' do
    link("#{node['cacert']['cert_dir']}/590d426f.0").must_exist.with(
      :link_type, :symbolic).and(:to, 'cacert.org.class3.pem')
  end

  it 'must verify https://cacert.org' do
    cmd = shell_out("openssl s_client -CApath #{node['cacert']['cert_dir']} -connect cacert.org:443")
    cmd.stdout.must_include('Verify return code: 0 (ok)')
  end
end
