#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2014, Zephpyr
#
# All rights reserved - Do Not Redistribute
#

package "nginx" do
    action :upgrade
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
end

template "/etc/nginx/nginx.conf" do
    source "nginx.conf.erb"
    owner "root"
    group "root"
    mode 0755
    notifies :reload, resources(:service => "nginx")
end

service "nginx" do
    action :start
end