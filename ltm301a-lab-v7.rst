Participant Hands-on Lab Guide v1.0

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

`Table of Contents 1 <#_Toc489016153>`__

`Accessing the lab environment. 9 <#accessing-the-lab-environment.>`__

`LAB 1 – Basic Setup, TMSH and SNATs
10 <#lab-1-basic-setup-tmsh-and-snats>`__

`Exercise 1.1 Basic set up using TMSH
10 <#exercise-1.1-basic-set-up-using-tmsh>`__

`Task 1 – TMSH challenge 10 <#task-1-tmsh-challenge>`__

`Task 2 – SNAT Pools 12 <#_Toc489016158>`__

`Task 3 – SNATs and NATs 13 <#_Toc489016159>`__

`LAB 2 – Profiles 14 <#lab-2-profiles>`__

`Exercise 2.1 – Working with Profiles
14 <#exercise-2.1-working-with-profiles>`__

`Task 1 – Working with profiles 14 <#_Toc489016162>`__

`Exercise 2.2 – Application Acceleration
15 <#exercise-2.2-application-acceleration>`__

`Task 1 - TCP Express 15 <#task-1---tcp-express>`__

`Task 2 - HTTP Optimization - RamCache Lab 15 <#_Toc489016165>`__

`Task 3 - HTTP Optimization - HTTP Compression Lab
16 <#_Toc489016166>`__

`Task 4 - Securing web applications with the HTTP profile
17 <#_Toc489016167>`__

`Task 5 - Using iRules 18 <#task-5---using-irules>`__

`LAB 3: Application Visibilty and Reporting (AVR) 20 <#_Toc489016169>`__

`TASK 1 – AVR Lab Setup - Verify provisioning, iRules and Data Group
20 <#_Toc489016170>`__

`TASK 2 – Create an Analytics Profile
21 <#task-2-create-an-analytics-profile>`__

`TASK 3 – Create a Web Application
21 <#task-3-create-a-web-application>`__

`TASK 4 – Visit the Web Site to Generate AVR Data
22 <#task-4-visit-the-web-site-to-generate-avr-data>`__

`TASK 5 – View the Analytics Reports 22 <#_Toc489016174>`__

`LAB 4 – Monitors and Status 24 <#_Toc489016175>`__

`Exercise 4.1 – Basic Monitoring 24 <#_Toc489016176>`__

`Task 1 – Default Monitors 24 <#task-1-default-monitors>`__

`Task 2 - Content Monitors 25 <#_Toc489016178>`__

`Exercise 4.2 – Virtual Server Status 26 <#_Toc489016179>`__

`Task 1 – Test Disabled Virtual Servers
26 <#task-1-test-disabled-virtual-servers>`__

`Task 2 – Virtual Server Connection Limits and Status
26 <#task-2-virtual-server-connection-limits-and-status>`__

`Exercise 4.3 – Pool Member and Virtual Servers 28 <#_Toc489016182>`__

`Task 1 – Create a new monitor 28 <#task-1-create-a-new-monitor>`__

`Task 2 – Effects of Monitors on Members, Pools and Virtual Servers
28 <#task-2-effects-of-monitors-on-members-pools-and-virtual-servers>`__

`Task 3 – More on status and member specific monitors
29 <#task-3-more-on-status-and-member-specific-monitors>`__

`Exercise 4.4 - Extended Application Verification (EAV)
29 <#_Toc489016186>`__

`Task 1 – Create an EAV monitor 29 <#task-1-create-an-eav-monitor>`__

`Exercise 4.4 - Inband Monitors 30 <#_Toc489016188>`__

`Task 1 – Create an Inband monitor and Active monitor with an Up
Interval
30 <#task-1-create-an-inband-monitor-and-active-monitor-with-an-up-interval>`__

`Task2 – Assign the Inband monitor to a pool and test
30 <#task2-assign-the-inband-monitor-to-a-pool-and-test>`__

`LAB 5 – SSL 32 <#_Toc489016191>`__

`Task 1 – Creating and Importing Certs and Key
32 <#task-1-creating-and-importing-certs-and-key>`__

`Task 2 – SSL Profile and Virtual Servers 33 <#_Toc489016193>`__

`LAB 6 – Virtual Servers and Packet Processing Review
35 <#lab-6-virtual-servers-and-packet-processing-review>`__

`Exercise 6.1 Packet Processing 35 <#_Toc489016195>`__

`Task 1 – Open BIG-IP TMSH and TCPDump session 35 <#_Toc489016196>`__

`Task 2 – Establish ftp connection 36 <#_Toc489016197>`__

`Exercise 6.2 – Packet Filters 36 <#_Toc489016198>`__

`Task 1 – Create a packet filter 36 <#_Toc489016199>`__

`Task 2 – Test the FTP packet filter 37 <#_Toc489016200>`__

`Exercise 6.3 – Virtual Server Packet Processing 37 <#_Toc489016201>`__

`Task 1 – Create a Transparent virtual server 37 <#_Toc489016202>`__

`Task 2 – Testing Virtual Server Packet Processing Behavior
38 <#_Toc489016203>`__

`Exercise 6.4 - Forwarding Virtual Servers 39 <#_Toc489016204>`__

`Task 1 – IP Forwarding Virtual Server
39 <#task-1-ip-forwarding-virtual-server>`__

`Task 2 – More on Transparent Virtual Servers 39 <#_Toc489016206>`__

`LAB 7 – Load Balancing and Pools
41 <#lab-7-load-balancing-and-pools>`__

`Exercise 7.1 Load Balancing 41 <#exercise-7.1-load-balancing>`__

`Task 1 - Ratio Load Balancing 41 <#task-1---ratio-load-balancing>`__

`Task 2 - Priority Groups Lab 41 <#_Toc489016210>`__

`Task 3 – Simple (Source Address) Persistence 42 <#_Toc489016211>`__

`LAB 8 – iApps (no labs required) 44 <#_Toc489016212>`__

`LAB 9 – Networking 45 <#_Toc489016213>`__

`Exercise 9.1 – Self IP Port Lockdown and more
45 <#exercise-9.1-self-ip-port-lockdown-and-more>`__

`Task 1 – Effects of Port Lockdown 45 <#_Toc489016215>`__

`Task 3 – Configure DNS and NTP 45 <#_Toc489016216>`__

`Task 3 – VLAN Tagging 46 <#task-3-vlan-tagging>`__

`LAB 10 – Roles and Partitions 47 <#_Toc489016218>`__

`Exercise 10.1 Roles and Partitions
47 <#exercise-10.1-roles-and-partitions>`__

`Task 1 – Create a partition 47 <#task-1-create-a-partition>`__

`Task 2 – Create and place a user in a partition 47 <#_Toc489016221>`__

`Exercise 10.2 Remote Authentication 48 <#_Toc489016222>`__

`Task 1 – Authenticate against LDAP
48 <#task-1-authenticate-against-ldap>`__

`LAB 11 – Device Service Clusters and High Availability
49 <#_Toc489016224>`__

`Exercise 11.1 – Building a DSC (Device Service Cluster)
49 <#_Toc489016225>`__

`Task 1 - Base Networking and HA VLAN
49 <#task-1---base-networking-and-ha-vlan>`__

`Task 2 – Prepare each BIG-IP for High Availability
50 <#_Toc489016227>`__

`Task 3 – Build the Device Trust and Device Group 51 <#_Toc489016228>`__

`Exercise 11.2 – Failover and Mirroring 52 <#_Toc489016229>`__

`Task 1 – Testing Failover 52 <#task-1-testing-failover>`__

`Task 2 - Mirroring 53 <#_Toc489016231>`__

`Exercise 11.3 – Traffic Groups 54 <#_Toc489016232>`__

`Task 1 - Build a New Traffic Group.
54 <#task-1---build-a-new-traffic-group.>`__

`LAB 12 – Performance (No Labs Available)
55 <#lab-12-performance-no-labs-available>`__

`LAB 13 – vCMP (no labs required) 56 <#lab-13-vcmp-no-labs-required>`__

`LAB 14 – Security and Securing the BIG-IP 57 <#_Toc489016236>`__

`Exercise 14.1 – More Security Features
57 <#exercise-14.1-more-security-features>`__

`Task 1 – Configure Audit Logging
57 <#task-1-configure-audit-logging>`__

`Task 2 – Limiting SSH access to the BIG-IP 57 <#_Toc489016239>`__

`Exercise 14.2 - BIG-IP Remote Logging
57 <#exercise-14.2---big-ip-remote-logging>`__

`Task 1 - Configuring a logging pool
57 <#task-1---configuring-a-logging-pool>`__

`Task 2 - Configure the logging destinations
58 <#task-2---configure-the-logging-destinations>`__

`Task 3 - Log Publisher and Filtering Messages
58 <#task-3---log-publisher-and-filtering-messages>`__

`Task 4 - Test your logging configuration 59 <#_Toc489016244>`__

`APPENDIX 1 – ANSWER KEY 60 <#appendix-1-answer-key>`__

`LAB 1 – Basic Setup, TMSH and SNATs 60 <#_Toc489016246>`__

`Exercise 1.1 – Basic set up using TMSH 60 <#_Toc489016247>`__

`Task 1 – Open BIG-IP TMSH and TCPDump session 60 <#_Toc489016248>`__

`Task 2 – SNAT Pools 60 <#_Toc489016249>`__

`Task 3 – SNATs and NATs 60 <#_Toc489016250>`__

`LAB 2 – Profiles 61 <#_Toc489016251>`__

`Exercise 2.1 – Working with Profiles 61 <#_Toc489016252>`__

`Task 1 – Working with profiles 61 <#_Toc489016253>`__

`Exercise 2.2 – Application Acceleration 61 <#_Toc489016254>`__

`Task 1 - TCP Express 61 <#_Toc489016255>`__

`Task 2 - HTTP Optimization - RamCache Lab 62 <#_Toc489016256>`__

`Task 3 - HTTP Optimization - HTTP Compression Lab
62 <#_Toc489016257>`__

`Task 4 - Securing web applications with the HTTP profile
62 <#_Toc489016258>`__

`LAB 3: Application Visibilty and Reporting (AVR) 63 <#_Toc489016259>`__

`TASK 1 – AVR Lab Setup - Verify provisioning, iRules and Data Group
63 <#_Toc489016260>`__

`TASK 6 – View the Analytics Reports 63 <#_Toc489016261>`__

`LAB 4 – Monitors and Status 63 <#_Toc489016262>`__

`Exercise 4.1 – Basic Monitoring 63 <#_Toc489016263>`__

`Task 1 – Default Monitors 63 <#_Toc489016264>`__

`Task 2 - Content Monitors 63 <#_Toc489016265>`__

`Exercise 4.2 – Virtual Server Status 64 <#_Toc489016266>`__

`Task 1 – Test Disabled Virtual Servers 64 <#_Toc489016267>`__

`Task 2 – Virtual Server Connection Limits and Status
65 <#_Toc489016268>`__

`Exercise 4.3 – Pool Member and Virtual Servers 65 <#_Toc489016269>`__

`Task 2 – Effects of Monitors on Members, Pools and Virtual Servers
65 <#_Toc489016270>`__

`Task 3 – More on status and member specific monitors
66 <#_Toc489016271>`__

`Exercise 4.4 - Extended Application Verification (EAV)
66 <#_Toc489016272>`__

`Task 1 – Create an EAV monitor 66 <#_Toc489016273>`__

`Exercise 4.4 - Inband Monitors 66 <#_Toc489016274>`__

`LAB 5 – SSL 67 <#_Toc489016275>`__

`Task 1 – Importing Certs and Key
67 <#task-1-importing-certs-and-key>`__

`Task 2 – SSL Profile and Virtual Servers
67 <#task-2-ssl-profile-and-virtual-servers-1>`__

`LAB 6 – Virtual Servers and Packet Processing Review
67 <#_Toc489016278>`__

`Exercise 6.1 – Lab Preparation and Packet Processing
67 <#_Toc489016279>`__

`Task 2 – Open BIG-IP TMSH and TCPDump session 67 <#_Toc489016280>`__

`Task 3 – Establish ftp connection 67 <#_Toc489016281>`__

`Exercise 6.2 – Packet Filters 68 <#_Toc489016282>`__

`Task 2 – Test the FTP packet filter 68 <#_Toc489016283>`__

`Exercise 6.4 – Virtual Server Packet Processing 68 <#_Toc489016284>`__

`Task 2 – Testing Virtual Server Packet Processing Behavior
68 <#_Toc489016285>`__

`Exercise 6.2 - IP Forwarding Virtual Servers 69 <#_Toc489016286>`__

`Task 1 – Forwarding Virtual Server 69 <#_Toc489016287>`__

`Task 2 – More on Transparent Virtual Servers 69 <#_Toc489016288>`__

`LAB 7 – Load Balancing and Pools 69 <#_Toc489016289>`__

`Exercise 7.1 Load Balancing 69 <#_Toc489016290>`__

`Task 1 - Ratio Load Balancing 69 <#_Toc489016291>`__

`Task 2 - Priority Groups Lab 70 <#_Toc489016292>`__

`Task 5 – Simple (Source Address) Persistence 70 <#_Toc489016293>`__

`LAB 8 – iApps (no labs required) 70 <#_Toc489016294>`__

`LAB 9 – Networking 71 <#_Toc489016295>`__

`Exercise 9.1 – Self IP Port Lockdown and more 71 <#_Toc489016296>`__

`Task 1 – Effects of Port Lockdown 71 <#_Toc489016297>`__

`LAB 10 – Roles and Partitions 71 <#_Toc489016298>`__

`Exercise 10.1 Roles and Partitions 71 <#_Toc489016299>`__

`Task 2 – Create and place a user in a partition 71 <#_Toc489016300>`__

`Exercise 10.2 Remote Authentication 72 <#_Toc489016301>`__

`Task 1 – Authenticate against LDAP 72 <#_Toc489016302>`__

`LAB 11 – Device Service Clusters and High Availability
72 <#_Toc489016303>`__

`Exercise 11.1 – Building a DSC (Device Service Cluster)
72 <#exercise-11.1-building-a-dsc-device-service-cluster-1>`__

`Task 1 - Base Networking and HA VLAN 72 <#_Toc489016305>`__

