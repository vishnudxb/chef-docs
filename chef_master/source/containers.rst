=====================================================
|chef| for Containers
=====================================================

.. include:: ../../includes_containers/includes_containers.rst

.. image:: ../../images/containers.png

.. include:: ../../includes_containers/includes_containers_lxc.rst

|chef container|
=====================================================
.. include:: ../../includes_containers/includes_containers_chef_container.rst

|chef| for Docker
=====================================================
.. include:: ../../includes_containers/includes_containers_docker.rst

.. image:: ../../images/containers_docker.png

.. include:: ../../includes_containers/includes_containers_docker_chef.rst

.. image:: ../../images/containers_docker_chef.png

Official |docker| Images
-----------------------------------------------------
Chef makes available |docker| images that  have |chef container| pre-installed on the `|docker| Hub <https://registry.hub.docker.com/repos/chef>`. The image names follow the format ``chef/{OS}-{OS_VERSION}:{CHEF_VERSION}``.
We are taking advantage of the |docker| tagging functionality to allow you to specify constraints on the ``CHEF_VERSION`` you wish to use.

.. list-table::
   :widths: 60 60 360
   :header-rows: 1

   * - Version Constraint
     - Example
     - Description
   * - ``:latest``
     - ``chef/ubuntu-12.04:latest``
     - This will give you latest release of |chef container|. This is the default if ``CHEF_VERSION`` is not specified.
   * - ``:MAJOR``
     - ``chef/ubuntu-12.04:11``
     - This will give you the |chef container| image with the latest patch release of |chef client| with the specified major version.
   * - ``:MAJOR.MINOR``
     - ``chef/ubuntu-12.04:11.8``
     - This will give you the |chef container| image with the latest patch release of |chef client| with the specified major and minor version.
   * - ``:MAJOR.MINOR.PATCH``
     - ``chef/ubuntu-12.04:11.8.2``
     - This will give you the |chef container| image with the specific version of |chef client| you requested.

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

**Install this plugin**

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
**Create a Dockerfile**

.. include:: ../../step_plugin_knife/step_plugin_knife_container_docker_init_create_dockerfile.rst

Container Services
=====================================================
.. include:: ../../includes_containers/includes_containers_container_service_attributes.rst
