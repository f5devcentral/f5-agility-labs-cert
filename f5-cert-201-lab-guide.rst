Participant Hands-on Lab Guide

|image0|

    Last Updated: *Date*

©2014 F5 Networks, Inc. All rights reserved. F5, F5 Networks, and the F5
logo are trademarks of F5 Networks, Inc. in the U.S. and in certain
other countries. Other F5 trademarks are identified at f5.com.

Any other products, services, or company names referenced herein may be
trademarks of their respective owners with no endorsement or
affiliation, express or implied, claimed by F5.

These training materials and documentation are F5 Confidential
Information and are subject to the F5 Networks Reseller Agreement. You
may not share these training materials and documentation with any third
party without the express written permission of F5.

Table of Contents
=================

Table of Contents 1

LAB 1 – Packet Processing and Virtual Servers 8

Exercise 1.1 Lab Preparation and Packet Processing 8

Task 1 – BIG-IP VE System Configuration 8

Task 2 – Open BIG-IP TMSH and TCPDump session 9

Task 3 – Establish ftp connection 9

Exercise 1.2 – Packet Filters 10

Task 1 – Create a packet filter 10

Task 2 – Test the FTP packet filter 10

Exercise 1.3 – Virtual Server Packet Processing 11

Task 1 – Create additional Virtual Servers 11

Task 2 – Testing Virtual Server Packet Processing Behavior 12

LAB 2 – Virtual Server and Pool Behavior and Status 13

Exercise 2.1 – Virtual Server Status 13

Task 1 – Test Disabled Virtual Servers 13

Task 3 – Virtual Server Connection Limits and Status 14

Exercise 2.2 – Pool Member and Virtual Servers 15

Task 1 – Create a new monitor 15

Task 2 – Effects of Monitors on Members, Pools and Virtual Servers 15

Task 3 – More on status and member specific monitors 16

Exercise 2.3 – Load Balancing 16

Task 1 – Load Balancing 16

Task 2 – Priority Group Activation 17

Task 3 – The Effects of Persistence on Load Balancing 17

LAB 3 – TROUBLESHOOTING THE BIG-IP 19

Exercise 3.1 – Trouble-shooting Hardware 19

Task 1 – End User Diagnostics 19

Task 2 – LCD Panel 20

Task 3 – Hardware Log Files 20

Task 4 – HA and Failover 20

Exercise 3.2 – tcpdump Packet Capture 20

Task 1 – Packet Captures of multiple interfaces simultaneously 20

Exercise 3.3 – Performance Statistics 21

Task 1 – Observing performance statistics 21

Exercise 3.4 – Connectivity Troubleshooting 21

Task 1 – Connectivity troubleshooting tools 21

Exercise 3.5 – Self IP Port Lockdown and more 21

Task 1 – Effects of Port Lockdown 22

Task 2 – Effects of Port Lockdown 22

Task 3 – Check DNS and NTP are configured properly 22

LAB 4 – SUPPORT AND ANALYTICS 23

Exercise 4.1 – Support, Status and Logs 23

Task 1 – Qkview and iHealth 23

Task 2 – Network Map 23

Task 3 - Dashboard 24

Task 4 – Log files 24

Exercise 4.2 – iApps and Analytics 25

Task 1 – Create and iApps and add Analytics 25

LAB 5 – Managing the BIG-IP 27

Exercise 5.1 – UCS, BIG-IP Archive 27

Task 1 – Create UCS Archive Files 27

Exercise 5.2 – Upgrading a BIG-IP Device Service Clusters (DSC) 27

Task 1 – Upgrading software 27

Exercise 5.3 – BIG-IQ 28

Task 1 – Peruse BIG-IQ 28

Task 2 – Make a modification via the BIG-IQ 29

LAB 6 – MODIFY AND MANAGE POOL AND VIRTUAL SERVERS 30

Exercise 6.1 – Modify and Troubleshoot Virtual Servers 30

Task 1 – Troubleshooting virtual servers 30

Task 2 – Working with profiles 31

APPENDIX 1 – ANSWER KEY 32

LAB 1 – Packet Processing and Virtual Servers 32

Exercise 1.1 – Lab Preparation and Packet Processing 32

Task 2 – Open BIG-IP TMSH and TCPDump session 32

Task 3 – Establish ftp connection 32

Exercise 1.2 – Packet Filters 32

Task 2 – Test the FTP packet filter 32

Exercise 1.3 – Virtual Server Packet Processing 33

Task 2 – Testing Virtual Server Packet Processing Behavior 33

LAB 2 – Virtual Server and Pool Behavior and Status 33

Exercise 2.1 – Virtual Server Status 33

Task 2 – Test Disabled Virtual Server 33

Task 3 – Virtual Server Connection Limits and Status 34

Exercise 2.2 – Pool Member and Virtual Servers 34

Task 2 – Effects of Monitors on Members, Pools and Virtual Servers 34

Task 3 – More on status and member specific monitors 35

Exercise 2.3 – Load Balancing 35

Task 1 – Load Balancing 35

Task 2 – Priority Group Activation 36

Task 3 – The Effects of Persistence on Load Balancing 36

LAB 3 – TROUBLESHOOTING HARDWARE 37

Exercise 3.1 – Trouble-shooting Hardware 37

Task 1 – End User Diagnostics 37

Task 2 – LCD Panel 37

Task 3 – Hardware Log Files 37

Task 4 – HA and Failover 37

Exercise 3.2 – tcpdump Packet Capture 38

Task 1 – Packet Captures of multiple interfaces simultaneously 38

Exercise 3.3 – Performance Statistics 39

Task 1 – Observing performance statistics 39

Exercise 3.4 – Connectivity Troubleshooting 39

Task 1 – Connectivity troubleshooting tools 39

Exercise 3.5 – Self IP Port Lockdown 39

Task 1 – Effects of Port Lockdown 39

LAB 4 – SUPPORT AND ANALYTICS 40

Exercise 4.1 – Support, Status and Logs 40

Task 1 – Qkview and iHealth 40

Task 2 – Network Map 40

Task 3 - Dashboard 40

Task 4 – Log files 41

Exercise 4.2 – iApps and Analytics 41

Task 1 – Create iApps Analytics 41

LAB 5 – Managing the BIG-IP 41

Exercise 5.1 – UCS, BIG-IP Archive 41

Task 1 – Create UCS Archive Files 41

Exercise 5.2 – Upgrading a BIG-IP Device Service Clusters (DSC) 42

Task 1 – Upgrading software 42

Exercise 5.3 – BIG-IQ 42

Task 1 – Peruse BIG-IQ 42

Task 2 – Make a modification via the BIG-IQ 43

LAB 6 – MODIFY AND MANAGER POOLS AND VIRTUAL SERVER 43

Exercise 6.1 – MODIFY AND TROUBLESHOOT VIRTUAL SERVERS 43

Task 1 – Troubleshooting virtual servers 43

Task 2 – Working with profiles 44

Lab Network Overview

Each student will have a BIG-IP VE environment with IP addressing as
below:

|image1|

F5 Lab Introduction

Welcome to the F5 Virtual Environment (vLab) setup and hands-on F5 201
Exam Lab exercises.

The purpose of this guide is to provide a sampling of hands-on exercises
to better understand the subjects outlined in the 201-TMOS
Administration Exam Blueprint.

The Ravello F5 vLab (virtual lab environment) is an F5-community
supported tool. Please DO NOT contact F5 Support for assistance with the
vlab. For help with the setup of the vLab or running a demonstration,
you should contact your F5 Channel Account Manager (CAM).

To set up your own lab environment on your own platform.

Please refer to vLab Setup and Configuration Guide for detailed
instructions. This guide is included in the Partner\_vLab\_Package on
https://downloads.f5.com.

Accessing the Ravello lab environment is on the next page.

Lab Basics and Prep

Accessing the lab environment.
------------------------------