`Task 2 – Prepare each BIG-IP for High Availability
72 <#_Toc489016306>`__

`Task 3 – Build the Device Trust and Device Group 73 <#_Toc489016307>`__

`Exercise 11.2 – Failover and Mirroring
73 <#exercise-11.2-failover-and-mirroring-1>`__

`Task 1 – Testing Failover 73 <#task-1-testing-failover-1>`__

`Task 2 - Mirroring 74 <#task-2---mirroring-1>`__

`Exercise 11.3 – Traffic Groups 74 <#exercise-11.3-traffic-groups-1>`__

`Task 1 - Build a New Traffic Group.
74 <#task-1---build-a-new-traffic-group.-1>`__

`LAB 14 – Security and Securing the BIG-IP 75 <#_Toc489016313>`__

`Exercise 14.1 – More Security Features 75 <#_Toc489016314>`__

`Task 1 – Configure Audit Logging 75 <#_Toc489016315>`__

`Task 2 – Limiting SSH access to the BIG-IP 75 <#_Toc489016316>`__

`APPENDIX II – LAB 1 75 <#appendix-ii-lab-1>`__

`TMSH Commands 75 <#tmsh-commands>`__

`GUI Build Instructions 76 <#gui-build-instructions>`__

`Task 1 - Creating VLANs 76 <#task-1---creating-vlans>`__

`Task 2 - Assigning a Self IP addresses to your VLANs
77 <#task-2---assigning-a-self-ip-addresses-to-your-vlans>`__

`Task 3 - Assigning the Default Gateway
78 <#task-3---assigning-the-default-gateway>`__

`Task 4 - Creating Pools 79 <#task-4---creating-pools>`__

`Task 5 - Creating Virtual Servers
80 <#task-5---creating-virtual-servers>`__

`Appendix III – Extended Application Verification (EAV) Monitor from
DevCentral
83 <#appendix-iii-extended-application-verification-eav-monitor-from-devcentral>`__

Lab Network Overview

Each student will have a BIG-IP VE environment with IP addressing as
below:

|image1|

F5 Lab Introduction

Welcome to the F5 Virtual Environment (vLab) setup and hands-on F5 301
Exam Lab exercises.

The purpose of this guide is to provide a sampling of hands-on exercises
to better understand the subjects outlined in the 301a – LTM Architect,
Setup and Deploy Exam Blueprint.

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

    |image3|

LAB 1 – Basic Setup, TMSH and SNATs
===================================

In this section, you will provide the basic networking, create a virtual
server and pool to test your comfort level with basic set up. You using
try doing much of this through **tmsh** commands to become familiar with
the basic syntax, which you may see on the exams. Finally you will work
with SNATs and NATs to solidify the concepts in the first exam
objective.

Objective:

-  Objective 1.01

   -  Given an expected traffic volume, determine the appropriate SNAT
      configuration

Lab Requirements:

-  Ravello 301 certification lab environment

-  Or, F5 Partner vLab enviroment

Estimated completion time: ?? minutes

Exercise 1.1 Basic set up using TMSH
------------------------------------

Task 1 – TMSH challenge 
~~~~~~~~~~~~~~~~~~~~~~~~

Access your BIG-IP, perform a basic build of networking, pool and
virtual server and establish that your environment is working. **If you
are unfamiliar with TMSH** **this is a good opportunity to get a feel
for it.**

For BIG-IP WebUI access open a browser and access
`**https://10.1.1.245** <https://10.1.1.245>`__. Log into the BIG-IP VE
system using the following credentials:

Username: admin

Password: admin

For BIG-IP terminal access, you have two options:

-  SSH Access from a Linux terminal window. Open a terminal window and
   type the following:

ssh root@10.1.1.245

-  Password: **default**

-  Select the PuTTY icon on the bottom task bar and select **bigip01**

Note: If you use PuTTY, you MIDDLE mouse button allows you to paste into
the window

Given the following , network the BIG-IP and build a basic pool and
virtual server using SNAT automap.

+------------------+----------------+------------------+-----------------+-----------------+
| VLANs            | Name:          | client\_vlan     | server\_vlan    |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | Interface:     | 1.1              | 1.2             |                 |
+------------------+----------------+------------------+-----------------+-----------------+
| IP Addressing    | Name:          | client\_ip       | server\_ip      |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | IP Address:    | 10.1.10.245      | 10.1.20.245     |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | Netmask:       | 255.255.255.0    | 255.255.255.0   |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | VLAN:          | client\_vlan     | server\_vlan    |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  |                |                  |                 |                 |
+------------------+----------------+------------------+-----------------+-----------------+
| Pool             | Name:          | www\_pool        |                 |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | Members        | 10.1.20.11:80    | 10.1.20.12:80   | 10.1.20.13:80   |
+------------------+----------------+------------------+-----------------+-----------------+
| Virtual Server   | Name:          | www\_vs          |                 |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | Destination:   | 10.1.10.100:80   |                 |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | Pool           | www\_pool        |                 |                 |
+------------------+----------------+------------------+-----------------+-----------------+

Here are example TMSH command to help you:

Command examples for networking:

create net vlan <vlan-name> interfaces add { <interface> { untagged } }

create net self <ip\_name> address <ip/mask> vlan <vlan\_name>

create net route def\_gw network 0.0.0.0/0 gw 10.1.10.1

Command example for creating pool:

create ltm pool <pool name> members add { <ip:port> <ip:port> <etc…> }
monitor http

Command example for creating a standard virtual server:

create ltm virtual <vs name> destination <ip:port> pool <pool name>
ip-protocol tcp source-address-translation { type automap }

Write your configuration to disk and create an archive.

save sys config

save sys ucs lab1-base-config

The tmsh commands and GUI commands to build the base configuration can
be found in Appendix II.

Alternately, you can select the **Lab Guides** link on the jumpbox
browser. The tmsh commands and other useful cut and paste for other labs
can be found in **Cert 301a LTM Architect.txt**.

Log on to the BIG-IP WebUI and verify your virtual server is
**Available** (green circle).

Using a new browser window (preferably a private browser window) access
the web site at http://10.1.10.100

Q1. In the **Request Detail** at the top of the page, what is the client
IP address and why?

Task 2 – SNAT Pools
~~~~~~~~~~~~~~~~~~~

Building a new ftp application, let’s take a closer look at SNATs and
SNAT Pools using the **tcpdump** tool and view the connection table.

Build an FTP virtual server and pool. You will need to use the default
**FTP** profile and use **Auto Map** for the Source Translation address.

Virtual server name **ftp\_vs**, IP address and port,
**10.1.10.100:21**, **FTP Profile** is **FTP**, **Source Address
Translation** is **Auto Map**

Pool name, **ftp\_pool**, monitor **tcp**, pool member **10.1.20.15:21**

Verify your FTP virtual server and pool are **Available**.

Open up a terminal window and SSH to the BIG-IP.

ssh root@10.1.1.245 or PuTTY User: **root** Passwood: **default**

At the BIG-IP CLI prompt do a tcpdump of the server-side traffic and
just watch the FTP pool member:

tcpdump -nni server\_vlan host 10.1.20.15

From a Linux terminal window FTP to 10.1.10.100. The logon credentials
are **root/default**. It may take 15-20 to connect.

Q1. Do you see traffic destined for the ? Where is it coming from?

Imagine a dozen virtual servers using with pools in the same subnet
using Auto Map. It would be extremely difficult to watch for particular
client traffic from a particular virtual server. SNAT pools can make
management and debugging a little easier.

Create a SNAT pool and assign it to the FTP server.

Go to Address Translation on the sidebar and select **SNAT Pool List**
and create a new SNAT pool named **SNATpool\_249** with **10.1.20.249**
as a member.

Q2. Why might you require more than one IP address in the SNAT pool?

Go to the **ftp\_vs** and change the **Source Address Translation** to
the **SNATpool\_249** pool.

Let’s tried the tcpdump we did earlier, but have it limited to the pool
member and SNAT pool IP.

tcpdump -nni server\_vlan host 10.1.20.15 and 10.1.20.249

Now there is no extraneous traffic being seen. Open a terminal window
and ftp to **10.1.10.100** and log on to the ftp server. User: **root**
Password: **default**

Q3. What is the client IP that shows up in the tcpdump?

Open up another SSH session to the BIG-IP, go into TMSH and dump the
connection table.

tmsh show sys connection

Find the connection with your client IP 10.1.10.51 and the SNAT pool IP.

Q4. What are the ephemeral port numbers on your client-side source IP
and server-side source IP?

Task 3 – SNATs and NATs
~~~~~~~~~~~~~~~~~~~~~~~

Let’s take a look at using SNATs to allow internal resources to access
external resources more securely and the difference between SNAT and
NATs.

The LAMP server used for the internal server farm has a default gateway
of 10.1.20.240 and has no external access at this time, but you can SSH
to it via the out-of-band management network.

On the BIG-IP, add a new self IP address named **server\_gw** to the
**server\_vlan**, ip address **10.1.20.240**, netmask **255.255.255.0.
**

From the jumpbox, open PuTTY, load the LAMP (10.1.1.252) server profile
and SSH to the LAMP server. The user credentials are **root/default**.

At the command prompt, attempt to hit the Google open DNS server.

dig @8.8.4.4

Q1. Did the command succeed?

On the BIG-IP, open the **SNAT List** and select **Create**

Create a new SNAT translation Name: **server\_snat,** used the IP
address **10.1.10.248** for the Translation and limit the allowed
ingress traffic to VLAN **server\_vlan**.

In a BIG-IP terminal window, do a **tcpdump** on the **client\_vlan**,
limited to the **10.1.20.248** and **8.8.4.4**.

From the LAMP server try the **dig** command again and the try to **ping
8.8.4.4** from the LAMP server.

Q2. Did the dig work? What was the source IP?. Did the ping work? What
was the result?

From the Linux prompt attempt to FTP to 10.1.10.249.

Q3. What happened when you try to FTP to the SNAT address?

Go to **Statistics >> Module Statistics >> Local Traffic** and select
**Statistics Type: SNAT Translations** and review the information.

Under **Address Translation** go to the **NAT List** and create a NAT
named **server\_15\_nat** with a **NAT Address** of **10.1.10.15** and
an **Origin Address** of **10.1.20.15**.

Attempt to FTP to 10.1.10.15. Attempt to ping 10.1.10.15.

Q4. When you attempted to FTP and ping 10.1.10.15 and access 10.1.20.15
behind the BIG-IP were you successful?

LAB 2 – Profiles
----------------

Objective:

-  Objective 1.02 U/A

   -  Given a scenario, determine the minimum profiles for an
      application

-  Objective 1.03 U/A

   -  Given an application configuration, determine which functions can
      be offloaded to the LTM device

-  Objective 1.04 U/A

   -  Given iRule functionality, determine the profiles and
      configuration options necessary to implement the iRule.

-  Objective 1.05 A/E

   -  Given application requirements, determine the appropriate profile
      and persistence settings.

Estimated completion time: A lot of minutes

Exercise 2.1 – Working with Profiles
------------------------------------

Task 1 – Working with profiles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create a new pool called **secure\_pool**, using the **https** default
monitor and add the following members, **10.1.20.11:443,
10.1.20.12:443** and **10.1.20.13.443.**

Create new virtual server **secure\_vs** at **10.1.10.115:443** with
**TCP** the profile using your new **secure\_pool**.

Open two PuTTy/Terminal windows to the BIG-IP and run the following
tcpdumps; one in each window.

tcpdump -nni client\_vlan -X -s0 host 10.1.10.51 and 10.1.10.115

tcpdump -nni server\_vlan -X -s0 host 10.1.10.51

Verify your virtual server is available and then browse to
https://10.1.10.115\ **.** View the TCPDUMPs.

Q1. Did site work? Why didn’t you need to SNAT? Did you need SSL
profiles?

Q2. Could you use L7 iRules or profiles to view or modify the request or
response? Why or why not?

Modify **secure\_vs** to use the HTTP (80) **www\_pool**. View the
TCPDUMPs

Verify your virtual server is available and then browse to
https://10.1.10.115\ **. **

Q3. Did site work? Why or not?

Change SSL Profile to include the default **clientssl** then update.

Browse to https://10.1.10.115 and observe the tcpdump.

Q4. Did site work? What did you observe in the TCPDUMPs? Did you need an
HTTP profile?

On the **secure\_vs** in the virtual server **Resouces** section enable
**cookies** as the D\ **efault Persistence Profile** and then
**Update**.

Q5. Did it work? What was needed to add cookie persistence?

Browse to https://10.1.10.115/ scroll and select **Display Cookie** in
the **HTTP Request and Response Information** section on the web page.

Q6. What node do the pictures come from? What is the name of the cookie
inserted begin with?

Assign the **secure\_pool** to the **secure\_vs** once again. Browse to
**https://10.1.10.115**

Q5. Did site work? Why or why not?

Troubleshoot and fix.

Q6. What profile was needed to correct the error?

Exercise 2.2 – Application Acceleration
---------------------------------------

Task 1 - TCP Express
~~~~~~~~~~~~~~~~~~~~

Set client-side and server-side TCP profiles on your virtual server
properties.

From the drop-down menus place the **tcp-wan-optimized** profile on the
client-side and the **tcp-lan-optimized** profile on the server-side.

Note the custom boxes in each of the TCP profiles you used.

Q1. What is the idle timeout in each profile? Why might you want to
change it?

Q2. What is the Nagle selection in the default TCP, tcp-wan-optimized
and tcp-lan-optimized profiles? Why might you want to change it?

Q3. What happens if you increase the proxy buffer sizes?

Task 2 - HTTP Optimization - RamCache Lab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Go to your virtual server and refresh server times. Note the Source Node
for the pictures of the BIG-IPs. They change depending on where the
connection is coming from. The Source Node information is part of the
picture.

Go to **Local Traffic>Profiles>Services>Web Acceleration** or
**Acceleration>Profiles>Web Acceleration**

Create a new profile named **www-opt-caching** using
**optimized-caching** as the Parent Profile.

Take all the defaults, no other changes are required.

Q1. What resource would be consumed if you increased the **Cache Size**
setting?

Open up your **www\_vs** virtual server.

At the HTTP Profile drop down menu make sure http is selected.

Under **Acceleration** at **Web** **Acceleration** **Profile** select
your new caching profile; **www-opt-caching**

