.. The contents of this file are included in multiple topics.
.. This file describes a command or a sub-command for Knife.
.. This file should not be changed in a way that hinders its ability to appear in multiple documentation sets.


.. Containers are an approach to virtualization that allow a single operating system to host many working configurations, with each working configuration running as a process that is isolated from all other processes, including even the host operating system. Each container comprises a working configuration---or application---and all of its dependencies that are not already available from the host operating system or from another container that is also running on the host operating system.

A Linux container is an approach to virtualization that eliminates the need for a hypervisor by leveraging a Linux kernel featured called |control groups|. |control groups| allow a Linux operating system to isolate CPU, memory, network, file system volumes and process into a userspace commonly referred to as a "container." This approach to virtualization allows a single operating system to host many working configurations, with each working configuration running in isolation from the other containers and the host itself, without the bloat of a hypervisor or guest operating system. Each container comprises a working configuration---or application---and all of its dependencies that are not already available from the host operationg system or from another conttainer.


