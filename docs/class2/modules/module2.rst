Section 2 - Troubleshoot basic hardware issues
==============================================

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 2.01 Perform an End User Diagnostic per F5 documentation and collect the output
-------------------------------------------------------------------------------------------

|
|

**2.01 - Reboot an F5 platform into the EUD**

`http://support.f5.com/kb/en-us/products/big-ip\_ltm/releasenotes/related/EUD\_11\_4.html <http://support.f5.com/kb/en-us/products/big-ip_ltm/releasenotes/related/EUD_11_4.html>`__

You can run the EUD only from a console connected to the BIG-IP system.
You can start the EUD using the following methods:

-  Attach a USB CDROM drive containing the bootable system CD. As the
   system boots up, the EUD starts.

-  Attach a USB mass storage device drive with the EUD boot image
   loaded. As the system boots up, the EUD starts.

-  While the system is booting, select the End User Diagnostics option
   from the boot menu.

You can then run the tests that are necessary.

After you have completed the tests you want to run, use option 21 to
exit the EUD and reboot the system. You must use this option to exit the
EUD. Using other methods, such as rebooting or using the command menu,
can destabilize the system.

----

|

**2.01 - Download output from the unit an EUD was run on**

`http://support.f5.com/kb/en-us/products/big-ip\_ltm/releasenotes/related/EUD\_11\_4.html <http://support.f5.com/kb/en-us/products/big-ip_ltm/releasenotes/related/EUD_11_4.html>`__

An End User Diagnostic or EUD report log is stored as a text file named
eud.log in the /shared/log/ directory on the host file system.

If you have run an EUD Test on the system it will be available in this
location. You can connect to the console IP address of the BIG-IP system
and use and SCP tool to get the file off of the system, to upload to the
F5 Support case.

----

|

**2.01 - Interpret the output from an EUD and determine if the test
passed or failed**

`http://support.f5.com/kb/en-us/products/big-ip\_ltm/releasenotes/related/EUD\_11\_4.html <http://support.f5.com/kb/en-us/products/big-ip_ltm/releasenotes/related/EUD_11_4.html>`__

When all tests complete correctly, the following message displays:

*Completed test with 0 errors*.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 2.02 Interpret the LCD Warning Messages
---------------------------------------------------

|
|

**2.02 - Locate the LCD on an F5 Platform**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/platform-b5000/2.html
-
c\_reuse\_about\_lcd\_panel <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/platform-b5000/2.html#c_reuse_about_lcd_panel>`__

On the front of the platform, you can reset the unit using the LCD
control buttons. You can also use the front-panel LEDs to assess the
condition of the platform. On the back, you can power off the unit.

|

.. image:: /_static/201/p11.png


|

Front view of the 5000 platform

1. Management 10/100/1000 Ethernet port

2. USB ports

3. Console serial port

4. Serial (hard-wired) failover port

5. 10/100/1000 interfaces

6. 1G/10G optical ports

7. Indicator LEDs

8. LCD display

9. LCD control buttons

The liquid crystal display, or LCD panel, provides the ability to
control the unit without attaching a console or network cable.

|

.. image:: /_static/201/p12.png


|

The LCD panel is located on the front of all F5 hardware except for the
Viprion 2400 Series Chassis. A separate USB attachable LCD panel is
available for the Viprion 2400 Series Chassis.

----

|

**2.02 - Correlate the LCD message to message in the corresponding log
file**

`http://support.f5.com/kb/en-us/solutions/public/4000/200/sol4263.html <http://support.f5.com/kb/en-us/solutions/public/4000/200/sol4263.html>`__

Alert conditions

Alerts that affect the behavior of the Alarm LED indicator are defined
in the /etc/alertd/alert.conf file. The lcdwarn function of an alert
definition defines which alerts will modify the Alarm LED indicator.

As an example, the default alertd process conditions in BIG-IP version
9.2 are defined in the following table:

+---------------------------------+-----------------+----------------+
| Description                     | Alert Level     | LED behavior   |
+---------------------------------+-----------------+----------------+
| CPU Temp too high               | 3 - Critical    | Solid Red      |
+---------------------------------+-----------------+----------------+
| CPU fan too slow                | 3 - Critical    | Solid Red      |
+---------------------------------+-----------------+----------------+
| CPU fan bad                     | 3 - Critical    | Solid Red      |
+---------------------------------+-----------------+----------------+
| Chassis Temp too high           | 3 - Critical    | Solid Red      |
+---------------------------------+-----------------+----------------+
| Chassis Fan bad                 | 3 - Critical    | Solid Red      |
+---------------------------------+-----------------+----------------+
| Power Supply bad                | 4 - Emergency   | Blink Red      |
+---------------------------------+-----------------+----------------+
| Unit going standby              | 0 - Warning     | Solid Yellow   |
+---------------------------------+-----------------+----------------+
| Unit going Active               | 0 - Warning     | Solid Yellow   |
+---------------------------------+-----------------+----------------+
| The license validation failed   | 2 - Alert       | Solid Red      |
+---------------------------------+-----------------+----------------+
| The license has expired         | 2 - Alert       | Solid Red      |
+---------------------------------+-----------------+----------------+
| Blocking DoS attack             | 2 - Alert       | Solid Red      |
+---------------------------------+-----------------+----------------+
| Hard disk is failing            | 4 - Emergency   | Blink Red      |
+---------------------------------+-----------------+----------------+

The events that trigger LCD screen events and lights are written to log
files. You may want to look up more information on the logged events.
For example, the BIG-IP system may generate an error messages to the
/var/log/ltm file that contains the following event:

-  emerg system\_check[11277]: 010d0010:0: Power supply #2 fan-1: fan
   speed (0) is too low.

----

|

**2.02 - Identify which tasks the buttons on the LCD perform**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/pg-10200v/2.html - c\_reuse\_about\_lcd\_panel <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/pg-10200v/2.html#c_reuse_about_lcd_panel>`__

Pressing the X button puts the LCD panel in Menu. The buttons Left
Arrow, Right Arrow, Up Arrow, and Down Arrow are only functional when
the LCD is in Menu mode for navigation. The ✔ check button is used to
select and confirm selections.

Please refer to the Hyperlink to review the menu options available on
the LCD Panel

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 2.03 Identify a possible hardware issue within the log files
------------------------------------------------------------------------

|
|

**2.03 - Indicate which logs would contain debugging information**

`http://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/tmos-concepts-11-4-0/11.html <http://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-concepts-11-4-0/11.html>`__

If you are using the Syslog utility for local logging, whether or not
you are using the high-speed logging mechanism you can view and manage
the log messages, using the BIG-IP Configuration utility.

The local Syslog logs that the BIG-IP system can generate include
several types of information. For example, some logs show a timestamp,
host name, and service for each event. Moreover, logs sometimes include
a status code, while the audit log shows a user name and a transaction
ID corresponding to each configuration change. All logs contain a
one-line description of each event.

For local log messages that the BIG-IP system stores in the local Syslog
data base, the BIG-IP system automatically stores and displays log
messages in these categories:

-  System messages

-  Packet filter messages

-  Local Traffic messages

-  Global Traffic messages

-  BIG-IP system configuration (audit) messages

Each type of event is stored locally in a separate log file, and the
information stored in each log file varies depending on the event type.
All log files for these event types are in the directory /var/log.

The product specific logs like /var/log/ltm, var/log/gtm, etc will
contain debug info relative to that product. If you are logging from an
irule you can define what log file you want to write your debug info
into by specifying the local facility you chose.

----

|

**2.03 - Given a log file, determine the nature of a hardware issue**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/tmos-concepts-11-4-0/11.html
-
conceptid <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-concepts-11-4-0/11.html#conceptid>`__

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

You may look in the logs and see there are may events. Perhaps you
notice an event like this:

Mon Feb 14 o4:36:06 PST 2005 bigip2 bcm56xxd(785) 00010012 Link 2.5 is up

This could have been caused by the administrator turning up a new
interface or because the interface lost connectivity to the upstream
switch. Some events can be self-explanatory while others may be more
cryptic and need some deciphering.

**Understanding log content**

The logs that the BIG-IP system generates include several types of
information. For example, some logs show a timestamp, host name, and
service for each event. Moreover, logs sometimes include a status code,
while the audit log shows a user name and a transaction ID corresponding
to each configuration change. All logs contain a 1-line description of
each event.