Clear the statistics on the **www\_pool**.

Browse to http://10.1.10.100. Refresh the main web page several times.

Q2. The pictures do not change. Why do you think that is?

Q3. Go to your pool. Are all pool members taking connections?

Now go to **Statistics>Module Statistics>Local Traffic** on the sidebar,
from the **Statistics Type** drop down menu select **Profiles Summary**
and select the **Web Acceleration** profile view link. Note the
information.

You can get more detailed information on ram/fast cache entries at the
CLI level

Log onto the CLI of your BIG-IP via SSH using the root account (user:
root password: default).

At the CLI go into “\ **tmsh**\ ” at the (tmos)# prompt

At the tmsh shell prompt enter “\ **show ltm profile ramcache
www-opt-caching**\ ”

 

Task 3 - HTTP Optimization - HTTP Compression Lab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Browse to http://10.1.10.100. On the web page under, **HTTP Request and
Response Information** select the **Request and Response Headers** link.

Q1. Does the browser accept compression?

Go to Local **Traffic>Profiles>Service>HTTP** **Compression** or
**Acceleration>Profiles>HTTP Compression**

Create a new profile, named **www-compress** using the
**wan-optimized-compression** default profile.

Q2. At what point would the BIG-IP quit compressing responses?

Open up your **www\_vs** virtual server.

At the **Web Acceleration** drop down menu select **None**

For purpose of this lab we don’t want caching interfering with our
response headers.

At the **HTTP Compression** drop down menu select the HTTP compression
profile you just created.

Now hit your virtual server and on the web page under **Content Examples
on This Host** select the **HTTP Compress Example** and **Plaintext
Compress Example** link.

Now off to the statistics on the sidebar, under the **Local Traffic**
drop down menu select **Profiles Summary**

Select the **View** link next to the **HTTP Compression** profile type

On the web page under, **HTTP Request and Response Information** select
the **Request and Response Headers** link. Notice you no longer see the
**Accept-Encoding** header in the **Request Headers Received** at the
Server section.

You can also browse to https://10.1.10.115 and note what the
request/response looks like unchanged.

Task 4 - Securing web applications with the HTTP profile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here you are going to perform some custom profile alterations to help
secure the web site. You are going to make sure hackers can see error
codes returned, scrub the response headers of extraneous and potentially
dangerous information and encrypted the persistence cookie to prevent
tampering.

Obtain the cookie name and information by browsing to
https://10.1.10.115/ and open the **Display Cookie**. The cookie name is
everything in front of the ”=” sign. How BIG-IP creates cookies for
Cookie Insert persistence can be found at
https://support.f5.com/csp/article/K6917. After reading this article you
could craft a cookie to hit a particular server.

Q1. What is the cookie name? Note the information after the cookie.

Let’s begin by creating a custom HTTP profile.

+----------------------------------------+------------------------------------------+---------------------------------------------+
| Name:                                  | **secure-my-website**                    |                                             |
+========================================+==========================================+=============================================+
| Set the Fallback Host                  | **http://www.f5.com **                   |                                             |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Fallback on Error Codes                | **404 500-505**                          | The fallback site if an error is received   |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Response Headers Allowed               | **Content-Type Set-Cookie Location**     |                                             |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Encrypt Cookies                        | **<cookie name you obtained earlier>**   |                                             |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Cookie Encryption Passphrase           | **xcookie**                              |                                             |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Confirm Cookie Encryption Passphrase   | **xcookie**                              |                                             |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Insert XForwarded For                  | **Enable**                               | Example of modify headers                   |
+----------------------------------------+------------------------------------------+---------------------------------------------+

Q2. What is in the X-Forwarded-For header? Why might you want to enable
it?

Attach your new HTTP Profile to your **secure\_vs** virtual server

Browse to https://10.1.10.115.

Do the web pages appear normal? On the web page under, **HTTP Request
and Response Information** select the **Request and Response Headers**
link.

Open a new browser to http://10.1.10.100. On the web page under, **HTTP
Request and Response Information** select the **Request and Response
Headers** link.

Q3. Are they the same? What is different?

Now browse to a bad page.

For example, **https://10.1.10.115 /badpage**

Q4. What is the result?

Under, **HTTP Request and Response Information** select the **Display
Cookie** link.

Q5. What is different from the cookie at the start of the task?

NOTE: Even though the data is encrypted between your browser and the
virtual server, the LTM can still modify the data (i.e. resource
cloaking) because the data is unencrypted and decompressed within TMOS.

Task 5 - Using iRules
~~~~~~~~~~~~~~~~~~~~~

By now you should be thoroughly sick of trying to remember to type in
every time you want to access your secure web site. Not only is that
easily rectify on the BIG-IP, but it is much more secure than opening up
port 80 on your secure web servers, so that they can perform a redirect.

While it would be easy to write your own redirect iRule, you note F5 has
one prebuilt that you can use.

Example of simple redirect iRule:

when HTTP\_REQUEST {

HTTP::redirect https://[HTTP::host][HTTP::uri]

}

Go to **Local Traffic>iRules**

In the search box at the top of the list of iRules, type **redirect**
and hit **Search**.

Open the iRule and take a quick look. This is a F5 Verified and F5
supported iRule.

Create your HTTP-to-HTTPS redirect virtual server.

Go to Local **Traffic > Virtual Servers** and create a new virtual
server.

+------------------------------+-------------------------------------------------------------+
| Name                         | redirect\_to\_secure\_vs                                    |
+==============================+=============================================================+
| Destination                  | <same IP as secure\_vs>                                     |
+------------------------------+-------------------------------------------------------------+
| Service Port                 | 80 (HTTP)                                                   |
+------------------------------+-------------------------------------------------------------+
| Source Address Translation   | None <you don’t need this, this traffic is going nowhere>   |
+------------------------------+-------------------------------------------------------------+
| iRule                        | \_sys\_https\_redirect                                      |
+------------------------------+-------------------------------------------------------------+

Hit **Finished**

WOW! That didn’t go too far did it. You just got an error. If you are
going to redirect the HTTP request you need the HOST and URI information
and that requires the HTTP protocol.

Test your new virtual by going to http://10.1.10.115.

You should be redirected to the HTTPS virtual server.

As you can see very small iRules can make a very big difference. On the
exam, you may be asked to identify the iRule that would best solve an
issue. So, you should be familiar with basic iRules syntax.

 

LAB 3: Application Visibilty and Reporting (AVR) 
=================================================

You will use iApps templates, iRules and an analytics profile to build
new virtual servers that will be used to test Application Visibility and
Reporting (aka Analytics). In interest of time and to avoid typing
errors the iRules and Data Groups have been predefined, mostly.

-  Objective 1.06 U/A

   -  Explain the steps necessary to configure AVR

-  Objective 1.07 U/A

   -  Given a set of reporting requirements, determine the AVR metrics
      and entities to collect

Estimated Completion Time:

TASK 1 – AVR Lab Setup - Verify provisioning, iRules and Data Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task you prep the BIG-IP for the Application Visibility and
Reporting (AVR) lab. In the interest of time AVR has already been
provisioned, a data group has been built and two iRules have been
prepopulated on the BIG-IP.

AVR is **NOT** provisioned by default, but should be already be
provisioned on this BIG-IP. You can verify this by going to **System >>
Resource Provisioning**. Application Visibility and Reporting should be
set to Nominal.

Q1. What resources does AVR require to be provisioned?

Go to **Local Traffic >> iRules >> iRules** List and select Data Group
List from the top-bar

A **Data Group** named **user\_agents** has already been created for
you.

+--------------+-------------+
| **String**   | **Value**   |
+==============+=============+
| agent        | IE9         |
+--------------+-------------+
| agent1       | IE11        |
+--------------+-------------+
| agent2       | IE11        |
+--------------+-------------+
| agent3       | Chrome      |
+--------------+-------------+
| agent4       | Firefox     |
+--------------+-------------+
| agent5       | Safari      |
+--------------+-------------+
| agent6       | iPhone5     |
+--------------+-------------+
| agent7       | iPhone6     |
+--------------+-------------+
| agent8       | iPhone6     |
+--------------+-------------+
| agent9       | Android     |
+--------------+-------------+

To save time and typing errors, the iRules required for this lab have
already been configured on the BIG-IP. Find the iRules below under
**Local Traffic >> iRules >> iRule List** and verify the iRules exist.
We use these iRules to modify traffic and give Analytics something
interesting to see.

**random\_client\_ip** – randomizes the client IPs and user agents using
the data group you built.

Q2. Review the iRule, what profiles are required on the virtual server?

**delay\_server** – introduces delay into server-side traffic

 Q3. Review the iRule, what profiles are required on the virtual server?

TASK 2 – Create an Analytics Profile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create an analytics profile that will be used with a virtual server.

In the Configuration Utility, open the Local Traffic > Profiles >
Analytics page, and then click Create.

Create an analytics profile using the following information, and then
click Finished.

Profile Name custom\_analytics

Collected Metrics Max TPS and Throughput Page Load Time

Collected Entities <select everything>

 

TASK 3 – Create a Web Application
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

NOTE: The destination address is the default gateway of the web servers.

Name avr\_virtual2

Destination Address 10.1.20.240

Service Port 80 (HTTP)

Configuration Advanced

HTTP Profile http

Source Address Translation Auto Map

Analytics Profile custom\_analytics

iRules delay\_server

Default Pool www\_pool

Create another virtual server using the following information, and then
click Finished.

NOTE: Within the iRule you are pointing traffic to the virtual server
you created above, so avr\_virtual2 had to be created first.

Name avr\_virtual1

Destination Address 10.1.10.90

Service Port 80 (HTTP)

HTTP Profile http

iRules random\_client\_ip

TASK 4 – Visit the Web Site to Generate AVR Data
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use a web browser to access the virtual server, and then view the
Analytics statistics.

Use a new tab to access http://10.1.10.90. It is recommended you use
private browsing.

Type **<Ctrl>F5** several times to refresh the page. Do this for each of
the next steps.

Click the **Welcome** link, and then click the banner at the top of the
page to return to the home page.

Click the **Stream Profile Example** link. Click the banner at the top
to return to the home page.

Click on the **Multiple Stream Example** link. Click the banner at the
top of the page to return home.

Click the **Request and Response Headers** link. Click the banner at the
top of the page to return home.

Close the F5 vLab Test Web Site tab.

Open the **Statistics > Analytics > HTTP > Overview page**.

If you don’t see anything, set your Auto Refresh to 1 minute. It may
take up to 5 minutes for data to load.

TASK 5 – View the Analytics Reports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the Analytics page to view statistics information on the BIG-IP
system.

In the Configuration Utility, refresh the **Statistics > Analytics >
HTTP > Overview** page until you see statistics.

Once you have data set the **Override** time range to list box, select
**Last Hour**.

Open the **Transactions** page from the top bar. Let’s review some of
the various data compiled.

From the **View By** list box, select **Pool Members**.

From the **View By** list box, select **URLs**.

From the **View By** list box, select **Response Codes**.

Users are complaining of intermittent slow responses.

Open the **Latency > Server Latency** page, and then from the **View
By** list box, select **Pool Members**.

Q1. Does a particular pool member seem to be an issue? Pool member
10.1.20.13:80 has a higher average latency than the other pool members.

In the **Details** section, click **10.1.20.13:80**, and then from the
**View By** list box, select **URLs**.

Go to **Transactions**.

Q1. What country has the most transactions?

Q2. What are the top two User Agents?

LAB 4 – Monitors and Status
===========================

You are the administrator of a pair of BIG-IPs with a number of virtual
servers pre-configured. In this lab you will determine how traffic is
processed and take a look at various virtual server states and some
reasons a virtual server may not be working.

Objective:

-  Objective 1.08 U/A

   -  Given a scenario, determine the appropriate monitor type and
      parameters to use

-  Objective 1.09 A/E

   -  Given a set of parameters, predict an outcome of a monitor status
      on other LTM device objects

-  Objective 1.10 A/E

   -  Given a health monitor configuration and pool member response
      predict the resulting status of the pool member

Estimated completion time: 45 minutes

Exercise 4.1 – Basic Monitoring
-------------------------------

Task 1 – Default Monitors
~~~~~~~~~~~~~~~~~~~~~~~~~

You will be setting up a default monitor to test any node created. You
can also choose to use custom monitors and monitors on a per node basis.

Go to L\ **ocal Traffic>Nodes**, note the status nodes.

Note that the nodes exist in this table, even though they were never
specifically configured Node portion of the GUI. Each time a unique IP
address is placed in a pool a corresponding node entry is added and
assigned the default monitor (if any).

Also note, the node status is currently a blue square (Unchecked).

Q1. What would happen if a node failed?

Select the **Default Monitors** tab.

Notice you have several options, for nodes you want a generic monitor,
so we will choose icmp.

Select **icmp** from **Available** and place it in **Active**.

Select **Node List** or **Statistics** from the top tab.

Q2. What are your **node** statuses?

Select **Statistics>Module Statistics>Local Traffic**

What are the statuses of your nodes, pool and virtual server?

Task 2 - Content Monitors
~~~~~~~~~~~~~~~~~~~~~~~~~

The default monitor simply tells us the IP address is accessible, but we
really don’t know the status of the particular application the node
supports. We are now going to create a monitor to specifically test the
application we are interested in. We are going to check our web site and
its basic authentication capabilities.

Browse to http://10.1.10.100 virtual server and select the **Basic
Authentication** link under **Authentication Examples**. Log on with the
credentials **user.1/password**.

You could use text from this page or text within the source code to test
for availability. You could also use HTTP statuses or header
information. You will be looking for the HTTP status “\ **200 OK**\ ” as
the receive string to determine availability.

