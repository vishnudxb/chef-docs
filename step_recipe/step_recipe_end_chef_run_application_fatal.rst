.. This is an included how-to. 


A |chef client| run is stopped after a fatal message is sent to the logger and ``STDERR``. For example:

.. note:: This is almost never what you want and should only be used when the other methods of ending a chef-client run are not applicable.
  Chef::Application.fatal!  is used within the Chef code itself, but is not an example of typical expected recipe usage.

.. code-block:: ruby

   Chef::Application.fatal!("log_message", error_code) if condition

where ``condition`` defines when a ``log_message`` and an (optional) ``error_code`` are sent to the logger and ``STDERR``, after which the |chef client| will exit.
The optional error codes have no predefinition and can be assigned meaning by the developer. This might be useful for logfile analysis.

.. note:: This approach should be used carefully when the |chef client| is run as a daemonized service. Some services---such as a runit service---should restart, but others---such as init.d services---likely will not.
