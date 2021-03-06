.. The contents of this file are included in multiple topics.
.. This file should not be changed in a way that hinders its ability to appear in multiple documentation sets.

Cookbook testing uses `bundler <http://gembundler.com/>`_, `Berkshelf <http://berkshelf.com/>`_, and `Rake <https://github.com/ruby/rake>`_ to run tests. Tests are defined using a Rakefile and StackForge's Jenkins gates on them.

To run tests from the cookbook directory:

.. code-block:: bash

   $ bundle install --path=.bundle # install gem dependencies
   $ bundle exec berks vendor .cookbooks # install cookbook dependencies
   $ bundle exec rake e # run tests
