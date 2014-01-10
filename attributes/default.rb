#
# Cookbook Name:: chatsecure_jekyll
# Attributes:: default
#
# Copyright 2014, Chris Ballinger
#
# MIT License
#

# System
default['chatsecure_jekyll']['app_root']           = "/var/www/chatsecure-web"
default['chatsecure_jekyll']['log_dir']     	   = "/var/log/chatsecure-web/"

# Nginx
default['chatsecure_jekyll']['http_listen_port']    = 80
default['chatsecure_jekyll']['https_listen_port']   = 443
default['chatsecure_jekyll']['access_log']     		= "chatsecure_jekyll_nginx_access.log"
default['chatsecure_jekyll']['error_log']     		= "chatsecure_jekyll_nginx_error.log"
