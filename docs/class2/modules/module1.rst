Section 1 - Troubleshoot basic virtual server Connectivity issues
=================================================================

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 1.01 - Given a connectivity troubleshooting situation, consider the packet and virtual server processing order
--------------------------------------------------------------------------------------------------------------------------

|
|

**Virtual Server Intro:**

Before we get into the study points of this section, there is some basic
information you should know about virtual servers and the BIG-IP
platform.

`TMOS Concepts 11-5-0 (the 11-4-0 Docs no longer exist but concepts are the same) <https://techdocs.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-concepts-11-5-0/1.html#conceptid>`__

`Virtual Server Intro <https://techdocs.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-5-0/2.html#conceptid>`__

A BIG-IP platform is a default deny device. This means that the device
will not accept traffic and process it unless you have configured it to
do so.

A virtual server is a traffic-management object on the BIG-IP system
that is represented by an IP address and a service (port number).
Clients on an external network can send application traffic to a virtual
server, which then directs the traffic according to your configuration
instructions. The main purpose of a virtual server is often to balance
traffic load across a pool of servers on an internal network. Virtual
servers increase the availability of resources for processing client
requests.

Not only do virtual servers distribute traffic across multiple servers,
they also treat varying types of traffic differently, depending on your
traffic-management needs. For example, a virtual server can enable
compression on HTTP request data as it passes through the BIG-IP system,
or decrypt and re-encrypt SSL connections and verify SSL certificates.
For each type of traffic, such as TCP, UDP, HTTP, SSL, SIP, and FTP, a
virtual server can apply an entire group of settings, to affect the way
that Local Traffic Manager manages that traffic type.

A virtual server can also enable session persistence for a specific
traffic type. Through a virtual server, you can set up session
persistence for HTTP, SSL, SIP, and MSRDP sessions, to name a few.

Finally, a virtual server can apply an iRule, which is a user-written
script designed to inspect and direct individual connections in specific
ways. For example, you can create an iRule that searches the content of
a TCP connection for a specific string and, if found, directs the
virtual server to send the connection to a specific pool or pool member.

To summarize, a virtual server can do the following:

-  Distribute client requests across multiple servers to balance server
   load

-  Apply various behavioral settings to a specific type of traffic

-  Enable persistence for a specific type of traffic

-  Direct traffic according to user-written iRules

You can use virtual servers in any of several distinct ways:

**Directing traffic to a load balancing pool**

A Standard virtual server (also known as a load balancing virtual
server) directs client traffic to a load balancing pool and is the most
basic type of virtual server. When you first create the virtual server,
you assign an existing default pool to it. From then on, the virtual
server automatically directs traffic to that default pool.

**Sharing an IP address with a VLAN node**

You can set up a Forwarding (Layer 2) virtual server to share the same
IP address as a node in an associated VLAN. To do this, you must perform
some additional configuration tasks. These tasks consist of: creating a
VLAN group that includes the VLAN in which the node resides, assigning a
self-IP address to the VLAN group, and disabling the virtual server on
the relevant VLAN.

**Forwarding traffic to a specific destination IP address**

A Forwarding (IP) virtual server is just like other virtual servers,
except that a forwarding virtual server has no pool members to load
balance. The virtual server simply forwards the packet directly to the
destination IP address specified in the client request. When you use a
forwarding virtual server to direct a request to its originally
specified destination IP address, Local Traffic Manager adds, tracks,
and reaps these connections just as with other virtual servers. You can
also view statistics for a forwarding virtual server.

**Increasing the speed of processing HTTP traffic**

A Performance (HTTP) virtual server is a virtual server with which you
associate a Fast HTTP profile. Together, the virtual server and profile
increase the speed at which the virtual server processes HTTP requests.

**Increasing the speed of processing Layer 4 traffic**

A Performance (Layer 4) virtual server is a virtual server with which
you associate a Fast L4 profile. Together, the virtual server and
profile increase the speed at which the virtual server processes Layer 4
requests.

**Relaying DHCP traffic**

You can create a type of virtual server that relays Dynamic Host Control
Protocol (DHCP) messages between clients and servers residing on
different IP networks. Known as a DHCP relay agent, a BIG-IP system with
a DHCP Relay type of virtual server listens for DHCP client messages
being broadcast on the subnet and then relays those messages to the DHCP
server. The DHCP server then uses the BIG-IP system to send the
responses back to the DHCP client. Configuring a DHCP Relay virtual
server on the BIG-IP system relieves you of the tasks of installing and
running a separate DHCP server on each subnet.

When you create a virtual server, you specify the pool or pools that you
want to serve as the destination for any traffic coming from that
virtual server. You also configure its general properties, some
configuration options, and other resources you want to assign to it,
such as iRules or session persistence types.

----

|

**1.01 - Explain how a packet is processed once it arrives on the device**

In version 4.x, which was just prior to version 9.x (when TMOS was
created), the BIG-IP system used a virtual server precedence to define
the order in which it routes a packet to a specific virtual server in
the event that the packet matches multiple virtual server definitions.

The order of virtual server precedence was (from the highest precedence
to the lowest precedence) as follows:

-  ip:port

-  ip:any

-  network:port

-  any:port

-  network:any

-  vlan:port

-  vlan:any

-  any:any

Many things have changed since then.

In Version 9.x through 11.2.1, (*which is not a part of this exam
version, but is a building block for the current exam version*) the
BIG-IP system determines the order of precedence applied to new inbound
connections using an algorithm that places a higher precedence on the
address netmask and a lesser emphasis on the port. BIG-IP LTM sets
virtual server precedence according to the following criteria:

-  The first precedent of the algorithm chooses the virtual server that
   has the longest subnet match for the incoming connection.

-  If the number of bits in the subnet mask match, the algorithm chooses
   the virtual server that has a port match.

-  If no port match is found, the algorithm uses the wildcard server (if
   a wildcard virtual server is defined).