The table below lists the categories of information contained in the
logs and the specific logs in which the information is displayed.

Log information categories and their descriptions

+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| Information Type   | Explanation                                                                                                                                                                           | Log Type        |
+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| Timestamp          | The time and date that the system logged the event message.                                                                                                                           | System          |
|                    |                                                                                                                                                                                       |                 |
|                    |                                                                                                                                                                                       | Packet Filter   |
|                    |                                                                                                                                                                                       |                 |
|                    |                                                                                                                                                                                       | Local Traffic   |
|                    |                                                                                                                                                                                       |                 |
|                    |                                                                                                                                                                                       | Audit           |
+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| Host name          | The host name of the system that logged the event message. Because this is typically the host name of the local machine, the appearance of a remote host name could be of interest.   | System          |
|                    |                                                                                                                                                                                       |                 |
|                    |                                                                                                                                                                                       | Packet Filter   |
|                    |                                                                                                                                                                                       |                 |
|                    |                                                                                                                                                                                       | Local Traffic   |
+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| Service            | The service that generated the event.                                                                                                                                                 | System          |
|                    |                                                                                                                                                                                       |                 |
|                    |                                                                                                                                                                                       | Packet Filter   |
|                    |                                                                                                                                                                                       |                 |
|                    |                                                                                                                                                                                       | Local Traffic   |
+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| Status code        | The status code associated with the event. Note that only events logged by BIG-IP system components, and not Linux system services, have status codes.                                | Packet Filter   |
|                    |                                                                                                                                                                                       |                 |
|                    |                                                                                                                                                                                       | Local Traffic   |
+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| Description        | The description of the event that caused the system to log the message.                                                                                                               | System          |
|                    |                                                                                                                                                                                       |                 |
|                    |                                                                                                                                                                                       | Packet Filter   |
|                    |                                                                                                                                                                                       |                 |
|                    |                                                                                                                                                                                       | Local Traffic   |
+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| User Name          | The name of the user who made the configuration change.                                                                                                                               | Audit           |
+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| Transaction ID     | The identification number of the configuration change.                                                                                                                                | Audit           |
+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+
| Event              | A description of the configuration change that caused the system to log the message.                                                                                                  | Audit           |
+--------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------+

----

|

**2.03 - Given a possible issue, determine which log file entries to review**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/tmos-concepts-11-4-0/11.html - conceptid <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-concepts-11-4-0/11.html#conceptid>`__

Viewing and managing log messages are an important part of maintaining a
BIG-IP system. Log messages inform you on a regular basis of the events
that are happening on the system. Some of these events pertain to
general events happening within the operating system, while other events
are specific to the BIG-IP system, such as the stopping and starting of
BIG-IP system services.

The mechanism that the BIG-IP system uses to log events is the Linux
utility syslog-ng. The syslog-ng utility is an enhanced version of the
standard UNIX and Linux logging utility syslog.

The types of events that the BIG-IP system logs are:

**System events**

System event messages are based on Linux events, and are not specific to
the BIG-IP system.

**Packet filter events**

Packet filter messages are those that result from the implementation of
packet filters and packet-filter rules.

**Local traffic events**

Local-traffic event messages pertain specifically to the local traffic
management system.

**Audit events**

Audit event messages are those that the BIG-IP system logs as a result
of changes to the BIG-IP system configuration. Logging audit events is
optional.

To configure and manage event logging, log in to the BIG-IP
Configuration utility, and on the Main tab, expand System, and click
Logs.

As described in Introducing BIG-IP system logging, the BIG-IP system
automatically logs four main event types: system, packet filter, local
traffic, and configuration changes (audit). Each type of event is stored
in a separate log file, and the information stored in each log file
varies depending on the event type. All log files for these event types
are in the directory /var/log.

**Logging system events**

Many events that occur on the BIG-IP system are Linux-related events,
and do not specifically apply to the BIG-IP system.

Using the Configuration utility, you can display these system messages.
The table below shows some sample system log entries.

Sample system log entries

