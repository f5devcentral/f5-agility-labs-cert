Module - Basic Setup, TMSH and SNATs
====================================

Basic set up using TMSH
-----------------------

Open BIG-IP TMSH and TCPDump session 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. In the* **Request Detail** *at the top of the page, what is the client
IP address and why?*

10.1.20.245, because you applied SNAT Auto Map to the www\_vs virtual
server and that is the self IP address on the server VLAN

SNAT Pools
~~~~~~~~~~

*Q1. Do you see traffic destined for the FTP server? What is the source IP?*

Yes, monitor traffic is hitting the FTP server at 10.1.20.15 from source
IP 10.1.20.245 because monitors are serviced from the self IPs.

*Q2. Why might you require more than one IP address in the SNAT pool?*

When you have more than 65535 simultaneous connections. You should have
one IP address for every 65000 simultaneous connections or you may run
into port exhaustion.

*Q3. What is the client IP?*

10.1.20.249

*Q4. What are the ephemeral port numbers on your client-side source IP
and server-side source IP?*

They are the same ephemeral port numbers on your client-side source IP
and server-side source IP. BIG-IP will attempt to keep them the same if
the port is not already in use.

SNATs and NATs
~~~~~~~~~~~~~~

*Q1. Did the command succeed?*

No, the LAMP sent the request to the BIG-IP, but has no access to the
client-side network.

*Q2. Did the dig work? What was the source IP?. Did the ping work? What
was the result?*

Yes, the source IP was 10.1.20.248. The ping did not work, Destination
Net Prohibited

*Q3. What happened when you try to FTP to the SNAT address?*

The BIG-IP sends a reset.

*Q4. When you attempted to FTP and ping 10.1.10.15 and access 10.1.20.15
behind the BIG-IP were you successful?*

Yes, you should be able to FTP and ping to 10.1.20.15.

Module - Profiles
=================

Working with Profiles
---------------------

Working with profiles
~~~~~~~~~~~~~~~~~~~~~

*Q1. Did site work? Why didn't you need to SNAT? Did you need SSL
profiles?*

Yes, you didn't need to SNAT because you put the servers default gateway
on the BIG-IP (routed mode), you didn't need SSL profiles because the
client created an SSL session directly with the backend server.

*Q2. Could you use L7 iRules or profiles to view or modify the request or
response? Why or why not?*

No, because the session was encrypted through the proxy. Had this been
unencrypted you would have seen the HTTP request and response in the
tcpdumps.

*Q3. Did site work? Why not?*

SSL connection error, you could not establish a SSL session directly to
the backend servers because they don't support HTTPS.

*Q4. Did site work? What did you observe in the TCPDUMPs? Did you need an
HTTP profile?*

Yes, the tcpdumps show the client-side connection was encrypted and the
serve-side connection was not encrypted. The HTTP profile is not
required for SSL profiles to work, their at a different layer in the
stack.

*Q5. Did it work? What was needed to add cookie persistence?*

Yes, after you added the http profile to break out the http (L7)
request/response sequence.

*Q6. What nodes do the pictures come from? What is the name of the cookie
inserted begin with?*

All the images came from the same node. The cookie starts with
BIGipServerwww_pool

*Q5. Did site work?*

No, the BIG-IP was sending unencrypted request to encrypted servers.

*Q6. What profile was needed to correct the error?*

Server side ssl profile

Application Acceleration
-------------------------

TCP Express
~~~~~~~~~~~

*Q1. What is the idle timeout in each profile? Why might you want to
change it?*

300 second, for long term connections, such as telnet, ssh or ftp

*Q2. What is the Nagle selection in the tcp-wan-optimized? Why might you
want to change it?*

Nagle combines smaller packets into a larger packet for efficiency. It
the application relays on small packets for connection information,
Nagle may cause connection delays.

*Q3. What happens if you increase the proxy buffer sizes?*

You will use more memory per connection, for all connections using that
TCP profile.

