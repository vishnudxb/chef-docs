#
# Cookbook Name:: build-cookbook
# Recipe:: deploy
#
# Copyright (C) Chef Software, Inc. 2015
#

# chef-docs only uses the 'delivered' stage in the "Production Triple".
if node['delivery_builder']['change']['stage'] == 'delivered'

  promotion_command = [
    's3cmd cp',
    '--acl-public',
    '--config ~/.s3cfg-chef-docs',
    '--add-header "Cache-Control: max-age=900"',
    's3://chef-docs-staging/',
    's3://chef-docs/',
  ].join(' ')

  execute 'promote docs' do
    command promotion_command
    cwd node['delivery_builder']['repo']
    user node['delivery_builder']['build_user']
  end

  log "Change has been deployed to https://docs.chef.io/"

else

  log %Q( Deploy is no-op in '#{node['delivery_builder']['change']['stage']}' as chef-docs only uses the 'delivered' stage of Delivery's production triple. )

end
