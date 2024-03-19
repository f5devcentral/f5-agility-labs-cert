1.09 - Identify the matching order of multiple virtual servers
==============================================================

Open BIG-IP TMSH and TCPDump session
------------------------------------

In this task, you will open two SSH sessions to the BIG-IP. One for TMSH
commands and the other for tcpdump of the client-side network.

Open PuTTY/terminal window to establish an SSH session to BIG-IP from your jumpbox.

.. code-block:: bash

   ssh root@10.1.1.4
   Password: default.F5demo.com

Use tcpdump to monitor traffic from the client (10.1.10.199) destined to
**ftp\_vs** (10.1.10.100)

.. code-block:: bash

   tcpdump -nni client_vlan host 10.1.10.199 and 10.1.10.100

Open a second PuTTY/terminal window (window2) to BIG-IP and use **tmsh** to display the connection table.

.. code-block:: bash

   ssh root@10.1.1.4
   Password: default.F5demo.com

   tmsh

At the TMOS prompt **(tmos)#**

.. code-block:: bash

   show sys connection

Do you see any connections from the jumpbox 10.1.1.6 to 10.1.1.4:22?

*Q1. Why are the ssh management sessions not displayed in connection
table?*

Establish ftp connection
------------------------

In this task you will open a third terminal window and establish an FTP
session through the **ftp\_vs** virtual server. With the connection
remaining open you will view the results in your other windows with the tcpdump and
tmsh commands.

Open a command prompt on your Windows jumpbox and issue the following FTP command.

.. code-block:: bash

   ftp 10.1.10.100

It may take 15 to 20 seconds for the logon on prompt, just leave it at
prompt to hold the connection open.

In the tcpdump window you should see something similar to the tcpdump captured
below.

.. image:: /_static/201L/201ex211t2a-tcpdump.png

*Q1. In the tcpdump above, what is client IP address and port and the
server IP address port?*

In the tmsh windows, run the **show sys conn** again, but strain out the
noise of other connections (mirrored and selfIP) by just looking at
connections from your jumpbox.

.. code-block:: bash

   show sys conn cs-client-addr 10.1.10.199

The connection table on window2 will show the client-side and
server-side connection similar to below:

.. image:: /_static/201L/201ex211t2b-shsysconn.png

*Q2. What is source ip and port as seen by ftp server in the example
above?*

*Q3. What happened to the original client IP address and where did
10.1.20.249 come from?*

.. HINT::
   You may have to review the configuration of **ftp\_vs** to determine
   the answer to question 3.

Create additional Virtual Servers
----------------------------------

In this task you will create a wildcard virtual server and pool, test and observe various types of traffic under different configurations to determine how virtual servers
process new inbound connections. You will be using tcpdump in one window, and a browser to view the corresponding virtual server statistics.

Create **wildcard\_vs** **10.1.10.100:\*** with a **TCP** profile, **Automap** and a
pool named **wildcard\_pool** with the following member **10.1.20.11:\***

To create the wildcard pool, go to **Local Traffic > Pools > Pool List**
and select **Create**.

+---------------+------------------+
| **Name**      | wildcard\_pool   |
+===============+==================+
| **Address**   | 10.1.20.11       |
+---------------+------------------+
| **Port**      | \*               |
+---------------+------------------+

.. HINT::

   Don't forget to **Add** the pool member to the **New Members** box
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

Don't forget to hit **Finished.**

You were not required to enter the source addresses allowed. Go to your new virtual server and look at the **Source** configuration to see what the default is for source addresses allowed.

Testing Virtual Server Packet Processing Behavior
-------------------------------------------------

Many of your virtual servers have the same virtual address. You will now
test various behaviors.

Clear virtual server stats.

Observe connection statistics (VS stats) after each of the following tasks.

Browse to http://10.1.10.100:8080

*Q1. Which VS is used for web traffic over port 8080?*

FTP to 10.1.10.100

*Q2. Which VS is used for FTP traffic?*

Browse to http://10.1.10.100

*Q3. Which VS is used for this web traffic the default HTTP port? What
port was used?*

Clear virtual server stats.

Modify the **wildcard\_vs** to only allow connections from a **Source**
of 10.1.10.0/24.

.. NOTE::
   The source address your jumpbox should be connecting from is 10.1.10.199

Browse to http://10.1.10.100

Observe connection statistics (VS stats)

*Q4. Which VS is used for web traffic?*

Clean up your modifications

Clear virtual server stats.

Modify **wildcard\_vs** to include the default **Source** of 0.0.0.0/0.

IP Forwarding Virtual Server
----------------------------

Our web administrators would like to access the back-end server network.
They all access from the same 10.1.10.0/24 subnet. Let's create a
virtual server that allows them and only them to get to the backend
network. REMEMBER somewhere a router must have the route to the backend
network inserted.

Create a new **Forward (IP)** type of virtual server named
**forward-to-servernet** that only allows **Source** IPs from the
**10.1.10.0/24**, to the **Destination Address** **10.1.20.0/24**, all
ports should be allowed, all protocols should be allowed and **Automap** must be selected.