HTTP Optimization - RamCache Lab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What resource would be consumed if you increased the* **Cache Size**
*setting?*

More memory, per virtual server the caching profile was attached too.

*Q2. The pictures do not change. Why do you think that is?*

They are being pulled from cache.

*Q3. Go to your pool. Are all pool members taking connections?*

Yes, there are still uncacheable items to be retrieved.

HTTP Optimization - HTTP Compression Lab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Does the browser accept compression?*

Yes, in the Request Headers you find Accept-Encoding: gzip, deflate.

*Q2. At what point would the BIG-IP quit compressing responses?*

When it hits 90% CPU

Securing web applications with the HTTP profile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What is the cookie name? Note the information after the cookie.*

BIGipServerwww_pool

*Q2. What is in the X-Forwarded-For header? Why might you want to enable it?*

It place the original client IP in the HTTP header. It is useful for
virtual servers with SNAT if the original client IP is needed for
logging or other purposes.

*Q3. Are they the same? What is different?*

No, the server information has be removed from the response coming from
the secure\_vs

*Q4. What is the result?*

Redirected to www.f5.com.

*Q5. What is different from the cookie at the start of the task?*

Everything after the = sign as been encrytped

Module - Application Visibilty and Reporting (AVR) 
==================================================

Working with Analytics (AVR)
----------------------------

AVR Lab Setup - Verify provisioning, iRules and Data Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What resources does AVR require to be provisioned?*

16 gb of disks outside of the boot volume and 448mb of memory

*Q2. Review the iRule, what profiles are required on the virtual server?*

tcp and http

*Q3. Review the iRule, what profiles are required on the virtual server?*

tcp and http

View the Analytics Reports
~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What country has the most transactions?*

Usually the majority of the requests are coming from the United States.

*Q2. What are the top two User Agents?*

A majority of the requests should be from Internet Explorer v11 and
iPhone6 users, but it's not guaranteed due to the randomness of the
iRule.

Module - Monitors and Status
============================

Basic Monitoring
----------------

Default Monitors
~~~~~~~~~~~~~~~~

*Q1. What would happen if a node failed?*

The pool members with the node IP address would be marked offline.

*Q2. What are your node statuses?*

Available

Task 2 - Content Monitors
~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What is the status of the pool and its members?*

Available

*Q2. Go to* **Virtual Servers** *or* **Network Map** *, what is the status of
your virtual server?*

Available

*Q3. What is status of your pool and virtual server now?*

Both the pool and virtual servers dependent on the pool are mark
offline.

Virtual Server Status
---------------------

Test Disabled Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What is the Availability of* **www\_vs**? *What is the State?*

Availability: available, State: disabled

*Q2. What symbol is used to represent* **www\_vs** *status?*

Black Circle

*Q3. Would you expect browsing to http://10.1.10.100 to work?*

no

*Q4. Can you ping the virtual IP?*

Yes, the virtual address still responds to pings

*Q5. Did the site work? What did the tcpdump show?*

No, the tcpdump showed the virtual server 10.1.10.100:80 responding to
SYNs with Resets

*Q6. Did statistics counters for any virtual increment?*

No

*Q7. Why do you think the* **wildcard\_vs** *didn't pick up the packets?*

www\_vs was the most specific virtual server so it responded. That
response was to reset the connection.

*Q8. What symbol is used to represent* **wildcard\_vs**? *Why is symbol a
square?*

The status symbol is a black square. Black because the virtual server
was administratively disabled and square because there is no monitor and
the state is Unknown

*Q9. What is the Reason given for current state?*

The children pool member(s) either don't have service checking enabled,
or service check results are not available yet. Availability: unknown
State: disabled

*Q10. Does ftp session still work? Why?*

Disabling a configuration item (node, pool or virtual server) does not
affect existing connections.

*Q11. Did new ftp session establish connection? Why not?*

No, a disabled virtual server will not process new connections.

