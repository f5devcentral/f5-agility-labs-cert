Basic set up using TMSH
=======================

TMSH challenge 
--------------

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
    Password: default

-  Select the PuTTY icon on the bottom task bar and select **bigip01**

Given the following information, network the BIG-IP and build a basic pool and
virtual server using SNAT automap.

+------------------+----------------+------------------+-----------------+-----------------+
| VLANs            | Name:          | client\_vlan     | server\_vlan    |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | Interface:     | 1.1              | 1.2             |                 |
+------------------+----------------+------------------+-----------------+-----------------+
| IP Addressing    | Name:          | client\_ip       | server\_ip      |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | IP Address:    | 10.1.10.245      | 10.1.20.245     |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | Netmask:       | 255.255.255.0    | 255.255.255.0   |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | VLAN:          | client\_vlan     | server\_vlan    |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  |                |                  |                 |                 |
+------------------+----------------+------------------+-----------------+-----------------+
| Pool             | Name:          | www\_pool        |                 |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | Members        | 10.1.20.11:80    | 10.1.20.12:80   | 10.1.20.13:80   |
+------------------+----------------+------------------+-----------------+-----------------+
| Virtual Server   | Name:          | www\_vs          |                 |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | Destination:   | 10.1.10.100:80   |                 |                 |
+------------------+----------------+------------------+-----------------+-----------------+
|                  | Pool           | www\_pool        |                 |                 |
+------------------+----------------+------------------+-----------------+-----------------+

Here are example TMSH command to help you:

Command examples for networking::

   create net vlan <vlan-name> interfaces add { <interface> { untagged } }

   create net self <ip_name> address <ip/mask> vlan <vlan_name>

   create net route def_gw network 0.0.0.0/0 gw 10.1.10.1

Command example for creating pool::

   create ltm pool <pool name> members add { <ip:port> <ip:port> <etc> } monitor http

Command example for creating a standard virtual server::

  create ltm virtual <vs name> destination <ip:port> pool <pool name> ip-protocol tcp source-address-translation { type automap }

Write your configuration to disk and create an archive::

   save sys config
   save sys ucs lab1-base-config

.. NOTE:: The tmsh commands to build the base configuration can be found in **Module 3.12**.

Log on to the BIG-IP WebUI and verify your virtual server is **Available** (green circle).

Using a new browser window (preferably a private browser window) access
the web site at http://10.1.10.100

*Q1. In* **Request Detail** *at the top of the page, what is the client
IP address and why?*

SNATs and NATs
==============

SNAT Pools
----------

You will build a new FTP application, to take a closer look at SNATs and
SNAT Pools using the **tcpdump** tool and view the connection table.

When building the FTP application you will use the default
**FTP** profile and use **Auto Map** for the Source Translation address.

Go to **Local Traffic > Pools** and create a new pool.

.. list-table:: 
   :widths: 40 30

   *  - Name 
      - **ftp_pool**
   *  - Health Monitor 
      - **tcp**
   *  - Address 
      - **10.1.20.15**
   *  - Service Port 
      - **21**

Go to **Local Traffic > Virtual Servers** and create a new virtual server.

.. list-table::
   :widths: 40 30

   *  - Name 
      - **ftp_vs**
   *  - Destination Address 
      - **10.1.10.100**
   *  - Service Port 
      - **21**
   *  - FTP Profile 
      - **ftp**
   *  - Source Address Translation
      - **Auto Map**
   *  - Default Pool
      - **ftp_pool**

Verify your FTP virtual server and pool are **Available**.

Open up a terminal window and SSH to the BIG-IP::

   ssh root@10.1.1.4 
   Password: default

Or use PuTTY::

   Username: root
   Passwood: default

At the BIG-IP CLI prompt do a tcpdump of the server-side traffic and
watch the FTP pool member::

  tcpdump -nni server_vlan host 10.1.20.15

From a Linux terminal window FTP to 10.1.10.100. The logon credentials
are **root/default**. It may take 15-20 to connect.

*Q1. Do you see traffic destined for the for the FTP server? What is the source IP?*

Imagine a dozen virtual servers using 
using Auto Map. It would be extremely difficult to watch for particular
client traffic from a particular virtual server. Not to mention a SNAT IP address can only handle 65535. SNAT pools can make
management and debugging a little easier and keep port exhaustion at bay.

Create a SNAT pool and assign it to the FTP server.

Go to **Address Translation** on the sidebar and select **SNAT Pool List**
and create a new SNAT pool named **SNATpool\_249** with **10.1.20.249**
as a member.

*Q2. Why might you require more than one IP address in the SNAT pool?*

Go to the **ftp\_vs** and change the **Source Address Translation** to
the **SNATpool\_249** pool.

Let's tried the tcpdump we did earlier, but have it limited to the pool
member and SNAT pool IP::

   tcpdump -nni server_vlan host 10.1.20.15 and 10.1.20.249

Now there is no extraneous traffic being seen. Open a terminal window
and ftp to **10.1.10.100** and log on to the ftp server. User: **root**
Password: **default**

*Q3. What is the client IP that shows up in the tcpdump?*

Open up another SSH session to the BIG-IP, go into **TMSH** and dump the
connection table::

   show sys connection

Find the connection with your client IP 10.1.10.51 and the SNAT pool IP.

*Q4. What are the ephemeral port numbers on your client-side source IP
and server-side source IP?*

More SNATs and NATs
-------------------

Let's take a look at using SNATs to allow internal resources to access
external resources more securely and the difference between a SNAT and
a NAT.

The **LAMP** server used for the internal server farm has a default gateway
of **10.1.20.240** and has no external access at this time, but you can SSH
to it via the out-of-band management network at **10.1.1.252**.

On the BIG-IP, add a new self IP address named **server\_gw** to the VLAN
**server\_vlan**, with an IP address of **10.1.20.240** and netmask of **255.255.255.0**

From the jumpbox, SSH to the LAMP server at **10.1.1.252**. You can open PuTTY, load the LAMP (10.1.1.252) server profile and SSH to the LAMP server or open a terminal window and **ssh root@10.1.1.252**.  The username is **f5** no other credentials are required, it may take up to 30 seconds to login.

Once logged in, change yourself to root::

   su root
   Password: default

At the command prompt, attempt to hit the Google open DNS server::

   dig @8.8.4.4

*Q1. Did the command succeed?*

On the BIG-IP, open the **SNAT List** and select **Create**

Create a new SNAT translation Name: **server\_snat,** used the IP
address **10.1.10.248** for the Translation and limit the allowed
ingress traffic to VLAN **server\_vlan**.

In a BIG-IP terminal window, do a **tcpdump** on the **client\_vlan**,
limited to the **10.1.10.248** and **8.8.4.4**.

From the LAMP server try the **dig** command again and the try to **ping
8.8.4.4** from the LAMP server.

*Q2. Did the dig work? What was the source IP?. Did the ping work? What
was the result?*

From the Linux prompt attempt to FTP to **10.1.10.248**.

*Q3. What happened when you try to FTP to the SNAT address?*

Go to **Statistics >> Module Statistics >> Local Traffic** and select
**Statistics Type: SNAT Translations** and review the information.

Under **Address Translation** go to the **NAT List** and create a NAT
named **server\_15\_nat** with a **NAT Address** of **10.1.10.15** and
an **Origin Address** of **10.1.20.15**.

Attempt to FTP to 10.1.10.15. Attempt to ping 10.1.10.15.

*Q4. When you attempted to FTP and ping 10.1.10.15 and access 10.1.20.15
behind the BIG-IP were you successful?*