Note the URI is **/basic/**. You will need this for your monitor.

Select **Local Traffic>Monitor** on the side-bar and create and new
monitor called **www\_test** with **HTTP** as the **Parent Monitor**.

Once you have selected you parent (Type) monitor, you can access the
**Configuration** section

**Send String:** Enter the command to retrieve the page you want: **GET
/basic/\\r\\n**

**Receive String**: Enter **200 OK**

NOTE: The receive string is not case sensitive.

Enter **user.1/password** for the **Username** and **Password**

Click **Finish** and you will be taken back to Local
**Traffic>Monitors**

Where is your new Monitor?

Hint: Check the lower right hand corner of the Monitors list, here you
can go to the next page or view all Monitors

You can change the number of records displayed per page in
System>Preferences

Go to **www\_pool** and replace the default **http** monitor with your
**www\_test** monitor.

Q1. What is the status of the pool and its members?

Q2. Go to **Virtual Servers** or **Network Map**, what is the status of
your virtual server?

Just for fun **Reverse** the monitor. Now when 200 OK is returned it
indicates the server is not responding successfully.

Q3. What is status of your pool and virtual server now?

You can see where this would be useful if you were looking for a 404
(bad page) response.

Be sure to un-reverse your monitor before continuing.

Exercise 4.2 – Virtual Server Status
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

 Exercise 4.3 – Pool Member and Virtual Servers
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

Exercise 4.4 - Extended Application Verification (EAV)
------------------------------------------------------

Task 1 – Create an EAV monitor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Log on to the F5 DevCentral site http://devcentral.f5.com and go to the
following link;

https://devcentral.f5.com/codeshare/http-monitor-curl-basic-get

If you don’t have an account then create one. You’ll be glad you did.

This monitor is also in Appendix III of this document.

You will be using this monitor as your new external monitor, a copy of
the code is on your desktop in a plain text file called
\ **eav-http-monitor**.

A copy of this monitor is also in the /root directory on the BIG-IP. To
get a feel of how it works go to the BIG-IP CLI and test it against once
of the **www\_pool** members.

cd /root

/bin/sh eav-http-monitor 10.1.20.11 80

The first two parameters of an EAV are always IP address and port. In an
External monitor, the pool supplies these. Here you have to supply them.

Q1. What was the stdout output? Did this indicate the member was
Available?

Go to **System>File Management>External Monitor Program File List** and
select **Import**

**Choose File** to find the **eav-http-monitor** on your desktop, name
it **eav-http-monitor** and select **Import **

Create a monitor named **eav-http-monitor**, select type **External**
and **eav-http-monitor** as your **External Program**.

Apply the **eav-http-monitor** monitor to **www\_pool**. Remove all
other monitors.

Q2. Are your members up? What would happen if the external monitor
returned “DOWN”

Exercise 4.4 - Inband Monitors
------------------------------

In this exercise, you need to limited the amount of monitor traffic to
your back in servers. You will use the basic inband monitor, but you
would like the servers to come up sooner than 5 minutes, if they are
stable for over a minute. You will combine Inband and Active monitors to
accomplish this.

Task 1 – Create an Inband monitor and Active monitor with an Up Interval
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create inband and active monitors for your pool.

Create an inband monitor named **my\_inband**.

Note the 300 retry timer, after 3 failures in a 30 second period the
BIG-IP will mark the member down and will not check the member again for
5 minutes.

Create a new customer **http** monitor called **active\_http**, with an
**Up Interval** of **60** seconds and a **Time Until Up** of **30**
second and a **Receive String** of **200 OK**.

Task2 – Assign the Inband monitor to a pool and test
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You are going to begin by removing the current monitors for the
**www\_pool** and replacing them with the **my\_inband** monitor only.

Go to the **www\_pool** and remove the monitors and **Update**. Your
pool members show now be **Unchecked**.

Q1. What is the status of the **www\_pool** and **www\_vs**
configuration objects? Is the web site accessible? Why?

Add the **my\_inband** monitor to the **www\_pool**.

Q2. What are the status of **www\_pool** and **www\_vs**? Can you access
the web site?

Let’s simulate a failure. Open a new browser tab to
https://10.1.1.252:10000 this will bring you to **Webmin** on the
back-end server.

User: root Password: default

Under **Servers** on the side-bar, select the **Apache Webserver** link.
In the upper right corner select the **Stop Apache** link. This will
effectively bring the web sites down.

Go to your pool statistics. After 30 seconds what is the status of the
**secure\_pool** and **www\_pool?**

Q3. Why is the **www\_pool** still showing up?

Attempt to access http://10.1.10.100 and refresh several times.

Q4. What is the status of the **www\_pool** now?

In the **Webmin** tab, in the upper right corner, select **Start
Apache**.

Once Apache is started, refresh you pool statistics page. Then try to
browse to http://10.1.10.100/

Q5. What are the pool statuses and why?

It will be 300 seconds before the BIG-IP attempts to send any traffic to
the offline pool members.

Go to the **www\_pool** and add the **active\_http** monitor to the
pool.

Open a terminal window to BIG-IP and run the following tcpdump:

tcpdump -nni 1.2 -X -s0 port 80

Q6. How often to you see monitor traffic to the **www\_pool**?

In the **Webmin** tab, **Stop Apache** again and attempt to browse
http://10.1.10.100 and refresh several times. Check the status of your
pools. The **secure\_pool** and **www\_pool** should be offline.

Q7. How often to you see monitor traffic to the **www\_pool**?

In the **Webmin** tab Start Apache.

Q8. Did the www\_pool come up within 30 seconds without client traffic?
What did the tcpdump show?

LAB 5 – SSL
===========

-  Objective 1.11 (U/A)

   -  Given a set of application SSL requirements, determine the
      appropriate profiles and profile options

-  Objective 1.12 U/A

   -  Given a scenario determine the steps required to maintain SSL
      certificates

Task 1 – Creating and Importing Certs and Key
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You want the highest levels of encryption between the BIG-IP and the
client, but you do not require the same levels of encryption between the
BIG-IP and the server and you would like to save server processing
power. You are going to create new SSL certificates with 2048 bit keys
for client-side SSL and import a certificate you own that has a 1024 bit
keys for the server-side SSL processing.

Create the client-side SSL certificate and key.

Go to **System >> File Management >> SSL Certificate List** and select
**Create** and enter the following information\ **.**

+----------------------------+----------------------------+
| Name                       | **new\_ssl\_cert**         |
+============================+============================+
| Issuer                     | **Self**                   |
+----------------------------+----------------------------+
| Common Name                | **ltm301a.f5demo.com**     |
+----------------------------+----------------------------+
| Division                   | **Training**               |
+----------------------------+----------------------------+
| Organization               | **F5**                     |
+----------------------------+----------------------------+
| Locality                   | **Lab**                    |
+----------------------------+----------------------------+
| Country                    | **United States**          |
+----------------------------+----------------------------+
| State                      | **Washington**             |
+----------------------------+----------------------------+
| Email                      | **example@f5demo.com **    |
+----------------------------+----------------------------+
| Subject Alternative Name   | ***<leave this blank>***   |
+----------------------------+----------------------------+

By default, a self-sign certificate starts with a Lifetime of 365 days
and the key type is 2048 bit RSA.

Import the SSL certificate and key below to the BIG-IP to be used for
server-side encryption by selecting **Import**.

You can find the cert and key under the **Lab Guides** link on your
browser bookmark bar. Look for the **Cert 301a LTM Architect.txt**
file/link. Open the link and the certificate and key are in there under
**LAB 5 - SSL**

You may want to import the Key first, as it will validate certificate if
your naming both the same. If you were to import the certificate first
and then import a Key with the same name you could technically attached
an invalid key to the certificate.

Import the **Key** (Type), named **import\_ssl\_cert**, leave the
**Password** blank.

-----BEGIN RSA PRIVATE KEY-----

MIICXQIBAAKBgQCobsrka60VT1TLfQsamdtQCbvfnGC9ibiTtPjaHXRBpNV70prY

rihQqj3pBNlE4dvK0ucF49gGF5HXpKZDqZWXai3AnJhia248FRyT/ezxAjVqamFh

c3Lhx5ykSIxWzzw+VBuwTIvg2MS3aE3P/2CQ8MI02/uiLsya0eydw3EyiQIDAQAB

AoGBAKPN3BP5hALNfDHKEhp0tw1H6ia19n9eiNtdjQbSzlVo8RXS5DUGar7IUh1k

UcjjvtWp9nOL+nMySOvnfKshKhDbB/73NRg7VZ1eZL6K/0vv37KbDSU8KTQssSb3

myKxrRVMbxxpPujpUNT3gd6XqdUXyPjWuJOkCGLgVfGhANHhAkEA2ssfpYXgID2a

0B+VC+FaAB0GBg5P/oQF3mTPSj460totqGWeXi7beuYXgFYLbn5BNHCsDeVclZMy

ws7k4SZiiwJBAMUTSRX3rjeZBpl0zF6xr/JFfw0Fd4lgKDO+hFZvrbhDUYIU9D08

ROyH+FViQ0IoV2BtW9IZDtN/GzoroLE/hbsCQQCG5cwaSwOX/UOxZHeJ/qR2A28O

Vs69dvsDVpZ0CRBNppWWCSlummdaS/lbeDHOK2vagEmku7CszDf04ok9xGPnAkAl

5rubmfLLhoaaZLgZThsEgREaM/71UKTqrq1M4lWKpoe6eMUwMbMfulasNSWyR4fm

Z6HNGjybuEpIObPB4vGZAkBo1LKCZXas+mxRfZeucfzPLOx5a8XmwtV57br+ivnK

n0OIrSExckYHeeWb4sFl8Y/S85yyBqHS5q5v9s/x2fvp

-----END RSA PRIVATE KEY-----

Type **Certificate** and named **import\_ssl\_cert**

-----BEGIN CERTIFICATE-----

MIIBuzCCASQCCQCTVAeV4noavTANBgkqhkiG9w0BAQUFADAiMSAwHgYDVQQDExds

aW51eDMyc2VydmVyMS5mNXNlLmNvbTAeFw0xMDA2MTkyMTI2NTZaFw0yMDA2MTYy

MTI2NTZaMCIxIDAeBgNVBAMTF2xpbnV4MzJzZXJ2ZXIxLmY1c2UuY29tMIGfMA0G

CSqGSIb3DQEBAQUAA4GNADCBiQKBgQCobsrka60VT1TLfQsamdtQCbvfnGC9ibiT

tPjaHXRBpNV70prYrihQqj3pBNlE4dvK0ucF49gGF5HXpKZDqZWXai3AnJhia248

FRyT/ezxAjVqamFhc3Lhx5ykSIxWzzw+VBuwTIvg2MS3aE3P/2CQ8MI02/uiLsya

0eydw3EyiQIDAQABMA0GCSqGSIb3DQEBBQUAA4GBAH1e+FXvNOnKlP5RO5wKVjG0

C8F4Xww462beL2LeYZvV3ZjDoTUU0CNkkOnOKMbLkaiTICpBdd836sIiloAyV8M1

2YZwxgwP/fV4ycTjHUnloEBmmmBVmW3M5DzLGA1k9cB1dUly5koIoRE9mYRWm9V2

ZzYkbZf96KMh8zH47R4y

-----END CERTIFICATE-----

Q1. What is the common name of your imported certificate and when does
it expire?

Task 2 – SSL Profile and Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now you will create a custom client and server side SSL profiles using
your new certificates and key and attach them to you **secure\_vs** and
test.

Create a custom client SSL profile using your **new\_ssl\_cert**
certificate, by going to **Profiles >> SSL >> Client**.

Name you new profile **my-client-ssl** and place **new\_ssl\_cert** in
the **Certificate** and **Key** drop-downs.

Make sure you Add the certificate and key before you Finish.

Go to the SSL Server profiles and create a new profile named
**my-server-ssl** with you **import-ssl-cert** certificate and key.

Replace the current default client-side and server-side SSL profiles
with your new SSL profile

Browse to http://10.1.10.115.

Q1. Did it work?\  

LAB 6 – Virtual Servers and Packet Processing Review
====================================================

Objective:

-  Objective 1.13 U/A

   -  Given a set of application requirements, determine the appropriate
      virtual server type to use

-  Objective 1.14 U/A

   -  Given a set of application requirements, determine the appropriate
      virtual server configuration settings

-  Objective 1.15 U/A

   -  Given a set of application requirements, determine the appropriate
      virtual server configuration settings

Estimated completion time: 45 minutes

Exercise 6.1 Packet Processing
------------------------------

Task 1 – Open BIG-IP TMSH and TCPDump session
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

Task 2 – Establish ftp connection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task you will open a third terminal window and establish an FTP
session through the **ftp\_vs** virtual server. With the connection
remaining open you will view the results in window1 (tcpdump) and
window2 (tmsh).

Open a third command/terminal window (window3).

ftp 10.1.10.100

It may take 15 to 20 seconds for the logon on prompt, just leave it at
prompt to hold the connection open.

In window 1 you should see something similar to the tcpdump captured
below.

|image4|

Q1. In the tcpdump above, what is client IP address and port and the
server IP address port?

In window2 (tmsh) run the **show sys conn** again, but strain out the
noise of other connections (mirrored and selfIP) by just looking at
connections from your jumpbox.

sho sys conn cs-client-addr 10.1.10.51

The connection table on window2 will show the client-side and
server-side connection similar to below:

|image5|

Q2. What is source ip and port as seen by ftp server in the example
above?

Q3. What happened to the original client IP address and where did
10.1.20.249 come from?

You will have to review the configuration of **ftp\_vs** to determine
the answer to this question.

Exercise 6.2 – Packet Filters
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

Exercise 6.3 – Virtual Server Packet Processing
-----------------------------------------------

Task 1 – Create a Transparent virtual server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create a wildcard virtual server and pool, test and observe various
traffic under different configurations to determine how virtual servers
process new inbound connections. You will be using tcpdump from window1,
virtual server statistics, as well as a browser to determine behavior.

Create **wildcard\_vs** **10.1.10.100:\*** with TCP profile, Automap and
**wildcard\_pool** of **10.1.20.15:\***

To create the wildcard pool, go to **Local Traffic > Pools > Pool List**
and select **Create**.

+---------------+------------------+
| **Name**      | wildcard\_pool   |
+===============+==================+
| **Address**   | 10.1.20.15       |
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

Modify **wildcad\_vs** to include the default **Source** of 0.0.0.0/0.

Exercise 6.4 - Forwarding Virtual Servers
-----------------------------------------

Our web administrators would like to access the back-end server network.
They all access form the same 10.1.10.0/24 network. Let’s create a
virtual server that allows them and only them to get to the backend
network. REMEMBER somewhere a router must have the route to the backend
network inserted.

Task 1 – IP Forwarding Virtual Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create a new **Forward (IP)** type of virtual server named
**forward-to-servernet** that only allows **Source** IPs from the
**10.1.10.0/24**, to the destination **Network** **10.1.20.0/24**, all
ports should be allowed and protocols should be allowed.

Q1. What happens if we don’t change the Protocol from TCP? Only TCP will
be allowed through, things like ICMP and UDP will be blocked

Q2. What is the status of your new virtual server? Why?

Of course we are not going anywhere unless we install a route to the
10.1.20.0/24 network. From a terminal window on your jumpbox enter the
command:

sudo route add -net 10.1.20.0/24 gw 10.1.10.245

Enter **f5DEMOs4u** when prompted for a password.

Open up statistics for **forward-to-servernet** and test access to the
10.1.20.0/24 subnet

ping 10.1.20.11

dig @10.1.20.12 hackazon.f5demo.com

http://10.1.20.13 or curl 10.1.20.13

By the way, if you take a look at the iApp templates you will find one
for building IP Forwarding virtual servers.

Task 2 – More on Transparent Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You have a pool of servers running multiple applications (FTP, HTTP,
SSH, etc) and you don’t want to create a virtual server for each
application. In this case a transparent virtual server that doesn’t
translate the port would work best.

Build your transparent pool and virtual server

Create a new pool called **transparent-pool**, use the **gateway\_icmp**
monitor with the member **10.1.20.14:\*** and **10.1.20.15:\***,
wildcard “\*” for the port.

Q1. Why did we use gateway\_icmp? What other kind of monitor could we
have used?

Create a virtual server called **transparent-vs** with a IP address of
**10.1.10.95** with all ports “\ **\***\ ”, since we can’t put any L7
profiles on this virtual server a type of **Performance (Layer 4)** will
be more efficient and configure **transparent-pool** as the pool.

Note in the Advanced menu that Address Translation is still enabled, but
Port Translation is not.

Test your virtual server.

Browse to http://10.1.10.95

Q2. Did it work? What were the image results?

Browse to https://10.1.10.95

Q3. Did it work?

DNS is running to the LAMP server. In a LAMP terminal window.

dig @10.1.10.95 hackazon.f5demo.com

Q4. Did it work? Why not and how would you fix it?

LAB 7 – Load Balancing and Pools
================================

Exercise 7.1 Load Balancing
---------------------------

Task 1 - Ratio Load Balancing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Go to Local **Traffic>Pools** and select **www\_pool** and then
**Members** from the top bar or you could click on the **Members** link
in the **Pool List** screen.

Note: When we created the pool, we performed all our configuration on
one page, but when we modify a pool the Resource information is under
the Members tab

Under **Load Balancing** section

Change the **Load Balancing Method** to **Ratio (Member)**

In drop-down menu, notice most load balancing methods have two options,
(Node) or (Member).

Q1. What is the difference between Node and Member?

Select the first member in the pool **10.1.20.11:80** and change the
**Ratio** of the member to **3**

Open the pool statistics and reset the statistics for **www\_pool**.

Browse to http://10.1.10.100 and refresh the browser screen several
times.

Q2. How many Total connections has each member taken? Q. Is the ratio of
connections correct?

Now go back and put the pool back to **Round Robin** Load Balancing
Method

Reset the pool statistics and refresh the virtual server page several
times.

Q3. Does the ratio setting have any impact now?

Task 2 - Priority Groups Lab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Let’s look at priority groups. In this scenario we will treat the .13
server as if it was is in a disaster recovery site that can be reached
over a backhaul. To maintain at least two members in the pool for
redundancy and load our customer would like to use it during maintenance
periods or if one to the two other pool members fails.

NOTE: Remove any caching profile from the www\_vs virtual server
(10.1.10.100).

Go to the **www\_pool** **Members** section. Make sure the load
balancing method is Round Robin.

Set the **Priority Group Activation** to Less than … **2** Available
Members.

Select the pool members **10.1.20.11** and **10.1.20.12** and set their
**Priority Group** to **10**.

Review your settings and let’s see how load balancing reacts now.

Select the Statistics tab, reset the pool statistics, browse to
http://10.1.10.100 and refresh several times.

Q1. Are all members taking connections? Which member isn’t taking
connections?

Let’s simulate a maintenance window or an outage by disabling a pool
member **10.1.20.11:80** in the highest priority group. This should
cause low priority group to be activated, since number of active members
in our high priority group has dropped below 2.

Q2. Is the lower priority group activated and taking connections?

Select the member in the Priority Group 10 and **Disable** that pool
member.

Once again, select Statistics, reset the pool statistics, browse to the
virtual server and see which pool members are taking hits now.

Once you are done testing re-enable your disabled pool member.

Task 3 – Simple (Source Address) Persistence 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You have already seen cookie persistence at work, but if the client or
application (ie. ftp) does not support cookies you must use and
alternate method. The most common is Simple Persistence which is based
on the source IP address/network.

Verify your **www\_pool** is using Round Robin load balancing and the
priority groups are disabled.

Browse to http://10.1.10.100 and refresh several times. You should see
all 3 servers respond.

Go to **Local Traffic>Profiles** and select the **Persistence** tab and
from the **Persistence** **Profiles** screen select the **Create**
button.

Create a new persistence profile named **my-src-persist** with a
**Persistence Type** of **Source Address Affinity** and set the
**Timeout** to **120** seconds. The **Mask: None** defaults to
255.255.255.255 which means each new IP address will create a new
persistence record.

Now let’s attach the new persistence profile to the **www\_vs** virtual
server.

Note: When you create a Virtual Server everything is on a single page,
when you return to modified the Virtual Server the Properties and
Resources are on different pages.

Set the **Default Persistence Profile** to **my-src-persist**.

Test your Source Address Affinity persistence profile.

At this point you may want to open a second browser window to the BIG-IP
GUI.

Go to **Statistics>Module Statistic>Local Traffic** and select
P\ **ersistence Records** from the S\ **tatistics Type menu**

In this window, you can watch you persistence records. You may want to
set Auto Refresh to 20 seconds.

In another BIG-IP GUI window go to **www\_pool** and clear the member
statistics.

Browser to http://10.1.10.100 and refresh several times.

Q1. How many members are taking traffic?

Q2. Check you Persists Records window, are the any persistence records?

Q3. Refresh you web page prior to the Age column reaching 120. What
happens?

While the persistence recorded is still active **Disable** the member
you are persisted too and refresh the browser page.

Q4. Could you access the web site? Why?

While the persistence recorded is still active, go the member specific
menu of the member you are persisted too and do a **Force Offline** and
refresh the browser page.

Q5. Could you access the web site? Why?

Re-enable the member before continuing.

LAB 8 – iApps (no labs required)
================================

<This page intentionally left blank>

LAB 9 – Networking
==================

You have already done a number of labs around networks and there are
only so many things we can do in the lab environment. Will take a moment
to do a couple of simple exercises that will help set up later labs.

Exercise 9.1 – Self IP Port Lockdown and more
---------------------------------------------

Task 1 – Effects of Port Lockdown
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the exercise, you will do some basic configuration of DNS and NTP and
work with port lockdown.

Working with port lockdown on self IPs.

Ping 10.1.10.245

Q1. Was echo response received?

SSH to 10.1.10.245

Q2. Was ssh successful? Why not?

Open **Network > Self IPs > 10.1.10.245** and change **Port Lockdown**
to **Allow Defaults**

SSH to 10.1.10.245

Browse to https://10.1.10.245

Q3. Did SSH work? Did browsing work?

Q4. What other ports are opened when you select **Allow Defaults**.

Open **Network > Self IPs > 10.1.10.245** and change Port Lockdown to
**Allow Custom** and add **TCP** port **22**

SSH to 10.1.10.245

Browse to https://10.1.10.245

Q5. Did SSH work? Did browsing work?

Task 3 – Configure DNS and NTP 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

NTP is essential for a number of BIG-IP functions, in particular, when
creating Device Service Clusters. DNS configured on the BIG-IP can also
be of value.

Configure DNS and NTP.

Go to **System >> Configuration >> Device >> General**

Configure DNS to use **8.8.8.8** Google open DNS server and verify it
works. In BIG-IP command line terminal window test DNS from the CLI or
TMSH enter:

dig pool.ntp.org

Now that you’ve configure DNS, configure NTP using **pool.ntp.org**.

Task 3 – VLAN Tagging
~~~~~~~~~~~~~~~~~~~~~

Here you will set up multiple VLANs on the same interface and assign IP
addressing. You will be using one of these VLANs when you do the High
Availability lab.

Go to **VLANs** and create two **tagged** VLANs on interface 1.3.

The first VLAN will be named **vlan-30** on interface **1.3** and have a
tagged of **30**.

The second VLAN will be named **vlan-40** on interface **1.3** and have
a tagged of **40**.

Watch the box you push the interface into.

Create a new self IP named **HA-IP** and **10.1.30.245/24** and assign
it to vlan **vlan-30**.

You will be using this IP address for building a device service cluster
in a later lab.

LAB 10 – Roles and Partitions
=============================

Exercise 10.1 Roles and Partitions
----------------------------------

Task 1 – Create a partition
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Partitions are basically configuration containers. User assigned to a
partition can only view their partition and the **Common** partition.
Depending on their role a user may modify and create configuration items
within their partition and use (but not modify) configuration items in
the common partition.

To create a new partition, go to **System>>Users>>Partition List** and
select create

Create a new partition named **my\_partition**. There is really not a
whole lot to it.

Task 2 – Create and place a user in a partition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create a new local user by going to System>>Users>>User List and
selecting create.

Create a new user **testuser** with **testpass** as the password and set
their **Role** to **Manager**, assign them to the **test\_partition**
partiionand give them **tmsh Terminal Access**

Open a new private browser to the BIG-IP, or log out and log back in
under your current browser as the new user **testuser/testpass**.

Q1. In the upper right of the BIG-IP WebUI what partition are you in?

Look at the virtual servers. You can see these because they were all
built in the Common partition, but you cannot modify them. If you go
into a virtual server you will be the selections greyed out.

As you can see, you can view but not change things in common. But you
can use things in the Common partition to build your own configuration.

Build a new HTTP virtual server named **test\_vs**, with a destination
IP of 10.1.10.120 and used the **www\_pool** in the **/Common**
partition as the default pool.

