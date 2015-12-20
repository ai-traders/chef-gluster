#
# Cookbook Name:: gluster
# Attributes:: server
#
# Copyright 2015, Grant Ridder
# Copyright 2015, Biola University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Server package and servicename
case node['platform']
when 'ubuntu', 'debian'
  default['gluster']['server']['package'] = 'glusterfs-server'
  default['gluster']['server']['servicename'] = 'glusterfs-server'
when 'redhat', 'centos'
  default['gluster']['server']['package'] = 'glusterfs-server'
  default['gluster']['server']['servicename'] = 'glusterd'
end

# enable or disable server service
default['gluster']['server']['enable'] = true

# Package dependencies
case node['platform']
when 'ubuntu', 'debian'
  default['gluster']['server']['dependencies'] = ['xfsprogs']
when 'redhat', 'centos'
  default['gluster']['server']['dependencies'] = ['xfsprogs']
end

# Default path to use for mounting bricks
default['gluster']['server']['brick_mount_path'] = '/gluster'
# Partitions to create and format
default['gluster']['server']['partitions'] = []
# Gluster volumes to create
default['gluster']['server']['volumes'] = {}
# Set by the cookbook once bricks are configured and ready to use
default['gluster']['server']['bricks'] = []

# Retry delays for attempting peering
default['gluster']['server']['peer_retries'] = 0
default['gluster']['server']['peer_retry_delay'] = 10

# Retry delays for waiting for peer
default['gluster']['server']['peer_wait_retries'] = 10
default['gluster']['server']['peer_wait_retry_delay'] = 10

# For extend recipe
default['gluster']['server']['bricks_waiting_to_join'] = ''
