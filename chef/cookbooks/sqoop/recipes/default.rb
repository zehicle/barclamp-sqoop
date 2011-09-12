#
# Cookbook Name: sqoop
# Recipe: default.rb
#
# Copyright (c) 2011 Dell Inc.
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

#######################################################################
# Begin recipe transactions
#######################################################################
debug = node[:sqoop][:debug]
Chef::Log.info("BEGIN sqoop") if debug

# Configuration filter for our environment
env_filter = " AND environment:#{node[:sqoop][:config][:environment]}"

# Install the sqoop base package.
package "sqoop" do
  action :install
end

# Update the configuration file.
template "/etc/sqoop/conf/sqoop-site.xml" do
  owner node[:sqoop][:process_file_system_owner]
  group node[:sqoop][:global_file_system_group]
  mode "0644"
  source "sqoop-site.xml.erb"
end

#######################################################################
# End of recipe transactions
#######################################################################
Chef::Log.info("END sqoop") if debug