In this case we are taking advantage of the Common partition nodes and
pools to build are virtual server.

Log out and log in as admin (or go to your other browser window that is
logged in as admin)

Go to the Virtual Server List

Q2. Do you see the **test\_vs** just created?

Go to the upper right-hand corner and select **test\_partition**. You
can now see the **test\_vs** virtual server. Since you are an admin you
can also modify the virtual server as necessary

SSH to your BIG-IP and log in with the new user name and you should be
taken directly into the tmsh.

Note the prompt, your partition name is there.

Now let’s make a change to the test\_vs.

mod ltm virtual test\_vs description "Partition Testing"

In the BIG-IP WebUI go to your **test\_vs** virtual server.

Q3. Do you see your change? Is your change permanent?

**This is probably not on the 301, but as I have you playing with
partitions this is something you should know.**

SSH to the BIG-IP and log in as root. “cat”, “more” or “vi” bigip.conf
and look for you **test\_vs** virtual.

Q4. Did you find it in /config/bigip.conf?

Each partition gets its own “folder” where its configuration is stored
under the **partitions** directory in the /config directory. At the
BIG-IP CLI prompt:

cd /config/partitions/test\_partition

ls

cat bigip.conf

Q5. Did you find your virtual server? Is the tmsh change you made in
there?

As **testuser** at the tmsh prompt type: **save sys config**

Look at your bigip.conf in the test\_partition.

Q6. Do you see the change now?

Attempt to exit tmsh to get to the Linux CLI.

Q7. Where you able to?

Exercise 10.2 Remote Authentication
-----------------------------------

Task 1 – Authenticate against LDAP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Go to **System>Users>Authentication** and select **Change** under **User
Directory**.

Now select **LDAP** from the **User Directory** drop-down and enter the
following

+-------------------------+------------------------+
| Host                    | 10.1.20.252            |
+=========================+========================+
| Remote Directory Tree   | dc=f5demo,dc=com       |
+-------------------------+------------------------+
| Bind DN:                | Cn=Directory Manager   |
+-------------------------+------------------------+
| Bind Password/Confirm   | Default                |
+-------------------------+------------------------+
| Role                    | Administrator          |
+-------------------------+------------------------+

Open a new private browser window to bigip01 https://10.1.1.245 and
logon using the LDAP account **adminuser/password**.

Q1. Were you successful?

Try logging with the local account **testuser/testpass**.

Q2. Were you successful?

LAB 11 – Device Service Clusters and High Availability
======================================================

-  Objective 2.05 U/A

   -  Given a scenario, determine an appropriate high availability
      configuration (i.e., failsafe, failover and timers)

-  Objective 2.06 U/A

   -  Given a scenario, describe the steps necessary to set up a device
      group, traffic group and HA group

-  Objective 2.07 A/E

   -  Predict the behavior of an LTM device group or traffic groups in a
      given failure scenario

Exercise 11.1 – Building a DSC (Device Service Cluster)
-------------------------------------------------------

Task 1 - Base Networking and HA VLAN
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You will be creating a high availability cluster using the second BIG-IP
(bigip2) in your lab, so let’s prep our current BIG-IP and we will be
creating a high availability VLAN.

**STOP!** If you haven’t already **archived** your work **DO IT NOW!**

Begin by making sure the base network configuration is created on both
devices.

On bigip01.f5demo.com (10.1.1.245), this should already have been
accomplished. You will be using interface 1.3 VLAN 30 and IP 10.1.30.245
for Network Failover and ConfigSync.

This requires certain ports to be open on the Self IP; TCP port 4353 for
ConfigSync and TCP port 1026 for Network Failover and TCP port 6699 for
the Master Control Program.

Go to you **10.1.30.245** self IP and set **Port Lockdown** to **Allow
Defaults**. This will ensure the ports we require are open.

Go to https://10.1.1.246 which is **bigip02.f5demo.com** and login with
**admin/admin**.

Your second BIG-IP, **bigip02,** has already been licensed and the basic
setup completed. You need to make sure the BIG-IPs are provisioned the
same set up the base networking on **bigip02**.

