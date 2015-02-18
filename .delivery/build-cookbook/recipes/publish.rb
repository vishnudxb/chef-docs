#
# Cookbook Name:: build-cookbook
# Recipe:: publish
#
# Copyright (C) Chef Software, Inc. 2015
#

execute 'install deps' do
  command 'pip install -r requirements.txt'
  cwd node['delivery_builder']['repo']
  user node['delivery_builder']['build_user']
end

#
# We can't use a vanilla `execute` resource for a few reasons:
#
#   * chef-docs takes a long time to build so we must bump the default
#     timeout of the underlying `Mixlib::Shellout` instance.
#   * We want the build output to stream out to the console in real-time.
#
ruby_block 'build docs' do
  block do
    shell_out!(
      "make release PARALLEL_BUILD='-j #{node['cpu']['total']}'",
      cwd: node['delivery_builder']['repo'],
      user: node['delivery_builder']['build_user'],
      # Two hours
      timeout: 7200,
      live_stream: STDOUT,
    )
  end
end

execute 'stage docs' do
  command 'make upload'
  cwd node['delivery_builder']['repo']
  user node['delivery_builder']['build_user']
  environment(
    'S3BUCKET' => 'chef-docs-staging'
  )
end

log "Change has been staged at http://chef-docs-staging.s3-website-us-east-1.amazonaws.com/"