a. Open a browser and go to
       `http://api.f5labs.io/<instructor\_uri>/X <http://api.f5labs.io/%3cinstructor_uri%3e/X>`__
       (where **X** is your student number)

b. Look for the **xubuntu-jumpbox-vxx**. You will use the xubuntu
       jumpbox for all the labs. (see below)

    |image2|

a. You can click on **RDP** to RDP to the Xubuntu jumpbox or you can
   select the **CONSOLE** link and access the jumpbox via your browser.
   **The CONSOLE link requires you turn off pop-up blockers.**

    \ |image3|

LAB 1 – Packet Processing and Virtual Servers
=============================================

You are the administrator of a pair of BIG-IPs with a number of virtual
servers pre-configured. In this lab you will determine how traffic is
processed and take a look at various virtual server states and some
reasons a virtual server may not be working.

Objective:

-  Objective 1.01

   -  Given a connectivity-troubleshooting situation, consider the
      packet and virtual server processing order

Lab Requirements:

-  Ravello 201 certification lab environment

Estimated completion time: 30 minutes

Exercise 1.1 Lab Preparation and Packet Processing
--------------------------------------------------

Task 1 – BIG-IP VE System Configuration 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Access your BIG-IP and verify it is configured properly.

Open a new Web browser and access
`**https://10.1.1.245** <https://10.1.1.245>`__. Log into the BIG-IP VE
system using the following credentials:

Username: admin

Password: admin

Check the upper left-hand corner and ensure you are on the active device
the status should be **ONLINE (ACTIVE)**. Most deployments are
active-standby and either device could be the active device.

On the **System >> Resource Provisioning** page ensure **Local Traffic
(LTM) and Application Visibility and Reporting (AVR)** modules are
provisioned\ **.**

Go to **Local Traffic >> Virtual Servers** and verify your virtual
server states. They should match the graphic.

|image4|

**→NOTE:** This BIG-IP has been pre-configured and the **purple\_vs**
virtual server is down on purpose.

Task 2 – Open BIG-IP TMSH and TCPDump session
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task, you will open two SSH sessions to the BIG-IP. One for TMSH
commands and the other for tcpdump of the client-side network.

Open command/terminal window (window1) from the shortcut bar at the
bottom of the jumpbox.

ssh root@10.1.1.245

password: default

Use tcpdump to monitor traffic from the client (10.1.10.51) destined to
**ftp\_vs** (10.1.10.100)

tcpdump –nni client\_vlan host 10.1.10.51 and 10.1.10.100

Open command/terminal window (window2).

ssh root@10.1.1.245

password: default

Use tmsh to display connection table, at the Linux command prompt type:

tmsh

At the TMOS prompt **(tmos)#**

show sys connection

Do you see any connections from the jumpbox 10.1.1.51 to 10.1.1.245:22?

Q1. Why are the ssh management sessions not displayed in connection
table?

Task 3 – Establish ftp connection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task you will open a third terminal window and establish an FTP
session through the **ftp\_vs** virtual server. With the connection
remaining open you will view the results in window1 (tcpdump) and
window2 (tmsh).

Open a third commftpand/terminal window (window3).

ftp 10.1.10.100

It may take 15 to 20 seconds for the logon on prompt, just leave it at
prompt to hold the connection open.

In window 1 you should see something similar to the tcpdump captured
below.

|image5|

Q1. In the tcpdump above, what is client IP address and port and the
server IP address port?

In window2 (tmsh) run the **show sys conn** again, but strain out the
noise of other connections (mirrored and selfIP) by just looking at
connections from your jumpbox.

sho sys conn cs-client-addr 10.1.10.51

The connection table on window2 will show the client-side and
server-side connection similar to below:

|image6|

Q2. What is source ip and port as seen by ftp server in the example
above?

Q3. What happened to the original client IP address and where did
10.1.20.249 come from?

You will have to review the configuration of **ftp\_vs** to determine
the answer to this question.

Exercise 1.2 – Packet Filters
-----------------------------

Task 1 – Create a packet filter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You are going to test how packet filters impact packet processing by
creating a packet filter to block ftp connections to 10.1.10.100.

Go to **Network > Packet Filters > Rules** and **Create** a filter using
the following:

+--------------------------------------+---------------+
| **Name**                             | Block\_ftp    |
+======================================+===============+
| **Order**                            | First         |
+--------------------------------------+---------------+
| **Action**                           | Discard       |
+--------------------------------------+---------------+
| **Destination Hosts and Networks**   | 10.1.10.100   |
+--------------------------------------+---------------+
| **Destination Port List**            | 21 (FTP)      |
+--------------------------------------+---------------+
| **Logging**                          | Enabled       |
+--------------------------------------+---------------+

Make sure you select **Add** after enter a host/network or a port.

Task 2 – Test the FTP packet filter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ensure ftp connection is established. (See Exercise 1.1 - Task 3)

Go to **Network > Packet Filters > General** and select **Enable** and
then **Update**.

Q1. Was the existing ftp connection in the connection table affected?
Why?

Quit ftp and clear virtual server statistics by going to **Local Traffic
> Virtual Servers > Statistic**, select the virtual server and hit
**Reset**.

    Attempt to establish an ftp connection to 10.1.10.100. Note tcpdump
    capture in Window1

Q2. Was ftp connection successful? Why?

Q3. What did tcpdump reveal? Did the connection timeout or reset?

Q4. What did virtual server statistics for **ftp\_vs** reveal? Why are
counters not incrementing?

Q5. Prioritize the packet processing order below from 1-7:

Virtual Server\_\_\_ SNAT\_\_\_ AFM/Pkt Filter\_\_\_ NAT\_\_\_ Existing
Connections\_\_\_ Self IP\_\_\_ Drop \_\_\_

Review the Packet Filter Logs and Packet Filter Statistics, then disable
the Packet Filters.

Go to **Network > Packet Filters > Statistics** and review the
information.

Go to **System > Logs > Packet Filters** and review the information.

Go to **Network > Packet Filters > General** and select **Disable** and
then **Update**

Exercise 1.3 – Virtual Server Packet Processing
-----------------------------------------------

Task 1 – Create additional Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create a wildcard virtual server and pool, test and observe various
traffic under different configurations to determine how virtual servers
process new inbound connections. You will be using tcpdump from window1,
virtual server statistics, as well as a browser to determine behavior.

Create **wildcard\_vs** **10.1.10.100:\*** with TCP profile, Automap and
**wildcard\_pool** of **10.1.20.11:\***

To create the wildcard pool, go to **Local Traffic > Pools > Pool List**
and select **Create**.

+---------------+------------------+
| **Name**      | wildcard\_pool   |
+===============+==================+
| **Address**   | 10.1.20.11       |
+---------------+------------------+
| **Port**      | \*               |
+---------------+------------------+

Don’t forget to **Add** the pool member to the **New Members** box
before you hit **Finished.**

To create the wildcard virtual server, go to **Local Traffic > Virtual
Server** and select **Create**.

+----------------------------------+--------------------+
| **Name**                         | **wildcard\_vs**   |
+==================================+====================+
| **Destination**                  | 10.1.10.100        |
+----------------------------------+--------------------+
| **Service Port**                 | \*                 |
+----------------------------------+--------------------+
| **Source Address Translation**   | Automap            |
+----------------------------------+--------------------+
| **Default Pool**                 | wildcard\_pool     |
+----------------------------------+--------------------+

Don’t forget to hit **Finished.**

You didn’t enter the source addresses allowed. Go to your new virtual
server and look at the **Source** to see the default source addresses
allowed.

Task 2 – Testing Virtual Server Packet Processing Behavior
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Many of your virtual servers have the same virtual address. You will now
test various behaviors.

Clear virtual server stats.

Observe connection statistics (VS stats) for each of the following

Browse to http://10.1.10.100:8080

Q1. Which VS is used for web traffic over port 8080?

FTP to 10.1.10.100

Q2. Which VS is used for FTP traffic?

Browse to http://10.1.10.100

Q3. Which VS is used for this web traffic the default HTTP port? What
port was used?