+-------------+----------------+------------------------+----------------+---------------+-----------------+------------------+----+
| Interface   | VLAN name      | Tag (blank untagged)   | Self IP Name   | Self IP       | Mask            | Port Lockdown    |    |
+=============+================+========================+================+===============+=================+==================+====+
| 1.1         | client\_vlan   |                        | client\_ip     | 10.1.10.246   | 255.255.255.0   | None             |    |
+-------------+----------------+------------------------+----------------+---------------+-----------------+------------------+----+
| 1.2         | server\_vlan   |                        | server\_ip     | 10.1.20.246   | 255.255.255.0   | None             |    |
+-------------+----------------+------------------------+----------------+---------------+-----------------+------------------+----+
| 1.3         | vlan-30        | 30                     | HA\_IP         | 10.1.30.246   | 255.255.255.0   | Allow Defaults   |    |
+-------------+----------------+------------------------+----------------+---------------+-----------------+------------------+----+
|             |                |                        |                |               |                 |                  |    |
+-------------+----------------+------------------------+----------------+---------------+-----------------+------------------+----+

Q1. What is the status your BIG-IPs? Check the upper left-hand corner
next to the F5 ball.

Task 2 – Prepare each BIG-IP for High Availability
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On each BIG-IP you will update the device and device trust certificate
and configured the failover IPs for each device.

On **each** BIG-IP, prior to building the Device Trust it is
recommended, but not mandatory, that you renew the BIG-IP self-signed
certificate with valid information and re-generating the local Device
Trust certificate.

Under **System >> Device Certificate >> Device Certificate** select the
**Renew**\ … button

Common Name: <the Hostname of the BIG-IP in the upper left corner>

Country: United States (or your country of preference)

Lifetime: 3650

Lifetime is important, when your certificate expires your HA setup will
FAIL.

Select Finished. Your browser will ask to exchange certs with the BIG-IP
again.

Under **Device Management >> Device Trust >> Local Domain** select
**Reset Device Trust…**

In the **Certificate Signing Authority** select **Generate New
Self-Signed Authority**.

On each BIG-IP configure the device object failover parameters the
BIG-IP will send to other BIG-IPs that want to be a part of a sync-only
or sync-failover group.

Under **Device Management >> Device**, select the local BIG-IP. It will
have the (Self) suffix.

Under **Device Connectivity** on the top bar select:

**ConfigSync** and use the **HA-IP** for your **Local Address**.

Under **Network Failover **

In the F\ **ailover Unicast Configuration** section select the **Add**
button

Q1. If you were to add multiple IP address to the Failover Unicast, when
would the BIG-IP failover?

Use the Self IP address the HA VLAN for your Address

Leave the Port at the default setting of 1026

Note: Multicast is for Viprion chasses only.

Under Mirroring:

**Primary Local Mirror Address**: use the HA-IP.

**Secondary Local Mirror Address:** None

On each BIG-IP archive your work in a file called: lab11\_ha\_prep

Task 3 – Build the Device Trust and Device Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the task you will build a trust between bigip01 and bigip02. Once the
trust between the devices is built you will be build a Sync-Failover
device group and place the BIG-IPs in the new group. You will build this
from bigip01 and syncs its good configuration to bigip02.

On **bigip01.f5demo.com**, under **Device Management >> Device Trust >>
Peer List** and select **Add**

**Device IP Address:** <management IP address of the BIG-IP to add>

You could use any Self IP if the out-of-band management interface is not
configured.

Enter the **Administrator** Username and Password of the BIG-IP you are
trusting.

Select **Retrieve Device Information**

The certificate information and name from the other BIG-IP should appear

On each BIG-IP check the other BIG-IP in the Peer Authorities list.

Q1. Is all the information there?

If some information is missing delete the trust and try again.

Q2. What are the statuses of your BIG-IPs now?

They should be In Sync. But wait! We haven’t even created a device
group! Remember the Device Trust creates a Sync-Only group for the
certificates under the covers (device-trust-group) for the trust.

On **bigip01.f5demo.com** create a new **Sync-Failover** device group

Under **Device Management >> Device Group** create a new device group
named **my\_device\_group** with a type of **Sync-Failover**

Add the members of the group (bigip01 and bigip02) to the **Includes**
box and check the **Network Failover** setting for the group.

Check D\ **evice Groups** on each BIG-IP.

Q3. Did you have to create the Device Group on the other BIG-IP?

Q4. Is the full configuration synchronized yet?

Q5. What is the status and sync status on the BIG-IPs?

On your configurated BIG-IP (bigip01), click on the sync status
(**Awaiting Initial Sync)** or go to **Device Management >>Overview**.

**IMPORTANT!!!** Click the device with the configuration you want to
synchronize to the other BIG-IPs (that would be bigip01). The Sync
Options should appear.

**Sync Device to Group**. It could take up to 30 seconds for
synchronization to complete.

NOTE: During the Awaiting Initial Sync phase either BIG-IP can perform
the synchronization and the other BIG-IP will be overwritten.

Check each BIG-IP **Device Management >> Overview**.

Q6. Did the configuration synchronize? What, if any, errors do you see?

You ended up with an error because of configuration dependencies with
**avr2\_virtual**. This is why building you device service cluster early
is a good idea, but you can’t always do that. You could have a device
cluster pair that you are adding a third BIG-IP. You are going to have
to correct the error, synchronize and the re-add **avr\_virtual.**

On **bigip01** delete the virtual server **avr\_virtual2.**

Q7. Any issue with that?

Maybe the easier route is to remove the iRule from **avr\_virtual1**
(which references avr\_virtual2), synchronize and then add it back.

Q8. What is the sync status of bigip02 once you made the change?

Sync bigip01 to the group.

Q9. Are the BIG-IPs In Sync? Are the configurations the same?

Browse to http://10.1.10.100

Q10. Could you access the site? Which BIG-IP passed the traffic?

Place the **random\_client\_ip** iRule back on **avr\_virtual2** and
synchronize the changes

Exercise 11.2 – Failover and Mirroring
--------------------------------------

Task 1 – Testing Failover
~~~~~~~~~~~~~~~~~~~~~~~~~

Now that you have created your HA environment let’s play with it. In
this lab, you will set up mirroring and perform failover and
synchronization of updates.

Ensure **bigip02** is the **Active** BIG-IP. If **bigip01** is the
**Active** BIG-IP then go to **Device Management >> Traffic Groups**.
Select **traffic-group-1** and hit the **Force to Standby …** button.

Browse to http://10.1.10.100?

Q1. What is the source IP in the **Request Details**?

Browse to http://10.1.10.115?

Q2. What happened? Why?

The default gateway for the servers in the **secure\_pool** is
**10.1.20.240**. This IP is currently assigned to
**traffic-group-local-only** in **bigip01** and resides in the
**bigip\_base.conf**. We need this IP address to float to the active
BIG-IP upon failover. Because we are changing this from a base IP to a
floating IP you will encounter an error. Incremental updates are the
default, but sometimes a full overwrite is required.

On **bigip01, o**\ pen the self IP **server\_gw** (10.1.20.240) and
assign it to the default floating traffic group **traffic-group-1.**
Select **Changes Pending** or **Device Management** >> **Oveview**.

From the Overview page, select bigip01.f5demo.com, select Sync Device to
Group, select Overwrite Configure and select Sync.

Browse to http://10.1.10.115.

Q3. Did the site work? What was the client IP?

Browse to http://10.1.10.100.

Q4. What was the client IP address that the server saw (under **Request
Detail**\ s on the main page)? Why?

Failover the active BIG-IP by going to **Device Management >> Devices
>>** *<device name>*\ **(self)** and at the bottom of the page select
**Force to Standby**. This is how a system level failover is performed.

Q5. Does http://10.1.10.115 still work? What is the client IP?

Task 2 - Mirroring
~~~~~~~~~~~~~~~~~~

Once you place a BIG-IP in a device group, mirroring selections will
show up for SNAT objects, persistence profiles and connection mirroring
on virtual servers. The BIG-IP will only mirror records created after
mirroring is enabled. Let’s see how mirroring persistence works, as an
example.

Go to your Active BIG-IP.

Open you **www\_vs** virtual server and add my-src-persist as your
Persistence Profile.

On each BIG-IP go to **Module Statistics >> Local Traffic** and bring up
the **Persistence Record** statistics.

Browse to http://10.1.10.100.

Q1. Do you have a persistence record on each BIG-IP? What would happen
if you did a failover?

Go to your persistence profile **my-src-persist** and check the **Mirror
Persistence** box.

Synchronize your changes.

On each BIG-IP go to **Module Statistics >> Local Traffic** and bring up
the **Persistence Record** statistics.

SSH to your active BIG-IP and view your persistence records. In TMSH run
the following command:

show /ltm persistence persistence-records

Note the CLI/TMSH prompt, you can find the sync status and the BIG-IP
state.

For this lab, if you have any persistence records delete them.

delete /ltm persistence persistence-records

Browse to http://10.1.10.100 and refresh the page few times.

Check the persistence records on each of your BIG-IPs, you should see
the records are mirrored on each device.

Q2. If you had persistence records existing prior to mirroring would
they appear on the standby box?

Go to **Device Management>Traffic Groups**. Select the default traffic
group **traffic-group-1** and check out the **Next Active Device**.

Refresh the web page at http://10.1.10.100, and in **traffic-group-1**,
select **Force to Standby**.

Browse or refresh http://10.1.10.100.

Q3. Did you persist to the correct pool member? What is the client IP?

Exercise 11.3 – Traffic Groups
------------------------------

Task 1 - Build a New Traffic Group.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You are now going to build an active-active cluster by create a new
traffic-group and forcing that traffic group to run on the Standby
BIG-IP.

On you Active BIG-IP, go to **Device Management>Traffic Groups** and
create a new traffic group called **tg-2**.

Place the **www\_vs** in the new **tg-2** traffic group.

Remember you place virtual address, not virtual servers, in a traffic
group.

Go the **Virtual Server List**, note the IP address of **www\_vs** and
select **Virtual Address** from the top bar.

Under the **Virtual Address** select the traffic group you want to
assign it to, **tg-2**.

Q1. When you did this, what other virtual servers were assign to tg-2?

On the **Active** BIG-IP, under **Device Management** select **tg-2**
note the **Next Active Device** and **Force to Standby**.

Q2. What are the states of you BIG-IPs?

Browse to http://10.1.10.100 and ftp to 10.1.10.100.

Q3. Did the web site work? What was the client IP? Did ftp work? Why or
why not?

It is important to get all the listeners that support an application
into the same traffic group.

Go to your ftp SNAT pool and note the address, then go to the **SNAT
Translation List** select the IP and place it in **tg-2**.

FTP to 10.1.10.100.

Q4. Did it work now?

LAB 12 – Performance (No Labs Available)
========================================

<This page intentionally left blank>

LAB 13 – vCMP (no labs required)
================================

<This page intentionally left blank>

LAB 14 – Security and Securing the BIG-IP
=========================================

You have seen numerous security features already, but logging can be
just as important to securing the BIG-IP. In the lab you will set up
audit logging and log BIG-IP LTM message to a remove syslog-ng server.
You will also learn to about additional logging and minor security
features you can implement

Exercise 14.1 – More Security Features
--------------------------------------

Task 1 – Configure Audit Logging
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Audit logging allows you to log changes made by BIG-IP administrators
and other users.

Audit logging is disabled by default. **Go to System >> Logs >>
Configuration**.

Notice you can determine by role who is allowed to view the audit logs.

Audit Logging is toward the bottom of the page. **Enable** Audit Logging

In a private browser window, log on to the BIG-IP as
**adminuser/password**.

Make a change to the **Description** of the FTP virtual server
**ftp\_vs**.

Review the audit log at **System >> Logs >> Audit**. In the **Search**
box type **adminuser** and hit **Search**.

Q1. Do you see when adminuser logged on? Do you see the change made in
the audit log?

Task 2 – Limiting SSH access to the BIG-IP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The jumpbox has two IPs, 10.1.1.51 on the management network, 10.1.10.51
on the client-side network.

Open **System >> Platform** and in **SSH IP Allow** > **Specify Range**
of **10.1.20.0/24**

Q1. Does existing an SSH window still work? Does a new SSH work?

Change the **Specify Range** to the management network only 10.1.1.0/24.

Open new SSH session to 10.1.1.245 and 10.1.10.245.

Q2. Were new ssh sessions established?

Exercise 14.2 - BIG-IP Remote Logging
-------------------------------------