+--------------------------------+----------+-------------------+--------------------------------------------------+
| Timestamp                      | Host     | Service           | Event                                            |
+--------------------------------+----------+-------------------+--------------------------------------------------+
| Mon Feb 14 03:34:45 PST 2005   | bigip3   |                   |                                                  |
|                                |          |                   |                                                  |
|                                |          | syslog-ng[5494]   | new configuration initialized                    |
+--------------------------------+----------+-------------------+--------------------------------------------------+
| Mon Feb 14 03:35:06 PST 2005   | bigip3   | syslog-ng[5494]   | kjournald starting. Commit interval 5 seconds.   |
+--------------------------------+----------+-------------------+--------------------------------------------------+
| Mon Feb 14 04:38:06 PST 2005   | bigip3   | EXT3-fs           | mounted filesystem with ordered data mode.       |
+--------------------------------+----------+-------------------+--------------------------------------------------+

**Logging packet filter events**

Some of the events that the BIG-IP system logs are related to packet
filtering. The system logs the messages for these events in the file
/var/log/pktfilter.

Using the Configuration utility, you can display these packet filter
messages.

**Logging local traffic events**

Many of the events that the BIG-IP system logs are related to local area
traffic passing through the BIG-IP system. The BIG-IP system logs the
messages for these events in the file /var/log/ltm.

Using the Configuration utility, you can display these local-traffic
messages. The table below shows some sample local-traffic log entries.

Sample local-traffic log entries

+--------------------------------+----------+-----------------+---------------+------------------------------------------------+
| Timestamp                      | Host     | Service         | Status Code   | Event                                          |
+--------------------------------+----------+-----------------+---------------+------------------------------------------------+
| Mon Feb 14 03:34:45 PST 2005   | bigip2   |                 | 00010013      |                                                |
|                                |          |                 |               |                                                |
|                                |          | bcm56xxd(785)   |               | Starting packet registry event timer           |
+--------------------------------+----------+-----------------+---------------+------------------------------------------------+
| Mon Feb 14 03:35:06 PST 2005   | bigip2   | bcm56xxd(785)   | 00010013      | Starting HA heartbeat timer tick               |
+--------------------------------+----------+-----------------+---------------+------------------------------------------------+
| Mon Feb 14 04:38:06 PST 2005   | bigip2   | bcm56xxd(785)   | 00010013      | Successful start. Entering main message loop   |
+--------------------------------+----------+-----------------+---------------+------------------------------------------------+
| Mon Feb 14 o4:36:06 PST 2005   | bigip2   | bcm56xxd(785)   | 00010012      | Link 2.5 is up                                 |
+--------------------------------+----------+-----------------+---------------+------------------------------------------------+

|

**Some of the specific types of events that the BIG-IP system displays on the Local Traffic logging screen are:**

+---------------------------------------------------------------------------------------------------------------+
| -  Address Resolution Protocol (ARP) packet and ARP cache events                                              |
+---------------------------------------------------------------------------------------------------------------+
| -  bigdb database events (such as populating and persisting bigdb variables)                                  |
+---------------------------------------------------------------------------------------------------------------+
| -  HTTP protocol events                                                                                       |
+---------------------------------------------------------------------------------------------------------------+
| -  HTTP compression events                                                                                    |
+---------------------------------------------------------------------------------------------------------------+
| -  IP packet discard events due to exceptional circumstances or invalid parameters (such as a bad checksum)   |
+---------------------------------------------------------------------------------------------------------------+
| -  Layer 4 events (events related to TCP, UDP, and Fast L4 processing)                                        |
+---------------------------------------------------------------------------------------------------------------+
| -  MCP/TMM configuration events                                                                               |
+---------------------------------------------------------------------------------------------------------------+
| -  Monitor configuration events                                                                               |
+---------------------------------------------------------------------------------------------------------------+
| -  Network events (Layers 1 and 2)                                                                            |
+---------------------------------------------------------------------------------------------------------------+
| -  Packet Velocity ASIC (PVA) configuration events                                                            |
+---------------------------------------------------------------------------------------------------------------+
| -  iRule events related to run-time iRule processing                                                          |
+---------------------------------------------------------------------------------------------------------------+
| -  SSL traffic processing events                                                                              |
+---------------------------------------------------------------------------------------------------------------+
| -  General TMM events such as TMM startup and shutdown                                                        |
+---------------------------------------------------------------------------------------------------------------+

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 2.04 Force an active unit to standby under the appropriate circumstances
------------------------------------------------------------------------------------