-  A wildcard address has a netmask length of zero; thus, it has a lower
   precedence than any matching virtual server with a defined address.

This algorithm results in the following order of precedence:

-  <address>:<port>

-  <address>:\*

-  <network>:<port>

-  <network>:\*

-  \*:<port>

-  \*:\*

Example of VIP precedence behavior

For example, for a BIG-IP system with the following VIPs configured on
the inbound VLAN:

10.0.0.0/8:80

10.10.0.0/16:80

10.10.10.10/32:80

20.0.0.0/8:\*

20.0.0.0/8:80

\*:80 (alternatively noted as 0.0.0.0/0:80)

\*:\* (alternatively noted as any:any, 0.0.0.0/0:any)

The following table illustrates how inbound destination addresses map to
the configured VIPs:

+-------------------------------+------------------------------------------------------------------+
| Inbound destination address   | VIP                                                              |
+-------------------------------+------------------------------------------------------------------+
| 10.10.10.10:80                | 10.10.10.10/32:80 - address match and port match                 |
+-------------------------------+------------------------------------------------------------------+
| 10.10.10.11:80                | 10.10.0.0/16:80 - most specific address match and port match     |
+-------------------------------+------------------------------------------------------------------+
| 10.1.10.10:80                 | 10.0.0.0/8:80 - most specific address match and port match       |
+-------------------------------+------------------------------------------------------------------+
| 20.0.0.0:80                   | 20.0.0.0/8:80 - most specific address match and port match       |
+-------------------------------+------------------------------------------------------------------+
| 20.0.0.0:443                  | 20.0.0.0/8:\* - most specific address match with wildcard port   |
+-------------------------------+------------------------------------------------------------------+
| 1.1.1.1:443                   | \*:\* - wildcard address and wildcard port                       |
+-------------------------------+------------------------------------------------------------------+

Changes in the order of precedence applied to new inbound connections
are in Version 11.3 and later (which covers the material of this exam).
Complete details can be found at the following location:

`SOL14800: Order of precedence for virtual server matching (11.3.0 and
later) <http://support.f5.com/kb/en-us/solutions/public/14000/800/sol14800.html>`__

Starting in BIG-IP 11.3.0, you can configure source addresses from which
virtual servers accept traffic. The BIG-IP system uses the destination
address, source address, and service port configuration to determine the
order of precedence applied to new inbound connections. When a
connection matches multiple virtual servers, the BIG-IP system uses an
algorithm that places virtual server precedence in the following order:

- Destination address

- Source address

- Service port

This algorithm uses the following order of precedence:

+---------------+-----------------------+-----------------------+----------------------+
|  **Order**    |  **Destination**      |  **Source**           |  **Service port**    |
+---------------+-----------------------+-----------------------+----------------------+
| *1*           | *<host address>*      | *<host address>*      | *<port>*             |
+---------------+-----------------------+-----------------------+----------------------+
| *2*           | *<host address>*      | *<host address>*      | *\**                 |
+---------------+-----------------------+-----------------------+----------------------+
| *3*           | *<host address>*      | *<network address>*   | *<port>*             |
+---------------+-----------------------+-----------------------+----------------------+
| *4*           | *<host address>*      | *<network address>*   | *\**                 |
+---------------+-----------------------+-----------------------+----------------------+
| *5*           | *<host address>*      | *\**                  | *<port>*             |
+---------------+-----------------------+-----------------------+----------------------+
| *6*           | *<host address>*      | *\**                  | *\**                 |
+---------------+-----------------------+-----------------------+----------------------+
| *7*           | *<network address>*   | *<host address>*      | *<port>*             |
+---------------+-----------------------+-----------------------+----------------------+
| *8*           | *<network address>*   | *<host address>*      | *\**                 |
+---------------+-----------------------+-----------------------+----------------------+
| *9*           | *<network address>*   | *<network address>*   | *<port>*             |
+---------------+-----------------------+-----------------------+----------------------+
| *10*          | *<network address>*   | *<network address>*   | *\**                 |
+---------------+-----------------------+-----------------------+----------------------+
| *11*          | *<network address>*   | *\**                  | *<port>*             |
+---------------+-----------------------+-----------------------+----------------------+
| *12*          | *<network address>*   | *\**                  | *\**                 |
+---------------+-----------------------+-----------------------+----------------------+
| *13*          | *\**                  | *<host address>*      | *<port>*             |
+---------------+-----------------------+-----------------------+----------------------+
| *14*          | *\**                  | *<host address>*      | *\**                 |
+---------------+-----------------------+-----------------------+----------------------+
| *15*          | *\**                  | *<network address>*   | *<port>*             |
+---------------+-----------------------+-----------------------+----------------------+
| *16*          | *\**                  | *<network address>*   | *\**                 |
+---------------+-----------------------+-----------------------+----------------------+
| *17*          | *\**                  | *\**                  | *<port>*             |
+---------------+-----------------------+-----------------------+----------------------+
| *18*          | *\**                  | *\**                  | *\**                 |
+---------------+-----------------------+-----------------------+----------------------+

With the addition of the Source Address matching on the virtual server,
you can now have more than one virtual server listening on the same
IP:port combination, as long as the source IP filter is different on
each listener. There is a good example in the linked SOL for this
section.

----

|

**1.01 - Explain how a virtual server processes a request**

`SOL8082: Overview of TCP connection setup for BIG-IP LTM virtual server types <http://support.f5.com/kb/en-us/solutions/public/8000/000/sol8082.html>`__

**Standard virtual server**

The BIG-IP LTM TMOS operating system implements ”full proxy"
architecture for virtual servers configured with a TCP profile. By
assigning a custom TCP profile to the virtual server, you can configure
the BIG-IP LTM to maintain compatibility to disparate server operating
systems in the data center. At the same time, the BIG-IP LTM can
leverage its TCP/IP stack on the client side of the connection to
provide independent and optimized TCP connections to client systems.

In a full proxy architecture, the BIG-IP LTM appears as a TCP peer to
both the client and the server by associating two independent TCP
connections with the end-to-end session. Although certain client
information such as the source IP address or source TCP port, may be
re-used on the server side of the connection; the BIG-IP LTM system
manages the two sessions independently, making itself transparent to the
client and server.

The Standard virtual server requires a TCP or UDP profile, and may
optionally be configured with HTTP, FTP, or SSL profiles if Layer 7 or
SSL processing is required.

The TCP connection setup behavior for a Standard virtual server varies
depending on whether a TCP profile or a TCP and Layer 7 profile, such as
HTTP, is associated with the virtual server.

Standard virtual server with a TCP profile

The TCP connection setup behavior for a Standard virtual server operates
as follows: the three-way TCP handshake occurs on the client side of the
connection before the BIG-IP LTM initiates the TCP handshake on the
server side of the connection.

A Standard virtual server processes connections using the full proxy
architecture. The following TCP flow diagram illustrates the TCP
handshake for a Standard virtual server with a TCP profile:

|

.. image:: /_static/201/p1.jpeg

|

----

|

**1.01 - Given a specific connectivity issue, isolate where the problem might be according to the processing order**

**GUI Study in the vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

In general, all trouble shooting should be done in an order that allows
for narrowing of the possible issue. When there is an issue with
connectivity to a virtual server, there can be many reasons. Gather what
you know. When you or the client tried to connect to the virtual server,
how was it done? Was it through a browser or another application? What
was the path that was used? (ie https://www.yoursite.com)

Starting out with checking to see if you have IP connectivity to the
virtual server is a good place to start. This is a sort of “divide and
conquer” approach to solve the issue. Can you reach the virtual servers
IP address from your location on the network? Start with a ping of the
virtual server address. If you can ping the IP we know that the F5 is
listening. Now are you connecting to the port number the virtual server
is listening on?

If you were browsing to https://www.yoursite.com, does the DNS name of
www.yoursite.com resolve to the IP the address the virtual server is
configured on? If not, is it the NAT address of the firewall that
translates to the virtual server address?

If all the network connectivity looks good, is the virtual server
configured correctly for the type of traffic that is trying to pass?
Perhaps the administrator has applied a profile to the virtual server
telling it to process http traffic when the virtual server is set to
listen on 443. Without terminating the SSL traffic the virtual server
cannot process http traffic and the virtual server will not work
correctly.

These are just a few of the scenarios that you can be faced with trying
to figure out why a connection to an application may not be working.
Spending time on the vLabs and getting comfortable with interface and
configuring virtual servers will help you understand how the BIG-IP LTM
works.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 1.02 - Identify the reason a virtual server is not working as expected
----------------------------------------------------------------------------------

|
|

**1.02 - Determine the state of a virtual server (offline, enabled, etc.)**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/ltm-concepts-11-4-0/2.html <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/2.html>`__

At any time, you can determine the status of a virtual server or virtual
address, using the Configuration utility. You can find this information
by displaying the list of virtual servers or virtual addresses and
viewing the Status column, or by viewing the *Availability* property
of the object.

The Configuration utility indicates status by displaying one of several
icons, distinguished by shape and color:

-  The shape of the icon indicates the status that the monitor has
   reported for that node.

-  The color of the icon indicates the actual status of the node.

To understand these icons with respect to status, see the table below.

Explanation of status icons for virtual servers and virtual addresses

+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Status indicator                | Explanation                                                                                                                                                                                                                                                                                                 |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p2.png  | The virtual server or virtual address is **enabled** and able to receive traffic.                                                                                                                                                                                                                           |
|                                 |                                                                                                                                                                                                                                                                                                             |
|                                 |                                                                                                                                                                                                                                                                                                             |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p3.png  | The virtual server or virtual address is enabled but is **currently unavailable**. However, the virtual server or virtual address might become available later, with no user action required.                                                                                                               |
|                                 |                                                                                                                                                                                                                                                                                                             |
|                                 | An example of a virtual server or virtual address showing this status is when the objects connection limit has been exceeded. When the number of connections falls below the configured limit, the virtual server or virtual address becomes available again.                                               |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p4.png  | The virtual server or virtual address is enabled but **offline** because an associated object has marked the virtual server or virtual address as unavailable. To change the status so that the virtual server or virtual address can receive traffic, you must actively enable the virtual server or       |
|                                 | virtual address.                                                                                                                                                                                                                                                                                            |
|                                 |                                                                                                                                                                                                                                                                                                             |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p5.png  | The virtual server or virtual address is operational but set to **Disabled**. To resume normal operation, you must manually enable the virtual server or virtual address.                                                                                                                                   |
|                                 |                                                                                                                                                                                                                                                                                                             |
|                                 |                                                                                                                                                                                                                                                                                                             |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p6.png  | The status of the virtual server or virtual address is **unknown**.                                                                                                                                                                                                                                         |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

----

|

**1.02 - Determine if a virtual server is configured with the proper ip address configuration**

**GUI Study in the vLabs**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/ltm-concepts-11-4-0/2.html <http://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-1-0/ltm_virtual.html>`__

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

A virtual address is the IP address with which you associate a virtual
server. For example, if a virtual server’s IP address and service are
10.10.10.2:80, then the IP address 10.10.10.2 is a virtual address.

You can create a many-to-one relationship between virtual servers and a
virtual address. For example, you can create the three virtual servers
10.10.10.2:80, 10.10.10.2:443, and 10.10.10.2:161 for the same virtual
address of 10.10.10.2.

You can enable and disable a virtual address. When you disable a virtual
address, none of the virtual servers associated with that address will
receive incoming network traffic.

You create a virtual address indirectly when you create a virtual
server. When this happens, Local Traffic Manager internally associates
the virtual address with a MAC address. This in turn causes the BIG-IP
system to respond to Address Resolution Protocol (ARP) requests for the
virtual address, and to send gratuitous ARP requests and responses with
respect to the virtual address.

If the address you entered is not the correct address that your clients
are attempting to connect to, the symptom will seem as if the BIG-IP is
not working. This is a very common issue when DNS entries that resolve a
name to the virtual server IP address do not correlate. If your clients
are connecting to a DNS name make sure that it resolves to the intended
virtual server IP address or NAT address on the firewall that maps to
the virtual server IP address.

----

|

**1.02 - Determine if a virtual server is configured for the proper listening port**

**GUI Study in the vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

When you configure a virtual server and define the virtual address and
service port; this is how the virtual server is listening on the
network. If the service port you have configured is not the appropriate
port number for the type of connection that your clients are attempting
to make, the connection will likely fail. Understanding how your clients
intend to connect to the virtual server is usually a good sanity check
on the configuration.

----

|

**1.02 - Determine if the virtual server is configured with the appropriate profiles**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/ltm-concepts-11-4-0/2.html <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/2.html>`__

A virtual server has a number of properties and settings that you can
configure to affect the way that a virtual server manages traffic. You
can also assign certain resources to a virtual server, such as a load
balancing pool and a persistence profile. Together, these properties,
settings, and resources represent the definition of a virtual server,
and most have default values. When you create a virtual server, you can
either retain the default values or adjust them to suit your needs.
Profiles are one of the settings you can assign to a Virtual server to
control how the virtual server will behave.

Profiles are a configuration tool that you can use to affect the
behavior of certain types of network traffic. More specifically, a
profile is an object that contains settings with values, for controlling
the behavior of a particular type of network traffic, such as HTTP
connections. Profiles also provide a way for you to enable connection
and session persistence, and to manage client application
authentication.

By default, Local Traffic Manager provides you with a set of profiles
that you can use as is. These default profiles contain various settings
with default values that define the behavior of different types of
traffic. If you want to change those values to better suit the needs of
your network environment, you can create a custom profile. A custom
profile is a profile derived from a default profile and contains values
that you specify.

You can use profiles in the following ways:

-  You can use the default profiles, which means that you do not need to
   actively configure any profile settings. Local Traffic Manager uses
   them to automatically direct the corresponding traffic types
   according to the values specified in the those profiles.

-  You can create a custom profile, using the default profile as the
   parent profile, modifying some or all of the values defined in that
   profile.

-  You can create a custom profile to use as a parent profile for other
   custom profiles.

After configuring a profile, you associate the profile with a virtual
server. The virtual server then processes traffic according to the
values specified in the profile. Using profiles enhances your control
over managing network traffic, and makes traffic-management tasks easier
and more efficient.

You can associate multiple profiles with a single virtual server. For
example, you can associate a TCP profile, an SSL profile, and an HTTP
profile with the same virtual server.

----

How profiles are assigned to the virtual server can affect the virtual
servers ability to process the traffic that is passing through it. For
instance if you create a virtual server that is listening on
10.10.10.2:443, and you also assign an http profile to process the http
traffic according to your needs. The virtual server will not respond to
connections as expected. The virtual server settings say to take in
encrypted traffic on port 443 and then process and possible manipulate
the http headers. This is impossible without first terminating the
encrypted traffic with a clientside SSL profile to make the encrypted
traffic clear text for the BIG-IP to then apply the http profile. If you
apply a visual map of the OSI model to the functional parts of the
virtual server’s configuration it is easier to see what may be needed or
may be conflicting with each other. This is covered in depth in the F5
Certified Training course.

----

|

**1.02 - Determine if the pool configuration has an effect on virtual server state**

**GUI Study in the vLabs**

If all pool members are offline or misconfigured the virtual server’s
state can be affected. All heath status information trickles up to the
virtual server.

This means that if a node is not online due to a monitor marking the
node offline, any pool member using that node will be marked offline as
well. And if all members of a pool are marked offline by a failing
health monitor the virtual server will have no available resources so it
will be marked offline as well.

To see if a virtual server is not available due to a lack of resources
look in the GUI under Local Traffic and click on the Network Map/Show
Map and search for the virtual server in question. If it is down you can
see in the same pane if the resources are also offline.

----

|

**1.02 - Determine which tools to use in order to diagnose the issue**

**GUI Study in the vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

There are multiple tools you can use to check to see if a server behind
the BIG-IP is working as expected.

If you have a workstation on the local server subnet you can make a
direct connection to the server to see the response. Or if you have a
route to the server’s IP subnet from your current network location you
can try to connect to the server directly. If it is responding then look
to see if the pool member is configured to match how you just connected
to the server (IP:port).

You can see if the BIG-IP has connectivity to the IP address of the
server using the ping command from the command line interface of the
BIG-IP.

If there is IP connectivity then you can try to use the CURL command to
see if the BIG-IP can connect to the website on the server or FTP if the
server is listening for FTP traffic.

----

|

**1.02 - Explain the difference between the virtual servers status definitions**

**GUI Study in the vLabs**

A virtual servers status icon is a quick way to see the high level
status of the virtual server. The five different status levels are
Enabled, Offline, Currently Unavailable, Unknown and Disabled. Each of
theses levels are pretty self explanatory.

-  Enabled means that the virtual server is up and available for traffic
   (monitors are succeeding) and is represented by a green circle icon.

-  Offline means that the resource for the virtual server is not
   available (likely a failing monitor) and is represented by a red
   diamond icon.

-  Currently Unavailable means that the virtual server or all of it’s
   resources have reached a restricting connection limit that has been
   set by the administrator and the virtual server currently has no
   further capacity for traffic until the current connections fall below
   the connection limit settings. A yellow triangle icon represents the
   Currently Unavailable status.

-  Unknown means that there is not any monitors set for the resources of
   the virtual server, so there is no status to show and is represented
   by a blue square icon. This status does not mean that the virtual
   server will not respond to traffic. A virtual server with an Unknown
   status will take in traffic and send it on to the resources even if
   they are not online.

-  Disabled means that the administrator has marked the virtual server
   down so that it will not process traffic. The status icon will be a
   shape that represents the current monitor status of the virtual
   server but will always be colored black. Examples of this status icon
   would be; if the virtual server has succeeding monitors but is
   disabled the icon would be a black circle, or if the virtual server
   has failing monitors but is disabled the icon would be a black
   diamond or if the virtual server has no monitors but is disabled the
   icon would be a black square.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 1.03 - Identify the reason a pool member has been marked down by health monitors
--------------------------------------------------------------------------------------------

|
|

**Pool Intro:**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/ltm-concepts-11-4-0/5.html#conceptid <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/5.html#conceptid>`__

In a typical client-server scenario, a client request goes to the
destination IP address specified in the header of the request. For sites
with a large amount of incoming traffic, the destination server can
quickly become overloaded as it tries to service a large number of
requests. To solve this problem, BIG-IP Local Traffic Manager
distributes client requests to multiple servers instead of to the
specified destination IP address only. You configure Local Traffic
Manager to do this when you create a load balancing pool.

You can enable or disable individual pool members. When you enable or
disable a pool member, you indirectly set the value of the pool members
State property, in the following way:

-  Enable - Sets the State property of the pool member to Enabled.

-  Disable - Sets the State property of the pool member to Disabled.

Note that the difference between a disabled pool member, and a pool
member that a monitor reports as down, is that a disabled pool member
continues to process persistent and active connections. Conversely, a
pool member reported as down processes no connections whatsoever.

The status icons on the pool-member list screen and properties screen
indicate whether a pool member is currently enabled or disabled.

**Pool status**

An important part of managing pools and pool members is viewing and
understanding the status of a pool or pool member at any given time. The
Configuration utility indicates status by displaying one of several
icons, distinguished by shape and color, for each pool or pool member:

The shape of the icon indicates the status that the monitor has reported
for that pool or pool member. For example, a circle-shaped icon
indicates that the monitor has reported the pool member as being up,
whereas a diamond-shaped icon indicates that the monitor has reported
the pool member as being down.

The color of the icon indicates the actual status of the node itself.
For example, a green shape indicates that the node is up, whereas a red
shape indicates that the node is down. A black shape indicates that
user-intervention is required.

At any time, you can determine the status of a pool. The status of a
pool is based solely on the status of its members. Using the
Configuration utility, you can find this information by viewing the
Availability property of the pool. You can also find this information by
displaying the list of pools and checking the Status column.

The Configuration utility indicates pool status by displaying one of
several icons, distinguished by shape and color. To understand these
icons, see table below.

Explanation of status indicators for pools

+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Status indicator                | Explanation                                                                                                                                                                                                                                                                                                                                           |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p2.png  | At least one pool member is available for processing traffic.                                                                                                                                                                                                                                                                                         |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p3.png  | No pool members are currently available but any one of them could become available later, with no user action required. An example of an unavailable pool member becoming available automatically is when the number of concurrent connections to the pool member no longer exceeds the value defined in the pool members Connection Limit setting.   |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p4.png  | All pool members are unavailable and therefore cannot accept traffic. A reason for a pool member being unavailable is that an associated EAV monitor has detected that the pool member is unavailable. When pool status is red, user action is usually required.                                                                                      |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p5.png  | The status of at least one pool member is unknown, and no other pool members are available. Sample reasons for unknown pool-member status are:                                                                                                                                                                                                        |
|                                 |                                                                                                                                                                                                                                                                                                                                                       |
|                                 | One or more pool members has no associated monitor.                                                                                                                                                                                                                                                                                                   |
|                                 |                                                                                                                                                                                                                                                                                                                                                       |
|                                 | Monitor results are not available yet.                                                                                                                                                                                                                                                                                                                |
|                                 |                                                                                                                                                                                                                                                                                                                                                       |
|                                 | The pool members IP address is misconfigured.                                                                                                                                                                                                                                                                                                         |
|                                 |                                                                                                                                                                                                                                                                                                                                                       |
|                                 | The parent node has been disconnected from the network.                                                                                                                                                                                                                                                                                               |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

----

|

**1.03 - Discuss the effects of health monitors on the status of pool members/nodes**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/ltm-concepts-11-4-0/5.html#conceptid <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/5.html#conceptid>`__

Health monitors are a key feature of Local Traffic Manager. Health
monitors help to ensure that a server is in an up state and able to
receive traffic. When you want to associate a monitor with an entire
pool of servers, you do not need to explicitly associate that monitor
with each individual server. Instead, you can simply assign the monitor
to the pool itself. Local Traffic Manager then automatically monitors
each member of the pool.

Local Traffic Manager contains many different pre-configured monitors
that you can associate with pools, depending on the type of traffic you
want to monitor. You can also create your own custom monitors and
associate them with pools. The only monitor types that are not available
for associating with pools are monitors that are specifically designed
to monitor nodes and not pools or pool members. That is, the destination
address in the monitor specifies an IP address only, rather than an IP
address and a service port. These monitor types are:

-  ICMP

-  TCP Echo

-  Real Server

-  SNMP DCA

-  SNMP DCA Base

-  WMI

With Local Traffic Manager, you can configure your monitor associations
in many useful ways:

You can associate a health monitor with an entire pool instead of an
individual server. In this case, Local Traffic Manager automatically
associates that monitor with all pool members, including those that you
add later. Similarly, when you remove a member from a pool, Local
Traffic Manager no longer monitors that server.

When a server that is designated as a pool member allows multiple
processes to exist on the same IP address and port, you can check the
health or status of each process. To do this, you can add the server to
multiple pools, and then within each pool, associate a monitor with that
server. The monitor you associate with each server checks the health of
the process running on that server.

When associating a monitor with an entire pool, you can exclude an
individual pool member from being associated with that monitor. In this
case, you can associate a different monitor for that particular pool
member, or you can exclude that pool member from health monitoring
altogether. For example, you can associate pool members A, B, and D with
the http monitor, while you associate pool member C with the https
monitor.

You can associate multiple monitors with the same pool. For instance,
you can associate both the http and https monitors with the same pool.

----

|

**1.03 - Determine the state and availability of the pool member/node in question**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/ltm-concepts-11-4-0/5.html#conceptid <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/5.html#conceptid>`__

Table 4.5 Explanation of status icons for pool members

+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| Status indicator                | Explanation                                                                                                                                                                                                                                     | State property is set to...                                |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| .. image:: /_static/201/p2.png  | The pool member is set to Enabled, the parent node is up, and a monitor has marked the pool member as up.                                                                                                                                       | Enabled (All Traffic Allowed)                              |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| .. image:: /_static/201/p3.png  | The pool member is unavailable, but could become available later with no user interaction required. This status occurs when the number of concurrent connections has exceeded the limit defined in the pool members Connection Limit setting.   | Enabled (All Traffic Allowed)                              |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| .. image:: /_static/201/p4.png  | The pool member is unavailable because either the parent node is down, a monitor has marked the pool member as down, or a user has disabled the pool member.                                                                                    | Enabled (All Traffic Allowed)                              |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| .. image:: /_static/201/p5.png  | The pool member is set to Disabled, although a monitor has marked the pool member as up. To resume normal operation, you must manually enable the pool member.                                                                                  | Disabled (Only persistent or active connections allowed)   |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| .. image:: /_static/201/p5.png  | The pool member is set to Disabled and is offline because the parent node is down. To resume normal operation, you must manually enable the pool member.                                                                                        | Forced Offline (Only active connections allowed)           |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| .. image:: /_static/201/p7.png  | The pool member is set to Disabled and is offline because a user disabled it. To resume normal operation, you must manually enable the pool member.                                                                                             | Disabled (Only persistent or active connections allowed)   |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| .. image:: /_static/201/p7.png  | The pool member is set to Disabled and is offline because either the parent node is down, or a monitor has marked the pool member as down. To resume normal operation, you must manually enable the pool member.                                | Forced Offline (Only active connections allowed)           |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------+
| .. image:: /_static/201/p6.png  | The pool member or node has no monitor associated with it, or no monitor results are available yet                                                                                                                                              | Enabled (All Traffic Allowed)                              |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
|                                 |                                                                                                                                                                                                                                                 |                                                            |
+---------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------+

----

|

**1.03 - Verify the pool member/node Ratio configuration**

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/5.html#conceptid

**Ratio weights for pool members**

When using a ratio-based load balancing method for distributing traffic
to servers within a pool, you can assign a ratio weight to the
corresponding pool members. The ratio weight is used by the Local
Traffic Manager to distribute connections among pool members or nodes in
a static rotation. The number of connections that each system receives
over time is proportionate to the ratio weight you defined for each pool
member or node.

The ratio-based load balancing methods are: Ratio (node, member, and
sessions), Dynamic Ratio (node and member), and Ratio Least Connections
(node and member).

----

|

**1.03 - Verify the pool member/node connection configuration and count**

You can configure a virtual server, pool member, or node to prevent an
excessive number of connection requests during events such as a Denial
of Service (DoS) attack or a planned, high-demand traffic event. To
ensure the availability of a virtual server, pool member, or node, you
can use the BIG-IP Local Traffic Manager to manage the total number of
connections and the rate at which connections are made.

When you specify a connection limit, the system prevents the total
number of concurrent connections to the virtual server, pool member, or
node from exceeding the specified number.

When you specify a connection rate limit, the system controls the number
of allowed new connections per second, thus providing a manageable
increase in connections without compromising availability.

After configuring connection limits and connection rate limits on a
virtual server, or after configuring these limits on a pool member or
node associated with a virtual server, the system controls the total
number of concurrent connections and the rate of new connections to the
virtual server, pool member, or node.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 1.04 - Identify a pool member not in the active priority group
--------------------------------------------------------------------------

|
|

**1.04 - Identify a pool member not in the active priority group**

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/5.html?sr=52980886

About priority-based member activation

Priority-based member activation is a feature that allows you to
categorize pool members into priority groups, so that pool members in
higher priority groups accept traffic before pool members in lower
priority groups. The priority-based member activation feature has two
configuration settings:

**Priority group activation**

For the priority group activation setting, you specify the minimum
number of members that must remain available in each priority group in
order for traffic to remain confined to that group. The allowed value
for this setting ranges from 0 to 65535. Setting this value to 0
disables the feature (equivalent to using the default value of
Disabled).

**Priority group**

When you enable priority group activation, you also specify a priority
group for each member when you add that member to the pool. Retaining
the default priority group value of 0 for a pool member means that the
pool member is in the lowest priority group and only receives traffic
when all pool members in higher priority groups are unavailable.

If the number of available members assigned to the highest priority
group drops below the number that you specify, the BIG-IP system
distributes traffic to the next highest priority group, and so on.

For example, this configuration has three priority groups, 3, 2, and 1,
with the priority group activation value (shown here as min active
members) set to 2.

pool my\_pool {

lb\_mode fastest

min active members 2

member 10.12.10.7:80 priority 3

member 10.12.10.8:80 priority 3

member 10.12.10.9:80 priority 3

member 10.12.10.4:80 priority 2

member 10.12.10.5:80 priority 2

member 10.12.10.6:80 priority 2

member 10.12.10.1:80 priority 1

member 10.12.10.2:80 priority 1

member 10.12.10.3:80 priority 1

}

Connections are first distributed to all pool members with priority 3
(the highest priority group). If fewer than two priority 3 members are
available, traffic is directed to the priority 2 members as well. If
both the priority 3 group and the priority 2 group have fewer than two
members available, traffic is directed to the priority 1 group. The
BIG-IP system continuously monitors the priority groups, and whenever a
higher priority group once again has the minimum number of available
members, the BIG-IP system limits traffic to that group.

To see which pool members are not receiving traffic you can look at
Statistics in the GUI or on console.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Previous Exam Objective - 1.05 - Persistence
--------------------------------------------

|
|

Due to the 201 Exam Blueprint having an obvious mistake with layout or
objectives I have added this section.

**Previous Exam Topic 1.05 - Explain the concept of “persistence”**

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/10.html#unique_1009994785

Using BIG-IP Local Traffic Manager, you can configure session
persistence. When you configure session persistence Local Traffic
Manager tracks and stores session data, such as the specific pool member
that serviced a client request. The primary reason for tracking and
storing session data is to ensure that client requests are directed to
the same pool member throughout the life of a session or during
subsequent sessions when an application requires it to be so.

In addition, session persistence can track and store other types of
information, such as user preferences or a user name and password.

Local Traffic Manager offers several types of session persistence, each
one designed to accommodate a specific type of storage requirement for
session data. The type of persistence that you implement depends on
where and how you want to store client-specific information, such as
items in a shopping cart or airline ticket reservations.

For example, you might store airline ticket reservation information in a
back-end database that all servers can access, or on the specific server
to which the client originally connected, or in a cookie on the client’s
machine. When you enable persistence, returning connections will not be
load balancing and instead will be sent to the server to which they last
connected in order to access application again.

Local Traffic Manager keeps session data for a period of time that you
specify.

The primary tool for configuring session persistence is to configure a
persistence profile and assign it to a virtual server. If you want to
enable persistence for specific types of traffic only, as opposed to all
traffic passing through the virtual server, you can write an iRule.

To configure and manage persistence profiles, log in to the BIG-IP
Configuration utility, and on the Main tab, expand Local Traffic, and
click Persistence.

|
|

**Previous Exam Topic 1.05 - Verify the type of persistence profile assigned to the virtual server in question**

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/10.html#unique_1009994785

A persistence profile is a pre-configured object that automatically
enables persistence when you assign the profile to a virtual server. By
using a persistence profile, you avoid having to write a program to
implement a type of persistence.

Each type of persistence that Local Traffic Manager offers includes a
corresponding default persistence profile. These persistence profiles
each contain settings and setting values that define the behavior of the
BIG-IP system for that type of persistence. You can either use the
default profile or create a custom profile based on the default.

**Persistence profile types:**

You can configure persistence profile settings to set up session
persistence on the BIG-IP system. You can configure these settings when
you create a profile or after profile creation by modifying the profiles
settings.

The persistence types that you can enable using a persistence profile
are:

**Cookie persistence**

Cookie persistence uses an HTTP cookie stored on a clients computer to
allow the client to reconnect to the same server previously visited at a
web site.

**Destination address affinity persistence**

Also known as sticky persistence, destination address affinity
persistence supports TCP and UDP protocols, and directs session requests
to the same server based solely on the destination IP address of a
packet.

**Hash persistence**

Hash persistence allows you to create a persistence hash based on an
existing iRule.

**Microsoft Remote Desktop Protocol persistence**

Microsoft Remote Desktop Protocol (MSRDP) persistence tracks sessions
between clients and servers running the Microsoft Remote Desktop
Protocol (RDP) service.

**SIP persistence**

SIP persistence is a type of persistence used for servers that receive
Session Initiation Protocol (SIP) messages sent through UDP, SCTP, or
TCP.

**Source address affinity persistence**

Also known as simple persistence, source address affinity persistence
supports TCP and UDP protocols, and directs session requests to the same
server based solely on the source IP address of a packet.

**SSL persistence**

SSL persistence is a type of persistence that tracks non-terminated SSL
sessions, using the SSL session ID. Even when the clients IP address
changes, Local Traffic Manager still recognizes the connection as being
persistent based on the session ID. Note that the term non-terminated
SSL sessions refer to sessions in which Local Traffic Manager does not
perform the tasks of SSL certificate authentication and
encryption/re-encryption.

**Universal persistence**

Universal persistence allows you to write an expression that defines
what to persist on in a packet. The expression, written using the same
expression syntax that you use in iRules, defines some sequence of bytes
to use as a session identifier.

You can see the type of persistence assigned to a virtual server by
going to **Local Traffic > Virtual Servers** in the GUI and selecting
the virtual server from the list you wish to inspect. Click on the
Resources tab and look at the settings for the Default Persistence
Profile setting and the Fallback Persistence Profile setting. To change
the setting you can select the name of the profile you created or wish
to use, such as **cookie**. This implements cookie persistence, using
the default cookie persistence profile.

|

.. image:: /_static/201/p8.png

|
|

**Previous Exam Topic 1.05 - Differentiate between fallback and primary persistence**

**GUI Study in the vLabs**

The administrator of a BIG-IP can set a primary persistence type for a
virtual server as shown in the previous section. A fallback persistence
type can also be set. Only IP address based persistence types are
allowed as fallback. This means that along with honoring the primary
persistence method there is a second record being kept that can be used
to persist the client’s transaction to the resource of the virtual
server as well. For example if cookie persistence is set with a fallback
of sourceaddr, as a client makes their second connection to the virtual
server the cookie from the first connection will be used to determine
the server in the pool to send the connection to. But at the same time
as the first connection was made to the virtual server a source address
persistence record was also created. And if the client did not have the
cookie any longer the record matching their IP address would still exist
(if it had not timed out) and could be used to get them back to their
original pool member.

However this also means that if a source address persistence profile is
used as a fallback that has a wider subnet in the configuration such as
a 255.255.255.0, and a second client from the same class C network as
the first client made their first connection to the virtual server. They
would be persisted to the same pool member as the first client since
they would match the source IP record of the first client even though
they did not have a cookie when they connected.

|
|

**Previous Exam Topic 1.05 - Validate the expected persistence behavior**

**GUI Study in the vLabs - Module 8 Exercises**

As you connect to an application through the virtual server of the
BIG-IP platform the first connection is load balanced to the best
available resource according to the load-balancing algorithm. With
persistence enabled the following connections from the same client will
be sent to the same resource as their first initial load balanced
connection.

Checking to see if the client is being persisted is simple in a test
scenario where a single client connects to the virtual server and the
statistics on the system show the connections only going to the same
resource in the pool.

However in regular production volume it will be hard to see the
individual client connections hitting the same resource when there are
hundreds or thousands of connections coming in all the time. An easy way
to see that the client is connecting to the same server resource is to
have watermarks on the application webpages. These watermarks will show
a unique mark on the web page identifying it to the individual server,
much like we use in the vLabs on the load-balanced sites. Not all
developers will take the time or effort to do this water marking. If you
do not have the ability to add a watermark to your page then there needs
to be another method.

In the BIG-IP platform you have the ability to show the active
connection table and use filters to show the data you want to see. So to
show a client’s current connection in the connection table you can type
the following command:

In version 9.X and 10.X:

*bigpipe conn show \| grep “client IP”*

In version 11.x:

*tmsh show sys conn cs-client-addr “client IP”*

|
|

**Previous Exam Topic 1.05 - Use the appropriate tool to troubleshoot persistence**

**GUI Study in the vLabs**

If the persistence method you are using is not tracked locally by the
BIG-IP system, such as Cookie persistence; then there are no local
records on the BIG-IP to review. This is due to the fact that the cookie
containing the pool member info is passed to the client system from the
BIG-IP, and when the client makes the next connection it will include
the cookie from the previous in the request for the BIG-IP system to use
for the persistence info. Allowing the BIG-IP to simply read the cookie
and not have to locally store the info. An administrator can find the
cookie on the client’s workstation. It is stored where the client’s
local browser would normally store cookies. This location will vary by
browser type and OS type.

If the persistence method you are using is tracked by the BIG-IP system
locally, such as Source Address Affinity persistence, then you can look
at the records that are stored on the local system using the following
methods:

-  Source Address persistence records can be found in the Configuration
   Utility, open the Statistics > Module Statistics > Local Traffic page
   and select Persistence Records from the Statistics Type list.

-  In version 11.X command line do: tmsh show /ltm persistence
   persist-records

In version 9.X and 10.X command line do: B persist show all

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 1.05 - Identify traffic diverted due to persistence record
----------------------------------------------------------------------

|
|

**1.05 - Identify traffic diverted due to persistence record**

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/5.html#unique_1112226001

When traffic matches an existing persistence record the load balancing
decision is not made for that traffic. The decision of which server to
send it to has been made for that traffic by first inbound connection to
the virtual server that created the record and now the matching traffic
will use that decision until the persistence record expires.

You can see the existing persistence records for methods that are kept
on the system by typing the following command:

root@(bigipD1)(tmos)# show ltm persistence persist-records

Or by going to Overview > Module Statistics and choosing Persistence
records in the Statistics Type field.

|

.. image:: /_static/201/p9.png

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 1.06 - Identify the current configured state of the pool member
-----------------------------------------------------------------------------

|
|

**1.06 - Identify the current configured state of the pool member**

https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/5.html#unique_1112226001

**About pool member state**

You can enable or disable individual pool members. When you enable or
disable a pool member, you indirectly set the value of the pool member’s
State property, in the following way:

Enable sets the State property of the pool member to Enabled.

Disable sets the State property of the pool member to Disabled.

Note that the difference between a disabled pool member and a pool
member that a monitor reports as down is that a disabled pool member
continues to process persistent and active connections. Conversely, a
pool member reported as down processes no connections whatsoever.

The status icons on the pool-member list screen and properties screen
indicate whether a pool member is currently enabled or disabled.

**Pool and pool member status**

An important part of managing pools and pool members is viewing and
understanding the status of a pool or pool member at any given time. The
Configuration utility indicates status by displaying one of several
icons, distinguished by shape and color, for each pool or pool member:

The shape of the icon indicates the status that the monitor has reported
for that pool or pool member. For example, a circle-shaped icon
indicates that the monitor has reported the pool member as being up,
whereas a diamond-shaped icon indicates that the monitor has reported
the pool member as being down.

The color of the icon indicates the actual status of the node itself.
For example, a green shape indicates that the node is up, whereas a red
shape indicates that the node is down. A black shape indicates that
user-intervention is required.

At any time, you can determine the status of a pool. The status of a
pool is based solely on the status of its members. Using the
Configuration utility, you can find this information by viewing the
Availability property of the pool. You can also find this information by
displaying the list of pools and checking the Status column.

You can see the Status of a pool member in the GUI by going to Local
Trafic > Pools and clicking on the pool you want to see. Navigate to the
Members tab to view each pool member’s status. You can click on the pool
member to see which monitor may have changed the status of the pool
member.

|

.. image:: /_static/201/p10.png

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 1.07 - Identify a persistence issue
-------------------------------------------------

|
|

**1.07 - Identify a persistence issue**

**General Network Study and vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

When there is a persistence issue a user’s session state data will not
be available to the user’s session and it could result in many different
issues. If they are connecting to an application that requires a login
and they are load balanced to a different server after they have logged
in on their first connection, they may be presented with the login
screen for next server. If they are using a website filling out an
on-line form or filling up their shopping cart with items and they are
load balanced to a different server, their form data or cart contents
may not be available to that next server’s session. A simple fix for
most session state issues is to turn on persistence on the BIG-IP
platform and not load balance every session only a user’s first
connection. However even though we can generally fix the issue the real
problem lies with the application not sharing session state between the
servers. If the necessary information is shared between the application
servers, we would be able to load balance every connection to the most
available server. Most of time cost is the issue because it can be
expensive to run a session state database or to rewrite the application
to handle it.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|
