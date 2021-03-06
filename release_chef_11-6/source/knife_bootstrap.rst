.. THIS PAGE DOCUMENTS chef-client version 11.6

=====================================================
knife bootstrap
=====================================================

.. include:: ../../includes_chef/includes_chef_bootstrap.rst

.. include:: ../../includes_knife/includes_knife_bootstrap.rst

.. note:: To bootstrap the |chef client| on |windows| machines, the `knife-windows <http://docs.chef.io/plugin_knife_windows.html>`_ plugins is required, which includes the necessary bootstrap scripts that are used to do the actual installation.

Syntax
=====================================================
.. include:: ../../includes_knife/includes_knife_bootstrap_syntax.rst

Options
=====================================================
.. note:: Review the list of :doc:`common options </knife_common_options>` available to this (and all) |knife| subcommands and plugins.

.. include:: ../../includes_knife/includes_knife_11-10_bootstrap_options.rst

.. note:: |note knife rb settings|

Custom Templates
=====================================================
.. include:: ../../includes_knife/includes_knife_11-16_bootstrap_template.rst

Template Locations
-----------------------------------------------------
.. include:: ../../includes_knife/includes_knife_11-16_bootstrap_template_location.rst

Ubuntu 12.04
-----------------------------------------------------
.. include:: ../../includes_knife/includes_knife_11-16_bootstrap_example_ubuntu.rst

Debian and Apt
-----------------------------------------------------
.. include:: ../../includes_knife/includes_knife_11-16_bootstrap_example_debian.rst

Microsoft Windows
-----------------------------------------------------
.. include:: ../../includes_knife/includes_knife_11-16_bootstrap_example_windows.rst

Examples
=====================================================
The following examples show how to use this |knife| subcommand:

**Bootstrap a node**

.. include:: ../../step_knife/step_knife_bootstrap_node.rst

**Use an SSH password**

.. include:: ../../step_knife/step_knife_bootstrap_use_ssh_password.rst

**Use a file that contains a private key**

.. include:: ../../step_knife/step_knife_bootstrap_use_file_with_private_key.rst

