#
# Cookbook Name:: slurm
# Recipe:: autostart
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
#


cookbook_file "#{node[:cyclecloud][:bootstrap]}/writeactivenodes.sh" do
    source "writeactivenodes.sh"
    mode "0700"
    owner "root"
    group "root"
end

cron "writeactivenodes" do
    command "#{node[:cyclecloud][:bootstrap]}/cron_wrapper.sh #{node[:cyclecloud][:bootstrap]}/writeactivenodes.sh"
    only_if { node['cyclecloud']['cluster']['autoscale']['start_enabled'] }
end

cookbook_file "#{node[:cyclecloud][:bootstrap]}/autostart.py" do
    source "autostart.py"
    mode "0700"
    owner "root"
    group "root"
end

cron "autostart" do
    command "#{node[:cyclecloud][:bootstrap]}/cron_wrapper.sh #{node[:cyclecloud][:bootstrap]}/autostart.py"
    only_if { node['cyclecloud']['cluster']['autoscale']['start_enabled'] }
end
