=====================================================
|chef analytics_title| Zookeeper Troubleshooting
=====================================================

This topic relates troubleshooting steps for the |chef analytics| Zookeeper component.

If your |chef analytics| server suddenly stops ingesting actions from the configured Chef Server,
especially after a disk space full incident on the |chef analytics| datastore filesystem, check
the following.

1. If you inspect the Zookeeper logfile on the |chef analytics| system

   .. code-block:: bash

      less /var/log/opscode-analytics/zookeeper/current

   and see a logfile pattern like
    
   .. code-block:: bash

      2015-03-18_21:49:09.21424 2015-03-18 21:49:09,149 [myid:] - INFO  [main:NIOServerCnxnFactory@94] - binding to port 0.0.0.0/0.0.0.0:2181
      2015-03-18_21:49:10.16411 2015-03-18 21:49:10,163 [myid:] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxnFactory@197] - Accepted socket connection from /127.0.0.1:32842
      2015-03-18_21:49:10.16790 2015-03-18 21:49:10,167 [myid:] - WARN  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxn@362] - Exception causing close of session 0x0 due to java.io.IOException: ZooKeeperServer not running
      2015-03-18_21:49:10.16809 2015-03-18 21:49:10,167 [myid:] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxn@1007] - Closed socket connection for client /127.0.0.1:32842 (no session established for client)
      2015-03-18_21:49:10.29133 2015-03-18 21:49:10,291 [myid:] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxnFactory@197] - Accepted socket connection from /127.0.0.1:32843
      2015-03-18_21:49:10.29159 2015-03-18 21:49:10,291 [myid:] - WARN  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxn@362] - Exception causing close of session 0x0 due to java.io.IOException: ZooKeeperServer not running
      2015-03-18_21:49:10.29171 2015-03-18 21:49:10,291 [myid:] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxn@1007] - Closed socket connection for client /127.0.0.1:32843 (no session established for client)
      2015-03-18_21:49:12.28548 2015-03-18 21:49:12,284 [myid:] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxnFactory@197] - Accepted socket connection from /127.0.0.1:32847
      2015-03-18_21:49:12.28550 2015-03-18 21:49:12,285 [myid:] - WARN  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxn@362] - Exception causing close of session 0x0 due to java.io.IOException: ZooKeeperServer not running
      2015-03-18_21:49:12.28550 2015-03-18 21:49:12,285 [myid:] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxn@1007] - Closed socket connection for client /127.0.0.1:32847 (no session established for client)
      2015-03-18_21:49:12.46510 2015-03-18 21:49:12,464 [myid:] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxnFactory@197] - Accepted socket connection from /127.0.0.1:32848
      2015-03-18_21:49:12.46511 2015-03-18 21:49:12,464 [myid:] - WARN  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxn@362] - Exception causing close of session 0x0 due to java.io.IOException: ZooKeeperServer not running
      2015-03-18_21:49:12.46512 2015-03-18 21:49:12,464 [myid:] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxn@1007] - Closed socket connection for client /127.0.0.1:32848 (no session established for client)
      2015-03-18_21:49:12.54214 2015-03-18 21:49:12,541 [myid:] - ERROR [main:Util@239] - Last transaction was partial.
      2015-03-18_21:49:12.54472 2015-03-18 21:49:12,542 [myid:] - ERROR [main:ZooKeeperServerMain@63] - Unexpected exception, exiting abnormally
      2015-03-18_21:49:12.54473 java.io.EOFException
      2015-03-18_21:49:12.54473       at java.io.DataInputStream.readInt(DataInputStream.java:392)
      2015-03-18_21:49:12.54473       at org.apache.jute.BinaryInputArchive.readInt(BinaryInputArchive.java:63)
      2015-03-18_21:49:12.54473       at org.apache.zookeeper.server.persistence.FileHeader.deserialize(FileHeader.java:64)
      2015-03-18_21:49:12.54473       at org.apache.zookeeper.server.persistence.FileTxnLog$FileTxnIterator.inStreamCreated(FileTxnLog.java:576)
      2015-03-18_21:49:12.54474       at org.apache.zookeeper.server.persistence.FileTxnLog$FileTxnIterator.createInputArchive(FileTxnLog.java:595)
      2015-03-18_21:49:12.54474       at org.apache.zookeeper.server.persistence.FileTxnLog$FileTxnIterator.goToNextLog(FileTxnLog.java:561)
      2015-03-18_21:49:12.54474       at org.apache.zookeeper.server.persistence.FileTxnLog$FileTxnIterator.next(FileTxnLog.java:643)
      2015-03-18_21:49:12.54474       at org.apache.zookeeper.server.persistence.FileTxnSnapLog.restore(FileTxnSnapLog.java:158)
      2015-03-18_21:49:12.54475       at org.apache.zookeeper.server.ZKDatabase.loadDataBase(ZKDatabase.java:223)

