Basic set up of virtual lab environment using TMSH
==================================================

TMSH Commands
-------------

Access your BIG-IP, perform a basic build of networking, pool and
virtual server and establish that your environment is working. **If you
are unfamiliar with TMSH this is a good opportunity to get a feel for it.**

For BIG-IP WebUI access open a browser and access **https://10.1.1.4**. Log into the BIG-IP VE system using the following credentials::

    Username: admin
    Password: admin.F5demo.com

For BIG-IP terminal access, you have two options:

-  SSH Access from a Linux terminal window. Open a terminal window and
   type the following::

    ssh root@10.1.1.4
    Password: default.F5demo.com

-  Select the PuTTY icon on the bottom task bar and select **bigip01**

Given the following information, network the BIG-IP and build a basic pool and
virtual server using SNAT automap.

+----------------+--------------+----------------+---------------+---------------+
| VLANs          | Name:        | client\_vlan   | server\_vlan  |               |
+----------------+--------------+----------------+---------------+---------------+
|                | Interface:   | 1.1            | 1.2           |               |
+----------------+--------------+----------------+---------------+---------------+
| IP Addressing  | Name:        | client\_ip     | server\_ip    |               |
+----------------+--------------+----------------+---------------+---------------+
|                | IP Address:  | 10.1.10.245    | 10.1.20.245   |               |
+----------------+--------------+----------------+---------------+---------------+
|                | Netmask:     | 255.255.255.0  | 255.255.255.0 |               |
+----------------+--------------+----------------+---------------+---------------+
|                | VLAN:        | client\_vlan   | server\_vlan  |               |
+----------------+--------------+----------------+---------------+---------------+
|                |              |                |               |               |
+----------------+--------------+----------------+---------------+---------------+
| Pool           | Name:        | www\_pool      |               |               |
+----------------+--------------+----------------+---------------+---------------+
|                | Members      | 10.1.20.11:80  | 10.1.20.12:80 | 10.1.20.13:80 |
+----------------+--------------+----------------+---------------+---------------+
| Virtual Server | Name:        | www\_vs        |               |               |
+----------------+--------------+----------------+---------------+---------------+
|                | Destination: | 10.1.10.100:80 |               |               |
+----------------+--------------+----------------+---------------+---------------+
|                | Pool         | www\_pool      |               |               |
+----------------+--------------+----------------+---------------+---------------+

Here are example TMSH command to help you:

Command examples for networking::

   create net vlan <vlan-name> interfaces add { <interface> { untagged } }
   create net self <ip_name> address <ip/mask> vlan <vlan_name>

   # Client-side networking
   create net vlan client_vlan interfaces add { 1.1 { untagged } }
   create net self client_ip address 10.1.10.245/24 vlan client_vlan

   # Server-side networking
   create net vlan server_vlan interfaces add { 1.2 { untagged } }
   create net self server_ip address 10.1.20.245/24 vlan server_vlan

   # Default Route
   create net route def_gw network 0.0.0.0/0 gw 10.1.10.1

Command example for creating pool::

   create ltm pool <pool name> members add { <ip:port> <ip:port> <etc> } monitor http
   create ltm pool www_pool members add { 10.1.20.11:80 10.1.20.12:80 10.1.20.13:80 } monitor http

Command example for creating a standard virtual server::

  create ltm virtual <vs name> destination <ip:port> pool <pool name> ip-protocol tcp source-address-translation { type automap }
  create ltm virtual www_vs destination 10.1.10.100:80 pool www_pool ip-protocol tcp source-address-translation { type automap }

Write your configuration to disk and create an archive::

   save sys config
   save sys ucs lab1-base-config

Log on to the BIG-IP WebUI and verify your virtual server is **Available** (green circle).

Using a new browser window (preferably a private browser window) access
the web site at http://10.1.10.100

*Q1. In* **Request Detail** *at the top of the page, what is the client
IP address and why?*
