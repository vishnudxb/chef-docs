=====================================================
Chef for Containers
=====================================================
.. note:: This page collections information about |chef| that is specific to using |chef| with containers.

.. include:: ../../includes_containers/includes_containers.rst

.. image:: ../../images/containers.png


Install the |chef client| on |linux| containers
=====================================================
.. include:: ../../includes_containers/includes_containers_chef_container.rst

Using |chef container| with |docker|
-----------------------------------------------------
.. include:: ../../includes_containers/includes_containers_docker.rst

.. image:: ../../images/containers_docker.png

.. include:: ../../includes_containers/includes_containers_docker_chef.rst

.. image:: ../../images/containers_docker_chef.png

.. Install using |dockerfile|
.. +++++++++++++++++++++++++++++++++++++++++++++++++++++
.. .. include:: ../../includes_containers/includes_containers_docker_install.rst
..
.. Using LXC
.. =====================================================
.. .. include:: ../../includes_containers/includes_containers_lxc.rst
.. 
.. .. image:: ../../images/containers_lxc.png
.. 


Knife
=====================================================

knife-container
-----------------------------------------------------
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container.rst

Install this plugin
+++++++++++++++++++++++++++++++++++++++++++++++++++++
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_install.rst

container docker build
+++++++++++++++++++++++++++++++++++++++++++++++++++++
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_build.rst

Syntax
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_build_syntax.rst

Options
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_build_options.rst

container docker init
+++++++++++++++++++++++++++++++++++++++++++++++++++++
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_init.rst

Syntax
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_init_syntax.rst

Options
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. include:: ../../includes_plugin_knife/includes_plugin_knife_container_docker_init_options.rst

Examples
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
**Create a Dockerfile**

.. include:: ../../step_plugin_knife/step_plugin_knife_container_docker_init_create_dockerfile.rst

Resources
=====================================================

container_service
-----------------------------------------------------
.. include:: ../../includes_resources/includes_resource_container_service.rst

Syntax
+++++++++++++++++++++++++++++++++++++++++++++++++++++
.. include:: ../../includes_resources/includes_resource_container_service_syntax.rst

Actions
+++++++++++++++++++++++++++++++++++++++++++++++++++++
.. include:: ../../includes_resources/includes_resource_container_service_actions.rst

Attributes
+++++++++++++++++++++++++++++++++++++++++++++++++++++
.. include:: ../../includes_resources/includes_resource_container_service_attributes.rst

Providers
+++++++++++++++++++++++++++++++++++++++++++++++++++++
.. include:: ../../includes_resources/includes_resource_container_service_providers.rst

Examples
+++++++++++++++++++++++++++++++++++++++++++++++++++++
|generic resource statement|

**Start apachectl in a container**

.. include:: ../../step_resource/step_resource_container_service_start_apachectl.rst



For more information ...
=====================================================
For more information about containers:


