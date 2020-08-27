Module 1 – Accessing the Lab, Networking and BIG-IP Traffic Flow
================================================================

Networking the BIG-IP
---------------------

*Q1. Why is interface 1.4 showing uninitialized?   Does this indicate a problem with the interface?*

No, there is no problem with the interface.  On a BIG-IP VE, which is what comprises the lab environment, an interface will remain **Uninitialized** if it has not been assign to a VLAN.

*Q2. What will happen to the IP addresses if the BIG-IP goes down?*

In the current configuration all Self IPs are non-floating, assigned to **traffic-group-local-only**, and as such, they will go down with the BIG-IP.

Packet Processing Lab
---------------------

*Q1. Why are ssh sessions not displayed in connection table?*

**tmsh show sys connections** displays connections on the TMOS data plane.
SSH connections are established to out-of-band management interface and
thus not seen.

*Q2. In the tcpdump above, what is client IP address and port and the
server IP address port?*

10.1.10.1:60603 and 10.1.10.20:21 (FTP)

.. NOTE::

   60603 is an ephemeral port and BIG-IP will attempt to use the same
   client port on the server-side connection

*Q3. What is source ip and port as seen by ftp server in the example
above?*

Source IP: 10.1.20.249 Source IP: 61236

*Q4. What happened to the original client IP address and where did
10.1.20.249 come from?*

The virtual server was configured to do source address translation using
the SNAT Pool, SNAT249\_pool. Reviewing the configuration of
SNAT249\_pool shows it was configured with IP address 10.1.20.249.

Packet Filters
--------------

*Q1. Was the existing ftp connection in the connection table affected?
Why?*

The FTP connection is not affected because adding packet filter does not
impact established connections.

*Q2. Was ftp connection successful? If yes, why?*

The attempt to establish a new FTP connection was blocked, because the
packet filter rule applies to all new connection attempts

*Q3. What did tcpdump reveal? Connection timeout or reset?*

Tcpdump revealed multiple **S** (syn) attempts without receiving ack. This
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

*Q1. Which VS is used for web traffic over port 10000?*

wildcard\_vs

*Q2. Which VS is used for ftp traffic?*

ftp\_vs

*Q3. Which VS is used for web traffic over the default HTTP port? Which
port was used?*

www\_vs port 80

Q4. Which VS is used for web traffic?

wildcard\_vs