Virtual Server Connection Limits and Status
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Does ftp session work?*

Yes

*Q2. What is the virtual server status of* **ftp\_vs**?

Yellow Triangle - Availability: unavailable - State: enabled

*Q3. Did new ftp session establish connection? Why not?*

No, the virtual server's connection limit has been reached.

*Q4. Did tcpdump capture a connection reset?*

Yes, tcpdump had **R** resets returning from the virtual server.

Pool Member and Virtual Servers
-------------------------------

Effects of Monitors on Members, Pools and Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Since the* **mysql\_monitor** *will fail, how long will it take to
mark the pool offline?*

60 seconds, the monitor will have to fail 4 times at 15 second intervals
before it exceeds the 46 second timeout value.

*Q2. What is the icon and status of* **www\_vs**?

Red Diamond - Availability: offline - State: enabled - The children pool
member(s) are down

*Q3. What is the icon and status of* **www\_pool**?

Red Diamond - Availability: offline - State: enabled - The children pool
member(s) are down

*Q4. What is the icon and status of the* **www\_pool** *members?*

Red Diamond - Availability: offline - State: enabled - Pool member has
been marked down by a monitor

*Q5. Does pool configuration have an effect on virtual server status?*

Yes, the status of the pool members can affect the status of the virtual
server.

*Q6. What is the icon and status of www\_vs?*

Black Diamond - Availability: offline - State: disabled - The children
pool member(s) are down

*Q7. Did traffic counters increment for* **www\_vs**?

No

*Q8. What is the difference in the tcpdumps between Offline (Disabled) vs
Offline (Enabled)?*

Offline (Disabled) - immediate connection reset, you will see no virtual
server statistics.

Offline (Enabled) - initial connection accepted then reset - vs stats
incremented

More on status and member specific monitors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What is the status of the Pool Member and the monitors assigned to it?*

Red Diamond - Red Diamond - Availability: offline - State: enabled -
Pool member has been marked down by a monitor

http - Green Circle, mysql\_monitor - Red Diamond

*Q2. What is the status of* **www\_vs**, **www\_pool** *and the pool
members? Why?*

Green, Green, Red, Red, Green. One pool member available, marks the pool
available and since the pool is available, the virtual server is
available

*Q3. Did the site work?*

Yes

*Q4. Which* **www\_pool** *members was traffic sent to?*

Traffic was distributed to available pool members.

Extended Application Verification (EAV)
----------------------------------------

Create an EAV monitor
~~~~~~~~~~~~~~~~~~~~~

*Q1. What was the stdout output? Did this indicate the member was Available?*

UP, indicating the member was Availble

*Q2. Are your members up? What would happen if the external monitor
returned "DOWN"*

Yes, the same would be true if DOWN was returned, any stdout output is
consider good status

Inband Monitors
---------------

*Q1. What is the status of the* **www\_pool** *and* **www\_vs** *objects? Is
the web site accessible? Why?*

Unchecked (blue square), Yes, because Uncheck simply mean the status in
unknown and is always assumed to be availale.

*Q2. What are the status of* **www\_pool** *and* **www\_vs**? *Can you access
the web site?*

Available, Yes

*Q3. Why is the* **www\_pool** *still showing up?*

Because there hasn't been any client traffic to trigger the inband
monitor.

*Q4. What is the status of the* **www\_pool** *now?*

Offline

*Q5. What are the pool statuses and why?*

Offline, regardless of client traffic the BIG-IP will not attempt a
connection to the offline pool members for 300 seconds

*Q6. How often to you see monitor traffic to the* **www\_pool**?

Once a minute

*Q7. How often to you see monitor traffic to the* **www\_pool**?

Every 5 seconds

*Q8. Did the www\_pool come up within 30 seconds without client traffic?
What did the tcpdump show?*

Yes, the active monitor marked the pool up after 6 consecutive
successful monitor attempts.

The tcpdump show the monitor executing every 5 seconds until the members
were marked Available then it slowed to every 60 seconds.

