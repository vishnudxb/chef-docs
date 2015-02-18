#
# Cookbook Name:: build-cookbook
# Library:: _helper
#
# Copyright (C) Chef Software, Inc. 2015
#

Chef::Resource.send(:include, Chef::Mixin::ShellOut)