|
|

**2.04 - Force an active unit to standby under the appropriate
circumstances**

**General Network Study and vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

For example:

If the BIG-IP HA pair is synchronized then the configurations are the
same on both systems. If the active system is having an issue and you
can’t find an issue with the other systems in the environment (Client or
Server). The issue may have something to do with the LTM. You could try
a fail over of the Active system to the standby system. If the problem
resolves then you are likely faced with an issue in the first system and
since they were in sync it may be hardware. That hardware issue may be
in the LTM or in the network systems that it is connected to. If the
fail over did not solve the issue the problem is like a configuration
issue and hardware has been eliminated.

Since a failover of an HA pair can interrupt current connections of
clients and depending on the type of connection they may have made their
connection may not recover from the termination of the connection (if
connection mirroring is not properly configured for long lived
connections), using failover as a troubleshooting step should be done as
a last measure. How ever it can help to narrow down if there is an issue
with hardware.

For a failover between systems in an HA pair, to be transparent to the
clients currently connected to the active unit, the state of the active
connections need to be known by the standby system. If the connection
states are not know by the standby system when the failover occurs,
connections that were being persisted, connections that were being
SNAT’d or any active connection state know by the active unit will not
survive the failover. To create a stateful failover environment the
systems must be configured to mirror the current connection table,
persistence records and SNAT table to the standby unit.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 2.05 Understand the relationship between interfaces, trunks, VLANs and their status/statistics
----------------------------------------------------------------------------------------------------------

|
|

**2.05 - Understand the relationship between interfaces, trunks, VLANs
and their status/statistics**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/tmos-concepts-11-4-0/12.html - conceptid <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-concepts-11-4-0/12.html#conceptid>`__

**Introduction to BIG-IP system interfaces**

A key task of the BIG-IP system configuration is the configuration of
BIG-IP system interfaces. The interfaces on a BIG-IP system are the
physical ports that you use to connect the BIG-IP system to other
devices on the network. These other devices can be next-hop routers,
Layer 2 devices, destination servers, and so on. Through its interfaces,
the BIG-IP system can forward traffic to or from other network devices.

*Note: The term interface refers to the physical ports on the BIG-IP
system.*

Every BIG-IP system includes multiple interfaces. The exact number of
interfaces that you have on the BIG-IP system depends on the platform
type.

A BIG-IP system has two types of interfaces:

**A management interface**

The management interface is a special interface dedicated to performing
a specific set of system management functions.

**TMM switch interfaces**

TMM switch interfaces are those interfaces that the BIG-IP system uses
to send or receive application traffic, that is, traffic slated for
application delivery.

Each of the interfaces on the BIG-IP system has unique properties, such
as the MAC address, media speed, duplex mode, and support for Link Layer
Discovery Protocol (LLDP).

In addition to configuring interface properties, you can implement a
feature known as interface mirroring, which you can use to duplicate
traffic from one or more interfaces to another. You can also view
statistics about the traffic on each interface.

Once you have configured the properties of each interface, you can
configure several other features of the BIG-IP system that control the
way that interfaces operate. For example, by creating a virtual local
area network (VLAN) and assigning interfaces to it, the BIG-IP system
can insert a VLAN ID, or tag, into frames passing through those
interfaces. In this way, a single interface can forward traffic for
multiple VLANs.

**Introduction to virtual LANs**

A VLAN is a logical subset of hosts on a local area network (LAN) that
operate in the same IP address space. Grouping hosts together in a VLAN
has distinct advantages. For example, with VLANs, you can:

Reduce the size of broadcast domains, thereby enhancing overall network
performance.

Reduce system and network maintenance tasks substantially.
Functionally-related hosts no longer need to physically reside together
to achieve optimal network performance.

Enhance security on your network by segmenting hosts that must transmit
sensitive data.