Module - SSL
============

SSL Certificates and Profiles
-----------------------------

Importing Certs and Key
~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What is the common name of your imported certificate and when does
it expire?*

Linux32server1.f5se.com, Jun 16, 2020

SSL Profile and Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Did it work?*

Yes

Module - Virtual Servers and Packet Processing Review
=====================================================

Lab Preparation and Packet Processing
-------------------------------------

Open BIG-IP TMSH and TCPDump session 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Why are ssh sessions not displayed in connection table?*

**tmsh show sys connections** displays connections on the TMOS data plane.
SSH connections are established to out-of-band management interface and
thus not seen.

Establish ftp connection
~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. In the tcpdump above, what is client IP address and port and the
server IP address port?*

10.1.10.51:60603 and 10.1.10.20:21 (FTP)

.. NOTE::

   60603 is an ephemeral port, your port will probably be differenr.  BIG-IP will attempt to use the same ephemeral port on the server-side connection, if the port is available.

*Q2. What is source ip and port as seen by ftp server in the example
above?*

Source IP: 10.1.20.249 Source Port: <it should be the same as the client ephemeral port>

*Q3. What happened to the original client IP address and where did
10.1.20.249 come from?*

The virtual server was configured to do source address translation using
the SNAT Pool, SNAT249\_pool. Reviewing the configuration of
SNAT249\_pool shows it was configured with IP address 10.1.20.249.

Packet Filters
--------------

Test the FTP packet filter
~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Was the existing ftp connection in the connection table affected?
Why?*

The FTP connection is not affected because adding packet filter does not
impact established connections.

*Q2. Was ftp connection successful? Why?*

The attempt to establish a new FTP connection was blocked, because the
packet filter rule applies to all new connection attempts

*Q3. What did tcpdump reveal? Connection timeout or reset?*

Tcpdump revealed multiple "S" (syn) attempts without receiving ack or reset. This
is indicating a connection timeout.

*Q4. What did virtual server statistics for ftp20\_vs reveal? Why are
counters not incrementing?*

VS stats shows no new connection attempts because Filter is applied
before VS in order of processing

*Q5. Prioritize the packet processing order:*

Virtual Server **3** SNAT **4** AFM/Pkt Filter **2** NAT **5** Existing
Connections **1** Self IP **6** Drop **7**

Virtual Server Packet Processing
--------------------------------

Testing Virtual Server Packet Processing Behavior
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Which VS is used for web traffic over port 8080?*

wildcard\_vs

*Q2. Which VS is used for ftp traffic?*

ftp\_vs

*Q3. Which VS is used for web traffic over the default HTTP port? Which
port was used?*

www\_vs port 80

*Q4. Which VS is used for web traffic?*

**wildcard\_vs**

IP Forwarding Virtual Servers
-----------------------------

Forwarding Virtual Server
~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What happens if we don't change the Protocol from TCP?*

Only TCP will be allowed through, things like ICMP and UDP will be
blocked

*Q2. What is the status of your new virtual server? Why?*

Unchecked (blue square) because there is nothing to monitor.

More on Transparent Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Why did we use gateway\_icmp? What other kind of monitor could we
have used?*

Because there isn't a port on the pool member, you could have used a
transparent monitor to assign a L7 content monitor to check a specific
port.

*Q2. Did it work? What were the image results?*

Yes, images came from nodes 4 and 5.

*Q3. Did it work?*

dig @10.1.20.12 hackazon.f5demo.com

*Q4. Did it work? Why not and how would you fix it?*

No, because it is a UDP protocol and a TCP profile is on the virtual
server. You could do a wildcard for the protocols and then it would work
or create a UDP transparent virtual.

Module - Load Balancing and Pools
=================================

Load Balancing
--------------

Ratio Load Balancing
~~~~~~~~~~~~~~~~~~~~

*Q1. What is the difference between Node and Member?*