Your customer would also like to integrate BIG-IP system messages with
their central logging system, to be processed by their correlation
software. They would like you to send mcpd informational messages (

to external logging server(s).

Task 1 - Configuring a logging pool
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create a pool of the logging server(s). This will be the destination for
high speed logging. You will be logging to syslog\_ng over TCP port 514.
You will be using a combination of an inband monitor and an active
monitor to determine the log server’s availability. This monitor will
combination will reduce network activity and superfluous log messages to
the syslog server.

Configure the Logging Pool

Create an **inband** monitor named **syslog\_inband**.

Create an active **TCP** monitor named **syslog\_active** and set the
**Up Interval** to **180** seconds

This will poll the syslog server every three minutes while the inband
monitor is showing the server available. If the server goes down, it
will be polled every 5 seconds.

Create a logging pool named **logging­\_pool**, with the
**syslog\_inband, syslog\_active** monitors and the member
**10.1.20.252:514**.

Task 2 - Configure the logging destinations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Remember at least two log destinations need to be created. The first one
will be the High Speed Logging (HSL) Destination where the messages will
be sent (the Logging\_Pool you just created) and what protocol will be
used, TCP or UDP. The second Log Destination created will specify the
message format and the HSL Destination where formatted messages go too.

High Speed Logging Log Destination

First you will create a Log Destination to tell the BIG-IP where to send
the log messages.

Go to **System > Logs > Configurations > Log Destinations** and create a
HSL destination named **hsl\_logging\_dest** of a type **Remote
High-Speed Log** and the pool name is **logging\_pool**

Name: **hsl\_logging\_dest**

Type: **Remote High-Speed Log**

Pool Name: **logging\_pool**

Protocol: **TCP**

Formatted Log Destination

This log destination will be used to format the log output. You are
sending the messages to a syslog ng server, so you will want them in a
syslog format. You will send the formatted log events to the HSL Log
Destination you created earlier.

**In Logging Destinations** select **Create** and build a formatted
destination named **formatted\_dest** with a type of **Remote Syslog**
and with the **Syslog Format** of **Syslog** and the **High Speed Log
Destination** set to **hsl\_logging\_dest.**

Task 3 - Log Publisher and Filtering Messages
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The log publisher is a way to associate individual or multiple log
destinations to a logging profile. In this case, any messages through
this publisher will go to local logs and the remote logs via
formatted\_dest.

Go to **System > Logs > Configurations > Log Publishers** and select
**Create**.

Name: **logging\_pub**

Destinations: Move **formatted\_dest** and **local-syslog** to the
**Selected** box.

Select **Finished** when done.

This step created a log publisher that will send Syslog formatted events
to a remote server, the local database, and the local syslog. Normally
you wouldn’t want to do this, but this is one way to show how BIG-IP can
send to multiple destinations, for demonstration purposes and show you
can check your own logs on the BIG-IP instead of going to the logging
server.

System Logging Filter

Now you will create a system logging filter. This will demonstrate how
we can log systems events off box, as well as on box. We do NOT want to
take the defaults as logging down to the debug level would cause the
BIG-IP to drop log messages and could fill up the log files to the point
where the BIG-IP runs out of disk space. You are going to send
informational messages from the MCPd daemon to the published
destinations.

Go to **System > Log > Configuration > Log Filters** and select Create

Name: **my-mcpd-filter**

Severity: **Informational**

Source: **mcpd**

Log Publisher: **logging\_pub**

Task 4 - Test your logging configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Generate and view a mcpd event.

SSH to the syslog-ng server at **10.1.1.252**. **Credentials
root/default**

Watch the bigip.log syslog file for your events

tail –f /var/log/syslog \| grep bigip

Go to **Local Traffic > Pools** and select the **www\_pool**. Disable
one of the pool members.

Q. Did you see messages on the syslog servers? You saw and audit message
and bigip01.f5demo.com mcpd[7702] Pool /Common/www\_pool member
/Common/10.1.20.13:80 session status forced disabled.

APPENDIX 1 – ANSWER KEY
=======================

LAB 1 – Basic Setup, TMSH and SNATs
===================================

Exercise 1.1 – Basic set up using TMSH
--------------------------------------

Task 1 – Open BIG-IP TMSH and TCPDump session 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. In the **Request Detail** at the top of the page, what is the client
IP address and why?

10.1.20.245, because you applied SNAT Auto Map to the www\_vs virtual
server and that is the self IP address on the server VLAN

Task 2 – SNAT Pools
~~~~~~~~~~~~~~~~~~~

Q1. Do you see traffic destined for the ? Where is it coming from?

Yes, monitor traffic is hitting the FTP server at 10.1.20.15 from source
IP 10.1.20.245 because monitors are serviced from the self IPs.

Q2. Why might you require more than one IP address in the SNAT pool?

When you have more than 65535 simultaneous connections. You should have
one IP address for every 65000 simultaneous connections or you may run
into port exhaustion.

Q3. What is the client IP?

10.1.20.249

Q4. What are the ephemeral port numbers on your client-side source IP
and server-side source IP?

They are the same ephemeral port numbers on your client-side source IP
and server-side source IP. BIG-IP will attempt to keep them the same if
the port is not already in use.

Task 3 – SNATs and NATs
~~~~~~~~~~~~~~~~~~~~~~~

Q1. Did the command succeed?

No, the LAMP sent the request to the BIG-IP, but has no access to the
client-side network.

Q2. Did the dig work? What was the source IP?. Did the ping work? What
was the result?

Yes, the source IP was 10.1.20.248. The ping did not work, Destination
Net Prohibited

Q3. What happened when you try to FTP to the SNAT address?

The BIG-IP sends a reset.

Q4. When you attempted to FTP and ping 10.1.10.15 and access 10.1.20.15
behind the BIG-IP were you successful?

Yes, you can both FTP and ping to 10.1.20.15.

LAB 2 – Profiles
----------------

Exercise 2.1 – Working with Profiles
------------------------------------

Task 1 – Working with profiles
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Did site work? Why didn’t you need to SNAT? Did you need SSL
profiles?

Yes, you didn’t need to SNAT because you put the servers default gateway
on the BIG-IP (routed mode), you didn’t need SSL profiles because a the
client created an SSL session directly with the backend server.

Q2. Could you use L7 iRules or profiles to view or modify the request or
response? Why or why not?

No, because the session was encrypted through the proxy. Had this been
unencrypted you would have seen the HTTP request and response in the
tcpdumps.

Q3. Did site work? Why not?

SSL connection error, you could not establish a SSL session directly to
the backend servers because they don’t support HTTPS.

Q4. Did site work? What did you observe in the TCPDUMPs? Did you need an
HTTP profile?

Yes, the tcpdumps show the client-side connection was encrypted and the
serve-side connection was not encrypted. The HTTP profile is not
required for SSL profiles to work, their at a different layer in the
stack.

Q5. Did it work? What was needed to add cookie persistence?

Yes, after you added the http profile to break out the http (L7)
request/response sequence.

Q6. What node do the pictures come from? What is the name of the cookie
inserted begin with?

All the images came from the same node. The cookie starts with
BIGipServerwww\_pool=….

Q5. Did site work?

No, the BIG-IP was sending unencrypted request to encrypted servers.

Q6. What profile was needed to correct the error?

Server side ssl profile

Exercise 2.2 – Application Acceleration
---------------------------------------

Task 1 - TCP Express
~~~~~~~~~~~~~~~~~~~~

Q1. What is the idle timeout in each profile? Why might you want to
change it?

300 second, for long term connections, such as telnet, ssh or ftp

Q2. What is the Nagle selection in the tcp-wan-optimized? Why might you
want to change it?

Nagle combines smaller packets into a larger packet for efficiency. It
the application relays on small packets for connection information,
Nagle may cause connection delays.

Q3. What happens if you increase the proxy buffer sizes?

You will use more memory per connection, for all connections using that
TCP profile.

Task 2 - HTTP Optimization - RamCache Lab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What resource would be consumed if you increased the **Cache Size**
setting?

More memory, per virtual server the caching profile was attached too.

Q2. The pictures do not change. Why do you think that is?

They are being pulled from cache.

Q3. Go to your pool. Are all pool members taking connections?

Yes, there are still uncacheable items to be retrieved.

Task 3 - HTTP Optimization - HTTP Compression Lab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Does the browser accept compression?

Yes, in the Request Headers you find Accept-Encoding: gzip, deflate.

Q2. At what point would the BIG-IP quit compressing responses?

When it hits 90% CPU

Task 4 - Securing web applications with the HTTP profile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the cookie name? Note the information after the cookie.

BIGipServerwww\_pool

Q2. What is in the X-Forwarded-For header? Why might you want to enable
it?

It place the original client IP in the HTTP header. It is useful for
virtual servers with SNAT if the original client IP is needed for
logging or other purposes.

Q3. Are they the same? What is different?

No, the server information has be removed from the response coming from
the secure\_vs

Q4. What is the result?

Redirected to www.f5.com.

Q5. What is different from the cookie at the start of the task?

Everything after the = sign as been encrytped

LAB 3: Application Visibilty and Reporting (AVR) 
=================================================

TASK 1 – AVR Lab Setup - Verify provisioning, iRules and Data Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What resources does AVR require to be provisioned?

16 gb of disks outside of the boot volume and 448mb of memory

Q2. Review the iRule, what profiles are required on the virtual server?

Q3. Review the iRule, what profiles are required on the virtual server?

TASK 6 – View the Analytics Reports
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What country has the most transactions?

A majority of the requests are coming from the United States.

Q2. What are the top two User Agents?

A majority of the requests should be from Internet Explorer v11 and
iPhone6 users, but it’s not guaranteed due to the randomness of the
iRule.

LAB 4 – Monitors and Status
===========================

Exercise 4.1 – Basic Monitoring
-------------------------------

Task 1 – Default Monitors
~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What would happen if a node failed?

The pool members with the node IP address would be marked offline.

Q2. What are your node statuses?

Available

Task 2 - Content Monitors
~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the status of the pool and its members?

Available

Q2. Go to **Virtual Servers** or **Network Map**, what is the status of
your virtual server?

Available

Q3. What is status of your pool and virtual server now?

Both the pool and virtual servers dependent on the pool are mark
offline.

Exercise 4.2 – Virtual Server Status
------------------------------------

Task 1 – Test Disabled Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

Task 2 – Virtual Server Connection Limits and Status
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Does ftp session work?

Yes

Q2. What is the virtual server status of **ftp\_vs**?

Yellow Triangle - Availability: unavailable - State: enabled

Q3. Did new ftp session establish connection? Why not?

No, the virtual server's connection limit has been reached-

Q4. Did tcpdump capture connection reset?

Yes, tcpdump revealed “R” reset

Exercise 4.3 – Pool Member and Virtual Servers
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

Traffic was distributed to available pool members.

Exercise 4.4 - Extended Application Verification (EAV)
------------------------------------------------------

Task 1 – Create an EAV monitor
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What was the stdout output? Did this indicate the member was
Available?

UP, indicating the member was Availble

Q2. Are your members up? What would happen if the external monitor
returned “DOWN”

Yes, the same would be true if DOWN was returned, and stdout output is
consider good.

Exercise 4.4 - Inband Monitors
------------------------------

Q1. What is the status of the **www\_pool** and **www\_vs** objects? Is
the web site accessible? Why?

Unchecked (blue square), Yes, because Uncheck simply mean the status in
unknown and thus always assume to be availale.

Q2. What are the status of **www\_pool** and **www\_vs**? Can you access
the web site?

Available, Yes

Q3. Why is the **www\_pool** still showing up?

Because there hasn’t been any client traffic to trigger the inband
monitor.

Q4. What is the status of the **www\_pool** now?

Offline

Q5. What are the pool statuses and why?

Offline, regardless of client traffic the BIG-IP will not attempt a
connection to the offline pool members for 300 seconds

Q6. How often to you see monitor traffic to the **www\_pool**?

Once a minute

Q7. How often to you see monitor traffic to the **www\_pool**?

Every 5 seconds

Q8. Did the www\_pool come up within 30 seconds without client traffic?
What did the tcpdump show?

Yes, the active monitor marked the pool up after 6 consecutive
successful monitor attempts.

The tcpdump show the monitor executing every 5 seconds until the members
were marked Available then it slowed to every 60 seconds.

LAB 5 – SSL
===========

Task 1 – Importing Certs and Key
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the common name of your imported certificate and when does
it expire?

Linux32server1.f5se.com, Jun 16, 2020

Task 2 – SSL Profile and Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Did it work?

Yes

LAB 6 – Virtual Servers and Packet Processing Review
====================================================

Exercise 6.1 – Lab Preparation and Packet Processing
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

Exercise 6.2 – Packet Filters
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

Exercise 6.4 – Virtual Server Packet Processing
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

Exercise 6.2 - IP Forwarding Virtual Servers
--------------------------------------------

Task 1 – Forwarding Virtual Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What happens if we don’t change the Protocol from TCP?

Only TCP will be allowed through, things like ICMP and UDP will be
blocked

Q2. What is the status of your new virtual server? Why?

Unchecked (blue square) because there is nothing to check.

Task 2 – More on Transparent Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Why did we use gateway\_icmp? What other kind of monitor could we
have used?

Because there isn’t a port on the pool member, you could have used a
transparent monitor to assign a L7 content monitor to check a specific
port.

Q2. Did it work? What were the image results?

Yes, images came from nodes 4 and 5.

Q3. Did it work?

dig @10.1.20.12 hackazon.f5demo.com

Q4. Did it work? Why not and how would you fix it?

No, because it is a UDP protocol and a TCP profile is on the virtual
server. You could do a wildcard for the protocols and then it would work
or create a UDP transparent virtual.

LAB 7 – Load Balancing and Pools
================================

Exercise 7.1 Load Balancing
---------------------------

Task 1 - Ratio Load Balancing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the difference between Node and Member?

Member is based on the connections for each pool member within a single
pool only, while Node takes into account all the connections an IP
address has across all pools it is a member of.

Q2. How many Total connections has each member taken? Q. Is the ratio of
connections correct?

Yes, the pool member with a Ratio of 3 took 3 times the number of
connections

Q3. Does the ratio setting have any impact now?

No, the pool member ratios only have an effect if Ratio load balancing
is selected.

Task 2 - Priority Groups Lab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Are all members taking connections? Which member isn’t taking
connections?

No, 10.1.20.13:80 in the low priority group is not taking connections.

Q2. Is the lower priority group activated and taking connections?

Yes, 10.1.20.13:80 in the low priority group is now taking connections.

Task 5 – Simple (Source Address) Persistence 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. How many members are taking traffic?

Only, one member is taking traffic

Q2. Check you Persists Records window, are the any persistence records?

Yes

Q3. Refresh you web page prior to the Age column reaching 120. What
happens?

The timer resets.

Q4. Could you access the web site? Why?

Yes, when a member is disabled, new connections can still be built to
it, if it there is a persist record pointing to it.

Q5. Could you access the web site? Why?

Force Offline only allows exist connections to be maintain, regardless
of persistence records.

LAB 8 – iApps (no labs required)
================================

<This section intentionally left blank>

LAB 9 – Networking
==================

You have already done a number of labs around networks and there are
only so many things we can do in the lab environment. Will take a moment
to do a couple of simple exercises that will help set up later labs.

Exercise 9.1 – Self IP Port Lockdown and more
---------------------------------------------

Task 1 – Effects of Port Lockdown
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Was echo response received?

Ping reply successful

Q2. Was ssh successful? Why not?

No. Port lockdown set to “Allow None” by default

Q3. Did SSH work? Did browsing work?

Yes NO

Q4. What other ports are opened when you select **Allow Defaults**.

From the bigip.conf;

ospf

tcp – snmp (161), ssh (22), 4353 (iquery/configsync), https (443), dns
(53)

udp – 1026 (Network failover), snmp (161), 4353 (iquery/configsync),
520, dns (53)

Q5. Did SSH work? Did browsing work?

Yes Not

LAB 10 – Roles and Partitions
=============================

Exercise 10.1 Roles and Partitions
----------------------------------

Task 2 – Create and place a user in a partition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. In the upper right of the BIG-IP WebUI what partition are you in?

test\_partition

Q2. Do you see the **test\_vs** just created?

No

Q3. Do you see your change? Is your change permanent?

Yes, but configuration changes made in tmsh are not permanent until
written to disk (save sys config) or a change is made in the GUI.
Changes made in the GUI are push into memory and written to disk.

Q4. Did you find it in /config/bigip.conf?

No

Q5. Did you find your virtual server? Is the tmsh change you made in
there?

Yes, but the new description isn’t there.

Q6. Do you see the change now?

Yes

Q7. Where you able to?

No, you were kicked off the BIG-IP SSH session

Exercise 10.2 Remote Authentication
-----------------------------------

Task 1 – Authenticate against LDAP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Were you successful?

Yes

Q2. Were you successful?

No, local accounts aside admin are disabled when using remote
authentication.

LAB 11 – Device Service Clusters and High Availability
======================================================

Exercise 11.1 – Building a DSC (Device Service Cluster)
-------------------------------------------------------

Task 1 - Base Networking and HA VLAN
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the status your BIG-IPs? Check the upper left-hand corner
next to the F5 ball.

Both are Active

Task 2 – Prepare each BIG-IP for High Availability
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. If you were to add multiple IP address to the Failover Unicast, when
would the BIG-IP failover?

Only after the network polls for all the IP addresses failed.

Task 3 – Build the Device Trust and Device Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Is all the information there?

Yes

Q2. What are the statuses of your BIG-IPs now?

Active In Sync

Q3. Did you have to create the Device Group on the other BIG-IP?

No, It was created automatically

Q4. Is the full configuration synchronized yet?

No! Only the Device Group is sync’d

Q5. What is the status and sync status on the BIG-IPs?

It should be Awaiting Initial Sync. Once BIG-IP is Active, the other is
Standby. There is no guarantee which BIG-IP will be the Active BIG-IP
when the device group is created.

Q6. Did the configuration synchronize? What, if any, errors do you see?

No, there was an error message on bigip02 indicating it could not load
avr\_virtual2 because of iRule dependencies. Which was why you created
that virtual first in the AVR lab.

Q7. Any issue with that?

Yes, avr\_virtual2 has dependencies.

Q8. What is the sync status of bigip02 once you made the change?

Changes Pending

Q9. Are the BIG-IPs In Sync? Are the configurations the same?

Yes and Yes

Browse to http://10.1.10.100

Q10. Could you access the site? Which BIG-IP passed the traffic?

Yes, the Active BIG-IP. You can tell because client IP is the SNAT Auto
Map of the active device.

Exercise 11.2 – Failover and Mirroring
--------------------------------------

Task 1 – Testing Failover
~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. What is the source IP in the **Request Details**?

10.1.20.246

Browse to http://10.1.10.115?

Q2. What happened? Why?

Site couldn’t be reached. The secure\_vs server does not use SNATs. The
secure\_pool servers use the default gateway, 10.1.20.240, you built as
a self IP on bigip01.

Q3. Did the site work? What was the client IP?

Yes, 10.1.10.51

Q4. What was the client IP address that the server saw (under **Request
Detail**\ s on the main page)? Why?

It should be10.1.20.240. www\_vs uses SNAT automap. The BIG-IP will
always use the floating IP for the SNAT if available. If you exceed
64000 simultaneous connects, the BIG-IP then uses the non-floating self
IP, but you probably should have created a SNAT pool.

Q5. Does http://10.1.10.115 still work? What is the client IP?

Yes, 10.1.10.51

Task 2 - Mirroring
~~~~~~~~~~~~~~~~~~

Q1. Do you have a persistence record on each BIG-IP? What would happen
if you did a failover?

No, only the Active unit had persistence records, upon failover
persistence would be lost.

Q2. If you had persistence records existing prior to mirroring would
they appear on the standby box?

No, BIG-IP only mirrors records created after mirroring is enabled.
Also, upon failover, the new Active BIG-IP will only mirror records
created after it became active.

Q3. Did you persist to the correct pool member? What is the client IP?

Yes, 10.1.10.240

Exercise 11.3 – Traffic Groups
------------------------------

Task 1 - Build a New Traffic Group.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. When you did this, what other virtual servers were assign to tg-?

ftp\_vs

Q2. What are the states of you BIG-IPs?

Active-Active

Q3. Did the web site work? What was the client IP? Did ftp work? Why or
why not?

Yes the web site work, the client IP was 10.1.20.245 SNAT because the
10.1.20.240 address is not part of the tg-2. The ftp site did NOT work
because it’s SNAT pool IP is not part of the tg-2 traffic group

Q4. Did it work now?

Yes, if you made the change on the active device for tg-2. If not,
synchronize and try again

LAB 14 – Security and Securing the BIG-IP
=========================================

Exercise 14.1 – More Security Features
--------------------------------------

Task 1 – Configure Audit Logging
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Do you see when adminuser logged on? Do you see the change made in
the audit log?

Yes, to both.

Task 2 – Limiting SSH access to the BIG-IP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Q1. Does existing an SSH window still work? Does a new SSH work?

Existing SSH session worked. New ssh sessions could not be establish for
the jumpbox source IPs.

Q2. Were new ssh sessions established?

Yes, to 10.1.1.245, No, to 10.1.10.245 (the source IP for that would be
10.1.10.51)

APPENDIX II – LAB 1 
====================

TMSH Commands
-------------

#

# bigip01

#

# Client-side networking

create net vlan client\_vlan interfaces add { 1.1 { untagged } }

create net self client\_ip address 10.1.10.245/24 vlan client\_vlan

# Server-side networking

create net vlan server\_vlan interfaces add { 1.2 { untagged } }

create net self server\_ip address 10.1.20.245/24 vlan server\_vlan

# Default route

create net route def\_gw network 0.0.0.0/0 gw 10.1.10.1

# Pool and Virtual Server v11.5.3

create ltm pool www\_pool members add { 10.1.20.11:80 10.1.20.12:80
10.1.20.13:80 } monitor http

create ltm virtual www\_vs destination 10.1.10.100:80 pool www\_pool
ip-protocol tcp source-address-translation { type automap }

# Write changes to disk

save sys config

# Archive your change

save sys ucs lab1-base-config

GUI Build Instructions
----------------------

Task 1 - Creating VLANs
~~~~~~~~~~~~~~~~~~~~~~~

You will create two untagged VLANs for the internal and external
networks

From the sidebar select **Network > VLANs** then select **Create**

|image6|

Under **General Properties**:

Name: **client\_vlan**

Tag: **<leave blank>**

Entering a tag is only required for “Tagged” (802.1q) interfaces,
“Untagged” interfaces will automatically get a tag but it is only for
internal L2 segmentation of traffic.

Under **Resources**

Under **Available** highlight and move interface 1.1 into the
**Untagged** box using the arrows.

|image7|

When you have completed your VLAN configuration, hit the **Finished**
button

**Create another untagged VLAN named server\_vlan on interface 1.2.**

Task 2 - Assigning a Self IP addresses to your VLANs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Go to **Network > Self IPs**, select **Create**.

|image8|

Create a new self IP, for the server\_vlan and client\_vlan VLANs. In
Network >> Self IPs >> New Self IP, under Configuration enter:

    ***Server-Side* *Client-side***

**Name:** server\_ip client\_ip

**IP Address:** 10.1.20.245 10.1.10.245

**Netmask:** 255.255.255.0 255.255.255.0

**VLAN:** server\_vlan client\_vlan

**Port Lockdown:** Allow None Allow None

The default “Allow None” means the Self IP would respond only to ICMP.

Prior to V11.3 “Allow Defaults” was the default selection and opened the
following on the self IP of the VLAN

TCP: ssh, domain, snmp, https

TCP: 4353, 6699 (for F5 protocols, such as HA and iQuery)

UDP: 520, cap, domain, f5-iquery, snmp

PROTOCOL: ospf

When you have completed your selfIP configuration, hit the **Finished**
button.

 |image9|

Task 3 - Assigning the Default Gateway
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Go to **Network > Routes** and then **Add**.

Here is where we assign our default gateway (and other static routes as
desired)

|image10|

Under **Properties**

Name: **default\_gateway**

Destination: **0.0.0.0**

Netmask: **0.0.0.0**

Resource: **Use Gateway…**

Gateway Address: **10.1.10.1**

When you have completed defining your default gateway, hit the button

Verify your network configuration:

Using Windows command line ping your client-side self ip (10.1.10.245)
to verify connectivity

Use puTTY utility on the task bar, to access your BIG-IP management port
at 10.1.1.245.

User: **root** Password: **default**

Ping your default gateway, 10.1.10.1

Ping a web server at 10.1.20.11

Task 4 - Creating Pools
~~~~~~~~~~~~~~~~~~~~~~~

In this lab we will build a pool and virtual serve to support our web
site and verify our configurations by accessing our web servers through
the BIG-IP. Verification will be performed visually and through various
statistical interfaces.

From the sidebar select **Local Traffic >> Pools** then select
**Create**.

|image11|

Under Configuration:

Name: **www\_pool**

Description: **<optional>**

Health Monitor: **http**

Under **Resources**

Load Balancing Method: **<leave at the default Round Robin>**

Priority Group Activation: **<leave at default>**

New Members:

    *Address* *Service Port*

    **10.1.20.11 80**

    **10.1.20.12 80**

    **10.1.20.13 80**

As you enter each IP address and port combination hit **Add** button

When you have completee your pool configuration, hit the e button

 |image12|

Task 5 - Creating Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now let’s build our virtual server

Under **Local Traffic** select **Virtual Servers** then select
**Create**.

|image13|

Under **General Properties**

Name: **www\_vs**

Type: **Standard**

Destination: Type: **Host**

Address: **10.1.10.100**

Service Port: **80 or HTTP**

Under Configurations

The web servers do not use the BIG-IP LTM as the default gateway. This
means return traffic will route around the BIG-IP LTM. Configuring SNAT
Automap on the Virtual Server will translate the client IP to the self
IP of the egress (server) VLAN and ensure the response returns to the
BIG-IP.

Source Address Translation: **Auto Map**

|image14|

Under Resources

iRules: **none**

Default Pool: From the drop-down menu, select the pool **www\_pool**,
which you created earlier

Default Persistence Profile: **None**

Fallback Persistence Profile: None

When you have completed your configuration, hit the **Finished** button

You have now created a Virtual Server (Note: Items in blue are links)

|image15|

Now let’s see if our virtual server works!

Open a browser window to http://10.1.10.100 the Virtual Server you just
created

I suggest private browsing to eliminate problems with browser caching.

Refresh the browser screen several times (use “<ctrl>” F5)

|image16|

Appendix III – Extended Application Verification (EAV) Monitor from DevCentral
==============================================================================

#!/bin/sh

#

# (c) Copyright 1996-2007 F5 Networks, Inc.

#

# This software is confidential and may contain trade secrets that are
the

# property of F5 Networks, Inc. No part of the software may be disclosed

# to other parties without the express written consent of F5 Networks,
Inc.

# It is against the law to copy the software. No part of the software
may

# be reproduced, transmitted, or distributed in any form or by any
means,

# electronic or mechanical, including photocopying, recording, or
information

# storage and retrieval systems, for any purpose without the express
written

# permission of F5 Networks, Inc. Our services are only available for
legal

# users of the program, for instance in the event that we extend our
services

# by offering the updating of files via the Internet.

#

# @(#) $Id: http\_monitor\_cURL+GET,v 1.0 2007/06/28 16:10:15 deb Exp $

# (based on sample\_monitor,v 1.3 2005/02/04 18:47:17 saxon)

#

# these arguments supplied automatically for all external monitors:

# $1 = IP (IPv6 notation. IPv4 addresses are passed in the form

# ::ffff:w.x.y.z

# where "w.x.y.z" is the IPv4 address)

# $2 = port (decimal, host byte order)

#

# Additional command line arguments ($3 and higher) may be specified in
the monitor template

# This example does not expect any additional command line arguments

#

# Name/Value pairs may also be specified in the monitor template

# This example expects the following Name/Vaule pairs:

# URI = the URI to request from the server

# RECV = the expected response (not case sensitive)

#

 

# remove IPv6/IPv4 compatibility prefix (LTM passes addresses in IPv6
format)