2. Then the datastore for Zookeeper is corrupt according to `Apache Zookeeper <http://zookeeper.apache.org/doc/r3.3.1/zookeeperAdmin.html#sc_troubleshooting>`_.
   Go ahead and clean up.

3. Please shutdown the |chef analytics| system

   .. code-block:: bash

      opscode-analytics-ctl stop

4. Then, throw away the zookeeper data like this

   .. code-block:: bash

      rm -fr /var/opt/opscode-analytics/zookeeper/data/version-2/*

5. Start back up

   .. code-block:: bash

      opscode-analytics-ctl start

After the above are complete you should not see the errors in the zookeeper logfile and you should also
see the Alaska service able to make a connection to the rabbitmq `/analytics/alaska` queue back on the |chef server|.

On the |chef server| if you see an "actions" user connected to rabbitmq, that connection is coming from the |chef analytics| system.
You know then that Zookkeeper is running, and that the Alaska service is running
and has connected back to the |chef server| as that "actions" user and will ingest messages for display in |chef analytics|.

You can check out the "actions" user connection on the |chef server| with

   .. code-block:: bash

      export PATH=/opt/opscode/embedded/bin:$PATH
      rabbitmqctl list_connections

      Listing connections ...
      actions	33.33.33.3	59870	running
      chef	33.33.33.9	41501	running
      chef	33.33.33.9	47757	running
      chef	33.33.33.9	56086	running
      chef	33.33.33.9	56087	running
      chef	33.33.33.9	56088	running
      chef	33.33.33.9	56089	running
      ...done.

Back on the |chef analytics| system, a good startup of the Alaska service in `/var/log/opscode-analytics/alaska/current` looks like

  .. code-block:: bash

      2015-03-19_21:34:32.81899 ok: run: zookeeper: (pid 5128) 4041s
      2015-03-19_21:34:33.52351 chef_analytics [INFO] ----------------------------------------------------------
      2015-03-19_21:34:33.52354 chef_analytics [INFO] Chef Analytics pipeline
      2015-03-19_21:34:33.52355 chef_analytics [INFO] Copyright 2014 Chef Software, Inc., formerly, Opscode Inc.
      2015-03-19_21:34:33.52357 chef_analytics [INFO] ----------------------------------------------------------
      2015-03-19_21:34:33.54686 chef_analytics [INFO] Loading config[/var/opt/opscode-analytics/storm/topology/alaska/alaska.conf]
      2015-03-19_21:34:33.56644 chef_analytics [INFO] Loaded schema [http_notification-0.0.1]
      2015-03-19_21:34:33.56680 chef_analytics [INFO] Loaded schema [smtp_notification-0.1.0]
      2015-03-19_21:34:33.57100 chef_analytics [INFO] Loaded schema [run_control-0.1.1]
      2015-03-19_21:34:33.57103 chef_analytics [INFO] Loaded schema [run_start-0.1.0]
      2015-03-19_21:34:33.57104 chef_analytics [INFO] Loaded schema [run_control_group-0.1.1]
      2015-03-19_21:34:33.57104 chef_analytics [INFO] Loaded schema [action-0.1.1]
      2015-03-19_21:34:33.57105 chef_analytics [INFO] Loaded schema [http_notification-0.1.0]
      2015-03-19_21:34:33.57106 chef_analytics [INFO] Loaded schema [pipeline_config-0.1.1]
      2015-03-19_21:34:33.57106 chef_analytics [INFO] Loaded schema [hipchat_notification-0.1.0]
      2015-03-19_21:34:33.57107 chef_analytics [INFO] Loaded schema [control_groups-0.1.0]
      2015-03-19_21:34:33.57107 chef_analytics [INFO] Loaded schema [hipchat_notification-0.0.1]
      2015-03-19_21:34:33.57108 chef_analytics [INFO] Loaded schema [control_groups-0.1.1]
      2015-03-19_21:34:33.57108 chef_analytics [INFO] Loaded schema [run_control_group-0.1.0]
      2015-03-19_21:34:33.57187 chef_analytics [INFO] Loaded schema [action-0.1.0]
      2015-03-19_21:34:33.57232 chef_analytics [INFO] Loaded schema [pipeline_egress-0.1.0]
      2015-03-19_21:34:33.57305 chef_analytics [INFO] Loaded schema [run_converge-0.1.0]
      2015-03-19_21:34:33.57329 chef_analytics [INFO] Loaded schema [run_control-0.1.0]
      2015-03-19_21:34:33.57376 chef_analytics [INFO] Loaded schema [run_resource-0.1.0]
      2015-03-19_21:34:34.27217 chef_analytics [INFO] Config ok
      2015-03-19_21:34:34.30079 chef_analytics [INFO] Configuring Graphite metrics via UDP
      2015-03-19_21:34:34.30937 chef_analytics [INFO] Started Graphite metrics reporting
      2015-03-19_21:34:34.37234 chef_analytics [INFO] Topology name: chef_analytics_pipeline_0-2-28
      2015-03-19_21:34:34.37238 chef_analytics [INFO] Running local topo
      2015-03-19_21:31:11.58057 chef_analytics [INFO] Preparing metrics hook for action_spout
      2015-03-19_21:31:11.62506 chef_analytics [INFO] Preparing metrics hook for actions_rule_engine_bolt
      2015-03-19_21:31:11.65001 chef_analytics [INFO] Preparing metrics hook for config_bolt
      2015-03-19_21:31:11.67106 chef_analytics [INFO] Preparing metrics hook for controls_rule_engine_bolt
      2015-03-19_21:31:11.69622 chef_analytics [INFO] Preparing metrics hook for egress_bolt
      2015-03-19_21:31:11.71801 chef_analytics [INFO] Preparing metrics hook for error_bolt
      2015-03-19_21:31:11.72892 chef_analytics [INFO] Preparing metrics hook for http_bolt
      2015-03-19_21:31:11.75243 chef_analytics [INFO] Preparing metrics hook for json_extraction_bolt
      2015-03-19_21:31:11.79425 chef_analytics [INFO] Preparing metrics hook for notification_bolt
      2015-03-19_21:31:11.80668 chef_analytics [INFO] Preparing metrics hook for notifier_config_spout
      2015-03-19_21:31:11.84040 chef_analytics [INFO] Preparing metrics hook for rabbitmq_publish_bolt
      2015-03-19_21:31:11.87711 chef_analytics [INFO] Preparing metrics hook for resources_rule_engine_bolt
      2015-03-19_21:31:11.91241 chef_analytics [INFO] Preparing metrics hook for __system
      2015-03-19_21:31:11.94101 chef_analytics [INFO] Preparing metrics hook for __acker

Any events you have waiting in the `/analytics/alaska` queue should quickly drain and show up in the |chef analytics| console.
An example of a message being processed successfully by the Alaska service in the same logfile looks like this

  .. code-block:: bash

      analytics.alaska_pipeline.AlaskaPipeline --schemadir /opt/opscode-analytics/embedded/docs/schema --standalonezk --alaskaconfig /var/opt/opscode-analytics/storm/topology/alaska/alaska.conf
      2015-03-16_15:59:23.48849 chef_analytics [INFO] json_extraction_bolt - 3ab6a680-06fd-4a91-b3f1-8481700635c6 validating message
      2015-03-16_15:59:23.48856 chef_analytics [INFO] json_extraction_bolt Message contains a valid ID, replacing ID 3ab6a680-06fd-4a91-b3f1-8481700635c6 with d831b7c6-adee-43df-9e8c-6bf54111cb7f
      2015-03-16_15:59:23.48857 chef_analytics [INFO] json_extraction_bolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f emitting message to simple_rules
      2015-03-16_15:59:23.48857 chef_analytics [INFO] json_extraction_bolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f acknowledging message
      2015-03-16_15:59:23.48858 chef_analytics [INFO] SimpleRuleEngineBolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f received message
      2015-03-16_15:59:23.48858 chef_analytics [INFO] SimpleRuleEngineBolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f emitting message to erchef
      2015-03-16_15:59:23.48859 chef_analytics [INFO] SimpleRuleEngineBolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f acknowledging message
      2015-03-16_15:59:23.48859 chef_analytics [INFO] egress_bolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f received message
      2015-03-16_15:59:23.48860 chef_analytics [INFO] egress_bolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f validating egress message
      2015-03-16_15:59:23.48861 chef_analytics [INFO] egress_bolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f emitting message to erchef
      2015-03-16_15:59:23.48861 chef_analytics [INFO] egress_bolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f acknowledging message
      2015-03-16_15:59:23.48863 chef_analytics [INFO] http_bolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f received message
      2015-03-16_15:59:23.48863 chef_analytics [INFO] http_bolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f preparing message for sending
      2015-03-16_15:59:23.48864 chef_analytics [INFO] http_bolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f posting message
      2015-03-16_15:59:23.49767 chef_analytics [INFO] http_bolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f successfully posted message to endpoint
      2015-03-16_15:59:23.49769 chef_analytics [INFO] http_bolt - d831b7c6-adee-43df-9e8c-6bf54111cb7f acknowledging message
      2015-03-16_15:59:23.50477 chef_analytics [INFO] json_extraction_bolt - 2e7c0c70-028f-4765-b168-f38a8a15ac59 received message {"message_type":"action","message_version":"0.1.1","organization_name":"testsean","service_hostname":"centos-6.3","recorded_at":"2015-03-13T15:49:51Z","remote_hostname":"33.33.33.1","request_id":"g3IAA2QAEGVyY2hlZkAxMjcuMC4wLjEDAACdPQAAAAAAAAAA","requestor_name":"sean_horn","requestor_type":"user","user_agent":"Chef Knife/12.0.3 (ruby-2.1.1-p76; ohai-8.0.1; x86_64-darwin12.0; +http://opscode.com)","id":"b0d60543-e2da-4d14-a74d-6d84a92eab26","task":"create","entity_type":"item","entity_name":"seanitem9","parent_type":"bag","parent_name":"seanbag","remote_request_id":"ec2405c8-7cbf-42a7-93d4-56047182182f","data":{"id":"seanitem9"}}
      2015-03-16_15:59:23.50480 chef_analytics [INFO] json_extraction_bolt - 2e7c0c70-028f-4765-b168-f38a8a15ac59 validating message
      2015-03-16_15:59:23.50760 chef_analytics [INFO] json_extraction_bolt Message contains a valid ID, replacing ID 2e7c0c70-028f-4765-b168-f38a8a15ac59 with b0d60543-e2da-4d14-a74d-6d84a92eab26
      2015-03-16_15:59:23.50761 chef_analytics [INFO] json_extraction_bolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 emitting message to simple_rules
      2015-03-16_15:59:23.50762 chef_analytics [INFO] json_extraction_bolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 acknowledging message
      2015-03-16_15:59:23.50763 chef_analytics [INFO] SimpleRuleEngineBolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 received message
      2015-03-16_15:59:23.50764 chef_analytics [INFO] SimpleRuleEngineBolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 emitting message to erchef
      2015-03-16_15:59:23.50766 chef_analytics [INFO] SimpleRuleEngineBolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 acknowledging message
      2015-03-16_15:59:23.50870 chef_analytics [INFO] egress_bolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 received message
      2015-03-16_15:59:23.50872 chef_analytics [INFO] egress_bolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 validating egress message
      2015-03-16_15:59:23.50973 chef_analytics [INFO] egress_bolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 emitting message to erchef
      2015-03-16_15:59:23.50975 chef_analytics [INFO] egress_bolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 acknowledging message
      2015-03-16_15:59:23.50997 chef_analytics [INFO] http_bolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 received message
      2015-03-16_15:59:23.50999 chef_analytics [INFO] http_bolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 preparing message for sending
      2015-03-16_15:59:23.51030 chef_analytics [INFO] http_bolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 posting message
      2015-03-16_15:59:23.53049 chef_analytics [INFO] http_bolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 successfully posted message to endpoint
      2015-03-16_15:59:23.53050 chef_analytics [INFO] http_bolt - b0d60543-e2da-4d14-a74d-6d84a92eab26 acknowledging message