Clear virtual server stats.

Modify the **wildcard\_vs** to only allow connections from a **Source**
of 10.1.10.0/24

Browse to http://10.1.10.100

Observe connection statistics (VS stats)

Q5. Which VS is used for web traffic?

Clean up your modifications

Clear virtual server stats.

Modify **wildcard\_vs** to include the default **Source** of 0.0.0.0/0.

LAB 2 – Virtual Server and Pool Behavior and Status
===================================================

You are the administrator of a pair of BIG-IPs with a number of virtual
servers pre-configured. In this lab you will determine how traffic is
processed and take a look at various virtual server states and some
reasons a virtual server may not be working.

Objective:

-  Objectives 1.02-1.06

   -  Identify the reason a virtual server is not working as expected

   -  Identify the reason a pool member has been marked down by health
      monitors

   -  Identify a pool member not in the active priority group

   -  Identify traffic diverted due to persistence record

   -  Identify the current configured state of the pool member

   -  Identify a persistence issue

Estimated completion time: 45 minutes

Exercise 2.1 – Virtual Server Status
------------------------------------

Task 1 – Test Disabled Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task, you will disable and enable various virtual servers and
note the behavior.

Disable **www\_vs** from the **Virtual Server List** or from within the
**www\_vs** GUI interface.

    Open **Local** **Traffic > Virtual Servers** and hover over status
    icons.

From window2 (TMSH) type: **show ltm virtual or show ltm virtual
www\_vs**

Q1. What is the Availability of **www\_vs**? What is the State?

Q2. What symbol is used to represent **www\_vs** status?

Q3. Would you expect browsing to **http://10.1.10.100** to work?

Q4. Can you ping the virtual IP?

Clear virtual server stats and browse to **http://10.1.10.100**

Observe the tcpdump (window1) and connection statistics in the Virtual
Server statics GUI interface.

Q5. Did the site work? What did the tcpdump show?

Q6. Did statistics counters for any virtual increment?

Q7. Why do you think the **wildcard\_vs** didn’t pick up the packets?

Disable **wildcard\_vs** and note the State and Availability of the
virtual servers.

Q8. What symbol is used to represent **wildcard\_vs**? Why is symbol a
square?

Q9. What is the Reason given for current state?

Establish ftp connection to 10.1.10.100 and ensure successful login.

Disable **ftp\_vs**.

Q10. Does ftp session still work? Why?

Open another window and establish ftp connection to 10.1.10.100.

Q11. Did new ftp session establish connection? Why not?

Make sure all virtual servers are **Enabled** before continuing.

Task 2 – Virtual Server Connection Limits and Status
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task, you will set the connection limit for the FTP virtual
server to 1 and note the status and behavior of different connection
scenarios.

Modify **ftp\_vs** for connection limit of 1. The **Connection Limit**
option can be found under the **Advanced** virtual server menus.

Establish ftp connection to **10.1.10.100** and hold the logon open.

Q1. Does FTP session work?

Q2. What is the virtual server symbol and status of **ftp\_vs**?

Open another window and establish a second ftp connection to
10.1.10.100.

Q3. Did new ftp session establish connection? Why not?

Q4. Did tcpdump capture connection reset?

Q5 Quit all FTP sessions and note **ftp\_vs** status.

 Exercise 2.2 – Pool Member and Virtual Servers
-----------------------------------------------

Task 1 – Create a new monitor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task, you will determine the effects of monitors on the status
of pools members.

Create **mysql** monitor for testing.

Go to **Local Traffic > Monitors** and select **Create**.

+----------------------+------------------+
| **Name**             | mysql\_monitor   |
+======================+==================+
| **Parent Monitor**   | mysql            |
+----------------------+------------------+
| **Interval**         | 15               |
+----------------------+------------------+
| **Timeout**          | 46               |
+----------------------+------------------+

Task 2 – Effects of Monitors on Members, Pools and Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Go to **Local Traffic -> Pools -> www\_pool** and assign
**mysql\_monitor** to the pool.

Observe Availability Status of **www\_pool.** The pool status
momentarily changes to **Unknown**.

Q1. Since the **mysql\_monitor** will fail, how long will it take to
mark the pool offline?

Go to **Local Traffic > Pool > www\_pool** and then **Member** from the
top bar and open member 10.1.20.13:80 and note the status of the
monitors.

Open **Local Traffic -> Network Map -> Show Map**

Q2. What is the icon and status of **www\_vs**?

Q3. What is the icon and status of **www\_pool**?

Q4. What is the icon and status of the **www\_pool** members?

Q5. How does the status of the pool configuration effect the virtual
server status?

Clear the virtual server statistics.

Browse to **http://10.1.10.100** and note the browser results,
statistics and tcpdump.

Disable **www\_vs** and clear the statistics and ping the virtual
server.

Q6. What is the icon and status of **www\_vs**?

Browse to **http://10.1.10.100** and note the browser results,
statistics and tcpdump..

Q7. Did traffic counters increment for **www\_vs**?

Q8. What is the difference in the tcpdumps between Offline (Disabled) vs
Offliine (Enabled)?

Make sure all virtual servers are **Enabled** before continuing.

Task 3 – More on status and member specific monitors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Go to **Local Traffic > Pool > www\_pool** and then **Member** from the
top bar and open member **10.1.20.13:80.** Enable the **Configuration:
Advanced** menus.

Q1. What is the status of the Pool Member and the monitors assigned to
it?

In **Health Monitors** select **Member Specific** and assign the
**http** monitor and **Update.**

Go to the **Network Map**.

Q2. What is the status of **www\_vs**, **www\_pool** and the pool
members? Why?

Browse to **http://10.1.10.100** and note results of browser and
tcpdump.

Q3. Did the site work?

Q4. Which **www\_pool** members was traffic sent to?

**NOTE:** After complete this task remove **mysql\_monitor** from the
**www\_pool** health monitors

Exercise 2.3 – Load Balancing
-----------------------------

Task 1 – Load Balancing
~~~~~~~~~~~~~~~~~~~~~~~

In the task, you will look and the various effects of different load
balancing configurations.

Open the **www\_pool Members** tab.

Note the load balancing method on the pool and the **Ratio** and
**Priority** settings on the members. Select each member and update them
to the following:

+--------------+-------------+----------------+
| **Member**   | **Ratio**   | **Priority**   |
+==============+=============+================+
| 10.1.20.11   | 5           | 10             |
+--------------+-------------+----------------+
| 10.1.20.12   | 1           | 10             |
+--------------+-------------+----------------+
| 10.1.20.13   | 1           | 5              |
+--------------+-------------+----------------+

Go to Local **Traffic > Pools > Statistics** and clear the **www\_pool**
statistics.

Browse to **http://10.1.10.100** and refresh or **<ctrl> F5** several
times.

Q1. Which **www\_pool** members was traffic sent to?

Q2. Did member **10.1.20.11** receive the most traffic? Why not?

Under the **Members** tab change L\ **oad Balancing Method** to **Ratio
(member)** then **Update**.

Clear stats for **www\_pool** and browse **http://10.1.10.100** several
times.

Q3. Which **www\_pool** members was traffic sent to?

Q4. Did member **10.1.20.11** receive the most traffic?

Task 2 – Priority Group Activation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Change **Priority Group Activation** to less than 2 and **Update**.

Clear stats for **www\_pool** and browse to **http://10.1.10.100**.

Q1. Which **www\_pool** members was traffic sent to?

On the pool statistics page, select member **10.1.20.11:80** and change
the **State** to **Disable.**

Clear the statistics for the **www\_pool** and browse to
http://10.1.10.100 several times.

Q2. Which **www\_pool** members was traffic sent to? Why?

Q3. Would the results have been different if 10.1.20.11:80 had been
marked offline or marked with a yellow triangle?

**IMPORTANT:** Once you have complete the lab, change then **Load
Balancing Method** to **Round Robin**, **Priority Group** to
**Disabled**, and **Enable** pool member **10.1.20.11:80**

