.. The contents of this file are included in multiple topics.
.. This file should not be changed in a way that hinders its ability to appear in multiple documentation sets.

To set up the |reporting| server:

#. Contact |company_name| and get the package that is appropriate for your |chef server oec| server's platform and operating system
#. Install the package on the same machine that is running |chef server oec| 11.0.1 or higher. For example on |ubuntu|:

   .. code-block:: bash

      $ dpkg -i opscode-reporting_1.0.0-1.ubuntu.10.04_amd64.deb

#. This is a placeholder for the max_connections calculations 

   If you have more than two Frontends in your cluster, the attribute postgresql['max_connections'] should be adjusted upwards
   in your /etc/opscode/private-chef.rb file.  The final number will be based on the number of Frontend systems in the cluster.
   All Frontend servers will use the |reporting| server. The default for the postgresql['max_connections'] attribute is 350.
   If the default has already been modified to account for other Add-On installations, please use the modified number for
   Current max_connections in the example below. The defaults for bifrost, erchef, and reporting are 20, 20, and 25
   respectively. Each Frontend will have all three of those services running and add the same number of required connections
   to the total.

   The formula for Frontends looks like this

   .. code-block:: bash

      postgresql['max_connections'] = Current max_connections + ((Total number of frontends - 2) * (bifrost + erchef + reporting) )

   If you will run a Pushy server, you will need to run the following formula for the active backend.
   Pushy adds 20 connections to the total

   The formula for Backends looks like this

   .. code-block:: bash

      postgresql['max_connections'] = Current max_connections + pushy

   You can apply both of these calculations cumulatively if you are running both Reporting and Pushy, or either one alone
   depending on which Add-On packages you are running.
   The default configuration of 350 connections will handle both Reporting and Pushy installed on a 4 node HA cluster with
   no further customization.

#. Reconfigure the |chef server oec| server:

   .. code-block:: bash

      $ private-chef-ctl reconfigure

#. Reconfigure the |reporting| server:

   .. code-block:: bash

      $ opscode-reporting-ctl reconfigure

.. #. Restart the |reporting| components:
.. 
..    .. code-block:: bash
.. 
..       $ private-chef-ctl restart opscode-reporting

#. Verify the installation:

   .. code-block:: bash

      $ opscode-reporting-ctl test