Member is based on the connections for each pool member within a single
pool only, while Node takes into account all the connections an IP
address has across all pools it is a member of.

*Q2. How many Total connections has each member taken? Is the ratio of
connections correct?*

Yes, the pool member with a Ratio of 3 took 3 times the number of
connections

*Q3. Does the ratio setting have any impact now?*

No, the pool member ratios only have an effect if Ratio load balancing
is selected.

Priority Groups Lab
~~~~~~~~~~~~~~~~~~~

*Q1. Are all members taking connections? Which member isnt taking
connections?*

No, 10.1.20.13:80 in the low priority group is not taking connections.

*Q2. Is the lower priority group activated and taking connections?*

Yes, 10.1.20.13:80 in the low priority group is now taking connections.

Simple (Source Address) Persistence 
-----------------------------------

*Q1. How many members are taking traffic?*

Only, one member is taking traffic

*Q2. Check you Persists Records window, are the any persistence records?*

Yes

*Q3. Refresh you web page prior to the Age column reaching 120. What
happens?*

The timer resets.

*Q4. Could you access the web site? Why?*

Yes, when a member is disabled, new connections can still be built to
it, if it there is a persist record pointing to it.

*Q5. Could you access the web site? Why?*

Force Offline only allows existing connections to be maintain, regardless
of persistence records.

Module - Networking
===================

Self IP Port Lockdown and more
------------------------------

Effects of Port Lockdown
~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Was echo response received?*

Ping reply successful

*Q2. Was ssh successful? Why not?*

No. Port lockdown set to **Allow None** by default

*Q3. Did SSH work? Did browsing work?*

Yes to SSH and No to browsing.

*Q4. What other ports are opened when you select* **Allow Defaults**?

From the bigip.conf::

   ospf
   tcp - snmp (161), ssh (22), 4353 (iquery/configsync), https (443), dns (53)
   udp - 1026 (Network failover), snmp (161), 4353 (iquery/configsync), 520, dns (53)

*Q5. Did SSH work? Did browsing work?*

Yes to SSH and No to browsing.

Module - Roles and Partitions
=============================

Roles and Partitions
--------------------

Create and place a user in a partition
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. In the upper right of the BIG-IP WebUI what partition are you in?*

test\_partition

*Q2. Do you see the* **test\_vs** *just created?*

No

*Q3. Do you see your change? Is your change permanent?*

Yes, but configuration changes made in tmsh are not permanent until
written to disk (save sys config) or a change is made in the GUI.
Changes made in the GUI are push into memory and written to disk.

*Q4. Did you find it in /config/bigip.conf?*

No

*Q5. Did you find your virtual server? Is the tmsh change you made in
there?*

Yes, but the new description isn't there.

*Q6. Do you see the change now?*

Yes

*Q7. Where you able to?*

No, you were kicked off the BIG-IP SSH session

Remote Authentication
---------------------

Authenticate against LDAP
~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Were you successful?*

Yes, well at least you should have been.

*Q2. Were you successful?*

No, local accounts aside admin are disabled when using remote
authentication.

Module - Device Service Clusters and High Availability
======================================================

Building a DSC (Device Service Cluster)
---------------------------------------

Base Networking and HA VLAN
~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What is the status your BIG-IPs?*

Both are Active

Prepare each BIG-IP for High Availability
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. If you were to add multiple IP addresses to the Failover Unicast, when
would the BIG-IP failover?*

Only after the network polls for all the IP addresses failed.

Build the Device Trust and Device Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Is all the information there?*

Yes

*Q2. What are the statuses of your BIG-IPs now?*

Active In Sync

*Q3. Did you have to create the Device Group on the other BIG-IP?*

No, It was created automatically

*Q4. Is the full configuration synchronized yet?*

No. Only the Device Group is synced

*Q5. What is the status and sync status on the BIG-IPs?*

It should be Awaiting Initial Sync. Once BIG-IP is Active, the other is
Standby. There is no guarantee which BIG-IP will be the Active BIG-IP
when the device group is created.