Task 3 – The Effects of Persistence on Load Balancing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task, you will enable persistence on the **www\_vs** and see the
effects of persistence on load balancing. You will also see where to
view persistence records that are maintain by the BIG-IP

Enable a **Persistence Profile** on **www\_vs** by opening the virtual
server and selecting the **Resources** tab.

Assign the following persistence profiles;

**Default Persistence Profile:** cookie

**Fallback Persistance\_Profile:** source\_addr

Note: If you see an error requiring an HTTP profile, go to Properties
and assign the default HTTP profile.

Q1. Why was a http profile required?

Clear stats for **www\_pool** and browse to **http://10.1.10.100**

Q2. Was traffic evenly distributed to all **www\_pool** members? Why
not?

In the web page under **HTTP Request and Response Information** is
**Display Cookie** link. Select **Display Cookie** to view the cookie
created by the BIG-IP.

Open **Statistic > Module Statistics > Local Traffic > Persistence
Records**

Click on pool member displayed on persistence record and **Disable** the
pool member.

Browse to **http://10.1.10.100**

Q3. Did you persist to the Disabled member? Why?

Change status of persisted pool member to **Forced Offline**

Note: Persisted Records still exist. Browse to http://10.1.10.100

Q4. Does traffic continue to persist to the member Forced Offline?

Q5. If cookies were disable on your browser would persistence still
work? Why?

Alternate method to display persistence is: **tmsh show ltm persistence
persist-records**

LAB 3 – TROUBLESHOOTING THE BIG-IP
==================================

Objective:

-  Objectives 2.01-2.05

   -  Perform an End User Diagnostic per F5 documentation and collect
      the output

   -  Interpret the LCD Warning Messages

   -  Identify a possible hardware issue within the log files

   -  Force an active unit to standby under the appropriate
      circumstances

   -  Understand the relationship between interfaces, trunks, VLANs and
      their status/statistics

-  Objectives 3.01-3.02

   -  Perform a packet capture within the context of a performance issue

   -  Use BIG-IP tools in order to identify potential performance issues

-  Objectives 4.01-4.03

   -  Verify remote connectivity to the box in order to determine the
      cause of a management connectivity issue

   -  Check and interpret port lockdown settings and packet filters in
      order to determine the cause of a management connectivity issue

   -  Given the use of a remote authentication server, verify proper DNS
      and NTP settings in order to diagnose a connectivity issue

Estimated completion time: 20 minutes

Exercise 3.1 – Trouble-shooting Hardware
----------------------------------------

Review what you have learned about troubleshooting hardware.

**SKIP Exercise 3.1 as it does not require the lab environment.**

Task 1 – End User Diagnostics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What three methods are available for running EUD on F5 Hardware?

Q2. How do you determine EUD version?

Q3. What is the filename and location of the EUD output?

Task 2 – LCD Panel
~~~~~~~~~~~~~~~~~~

Q1. How do you halt the unit via the LCD panel?

Q2. Holding the X for 4 seconds does what?

Q3. Holding the Check button for 4 seconds does what?

Task 3 – Hardware Log Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the filename and location of the logs for LTM?

Q2. Where will power supply, fan and hard disk related issues be logged?

Task 4 – HA and Failover
~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Is failover sometimes used to determine issues related to hardware
or software?

Q2. How do you initiate failover to standby unit?

Q3. What persistence profile cannot be mirrored?

Q4. What two connections types are re-mirrored after failback?

Q5. When would you recommend using connection mirroring?

Q6. Where is connection mirroring configured?

Q7. Where is persistence mirroring configured?

Q8. What tmsh command is used to view mirrored connections?

Q9. What tmsh command is used to view mirrored persistence?

Q10. What can be the cause of primary unit returning to active state
after initiating failover to standby?

Exercise 3.2 – tcpdump Packet Capture
-------------------------------------

In this exercise are going to perform **tcpdump** packet captures and
review the results.

Task 1 – Packet Captures of multiple interfaces simultaneously
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Open SSH session window 1, and enter on one line:

    tcpdump –ni client\_vlan –eXs 0 –w /var/tmp/dump.cap & tcpdump –ni
    server\_vlan –eXs 0 –w /var/tmp/dump2.cap &

Browse to **http://10.1.10.100 **

Type fg then <cr> then <crtl> c

Again, type fg then <cr> then <crtl> c

    tcpdump –r /var/tmp/dump.cap & tcpdump –r /var/tmp/dump2.cap

Q1. What is the alternate method for capturing two interfaces
simultaneously?

Q2. What interface does 0.0 represent?

Q3. What interface typically represents the management interface?

Q4. What is recommended method for packet captures on high load system?

Q5. Will tcpdump capture PVA accelerated traffic?

Exercise 3.3 – Performance Statistics
-------------------------------------

Task 1 – Observing performance statistics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Open **Statistics >> Performance** page

Note: Stats are available for System, Connections, Throughput and Cache

Q1. What is the longest time interval available for performance
statistics?

Exercise 3.4 – Connectivity Troubleshooting
-------------------------------------------

Task 1 – Connectivity troubleshooting tools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Disable all virtual servers with the 10.1.10.100 virtual address and
clear stats. Ping 10.1.10.100

Q1. Was echo response received?

Q2. What is the status of the virtual servers?

Enable all virtual servers with the 10.1.10.100 virtual address.

The **purple\_vs** is currently Offline (Enabled). Ping the virtual at
10.1.10.105

Q3. Was echo response received?

Exercise 3.5 – Self IP Port Lockdown and more
---------------------------------------------

Task 1 – Effects of Port Lockdown
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ping 10.1.10.245

Q1. Was echo response received?

SSH to 10.1.10.245

Q2. Was ssh successful? Why not?

Open **Network > Self IPs > 10.1.10.245** and change **Port Lockdown**
to **Allow Defaults**

SSH to 10.1.10.245

Browse to https://10.1.10.245

Q1. Did SSH work? Did browsing work?

Q2. What other ports are opened when you select Allow Defaults.

Open **Network > Self IPs > 10.1.10.245** and change Port Lockdown to
**Allow Custom** and add Port 22

SSH to 10.1.10.245

Browse to https://10.1.10.245

Q3. Did SSH work? Did browsing work?

Task 2 – Effects of Port Lockdown
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Open **System >> Platform**

On **SSH IP Allow** > **Specify Range** of 10.1.1.10-20

Q4. Does existing SSH window still work?

Open new SSH session to 10.1.1.245

Q5. Was new ssh session established?

Task 3 – Check DNS and NTP are configured properly
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Verify the DNS and NTP configuration and test DNS.

Go to **System >> Configuration >> Device >> General** and review the
DNS and NTP setting

In BIG-IP command line terminal window (window 2) test DNS from the CLI
or TMSH enter:

dig pool.ntp.org

LAB 4 – SUPPORT AND ANALYTICS
=============================

Objective:

-  Objective 5.01

   -  Identify the appropriate supporting components and severity levels
      for an F5 support ticket

-  Objective 6.01-6.04

   -  Review the network map in order to determine the status of objects

   -  Use the dashboard to gauge the current running status of the
      system

   -  Review log files and identify possible events

   -  Use iApps Analytics to gauge the current running status of
      application services

Estimated completion time: 45 minutes

Exercise 4.1 – Support, Status and Logs
---------------------------------------

Task 1 – Qkview and iHealth
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Open System->Support page.

Ensure QKView is selected then click Start.

Download snapshot file and upload ihealth.f5.com (login is required)

Q1. Are logs associated with qkview?

From ssh window run qkview

Q2. Where is default filename and location of qkview output?

Q3. Where is the default filename and location of core dump?

Q4. What is Severity and Condition for unit failure in active/standby
pair?

Q5. If support case was opened online with Severity 4 and no call has
been received in a week. What should you do?

Q6. What is the procedure to escalate support case?

Task 2 – Network Map
~~~~~~~~~~~~~~~~~~~~

