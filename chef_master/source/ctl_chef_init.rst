=====================================================
chef-init (executable)
=====================================================

The ``chef-init`` command is used by |chef container| to provide an entrypoint into a container.

This command has the following options:

``--bootstrap``
  Use to run the chef-client a single time and then exit, causing the container to stop.

``--on-boot``
  Use to run the chef-client a single time but keep the container alive until told to stop.

``--verify``
  Use to verify that ``chef-init`` is function correctly.
