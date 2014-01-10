#
# Cookbook Name:: chatsecure_jekyll
# Recipe:: default
#
# Copyright 2014, Chris Ballinger
#
# MIT License
#

# Make app root
directory node['chatsecure_jekyll']['app_root'] do
  owner node['nginx']['user']
  group node['nginx']['group']
  recursive true
  action :create
end


# Make Nginx log dirs
directory node['chatsecure_jekyll']['log_dir'] do
  owner node['nginx']['user']
  group node['nginx']['group']
  recursive true
  action :create
end

# Nginx config file
template node['nginx']['dir'] + "/sites-enabled/chatsecure_jekyll.nginx" do
    source "chatsecure_jekyll.nginx.erb"
    owner node['nginx']['user']
    group node['nginx']['group']
    variables({
      :http_listen_port => node['chatsecure_jekyll']['http_listen_port'],
      :https_listen_port => node['chatsecure_jekyll']['https_listen_port'],
      :domain => Chef::Config[:node_name],
      :ssl_cert => node['chatsecure_ssl']['ssl_dir'] + node['chatsecure_ssl']['ssl_cert'],
      :ssl_key => node['chatsecure_ssl']['ssl_dir'] + node['chatsecure_ssl']['ssl_key'],
      :app_root => node['chatsecure_jekyll']['app_root'],
      :access_log => node['chatsecure_jekyll']['log_dir'] + node['chatsecure_jekyll']['access_log'],
      :error_log => node['chatsecure_jekyll']['log_dir'] + node['chatsecure_jekyll']['error_log'],
    })
    notifies :restart, "service[nginx]"
    action :create
end