Explain status icons of objects on network map

Open **Local Traffic > Network Map** and hover over icons and observe
status info.

Ensure all icons are green. If not, then troubleshoot.

Note the top-down status relationship between VS, pools, pool members
and nodes.

Q1. What is a node?

Open **Local Traffic > Nodes** and disable node 10.1.20.11

Q2. What icon is reflected for 10.1.20.11 on the Network map?

Q3. What is the color of the icons? Why?

Q3. Does **ftp\_vs** still work as expected?

Select **www\_vs** from Network Map. Select Resources > Manage irules

Enable \_sys\_https\_redirect irule and click Finished.

Q4. Where is irule reflected on Network Map?

Task 3 - Dashboard
~~~~~~~~~~~~~~~~~~

Observe Dashboard statistics

Log on to the BIG-IP GUI using Firefox (Mozilla) and go to **Statistics
> Dashboard **

Q1. What is longest duration available for reporting?

Q2. How can report be exported?

Task 4 – Log files
~~~~~~~~~~~~~~~~~~

Interpret the LTM log file

Open ssh window1 and enter the following command:

tail –f /var/log/ltm

Disable **ftp\_vs**

Q1. Was alert logged?

Go to **System > Logs > Local Traffic**

Q2. Was the alert logged here?

From ssh window 1 enter **<CTRL> C** and at the CLI prompt enter:

**grep alert /var/log/ltm**

grep **www\_pool** /var/log/ltm

Q3. What command is needed to find all instances of err in /var/log/ltm

grep err /var/log/ltm

Exercise 4.2 – iApps and Analytics
----------------------------------

Task 1 – Create and iApps and add Analytics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As you saw in the first lab, Application Visibility and Reporting has
already been provisioned. You are going to create an analytics profile
and attach it to an HTTP iApp application you will create.

Open **Local Traffic >> Profiles >> Analytics** page.

Create an analytics profile using the following information, and then
click **Finished**.

+--------------------------+-----------------------------------------+
| **Profile Name**         | custom\_analytics                       |
+==========================+=========================================+
| **Collected Metrics**    | Max TPS and Throughput Page Load Time   |
+--------------------------+-----------------------------------------+
| **Collected Entities**   | URLs                                    |
|                          |                                         |
|                          | Countries                               |
|                          |                                         |
|                          | Client IP Addresses                     |
|                          |                                         |
|                          | Client Subnets                          |
|                          |                                         |
|                          | Response Codes                          |
|                          |                                         |
|                          | User Agents                             |
|                          |                                         |
|                          | Methods                                 |
+--------------------------+-----------------------------------------+

Go to **iApps >> Application Services** and select **Create**.

Select the **f5.http** template, name it **iapp\_lab** and review the
**Basic** selections.

in the **Template Options** section set the configuration mode to
**Advanced – Configure advanced options**

Build the iApp using the following information:

+---------------------------+---------------------+
| **Virtual Server IP**     | 10.1.10.110         |
+===========================+=====================+
| **Virtual Server Port**   | 80                  |
+---------------------------+---------------------+
| **FQDN**                  | iapp.f5demo.com     |
+---------------------------+---------------------+
| **Pool member 1**         | 10.1.20.14:80       |
+---------------------------+---------------------+
| **Pool member 2**         | 10.1.20.15:80       |
+---------------------------+---------------------+
| **Analytics Profile**     | custom\_analytics   |
+---------------------------+---------------------+

Review the status and components built by the iApp.

From both the Chromium and Firefox browsers go to **http://10.1.10.110**
and refresh the page several times and the select the following links
from the page on each browser.

**Request and Response Headers Allowed** *(review the request and
response headers)*

**HTTP Compress Example**

**Multiple Stream Example**

It may take up to 10 minutes for Analytic statistics to be available.

Q1. Did both pool members respond? Why?

Go to **Statistics >> Analytics >> HTTP** and review the information.

Q2. Can you determine which page took the longest to load?

Go to **Local Traffic >> Pools** and attempt to add **10.1.20.13:80** to
the **iapp\_lab\_pool**.

O3. Could you add the pool member? Why?

Q4. Can you add the **custom\_analytics** profile to the **ftp\_vs**?
Why?

LAB 5 – Managing the BIG-IP
===========================

Objective:

-  Objective 7.01-7.08

   -  Create and restore a UCS archive under the appropriate
      circumstances

   -  Identify which high-level tasks can be automated using BIG-IQ

   -  Manage software images

   -  Given an HA pair, describe the appropriate strategy for deploying
      a new software image

   -  Understand the processes of licensing, license reactivation,
      license modification and add-ons

   -  Identify which modules are licensed and/or provisioned

   -  Explain how to create a user

   -  Explain how to modify user properties

Estimated completion time: X minutes

Exercise 5.1 – UCS, BIG-IP Archive
----------------------------------

Task 1 – Create UCS Archive Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Open **System > Archives** page.

Create new archive **backup\_labs\_1\_to\_4**

Q1. What extension must Archive have?

Q2. What is the default location for ucs files?

Q3. What is command for loading ucs file?

Q4. What issues will occur by restoring ucs file on RMA device?

Exercise 5.2 – Upgrading a BIG-IP Device Service Clusters (DSC)
---------------------------------------------------------------

Task 1 – Upgrading software
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Prior to any upgrade, you would want to backup your device and then
synchronize your changes. In the upper left corner, you should see
**Changes Pending** due to the changes you have made to
**bigip01.f5demo.com**.

Click on **Changes Pending** or go to **Device Management >> Overview**
and select **bigip01.**

The **Sync Device to Group** button should already be selected. Hit the
**Sync** button at the bottom.

Sometime sync get slightly off, if your sync fails select Overwrite
Configuration and try again

Q1. You are about to start your upgrade to 12.1, which device will you
upgrade first?

On the appropriate device go to **System >> Software Management**

Select the v12.1.2 image and hit **Install.**

In the **Volume set name** selection enter **upgrade**.

You could also have pick a volume, but for the lab you are creating a
new one.

Q2. True or false? Once the install is complete, the BIG-IP will
automatically reboot to the new volume.

Q3. What steps would be required to complete the upgrade?

Exercise 5.3 – BIG-IQ
---------------------

Task 1 – Peruse BIG-IQ
~~~~~~~~~~~~~~~~~~~~~~

In this lab you will talk a short walk through the BIG-IQ interface and
perform a few tasks.

Logon to the BIG-IQ at **https://10.1.1.235** Username: **admin**
Password: **admin**

Go to **BIG-IQ** >> **Device >> Configuration >> Overview** view the
various panes.

Q1. What BIG-IPs are being managed?

Select the Backups pane, select “+” and the **Add Backup**

|image7|

Back up **bigip01.f5demo.com**.

Go to **BIG-IQ >> ADC** and review the information in the panels.

Q2. Where are configurations currently being display from?

Q3. What is the difference between displaying from BIG-IQ and displaying
from BIG-IP?

Select **bigip02** and the hover the mouse over the **Nodes** title.

Now select the **BIG-IQ** radio button from above, select **bigip02**,
and then hover over the **Nodes** title.

Q4. What now appears in the **Nodes** title when you hover the mouse
over it?

Task 2 – Make a modification via the BIG-IQ
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

With, **BIG-IQ** and **bigip02** selected hover over **Nodes** and hit
the plus sign (**+**) and add a new node to **bigip02** named
**new\_node** with an IP address of **10.1.20.252.**

Q1. Was new\_node added to bigip02?

Let’s have BIG-IQ deploy the change. Select **Deployment** next to
**ADC** on the top bar.

Next to **Deployments**, select the plus sign (+) and **Deploy
Configuration Changes**. Select the **review Pending Changes** link.

Q2. What is being added? What is in the **New Version** window.?

Name deployment **deploy\_new\_node**, select the **bigip02** device and
click on **Deploy** in the upper left.

*Q3. Check **bigip02**, was **new\_node** created?*

