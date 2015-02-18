#
# Cookbook Name:: build-cookbook
# Recipe:: default
#
# Copyright (C) Chef Software, Inc. 2015
#

# Ensure python is installed
include_recipe 'python'

# We use `s3cmd` to push the generated docs to S3
package 's3cmd'

# TODO: render the `.s3cfg-chef-docs` file for realz. For now we'll
# manually drop the file off on each of the builders