The way that you group hosts into VLANs is by using the Configuration
utility to create a VLAN and associate physical interfaces with that
VLAN. In this way, any host that sends traffic to a BIG-IP system
interface is logically a member of the VLAN or VLANs to which that
interface belongs.

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/tmos-concepts-11-4-0/18.html - unique\_599320773 <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-concepts-11-4-0/18.html#unique_599320773>`__

**VLANs on a BIG-IP system**

The BIG-IP system is a port-based switch that includes multilayer
processing capabilities. These capabilities enhance standard VLAN
behavior, in these ways:

You can associate physical interfaces on the BIG-IP system directly with
VLANs. In this way, you can associate multiple interfaces with a single
VLAN, or you can associate a single interface with multiple VLANs.

You do not need physical routers to establish communication between
separate VLANs. Instead, the BIG-IP system can process messages between
VLANs.

You can incorporate a BIG-IP system into existing, multi-vendor switched
environments, due to the BIG-IP system’s compliance with the IEEE 802.1q
VLAN standard.

You can combine two or more VLANs into an object known as a VLAN group.
With a VLAN group, a host in one VLAN can communicate with a host in
another VLAN using a combination of Layer 2 forwarding and IP routing.
This offers both performance and reliability benefits.

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/tmos-concepts-11-4-0/17.html - conceptid <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-concepts-11-4-0/17.html#conceptid>`__

**Introduction to trunks**

A trunk is a logical grouping of interfaces on the BIG-IP system. When
you create a trunk, this logical group of interfaces functions as a
single interface. The BIG-IP system uses a trunk to distribute traffic
across multiple links, in a process known as link aggregation. With link
aggregation, a trunk increases the bandwidth of a link by adding the
bandwidth of multiple links together. For example, four fast Ethernet
(100 Mbps) links, if aggregated, create a single 400 Mbps link.

With one trunk, you can aggregate a maximum of eight links. For optimal
performance, you should aggregate links in powers of two. Thus, you
ideally aggregate two, four, or eight links.

The purpose of a trunk is two-fold:

To increase bandwidth without upgrading hardware

To provide link failover if a member link becomes unavailable

You can use trunks to transmit traffic from a BIG-IP system to another
vendor switch. Two systems that use trunks to exchange frames are known
as peer systems.

How do trunks work?

In a typical configuration where trunks are configured, the member links
of the trunk are connected through Ethernet cables to corresponding
links on a peer system.

This figure shows an example of a typical trunk configuration with two
peers and three member links on each peer:

|

.. image:: /_static/201/p13.jpeg


|

A primary goal of the trunks feature is to ensure that frames exchanged
between peer systems are never sent out of order or duplicated on the
receiving end. The BIG-IP system is able to maintain frame order by
using the source and destination addresses in each frame to calculate a
hash value, and then transmitting all frames with that hash value on the
same member link.

The BIG-IP system automatically assigns a unique MAC address to a trunk.
However, by default, the MAC address that the system uses as the source
and destination address for frames that the system transmits and
receives (respectively), is the MAC address of the lowest-numbered
interface of the trunk.

The BIG-IP system also uses the lowest-numbered interface of a trunk as
a reference link. The BIG-IP system uses the reference link to take
certain aggregation actions, such as implementing the automatic link
selection policy. For frames coming into the reference link, the BIG-IP
system load balances the frames across all member links that the BIG-IP
system knows to be available. For frames going from any link in the
trunk to a destination host, the BIG-IP system treats those frames as if
they came from the reference link.

Finally, the BIG-IP system uses the MAC address of an individual member
link as the source address for any LACP control frames.

**Overview of LACP**

A key aspect of trunks is Link Aggregation Control Protocol, or LACP.
Defined by IEEE standard 802.3ad, LACP is a protocol that detects error
conditions on member links and redistributes traffic to other member
links, thus preventing any loss of traffic on the failed link. On a
BIG-IP system, LACP is an optional feature that you can configure.

You can also customize LACP behavior. For example, you can specify the
way that LACP communicates its control messages from the BIG-IP system
to a peer system. You can also specify the rate at which the peer system
sends LACP packets to the BIG-IP system. If you want to affect the way
that the BIG-IP system chooses links for link aggregation, you can
specify a link control policy.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|