LAB 6 – MODIFY AND MANAGE POOL AND VIRTUAL SERVERS
--------------------------------------------------

Exercise 6.1 – Modify and Troubleshoot Virtual Servers
------------------------------------------------------

Objective:

-  Objective 8.01-8.02

   -  Modify and manage virtual servers

   -  Modify and manage pManage software images

Estimated completion time: A lot of minutes

Task 1 – Troubleshooting virtual servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By now, I am sure you are dying to know what’s up with the
**purple\_vs**. Here’s a chance to find out. You are going to some
troubleshooting with a little guidance.

Go to **Network Maps** and take a look at the status of the
**purple\_vs** and its components.

It is obvious that all pool members are offline which could be anything,
a network issue, a server issue, a BIG-IP configuration issue.

Q1. Where would you start?

SSH to **bigip01** at 10.1.1.245.

Q2. Attempt to ping he pool members. Does it work? What does this tell
you?

Q3. Attempt a **curl -i** against the pool members. Does it work? What
does this tell you?

Q4. Since the problem affects all pool members, what would you suspect
as a possible issue?

Find the issue with the pool members and correct the issue.

Q5. Did you correct the issue? (If not go to **Appendix 1 – Answer Key**
and see how the issue was fixed)

Q6. Now the pool is working and purple\_vs is available can you access
the page through the virtual?

Q7. What is your next step in debugging? Is the virtual server
processing traffic?

You need to watch traffic from your PC to the BIG-IP virtual server and
from the BIG-IP to the pool.

Q8. What command(s) could you use to watch traffic hit the virtual
server and leave toward the pool?

(Try to figure it out, if you need help go to Appendix 1 – Answer Key
and my version of the commands)

Q9. Did you see traffic hit the virtual server? Did you see BIG-IP send
traffic to a pool member?

Q10. Did you see the return traffic? If there was no response, what is
your step?

The server’s default gateway is 10.1.20.240, which is an **unused** IP
address on the 10.1.20.0/24 network

(If you need help go to **Appendix 1 – Answer Key** and my version of
the commands)

There were two ways to resolve the virtual server issue. Your purple\_vs
should now be available.

Task 2 – Working with profiles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create new virtual server secure\_vs 10.1.10.100:443 with TCP profile,
Automap and **www\_pool**. Browse to https://10.1.10.100 and observe
tcpdump

Q1. Did site work? Why not?

Change SSL Profile to include clientssl then update Browse to
https://10.1.10.100 and observe tcpdump Q2. Did site work?

Enable cookies Default Persistence Profile and update? Note error and
troubleshoot to fix.

Q3. What was needed to add cookie persistence?

Browse to https://10.1.10.100/index.php and select Display Cookie on
bottom of page.

Q4. What is the name of the cookie inserted begin with?

Create new pool secure\_pool with members of 10.1.20.11:443,
10.1.20.12:443 and 10.1.20.13:443 and assign to sure\_vs. Browse to
https://10.1.10.100

Q5. Did site work?

Troubleshoot and fix.

Q6. What profile was needed to correct the error?

APPENDIX 1 – ANSWER KEY
=======================

LAB 1 – Packet Processing and Virtual Servers
=============================================

Exercise 1.1 – Lab Preparation and Packet Processing
----------------------------------------------------

Task 2 – Open BIG-IP TMSH and TCPDump session 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Why are ssh sessions not displayed in connection table?

“tmsh show sys connections” displays connections on the TMOS data plane.
SSH connections are established to out-of-band management interface and
thus not seen.

Task 3 – Establish ftp connection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. In the tcpdump above, what is client IP address and port and the
server IP address port?

10.1.10.1:60603 and 10.1.10.20:21 (FTP)

\*Note 60603 is an ephemeral port and BIG-IP will attempt to the same
client port on the server-side connection

Q2. What is source ip and port as seen by ftp server in the example
above?

Source IP: 10.1.20.249 Source IP: 61236

Q3. What happened to the original client IP address and where did
10.1.20.249 come from?

The virtual server was configured to do source address translation using
the SNAT Pool, SNAT249\_pool. Reviewing the configuration of
SNAT249\_pool shows it was configured with IP address 10.1.20.249.

Exercise 1.2 – Packet Filters
-----------------------------

Task 2 – Test the FTP packet filter
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Was the existing ftp connection in the connection table affected?
Why?

The FTP connection is not affected because adding packet filter does not
impact established connections.

Q2. Was ftp connection successful? If yes, why?

The attempt to establish a new FTP connection was blocked, because the
packet filter rule applies to all new connection attempts

Q3. What did tcpdump reveal? Connection timeout or reset?

Tcpdump revealed multiple “S” (syn) attempts without receiving ack. This
is indicating a connection timeout.

Q4. What did virtual server statistics for ftp20\_vs reveal? Why are
counters not incrementing?

VS stats shows no new connection attempts because Filter is applied
before VS in order of processing

Q5. Prioritize the packet processing order:

Virtual Server *3* SNAT *4* AFM/Pkt Filter *2* NAT *5* Existing
Connections *1* Self IP *6* Drop *7 *

Exercise 1.3 – Virtual Server Packet Processing
-----------------------------------------------

Task 2 – Testing Virtual Server Packet Processing Behavior
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Which VS is used for web traffic over port 8080?

wildcard\_vs

Q2. Which VS is used for ftp traffic?

ftp\_vs

Q3. Which VS is used for web traffic over the default HTTP port? Which
port was used?

www\_vs port 80

Q4. Which VS is used for web traffic?

**wildcard\_vs**

LAB 2 – Virtual Server and Pool Behavior and Status
===================================================

Exercise 2.1 – Virtual Server Status
------------------------------------

Task 2 – Test Disabled Virtual Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the Availability of **www\_vs**? What is the State?

Availability: available, State: disabled

Q2. What symbol is used to represent **www\_vs** status?

Black Circle

Q3. Would you expect browsing to http://10.1.10.100 to work?

no

Q4. Can you ping the virtual IP?

Yes, the virtual address still responds to pings

Q5. Did the site work? What did the tcpdump show?

No, the tcpdump showed the virtual server 10.1.10.100:80 responding to
SYNs with Resets

Q6. Did statistics counters for any virtual increment?

No

Q7. Why do you think the **wildcard\_vs** didn’t pick up the packets?

www\_vs was the most specific virtual server so it responded. That
response was to reset the connection.

Q8. What symbol is used to represent **wildcard\_vs**? Why is symbol a
square?

The status symbol is a black square. Black because the virtual server
was administratively disabled and square because there is no monitor and
the state is Unknown

Q9. What is the Reason given for current state?

The children pool member(s) either don't have service checking enabled,
or service check results are not available yet. Availability: unknown
State: disabled

Q10. Does ftp session still work? Why?

Disabling a configuration item (node, pool or virtual server) does not
affect existing connections.

Q11. Did new ftp session establish connection? Why not?

No, a disabled virtual server will not process new connections.

Task 3 – Virtual Server Connection Limits and Status
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Does ftp session work?

Yes

Q2. What is the virtual server status of **ftp\_vs**?

Yellow Triangle - Availability: unavailable - State: enabled

Q3. Did new ftp session establish connection? Why not?

No, the virtual server's connection limit has been reached-

Q4. Did tcpdump capture connection reset?

Yes, tcpdump revealed “R” reset

Exercise 2.2 – Pool Member and Virtual Servers
----------------------------------------------

Task 2 – Effects of Monitors on Members, Pools and Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Since the **mysql\_monitor** will fail, how long will it take to
mark the pool offline?

60 seconds, the monitor will have to fail 4 times at 15 second intervals
before it exceeds the 46 second timeout value.

Q2. What is the icon and status of **www\_vs**?

Red Diamond – Availability: offline – State: enabled – The children pool
member(s) are down

Q3. What is the icon and status of **www\_pool**?

Red Diamond – Availability: offline – Sate: enabled - The children pool
member(s) are down

Q4. What is the icon and status of the **www\_pool** members?

