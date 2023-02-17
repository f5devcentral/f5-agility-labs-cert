1.07 - Determine between packet based versus connection based load balancing
============================================================================

Demonstrate when to use packet based load balancing
---------------------------------------------------

Start by going to **Local Traffic, Profiles, Protocol, UDP**

Select the **udp_gtm_dns** profile.

What is the Datagram LB setting do?  (Look in the Help tab if you are not sure)
The help indicates that Datagram LB when enabled load balances UDP traffic packet by packet.  Is this default?


Demonstrate when to use connection based load balancing
-------------------------------------------------------

Most applications are configured with load balancing connection based instead of packet-by-packet.  TCP based applications will be balanced based on their connections due to the requirements of the SYN, SYN ACK, ACK handshake.
