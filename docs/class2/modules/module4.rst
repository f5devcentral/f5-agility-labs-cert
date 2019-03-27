Section 4 - Troubleshoot basic device management connectivity issues
====================================================================

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 4.01 Verify remote connectivity to the box in order to determine the cause of a management connectivity issue
-------------------------------------------------------------------------------------------------------------------------

|
|

**4.01 - Isolate potential causes of basic network connectivity issues,
given scenarios related to: client configuration, client network access,
device network access, and network topologies**

**GUI Study in the vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

A general knowledge of how devices communicate on IP based networks and
basic configuration settings that are necessary on the client as well as
the server environments are critical to being able to support an ADN
environment. An understanding of how networks are designed and where
devices are connected in a network topology are also critical to
supporting an ADN environment.

|
|

**4.01 - Apply connectivity troubleshooting tools (i.e. ping,
traceroute, http/https availability, remote shell access, network based
console access) in the appropriate situation**

**General Network Study and vLabs Practice**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

Understanding of each of these tools functions and when you should use
them to do troubleshooting of issues is key to administration of any
network. An understanding of ways to connect to systems via console to
test connectivity from the remote device on the network is critical as
well.

**Ping**

Ping is a computer network administration utility used to test the
reachability of a host on an Internet Protocol (IP) network and to
measure the round-trip time for messages sent from the originating host
to a destination computer. Ping operates by sending Internet Control
Message Protocol (ICMP) echo request packets to the target host and
waiting for an ICMP response.

**Traceroute**

Traceroute is a computer network diagnostic tool for displaying the
route (path) and measuring transit delays of packets across an Internet
Protocol (IP) network. The history of the route is recorded as the
round-trip times of the packets received from each successive host
(remote node) in the route (path); the sum of the mean times in each hop
indicates the total time spent to establish the connection. Traceroute
proceeds unless all (three) sent packets are lost more than twice, then
the connection is lost and the route cannot be evaluated. Traceroute
sends a sequence of three Internet Control Message Protocol (ICMP) Echo
Request packets addressed to a destination host.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 4.02 Check and interpret port lockdown settings and packet filters in order to determine the cause of a management connectivity issue to a Self-IP
---------------------------------------------------------------------------------------------------------------------------------------------------------------

|
|

**4.02 - Given a scenario, review port lockdown settings on the Self-IP
to determine the cause of the issue**

`http://support.f5.com/kb/en-us/solutions/public/13000/200/sol13250.html <http://support.f5.com/kb/en-us/solutions/public/13000/200/sol13250.html>`__

Port lockdown is a BIG-IP security feature that allows you to specify
particular protocols and services from which the self-IP address defined
on the BIG-IP system can accept traffic.

The port lockdown feature allows you to secure the BIG-IP system from
unwanted connection attempts by controlling the level of access to each
self-IP address defined on the system. Each port lockdown list setting
specifies the protocols and services from which a self-IP can accept
connections. The system refuses traffic and connections made to a
service or protocol port that is not on the list.

**Port lockdown setting definitions:**

**Allow Default**

This option allows access for a pre-defined set of network protocols and
services that are typically required in a BIG-IP deployment.

The Allow Default setting specifies that connections to the self-IP
addresses are allowed from the following protocols and services:

+--------------------+-----------+----------------------+
| Allowed protocol   | Service   | Service definition   |
+--------------------+-----------+----------------------+
| OSPF               | N/A       | N/A                  |
+--------------------+-----------+----------------------+
| TCP                | 4353      | iQuery               |
+--------------------+-----------+----------------------+
| UDP                | 4353      | iQuery               |
+--------------------+-----------+----------------------+
| TCP                | 443       | HTTPS                |
+--------------------+-----------+----------------------+
| TCP                | 161       | SNMP                 |
+--------------------+-----------+----------------------+
| UDP                | 161       | SNMP                 |
+--------------------+-----------+----------------------+
| TCP                | 22        | SSH                  |
+--------------------+-----------+----------------------+
| TCP                | 53        | DNS                  |
+--------------------+-----------+----------------------+
| UDP                | 53        | DNS                  |
+--------------------+-----------+----------------------+
| UDP                | 520       | RIP                  |
+--------------------+-----------+----------------------+
| UDP                | 1026      | network failover     |
+--------------------+-----------+----------------------+

 