Red Diamond – Availability: offline – State: enabled - Pool member has
been marked down by a monitor

Q5. Does pool configuration have an effect on virtual server status?

Yes, the status of the pool members can affect the status of the virtual
server.

Q6. What is the icon and status of www\_vs?

Black Diamond - Availability: offline – State: disabled – The children
pool member(s) are down

Q7. Did traffic counters increment for **www\_vs**?

No

Q8. What is the difference in the tcpdumps between Offline (Disabled) vs
Offline (Enabled)?

Offline (Disabled) – immediate connection reset, you will see no virtual
server statistics.

Offline (Enabled) – initial connection accepted then reset – vs stats
incremented

Task 3 – More on status and member specific monitors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the status of the Pool Member and the monitors assigned to
it?

Red Diamond - Red Diamond – Availability: offline – State: enabled -
Pool member has been marked down by a monitor

http – Green Circle, mysql\_monitor – Red Diamond

Q2. What is the status of **www\_vs**, **www\_pool** and the pool
members? Why?

Green, Green, Red, Red, Green. One pool member available, marks the pool
available and since the pool is available, the virtual server is
available

Q3. Did the site work?

Yes

Q4. Which **www\_pool** members was traffic sent to?

Traffic was distributed to availble pool members.

Exercise 2.3 – Load Balancing
-----------------------------

Task 1 – Load Balancing
~~~~~~~~~~~~~~~~~~~~~~~

Q1. Which **www\_pool** members was traffic sent to?

Traffic was distributed to 10.1.20.12 and 10.1.20.13

Q2. Did member 10.1.20.12 receive the most traffic? Why not?

No, because LB method is round robin, Ratio and Priority Group
configurations do not apply.

Q3. Which **www\_pool** members was traffic sent to?

Traffic was distributed to 10.1.20.12 and 10.1.20.13

Q4. Did member 10.1.20.12 receive the most traffic?

10.1.20.12 received 5x more traffic than 10.1.20.12

Task 2 – Priority Group Activation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Which **www\_pool** members was traffic sent to?

Traffic was distributed to 10.1.20.11 and 10.1.20.12

Q2. Which **www\_pool** members was traffic sent to? Why?

Traffic was distributed to 10.1.20.12 and 10.1.20.13. Pool member
availability dropped below 2 available members in the highest priority
group and the next lowest priority group was activated.

Q3. Would the results have been different if 10.1.20.11:80 had been
marked offline or marked with a yellow triangle?

No, both mark the member as Unavailable, dropping the Available members
below 2.

Task 3 – The Effects of Persistence on Load Balancing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Why was a http profile required?

The http profile was required to tell the BIG-IP to parse the http
request/response sequence for the virtual server so it could insert and
read cookies in the http headers.

Q2. Was traffic evenly distributed to all **www\_pool** members? Why
not?

Traffic went to only on pool member because of persistence,

Q3. Did you persist to the Disabled member? Why?

Yes, a Disable pool member will still receive new connections if a
persistence record points to it.

Q4. Does traffic continue to persist to the member Forced Offline?

No, another available member was selected and a new persistence record
was created

Q5. If cookies were disable on your browser would persistence still
work? Why?

Yes, a source address persistence you be used to persist to a pool
member

LAB 3 – TROUBLESHOOTING HARDWARE
================================

Exercise 3.1 – Trouble-shooting Hardware
----------------------------------------

Task 1 – End User Diagnostics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What three methods are available for running EUD on F5 Hardware?

USB CDROM, USB Bootable Drive, Hardware Boot Menu

Q2. How do you determine EUD version?

EUD image downloaded or eud\_info

Q3. What is the filename and location of the EUD output?

/shared/log/eud.log

Task 2 – LCD Panel 
~~~~~~~~~~~~~~~~~~~

Q1. How do you halt the unit via the LCD panel?

Press X, select system menu, press check, select halt, press check to
confirm

Q2. Holding the X for 4 seconds does what?

Power down unit

Q3. Holding the Check button for 4 seconds does what?

Reboot the unit

Task 3 – Hardware Log Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the filename and location of the logs for LTM?

/var/log/ltm

Q2. Where will power supply, fan and hard disk related issues be logged?

/var/log/ltm

Task 4 – HA and Failover
~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Is failover sometimes used to determine issues related to hardware
or software?

hardware

Q2. How do you initiate failover to standby unit?

From Active unit select Network->Traffic Groups, select traffic group,
select Force to Standby

Q3. What persistence profile cannot be mirrored?

Cookie persistence is not mirrored

Q4. What two connections types are re-mirrored after failback?

Only FastL4 and SNAT connections are re- mirrored after failback

Q5. When would you recommend using connection mirroring?

Long lived connections

Q6. Where is connection mirroring configured?

You can configure connection mirroring at VS and SNAT

Q7. Where is persistence mirroring configured?

You can configure persistence mirroring at Persistence

Q8. What tmsh command is used to view mirrored connections?

show /ltm persistence persist-records

Q9. What tmsh command is used to view mirrored persistence?.

show /ltm persistence persist-records

Q10. What can be the cause of primary unit returning to active state
after initiating failover to standby?

Show /sys connection all-properties

Exercise 3.2 – tcpdump Packet Capture
-------------------------------------

Task 1 – Packet Captures of multiple interfaces simultaneously
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the alternate method for capturing two interfaces
simultaneously?

tcpdump –ni eth1 –w /var/tmp/dump1.cap & tcpdump –ni eth2 –w
/var/tmp/dump2.cap

Q2. What interface does 0.0 represent?

All interfaces

Q3. What interface typically represents the management interface?

eth0

Q4. What is recommended method for packet captures on high load system?

F5 recommends that you mirror traffic to a dedicated sniffing device

Q5. Will tcpdump capture PVA accelerated traffic?

No, you must disable PVA to capture traffic

Exercise 3.3 – Performance Statistics
-------------------------------------

Task 1 – Observing performance statistics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the longest time interval available for performance
statistics?

30 Days

Exercise 3.4 – Connectivity Troubleshooting
-------------------------------------------

Task 1 – Connectivity troubleshooting tools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Was echo response received?

Ping reply was successful

Q2. What is the status of the virtual servers?

ftp\_vs and www\_vs available, disabled – wildcard\_vs unknown, disabled

Q3. Was echo response received?

Ping reply successful

Exercise 3.5 – Self IP Port Lockdown
------------------------------------

Task 1 – Effects of Port Lockdown
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Was echo response received?

Ping reply successful

Q2. Was ssh successful? Why not?

No. Port lockdown set to “Allow None” by default

Q3. Was ssh successful?

Yes

Q4. Does existing ssh window still work?

No

Q5. Was new ssh session established?

No

LAB 4 – SUPPORT AND ANALYTICS
=============================

Exercise 4.1 – Support, Status and Logs
---------------------------------------

Task 1 – Qkview and iHealth
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Are logs associated with qkview?

Yes

Q2. Where is default filename and location of qkview output?

/var/tmp/hostname.qkview

Q3. Where is the default filename and location of core dump?

/var/core/

Q4. What is Severity and Condition for unit failure in active/standby
pair?

Severity 2, Site at Risk

Q5. If support case was opened online with Severity 4 and no call has
been received in a week. What should you do?

Call support, reference open case and ask to escalate. This may require
Duty Manager approval.

Q6. What is the procedure to escalate support case?

Call support, reference open case and ask to escalate. This may require
Duty Manager approval.

Task 2 – Network Map
~~~~~~~~~~~~~~~~~~~~

Q1. What is a node?

IP Address of Pool Member

Q2. What icon is reflected for 10.1.20.11 on the Network map?

Grey Circle

Q3. Does **ftp\_vs** still work as expected?

No

Q4. Where is irule reflected on Network Map?

iRule is displayed between VS and Pool

Task 3 - Dashboard
~~~~~~~~~~~~~~~~~~

Q1. What is longest duration available for reporting?

1 Month

Q2. How can report be exported?

