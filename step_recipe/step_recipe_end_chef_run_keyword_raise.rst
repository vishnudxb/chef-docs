.. This is an included how-to. 

In certain situations it may be useful to stop a |chef client| run
entirely by using an unhandled exception. The ``fail`` and ``raise``
methods can be used to stop a |chef client| run in both the compile and execute phases.
For the purposes of exception generation and handling, please consider
``fail`` and ``raise`` as synonyms.

Use the ``raise`` keyword in a recipe---but outside of any resource blocks---to trigger an unhandled exception during the compile phase. For example:

.. code-block:: ruby

   file '/tmp/name_of_file' do
     action :create
   end
   
   raise "message" if node['platform'] == 'windows'
   
   package 'name_of_package' do
     action :install
   end

where ``node['platform'] == 'windows'`` is the condition that will trigger the unhandled exception.

Use the ``raise`` keyword in the |resource ruby_block| resource to trigger an unhandled exception during the execute phase. For example:

.. code-block:: ruby

   ruby_block "name" do
     block do
       # Ruby code with a condition, e.g. if ::File.exist?(::File.join(path, "/tmp"))
       raise "message"  # e.g. "Ordering issue with file path, expected foo"
     end
   end

For both of the above, you should always ``raise`` with a message and
may optionally want to ``raise`` a custom exception, like the
following example illustrates

.. code-block:: ruby

class MyCustomError < StandardError
end
 
raise MyCustomError, "I am a custom exception"

Other possible errors to raise could include errors from the chef-client custom exceptions list

https://github.com/opscode/chef/blob/11-stable/lib/chef/exceptions.rb