*Q6. Did the configuration synchronize? What, if any, errors do you see?*

No, there was an error message on bigip02 indicating it could not load
avr\_virtual2 because of iRule dependencies. Which was why you created
that virtual first in the AVR lab.

*Q7. Any issue with that?*

Yes, avr\_virtual2 has dependencies.

*Q8. What is the sync status of bigip02 once you made the change?*

Changes Pending

*Q9. Are the BIG-IPs In Sync? Are the configurations the same?*

Yes and Yes

Browse to http://10.1.10.100

*Q10. Could you access the site? Which BIG-IP passed the traffic?*

Yes, the Active BIG-IP. You can tell because the virtual server is using SNAT Auto
Map and the source IP is selfIP address of the active device.

Failover and Mirroring
----------------------

Testing Failover
~~~~~~~~~~~~~~~~

*Q1. What is the source IP in the* **Request Details**?

10.1.20.246


*Q2. What happened? Why?*

Site couldn't be reached. The secure\_vs server does not use SNATs. The
secure\_pool servers use the default gateway, 10.1.20.240, you built as
a self IP on bigip01.

*Q3. Did the site work? What was the client IP? Why?*

Yes, 10.1.10.51 because SNAT Auto Map is not configured on this virtual server and the pool member uses the floating IP as a default gateway.

*Q4. What was the client IP address that the server saw (under* **Request
Details** *on the main page)? Why?*

It should be 10.1.20.240. www_vs uses SNAT automap. The BIG-IP will
always use the floating IP for the SNAT if available. If you exceed
64000 simultaneous connection, the BIG-IP then uses the non-floating self
IP, but you probably should have created a SNAT pool, since you cannot mirror
SNAT connections on non-floating self IPs.

*Q5. Does http://10.1.10.115 still work? What is the client IP?*

Yes, 10.1.10.51 

Mirroring
~~~~~~~~~

*Q1. Do you have a persistence record on each BIG-IP? What would happen
if you did a failover?*

No, only the Active unit had persistence records, upon failover
persistence would be lost.

*Q2. If you had persistence records existing prior to mirroring would
they appear on the standby box?*

No, BIG-IP only mirrors records created after mirroring is enabled.
Also, upon failover, the new Active BIG-IP will only mirror records
created after it became active.

*Q3. Did you persist to the correct pool member? What is the client IP?*

Yes, 10.1.10.240

Traffic Groups
--------------

Build a New Traffic Group
~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. When you did this, what other virtual servers were assign to tg-2?*

ftp\_vs

*Q2. What are the states of you BIG-IPs?*

Active-Active

*Q3. Did the web site work? What was the client IP? Did ftp work? Why or
why not?*

Yes the web site work, the client IP was 10.1.20.245 SNAT because the
10.1.20.240 address is not part of the tg-2. The ftp site did NOT work
because it's SNAT pool IP is not part of the tg-2 traffic group

*Q4. Did it work now?*

Yes, if you made the change on the active device for tg-2. If not,
synchronize and try again

Module - Security and Securing the BIG-IP
=========================================

More Security Features
----------------------

Configure Audit Logging
~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Do you see when adminuser logged on? Do you see the change made in
the audit log?*

Yes, to both.

Limiting SSH access to the BIG-IP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Does existing an SSH window still work? Does a new SSH work?*

Existing SSH session worked. New ssh sessions could not be establish for
the jumpbox source IPs.

*Q2. Were new ssh sessions established?*

Yes, to 10.1.1.245, No, to 10.1.10.245 (the source IP for that would be
10.1.10.51)

BIG-IP Remote Logging
---------------------

Test your logging configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Did you see messages on the syslog servers?* 

You saw and audit message and in the bigip.log::
 
   bigip01.f5demo.com mcpd[7702] Pool /Common/www_pool member/Common/10.1.20.13:80 session   status forced disable