Reports may be exported as csv files.

Task 4 – Log files
~~~~~~~~~~~~~~~~~~

Q1. Was alert logged?

Yes

Q2. Was the alert logged here?

Q3. What command is needed to find all instances of err in /var/log/ltm?

grep err /var/log/ltm

Exercise 4.2 – iApps and Analytics
----------------------------------

Task 1 – Create iApps Analytics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Did both pool members respond? Why?

No, only one responded because cookie persistence was built using the
iApp

Q2. Can you determine which page took the longest to load?

If you select Latency >> Page Load Time from the top bar you will find
/bigtext.html took longest.

O3. Could you add the pool member? Why?

No, because iApp strictness is on by default and the application can
only be changed by going to the iApp application and selecting
Reconfigure from the top bar

Q4. Can you add the **custom\_analytics** profile to the **ftp\_vs**?
Why?

No, analytics in v11.5 can only be done on HTTP and DNS virtual servers
with a HTTP or DNS profile attached.

LAB 5 – Managing the BIG-IP
---------------------------

Exercise 5.1 – UCS, BIG-IP Archive
----------------------------------

Task 1 – Create UCS Archive Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What extension must Archive have?

.ucs

Q2. What is the default location for ucs files?

/var/local/ucs

Q3. What is command for loading ucs file?

load /sys ucs <path/to/UCS>

load /sys ucs <path/to/UCS> no-license – will not restore the license
file

Q4. What issues will occur by restoring ucs file on RMA device?

Licensing and device cert keys must be updated.

Exercise 5.2 – Upgrading a BIG-IP Device Service Clusters (DSC)
---------------------------------------------------------------

Task 1 – Upgrading software
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. You are about to start your upgrade to 12.1, which device will you
upgrade first?

You would begin the upgrade on the standby device, in this case that
should be bigip02.

Q2. True or false? Once the install is complete, the BIG-IP will
automatically reboot to the new volume.

False, you will have to set the new volume as the Active volume and then
reboot the BIG-IP

Q3. What steps would be required to complete the upgrade?

1. Set the new volume to the active volume

2. Reboot the BIG-IP

3. Confirm the reboot was successful and the BIG-IP is running

4. Force the BIG-IP with the old software to Standby, making virtual
   servers, etc active on the upgraded BIG-IP

5. Test that traffic is passing correctly.

6. Upgrade the BIG-IP with the older software.

Exercise 5.3 – BIG-IQ
---------------------

Task 1 – Peruse BIG-IQ
~~~~~~~~~~~~~~~~~~~~~~

Q1. What BIG-IPs are being managed?

bigip01.f5demo.com and bigip02.f5demo.com

Q2. Where are configurations currently being display from?

The configuration displayed was retrieved from the BIG-IP

Q3. What is the difference between displaying from BIG-IQ and displaying
from BIG-IP?

If you are displaying configuration from BIG-IP the configuration is
maintained and updated on that BIG-IP. If you are displaying
configuration from the BIG-IQ, then BIG-IQ owns the configuration and
can push changes out to the BIG-IP, no change should be made to the
BIG-IP directly.

Q4. What now appears in the Nodes title when you hover the mouse over
it?

A “+” appears in the title area because you can now modify the device
via the BIG\_IQ.

Task 2 – Make a modification via the BIG-IQ
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Was new\_node added to bigip02?

No, it was not.

Q2. What is being added? What is in the **New Version** window.?

new\_node is being added and the REST commands to do that are show in
the New Version window.

Q3. Check **bigip02**, was **new\_node** created?

Yes

LAB 6 – MODIFY AND MANAGER POOLS AND VIRTUAL SERVER
---------------------------------------------------

Exercise 6.1 – MODIFY AND TROUBLESHOOT VIRTUAL SERVERS
------------------------------------------------------

Task 1 – Troubleshooting virtual servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Where would you start?

I would go on the BIG-IP and test connectivity from the BIG-IP to the
pool members.

Q2. Attempt to ping one of the pool members. Does it work? What does
this tell you?

The ping should be successful. This means me server IP is up and I have
basic connectivity.

Q3. Attempt a **curl -i** against a pool member. Does it work? What does
this tell you?

The curl should be successful and you should see the request come back.
The application is running.

Q4. Since the problem affects all pool members, what would you suspect
as a possible issue?

Since I can see all pool members are functioning I would suspect the
monitor is the issue. You could start debugging the monitor directly, or
you could then put the default HTTP monitor and see if the pool members
come up. If they do, then the monitor is the issue and needs correction.
In the case, you would check the Send and Receive strings. I would use a
curl -i (to include the header and response codes) to look for the
receive string. In this case it’s obvious, we are looking for a 200 OK
(successful reponse), but have fat-finger 020 OK in the Receive box.
Correct the receive string and reapply the monitor. The pool should come
up Available (Green).

Note: The default HTTP monitor usually, but not always, works on an HTTP
application.

Q5. Did you correct the issue? (If not go to **Appendix 1 – Answer Key**
and see how the issue was fixed)

Yes

Q6. Now the pool is working and purple\_vs is available can you access
the page through the virtual?

No

Q7. What do you think would be the next step in debugging the issue
would be?

I would clear the virtual server statistics and try again and see if the
traffic is hitting purple\_vs. The virtual server statistics should show
traffic being processed.

Q8. What command(s) could you use to watch traffic hit the virtual
server and leave toward the pool?

I would create two tcpdumps one on the client-side and the other on the
server-side. I would want to limit the captures to watch for my PC IP
address 10.1.10.51. You will need two terminal windows.

Terminal Window 1 (Client to BIG-IP)

**tcpdump -i client\_vlan -X -s0 host 10.1.10.51 and 10.1.10.105**

(This command will only watch client-side traffic between the PC and
virtual server. The -s0 command will dump the entire packet -X command
will dump hex and ascii code of the packet. You will be able to see the
HTTP request and response in the dump)

Terminal Window 2 (BIG-IP to Pool)

**tcpdump -i server\_vlan -X -s0 host 10.1.10.51**

(This command will only watch server-side traffic from the PC and to the
pool. The -s0 command will dump the entire packet -X command will dump
hex and ascii code of the packet. You will be able to see the HTTP
request and response in the dump)

Q9. Did you see traffic hit the virtual server? Did you see BIG-IP send
traffic to a pool member?

You should have seen traffic hit the virtual server in Window 1 and in
Window 2 BIG-IP should have picked a pool member and sent traffic to it.

Q10. Did you see the return traffic? If there was no response, what is
your step?

No, you should not have received a response. Because the BIG-IP is not
the default gateway, so the response went someplace else.

1. You can add and SNAT Pool or do SNAT Automap on the virtual server.

2. You can add 10.1.20.240 as a self IP address on the BIG-IP. This
   should be a floating IP in traffic\_group\_1 so that the default
   gateway for the servers is still available upon failover.

Task 2 – Working with profiles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Did site work? Why not?

SSL connection error

Q2. Did site work?

Yes

Q3. What was needed to add cookie persistence?

http profile

Q4. What is the name of the cookie inserted begin with?

BIGipServerwww\_pool=….

Q5. Did site work?

No

Q6. What profile was needed to correct the error?

Server side ssl profile

.. |image0| image:: media/image1.png
   :width: 1.93667in
   :height: 0.61667in
.. |image1| image:: media/image3.jpg
   :width: 6.59740in
   :height: 6.73203in
.. |image2| image:: media/image4.png
   :width: 4.13333in
   :height: 3.14356in
.. |image3| image:: media/image5.png
   :width: 3.61486in
   :height: 3.26667in
.. |image4| image:: media/image6.png
   :width: 6.44487in
   :height: 1.65476in
.. |image5| image:: media/image7.png
   :width: 6.34524in
   :height: 1.31133in
.. |image6| image:: media/image8.png
   :width: 6.70495in
   :height: 0.54167in
.. |image7| image:: media/image9.png
   :width: 2.15355in
   :height: 0.78146in
