#
# Cookbook Name:: shells
# Recipe:: default
#
# Copyright 2014, Western University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node[:shells][:packages].each do |pkg|
  package pkg do
    action :install
  end
end

node[:shells][:symlinks].each do |link_name, target|

  directory File.dirname(link_name) do
    owner     "root"
    group     "root"
    mode      "0755"
    recursive true
    action    :create
  end

  link link_name do
    to target
    not_if { File.file?(link_name) && ! File.symlink?(link_name) }
  end

end