IP=\`echo ${1} \| sed 's/::ffff://'\`

PORT=${2}

 

PIDFILE="/var/run/\`basename ${0}\`.${IP}\_${PORT}.pid"

# kill of the last instance of this monitor if hung and log current pid

if [ -f $PIDFILE ]

then

echo "EAV exceeded runtime needed to kill ${IP}:${PORT}" \| logger -p
local0.error

kill -9 \`cat $PIDFILE\` > /dev/null 2>&1

fi

echo "$$" > $PIDFILE

 

# send request & check for expected response

curl -fNs http://${IP}:${PORT}${URI} \| grep -i "${RECV}" 2>&1 >
/dev/null

 

# mark node UP if expected response was received

if [ $? -eq 0 ]

then

rm -f $PIDFILE

echo "UP"

else

rm -f $PIDFILE

fi

 

exit

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
   :width: 6.34524in
   :height: 1.31133in
.. |image5| image:: media/image7.png
   :width: 6.70495in
   :height: 0.54167in
.. |image6| image:: media/image8.png
   :width: 3.29911in
   :height: 2.18333in
.. |image7| image:: media/image9.png
   :width: 3.58333in
   :height: 1.98600in
.. |image8| image:: media/image10.png
   :width: 5.34896in
   :height: 2.43750in
.. |image9| image:: media/image11.png
   :width: 6.45056in
   :height: 1.32511in
.. |image10| image:: media/image12.png
   :width: 3.93367in
   :height: 2.40854in
.. |image11| image:: media/image13.png
   :width: 2.51667in
   :height: 2.73393in
.. |image12| image:: media/image14.png
   :width: 3.89762in
   :height: 1.13398in
.. |image13| image:: media/image15.png
   :width: 2.79762in
   :height: 2.27684in
.. |image14| image:: media/image16.png
   :width: 2.69048in
   :height: 0.89973in
.. |image15| image:: media/image17.png
   :width: 4.36674in
   :height: 0.90476in
.. |image16| image:: media/image18.png
   :width: 3.80000in
   :height: 2.01000in
