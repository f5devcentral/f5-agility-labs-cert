Section 8 - Manage existing system and application services
===========================================================

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 8.01 Modify and manage virtual servers
--------------------------------------------------

|
|

**8.01 - Given a proposed virtual server configuration change, outline
the scope of the change and for which connections those changes will
affect (active connections, new connections, persisted sessions)**

**GUI Study in the vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

This topic would be an example of an existing virtual server
configuration that is being modified. If you were to add a profile or an
iRule to a virtual server what would be the impact to the existing or
new client connections.

Build out a basic virtual server on the LTM and see what different
profile changes do to client connections.

----

|

**8.01 - Given a description of an application, identify the correct
virtual server configured for it (HTTP/HTTPS, TCP/UDP, VLANs enabled,
route-domain)**

**GUI Study in the vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

With a description of an application can you tell how a virtual server
will need to be configured? For example if you had an SSL protected
virtual server and needed to do cookie insert persistence. How would
this be configured at a high level? The virtual server would have to
terminate the SSL traffic with a Clientside SSL profile, to be able to
apply the http profile, so that you can process the http traffic to
insert a cookie into the header.

----

|

**8.01 - Given a situation where a virtual server configuration change
did not appear to immediately take effect, determine why**

**GUI Study in the vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

This topic has to do with recognizing that changing settings on a
virtual server may not immediately look as if anything changed. The
scope of the change and behavior of the type of change will define who
and how the clients will be affected.

Some changes do not affect existing connections only the new connections
after the change is made will be affected.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 8.02 Modify and manage pools
----------------------------------------

|
|

**8.02 - Distinguish between disabling a member and forcing it down**

`https://support.f5.com/kb/en-us/solutions/public/13000/300/sol13310.html <https://support.f5.com/kb/en-us/solutions/public/13000/300/sol13310.html>`__

The BIG-IP system designates two terms for network devices to which a
BIG-IP system load balances traffic: nodes and pool members. A node is
identified as the network device's IP address, such as 10.10.10.10. A
pool member is identified as the network device's IP address, the
service port on which the pool member is listening, and the name of the
pool to which it belongs. For example: myPool:10.10.10.10:80.

You can set the node and pool members to a Disabled or Forced Offline
state. When you interrupt access to a network device for maintenance,
you should change the state of the node to Disabled or Forced Offline.
If the node is set to Disabled or Forced Offline, any pool member in the
BIG-IP configuration that uses that same IP address is also set to
Disabled or Forced Offline. Alternatively, when you disrupt only some
services on a device, you should change the state of the affected pool
members to Disabled or Forced Offline. For example, if you want to
change the state of the HTTP, HTTPS, and FTP pool members using the
server IP 10.0.0.10, you should disable or force the 10.0.0.10 node
offline. If you want to only change the state of the HTTP pool members
running on address 10.0.0.10 and port 80, you should disable or force
all 10.0.0.10:80 pool members offline.

When set to Disabled, a node or pool member continues to process
persistent and active connections. It can accept new connections only if
the connections belong to an existing persistence session.

When set to Forced Offline, a node or pool member allows existing
connections to time out, but no new connections are allowed.

----

|

**8.02 - Determine use cases for disabling a member**

**GUI Study in the vLabs**

If the administrator needs to make changes, such as configuration
maintenance, to a server, that is the resource of a pool, but wants to
gracefully allow users to finish what they are doing, Then they should
sett the pool resource to Disabled.

----

|

**8.02 - Determine use cases for forcing down a member**

**GUI Study in the vLabs**

If the administrator needs take a resource out of a pool immediately due
to a critical misconfiguration or system error that is impacting
business, they can set the resource to Forced Offline.

----

|

**8.02 - Given a situation where a pool member has been disabled but
still appears to be receiving traffic, determine the cause**

**GUI Study in the vLabs**

Setting the pool resource to Disabled will allow the current users to
finish their sessions but not start new connections to this resource
unless the virtual server is using persistence. If the virtual server is
using persistence then the persistence record will be honored until it
expires. Thus the administrator could disable a pool member and that
member can still receive new connections from the existing persisted
clients.

----

|

**8.02 - Articulate the characteristics of a pool member that has been
disabled or forced offline (Such as for new connections, persisted
connections, etc.)**

**GUI Study in the vLabs**

Setting the pool resource to Disabled will allow the current users to
finish their sessions but not start new connections to this resource
unless the virtual server is using persistence. Setting the pool
resource to Forced Offline will allow current connections to finish but
will not allow any new connections to the even if persistence is
configured on the virtual server. If the Administrator needs to stop all
connections immediately from a pool resource with out any completion of
the current connections. Then removing the pool member from the pool
will kill all connections immediately. This is not recommended for
day-to-day maintenance but is an option for emergencies.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|
|

Conclusion
==========

|
|

This document is intended as a study guide for the F5 201 - TMOS
Administration exam. This study guide is not an all-inclusive document
that will guarantee a passing grade on the exam. It is intended
to be a living doc and any feedback or material that you feel should be
included, to help exam takers better prepare, can be sent to
F5CertGuides@f5.com.

Thank you for using this study guide to prepare the F5 201 - TMOS
Administration exam and good luck with your certification goals.

Thanks


**Eric Mitchell**

Sr. Systems Engineer - Global SI