*Q1. What happens if we don't change the Protocol from TCP?*

*Q2. What is the status of your new virtual server? Why?*

Of course we are not going anywhere unless we install a route to the
**10.1.20.0/24** network. From a command prompt window on your jumpbox enter the add route command.

Windows requires elevated priveleges. Click on the Windows **Start** icon at the bottom left of the desktop to find the **Command Prompt** application, right click on **Command Prompt**,
select **Run as Administrator**, select **Yes** at the pop-up::

   route add 10.1.20.0 mask 255.255.255.0 10.1.10.245

On a Linux jumpbox, the corresponding command is (enter the user password when prompted)::

   sudo route add -net 10.1.20.0/24 gw 10.1.10.245

Verifiy your route has been added (works for Windows and Linux)::

   netstat -r

Open up statistics for **forward-to-servernet** and from the jumpbox terminal window test access to the
10.1.20.0/24 subnet:

  - ping 10.1.20.11
  - nslookup lamp2.f5demo.com 10.1.20.12 (windows) or dig @10.1.20.12 f5demo.com (linux)
  - http://10.1.20.13 (from a browser) or curl 10.1.20.13 (linux)

By the way, if you take a look at the iApp templates you will find one
for building IP Forwarding virtual servers.

More on Transparent Virtual Servers
-----------------------------------

You have a pool of servers running multiple applications (FTP, HTTP,
SSH, etc) and you don't want to create a virtual server for each
application. In this case a transparent virtual server that doesn't
translate the port would work best.

Build your transparent pool and virtual server

Create a new pool called **transparent-pool**, use the **gateway\_icmp**
monitor with the member **10.1.20.14:**\ ***** and **10.1.20.15:**\ *****,
wildcard ``*`` for the port.

*Q1. Why did we use gateway\_icmp? What other kind of monitor could we
have used?*

Create a virtual server called **transparent-vs** with a IP address of
**10.1.10.95** with with the wildcard port ``*``, since we can't put any L7
profiles on this virtual server a virtual server type of **Performance (Layer 4)** will
be more efficient, Finally configure **transparent-pool** as the virtual server pool.

.. NOTE::
   Open the Advanced menu and review the Address Translation and
   Port Translation settings.

Test your virtual server.

Browse to **http://10.1.10.95**.

*Q2. Did it work? What were the image results?*

Browse to **https://10.1.10.95**.

*Q3. Did it work?*

DNS is running to the LAMP server.  SSH or PuTTY to 10.1.1.252 (LAMP server).
In the LAMP terminal window::

   login as: **root**
   Password: **default**
   root@localhost:~# **dig @10.1.10.95 lamp2.f5demo.com**
   
*Q4. Did it work? Why not and how would you fix it?*

Test Disabled Virtual Servers
-----------------------------

In this task, you will disable and enable various virtual servers and
note the behavior.

Make sure you have two SSH sessions opened to the BIG-IP.

- In window 1, have a tcpdump watching traffic to the **www_vs** virtual (**10.1.10.100**)
- In window 2, go into TMSH

Disable **www\_vs** from the **Virtual Server List** or from within the
**www\_vs** GUI interface.

Open **Local** **Traffic > Virtual Servers** and hover over status icons.

From window 2 (TMSH) type::

   show ltm virtual www_vs

*Q1. What is the Availability of* **www\_vs**\ *? What is the State?*

*Q2. In the TMUI GUI, what symbol is used to represent* **www\_vs** *status*?

*Q3. Would you expect browsing to* **http://10.1.10.100** *to work?*

*Q4. Can you ping the virtual IP?*

Clear virtual server stats and browse to **http://10.1.10.100**

Observe the tcpdump (window 1) and connection statistics in the Virtual
Server statics GUI interface.

*Q5. Did the site work? What did the tcpdump show?*

*Q6. Did statistics counters for any virtual server increment?*

Establish ftp connection to **10.1.10.100** and ensure successful login.

- Logon credentials are **root/default**

Disable **ftp\_vs**.

*Q10. Does ftp session still work? Why?*

Open another window and establish ftp connection to **10.1.10.100**.

*Q11. Did new ftp session establish connection? Why not?*

.. WARNING::

   Make sure all virtual servers are **Enabled** before continuing.

Virtual Server Connection Limits and Status
-------------------------------------------

In this task, you will set the connection limit for the FTP virtual
server to 1 and note the status and behavior of different connection
scenarios.

Modify **ftp\_vs** with *connection limit* set to **1**. The **Connection Limit**
option can be found under the **Advanced** virtual server menu.

Establish ftp connection to **10.1.10.100** and hold the logon open.

*Q1. Does FTP session work?*

*Q2. In the TMUI GUI, what is the virtual server symbol and status of* **ftp\_vs**\ **?**

Open another window and establish a second ftp connection to **10.1.10.100**.

*Q3. Did new ftp session establish connection? Why not?*

*Q4. Did tcpdump capture a connection reset?*

*Q5 Quit all FTP sessions and note* **ftp\_vs** *status.*