You can also determine the default supported protocols and services
using the following command: \ *tmsh list net self-allow*

The output will appear similar to the following example:

net self-allow {

 defaults {

  ospf:any

  tcp:domain

  tcp:f5query

  tcp:https

  tcp:snmp

  tcp:ssh

  udp:520

  udp:cap

  udp:domain

  udp:f5-iquery

  udp:snmp

 }

}

**Allow All**

This option specifies that all connections to the self-IP address are
allowed, regardless of protocol or service.

**Allow None**

This option specifies that no connections are allowed on the self IP
address, regardless of protocol or service. However, ICMP traffic is
always allowed, and if the BIG-IP systems are configured in a redundant
pair, ports that are listed as exceptions are always allowed from the
peer system.

**Allow Custom**

This option allows you to specify the protocols and services for which
connections are allowed on the self-IP address. However, ICMP traffic is
always allowed, and if the BIG-IP systems are configured in a redundant
pair, ports that are listed as exceptions are always allowed from the
peer system.

**Default port lockdown setting**

When creating a self-IP address, the default port lockdown setting in
BIG-IP 10.x is Allow Default. In BIG-IP 11.x, the default port lockdown
setting is **None**.

Modifying port lockdown settings for a specific self IP using the
Configuration utility

1. Log in to the Configuration utility.

2. Click Network.

3. Click Self-IPs.

4. Click the relevant self-IP address.

5. Select the desired setting from the Port Lockdown box.

6. Click Update.

**Modifying port lockdown settings using the tmsh utility**

1. Log in to the Traffic Management Shell (tmsh) by entering the
   following command:*tmsh*  NOTE:If you are currently logged in to the tmsh
   shell, you can skip this step.

2. To modify the port lockdown settings for a self IP address, use the
   following command syntax:*modify /net self <self\_ip> allow-service
   <option>* For example, to change the port lockdown setting for self IP
   address 10.10.10.1 to default, you would type the following
   command:modify /net self 10.10.10.1 allow-service default

3. Save the change by typing the following command:

   - BIG-IP 10.1.0 and later:save sys config
   - BIG-IP 10.0.x:save config

----

|

**4.02 - Describe appropriate use cases for the use of port lockdown**

`http://support.f5.com/kb/en-us/solutions/public/13000/200/sol13250.html <http://support.f5.com/kb/en-us/solutions/public/13000/200/sol13250.html>`__

For optimal security, F5 recommends using the port lockdown feature to
allow only the protocols or services required for a self-IP address.

If you are managing the BIG-IP platform from one of the Self-IP
addresses rather than using the out of band management interface, you
run the risk of users having access to the Self-IP address on a port
that will allow administration of the BIG-IP platform. All external
facing Self-IP addresses should be restricted to only necessary ports
for the BIG-IP platform to communicate to other necessary BIG-IP
platforms or other necessary network functions such as DNS servers, etc.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 4.03 Given the use of a remote authentication server, verify proper DNS and NTP settings in order to diagnose a connectivity issue
----------------------------------------------------------------------------------------------------------------------------------------------

|
|

**4.03 - Given the use of a remote authentication server, verify proper
DNS and NTP settings in order to diagnose a connectivity issue**

Due to the 201 Exam Blueprint having an obvious mistake with layout or
objectives I have modified this section’s Example Points to reflect the
Objectives from the last blueprint.

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/ltm-concepts-11-4-0/14.html#unique\_1887226478 <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/14.html#unique_1887226478>`__

**Remote Authentication Intro:**

A significant feature of BIG-IP Local Traffic Manager is its ability to
support Pluggable Authentication Module (PAM) technology. PAM technology
allows you to choose from a number of different authentication and
authorization schemes to use to authenticate or authorize network
traffic.

The goal of PAM technology is to separate an application, such as the
BIG-IP system, from its underlying authentication technology. This means
that you can dictate the particular authentication/authorization
technology that you want the BIG-IP system to use to authenticate
application traffic coming into the BIG-IP system.

To this end, Local Traffic Manager offers several authentication
schemes, known as authentication modules. These authentication modules
allow you to use a remote system to authenticate or authorize
application requests that pass through the BIG-IP system.

The BIG-IP system normally routes remote authentication traffic through
a Traffic Management Microkernel (TMM) switch interface (that is, an
interface associated with a VLAN and a self IP address), rather than
through the management interface. Therefore, if the TMM service is
stopped for any reason, remote authentication is not available until the
service is running again.

