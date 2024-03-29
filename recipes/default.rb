#
# Cookbook Name:: apt
# Recipe:: default
#
# Copyright 2008-2011, Opscode, Inc.
# Copyright 2009, Bryan McLellan <btm@loftninjas.org>
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

execute "apt-get-update-install" do
  command "apt-get update"
  action :nothing
end.run_action(:install)

## Run apt-get update to create the stamp file
#execute "apt-get-update" do
  #command "apt-get update"
  #ignore_failure true
  #not_if do ::File.exists?('/var/lib/apt/periodic/update-success-stamp') end
  #action :nothing
#end

## provides /var/lib/apt/periodic/update-success-stamp on apt-get update
#package "update-notifier-common" do
  #notifies :run, resources(:execute => "apt-get-update"), :immediately
#end

#execute "apt-get-update-periodic" do
  #command "apt-get update"
  #ignore_failure true
  #only_if do
    #File.exists?('/var/lib/apt/periodic/update-success-stamp') &&
    #File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86400
  #end
#end

#%w{/var/cache/local /var/cache/local/preseeding}.each do |dirname|
  #directory dirname do
    #owner "root"
    #group "root"
    #mode  0644
    #action :create
  #end
#end



