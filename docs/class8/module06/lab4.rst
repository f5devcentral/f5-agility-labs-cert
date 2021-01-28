Forwarding Virtual Servers
==========================

Our web administrators would like to access the back-end server network.
They all access from the same 10.1.10.0/24 subnet. Let's create a
virtual server that allows them and only them to get to the backend
network. REMEMBER somewhere a router must have the route to the backend
network inserted.

IP Forwarding Virtual Server
----------------------------

Create a new **Forward (IP)** type of virtual server named
**forward-to-servernet** that only allows **Source** IPs from the
**10.1.10.0/24**, to the destination **Network** **10.1.20.0/24**, all
ports should be allowed and all protocols should be allowed.

*Q1. What happens if we don't change the Protocol from TCP?*

*Q2. What is the status of your new virtual server? Why?*

Of course we are not going anywhere unless we install a route to the
**10.1.20.0/24** network. From a command/terminal window on your jumpbox enter the
add route command.  

Windows requires elevated priveleges, click on **Start**, right click on **Command Prompt**,
select **Run as Administrator**, select **Yes** at the pop-up::

   route add 10.1.20.0 mask 255.255.255.0 10.1.10.245
   
Linux (enter the user password when prompted)::

   sudo route add -net 10.1.20.0/24 gw 10.1.10.245

Enter **f5DEMOs4u** if prompted for a password.

Verifiy your route has been added (works for Windows and Linux)::

   netstat -r
   
Open up statistics for **forward-to-servernet** and from the jumpbox terminal window test access to the
10.1.20.0/24 subnet:

  - ping 10.1.20.11
  - nslookup hackzon.f5demo.com 10.1.20.12 (windows) or dig @10.1.20.12 hackazon.f5demo.com (linux)
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
   Open the Advanced menu and notice that Address Translation is still enabled, but
   Port Translation is not.

Test your virtual server.

Browse to **http://10.1.10.95**.

*Q2. Did it work? What were the image results?*

Browse to **https://10.1.10.95**.

*Q3. Did it work?*

DNS is running to the LAMP server.  SSH or PuTTY to 10.1.1.252 (LAMP server).
In the LAMP terminal window::
 
   dig @10.1.10.95 hackazon.f5demo.com

*Q4. Did it work? Why not and how would you fix it?*