**BIG-IP system authentication modules**

Local Traffic Manager authentication modules that you can implement for
remote authentication are:

**Lightweight Directory Access Protocol (LDAP)**

Local Traffic Manager can authenticate or authorize network traffic
using data stored on a remote LDAP server or a Microsoft Windows Active
Directory server. Client credentials are based on basic HTTP
authentication (user name and password).

**Remote Authentication Dial-In User Service (RADIUS)**

Local Traffic Manager can authenticate network traffic using data stored
on a remote RADIUS server. Client credentials are based on basic HTTP
authentication (user name and password).

**TACACS+**

Local Traffic Manager can authenticate network traffic using data stored
on a remote TACACS+ server. Client credentials are based on basic HTTP
authentication (user name and password).

**SSL client certificate LDAP**

Local Traffic Manager can authorize network traffic using data stored on
a remote LDAP server. Client credentials are based on SSL certificates,
as well as defined user groups and roles.

**Online Certificate Status Protocol (OCSP)**

Local Traffic Manager can check on the revocation status of a client
certificate using data stored on a remote OCSP server. Client
credentials are based on SSL certificates.

**Certificate Revocation List Distribution Point (CRLDP)**

Local Traffic Manager can use CRL distribution points to determine
revocation status.

**Kerberos Delegation**

Local Traffic Manager can authenticate application traffic when you are
using Microsoft Windows Integrated Authentication.

----

|

**4.03 - Given a suspected DNS issue, use appropriate tools to verify proper settings**

**GUI Study in the vLabs**

http://support.f5.com/kb/en-us/solutions/public/13000/200/sol13205.html

For the BIG-IP platform to connect to a node by name or to get to any
system for any reason by the server’s DNS name, a DNS server must be
configured on BIG-IP’s settings. The BIG-IP system uses two sources of
information to resolve host names: the hosts file and DNS. The BIG-IP
system first refers to the local /etc/hosts file. If the host name is
not found in the /etc/hosts file, the BIG-IP system uses DNS if
configured to do so. The following procedures help you configure the
BIG-IP system to use DNS.

Using the BIG-IP Configuration utility is the preferred method of
configuring a DNS remote lookup server.

Impact of procedure: Performing the following procedure should not have
a negative impact on your system.

1. Log in to the BIG-IP Configuration utility.

2. Click System.

3. Click Configuration.

4. Click Device.

5. Click DNS.

6. In the DNS Lookup Server List section, type the IP address of your
   remote DNS lookup server.

7. Click Add.

8. Complete the change by clicking Update.

This same procedure can be used to modify the BIND Forwarder Server List
or DNS Search Domain List. If this setting is not configured then
resolving a DNS name from the BIG-IP platform will fail, including
resolving the name of the remote authentication server for remote
authentication.

----

|

**4.03 - Given a suspected DNS issue, use appropriate tools to verify DNS response**

**GUI Study in the vLabs**

If the DNS issue is related to the BIG-IP platform connecting to a DNS
name you can check to make sure that the system is able to resolve
names. From the command prompt you can do a NSLOOKUP of a server name,
or you can DIG the server name. Both of these tools are found on the
BIG-IP platform.

*nslookup example:*

nslookup www.stonegreyband.com**\ Server: 192.168.69.1 Address:
192.168.69.1#53 Non-authoritative answer: www.stonegreyband.com
canonical name = stonegreyband.com. Name:stonegreyband.com 
Address: 71.251.96.82

*Dig Example:*

dig www.stonegreyband.com**; <<>> DiG 9.8.3-P1 <<>>
www.stonegreyband.com;; global options: +cmd;; Got answer:;;
->>HEADER<<- opcode: QUERY, status: NOERROR, id: 24965;; flags: qr rd
ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 0 ;; QUESTION
SECTION:;www.stonegreyband.com. IN A;; ANSWER
SECTION:www.stonegreyband.com. 3495 IN CNAME stonegreyband.com.
stonegreyband.com. 495 IN A 71.251.96.82 ;; Query time: 4 msec;;
SERVER: 192.168.69.1#53(192.168.69.1) ;; WHEN: Thu Jan 9 22:41:06
2014;; MSG SIZE rcvd: 69

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|
