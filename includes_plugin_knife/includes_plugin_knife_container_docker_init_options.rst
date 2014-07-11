.. The contents of this file are included in multiple topics.
.. This file describes a command or a sub-command for Knife.
.. This file should not be changed in a way that hinders its ability to appear in multiple documentation sets.


This argument has the following options:

``-b``, ``--berksfile``
   Use to generate a |berksfile| based on the run-list specified by the ``--run-list`` option. This option requires |berkshelf| be present on the same machine.

``--cookbook-path PATH[:PATH]``
   The directory in which cookbooks are located. This may be a colon-separated path.

``-d DOCKERFILES_PATH``, ``--force DOCKERFILES_PATH``
    Use to specify the path to the folder in which |dockerfile| contexts are located.

``--environments-path PATH[:PATH]``
   The directory in which environments are located. This may be a colon-separated path.

``-f [NAMESPACE/]IMAGE[:TAG]``, ``--from [NAMESPACE/]IMAGE[:TAG]``
   Use to specify the image to use as the base image. This image is then tagged and applied as the ``FROM`` value in the |dockerfile|.  The default value is ``chef/ubuntu-12.04:latest``. Currently, this value must be an image made available via the `Chef Docker Hub account <https://registry.hub.docker.com/repos/chef/>`

``--include-credentials``
    Use to specify you wish to include secure credentials (validator, encrypted_data_bag_secret, trusted_certs) in the Docker image.

    By default, those files are deleted after the ``knife container docker build`` process. In order for the resulting image to launch properly the secure credentials must be mounted into the ``/etc/chef/secure`` directory. This means that on the node hosting your |docker| engine, you must copy the necessary credentials into a folder on your host machine and mount them into the container using the ``-v`` flag of the ``docker run`` command: https://docs.docker.com/reference/commandline/cli/#run.

    For example, if you placed all your secure credentials into the ``/etc/chef-container/secure`` folder on your |docker| host, you could run this command:

    .. code-block:: bash
        $ docker run -d -v /etc/chef-container/secure:/etc/chef/secure:ro NAMESPACE/IMAGE

``--node-path PATH[:PATH]``
   The directory in which nodes are located. This may be a colon-separated path.

``-r RUN_LIST``, ``--run-list RUN_LIST``
   |run-list|

``--role-path PATH[:PATH]``
   The directory in which roles are located. This may be a colon-separated path.

``--server-url URL``
   |url chef_server|

``--secret-file PATH``
  The path to the file that contains the encryption key.

``--trusted-certs-dir PATH``
  The path to the directory where your trusted certificates are stored.

``--validation-client-name NAME``
   The name of the validation client, typically a client named |chef validator|.

``--validation-key PATH``
   The path to the validation key used by the client, typically a file named |chef validator pem|.

``-z``, ``--local-mode``
   |local_mode| This will include and use a local |chef repo| when building the |docker| image.
