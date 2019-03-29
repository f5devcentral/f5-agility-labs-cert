Section 3 - Troubleshoot basic performance issues
=================================================

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 3.01 Recognize when a packet capture is needed within the context of a performance issue
----------------------------------------------------------------------------------------------------

|
|

A packet capture can be one of the most powerful tools that an
administrator has at there command. If you are not use to doing packet
captures or have never done one, you should do them in your vLabs as
soon as possible to start becoming proficient.

**Running tcpdump on a busy system**

**Important:** The BIG-IP system is designed as an application delivery
network platform and not as a packet capture device. If you intend to
capture traffic under high load conditions, F5 recommends mirroring
traffic to a dedicated sniffing device.

Running tcpdump on a BIG-IP system is considered best effort, as it will
place more load on the CPU and may result in inaccuracies in the tcpdump
output, such as missed packets or packet timestamp irregularities. If
you run tcpdump on a heavily loaded BIG-IP system, the packet capture
process may not capture all matching traffic, and the statistical values
reported by tcpdump may be inaccurate.

If you run tcpdump on a heavily loaded system, F5 recommends using
tcpdump filter expressions to mitigate the potential for missed packets.

**Determine an appropriate location to take the capture**

`http://support.f5.com/kb/en-us/solutions/public/6000/500/sol6546.html <http://support.f5.com/kb/en-us/solutions/public/6000/500/sol6546.html>`__

An administrator can also do a capture from their workstation. The will
gather traffic between the destination and their workstation, which in
most cases is between the virtual server on the LTM and their
workstation. Captures can also be done locally on the F5 BIG-IP
platform. Doing a capture on the BIG-IP LTM is very strategic since you
have the ability to capture both sides of the proxied conversation
between the workstation and the back end server resources. Understanding
which networks the resources are on for both sides of the conversation
will also allow you to narrow the capture using filters in the tcpdump.

F5 recommends that you run tcpdump on a VLAN when you intend to capture
traffic for in-depth troubleshooting on the BIG-IP system. When the VLAN
is specified in the tcpdump syntax, tcpdump can read packets processed
by TMM.

**Determine the appropriate time to take capture**

**Command Line Study in the vLabs**

The right time to do a capture can be a catch 22. You need to capture
the issue; so a capture needs to be done while the problem is occurring.
Of course sometimes the problem may only be occurring under peak load.
So doing a capture during peak load may be ineffective due to issues
mentioned in the opening of this section. However most of the time you
can do the capture when the problem is occurring and tightening up the
amount of data you capture by using filters will help with overhead.

**Given a scenario, determine whether a packet capture is appropriate**

**Command Line Study in the vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

There may be times that determining the source of an issue will not
require the administrator to do a capture. When a problem arises look
first to the status of the BIG-IP and the configuration. If all of the
settings and statistics look fine, you can then check the client
settings and client access restrictions before moving on to a capture of
the network traffic.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 3.02 Use BIG-IP tools in order to identify potential performance issues
-----------------------------------------------------------------------------------

|
|

**3.02 - Differentiate between performance issue types (i.e. Latency, Congestion, broken content)**

**General Network Study**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

**Latency**

Latency is the largest cause of slow Web applications over the WAN or
Internet. Latency describes the time delay experienced while a data
packet moves from one point to another, usually caused by physical
distance and high round-trip times. Latency can also be introduced by
compute-intensive processing such as SSL handshaking, bulk
encryption/decryption, and TCP session management. Latency can have a
profound effect on application performance, even over networks with
abundant bandwidth.

**Congestion**

Network congestion occurs a node or network is processing so much data
that its level of service deteriorates. The BIG-IP platform has some
built in optimizations to help with network congestion. The TCP profile
has a setting to enable Nagles algorithm. Nagles algorithm attempts to
reduce network congestion by aggregating smaller TCP packets into larger
ones.

----

|

**3.02 - Establish the frequency of a given issue (random, continuous, isolated, intermittent, repetitive intervals)**

**General Network Study**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

Tracking how often issues occur or for how long an issue is impacting a
function can be a telltale sign to what may be happening. This can be
done through the use of logs, statistics, network captures and
observation.

For instance an administrator wants to load balance a server that is
already functioning in their DMZ. They spin up a second instance of the
server and place both the new and old server behind an LTM pair off of
the DMZ. They use the server’s address on the DMZ network for the
virtual server address on the LTM and place the servers on a new network
behind the LTM, with the LTM acting as the servers default gateway. The
firewall administrators add the new server IP addresses to the rule sets
allowing all the same server traffic to get to the servers on the new
network.

When the servers are brought on-line the users immediately notice a
delay in the transactions to the server. It seems to be taking about 30
seconds longer than before and is consistent on every transaction. In
thinking through the change in architecture, you would not expect that
the F5 platform introduced a 30 delay with each connection. The time it
takes for a DNS query to timeout in many systems is around 30 seconds.
On a deeper look into the logs on the server, it was doing a DNS reverse
lookup and it was timing out. The firewall admin had not added the new
network to the DNS rule on the firewall rule set to allow the network
nodes to query their DNS servers.

----

|

**3.02 - Explain how to get performance statistics in addition to the
those shown in the dashboard (Overview - Performance)**

**GUI Study in the vLabs**

To see additional platform performance information, use the following
steps:

In version 11.x of the BIG-IP Configuration Utility:

1. Click Statistics.

2. Click Performance.

In version 10.x of the BIG-IP Configuration Utility:

1. Click Overview.

2. Click Performance.

All categories are shown under the **All** tab or you can see the break
outs of **System**, **Connections**, **Throughput** and **Cache**.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|
