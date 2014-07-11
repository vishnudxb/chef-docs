=====================================================
|chef| for Containers
=====================================================

.. include:: ../../includes_containers/includes_containers.rst

.. image:: ../../images/containers.png

.. include:: ../../includes_containers/includes_containers_lxc.rst

|chef container|
=====================================================
.. include:: ../../includes_containers/includes_containers_chef_container.rst

Using |chef container| with secure credentials
-----------------------------------------------------
Best practice is to not keep secure credentials like private keys, secrets and certificates in |docker| images. That is why the default behavior for |knife container| is to delete those files at the completion of the image build. The process for mounting or otherwise making those credentials available to the |chef client| varies per containerization solution.

Credential Management with |Docker|
+++++++++++++++++++++++++++++++++++++++++++++++++++++
By default, secure credentials are deleted after the ``knife container docker build`` process. In order for the resulting image to launch properly the secure credentials must be mounted into the ``/etc/chef/secure`` directory. This means that on the node hosting your |docker| engine, you must copy the necessary credentials into a folder on your host machine and mount them into the container using the ``-v`` flag of the ``docker run`` command: https://docs.docker.com/reference/commandline/cli/#run.

For example, if you placed all your secure credentials into the ``/etc/chef-container/secure`` folder on your |docker| host, you could run this command:

.. code-block:: bash
    $ docker run -d -v /etc/chef-container/secure:/etc/chef/secure:ro NAMESPACE/IMAGE

|chef| for Docker
=====================================================
.. include:: ../../includes_containers/includes_containers_docker.rst

.. image:: ../../images/containers_docker.png

.. include:: ../../includes_containers/includes_containers_docker_chef.rst

.. image:: ../../images/containers_docker_chef.png

|dockerfile|
-----------------------------------------------------
.. include:: ../../includes_containers/includes_containers_docker_dockerfile.rst

..
.. Using LXC
.. =====================================================
.. .. include:: ../../includes_containers/includes_containers_lxc.rst
..
.. .. image:: ../../images/containers_lxc.png
..


|subcommand knife container|
=====================================================
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container.rst

Install this plugin
-----------------------------------------------------
.. include:: ../../step_plugin_knife/step_plugin_knife_container_install_rubygem.rst

docker build
-----------------------------------------------------
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_build.rst

Syntax
+++++++++++++++++++++++++++++++++++++++++++++++++++++
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_build_syntax.rst

Options
+++++++++++++++++++++++++++++++++++++++++++++++++++++
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_build_options.rst

docker init
-----------------------------------------------------
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_init.rst

Syntax
+++++++++++++++++++++++++++++++++++++++++++++++++++++
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_init_syntax.rst

Options
+++++++++++++++++++++++++++++++++++++++++++++++++++++
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_init_options.rst

Examples
+++++++++++++++++++++++++++++++++++++++++++++++++++++
**Initializing a |docker| container using local-mode**

.. include:: ../../step_plugin_knife/step_plugin_knife_container_docker_init_local_mode.rst

**Initializing a |docker| container using server-mode**

.. include:: ../../step_plugin_knife/step_plugin_knife_container_docker_init_server_mode.rst


Container Services
=====================================================
.. include:: ../../includes_containers/includes_containers_container_service_attributes.rst
