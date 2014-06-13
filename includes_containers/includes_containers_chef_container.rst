
|chef container| is a distribution of the |chef client| that includes components designed to support the unique requirements of running |chef client| in a |linux| container.

* |chef container| comes packaged with |chef client|, |runit| and |chef init|.
* The |chef client| is bootstrapped without needing an SSH connection.
* A resource dedicated to |linux| containers is built into |chef container|: |resource container_service|.
* A |knife| plugin dedicated to working with Linux containers is available: |subcommand knife docker| is used to manage |docker| image contexts.

The most popular core resources in the |chef client|---:doc:`cookbook_file </resource_cookbook_file>`, :doc:`directory </resource_directory>`, :doc:`env </resource_env>`, :doc:`execute </resource_execute>`, :doc:`file </resource_file>`, :doc:`group </resource_group>`, :doc:`http_request </resource_http_request>`, :doc:`link </resource_link>`, :doc:`mount </resource_mount>`, :doc:`package </resource_package>`, :doc:`remote_directory </resource_remote_directory>`, :doc:`remote_file </resource_remote_file>`, :doc:`ruby_block </resource_ruby_block>`, :doc:`service </resource_service>`, :doc:`template </resource_template>` , and :doc:`user </resource_user>`---work the same way in a |container| as they do on any |unix|- or |linux|-based platform.
