.. This is an included how-to. 


To initialize a new |dockerfile| context for an image named chef/demo with a run_list of ``recipe[apache2]``:

.. code-block:: bash

   $ knife container docker init docker -r recipe[apache2] -b -z

This will create a new folder ``docker`` with subfolder ``demo`` in ``Chef::Config[:knife][:dockerfiles_path]``. In ``docker``, we will create a directory named ``chef`` which will contain all the files and folder necessary for |chef-client| to run successfully inside your container. 

.. code-block:: ruby

   FROM chef/ubuntu_12.04
   ADD chef /etc/chef
   RUN chef-init --bootstrap
   ENTRYPOINT ["chef-init"]
   CMD ["--onboot"]

