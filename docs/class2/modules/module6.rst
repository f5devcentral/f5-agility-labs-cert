Section 6 - Identify and report current device status
=====================================================

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 6.01 Review the network map in order to determine the status of objects
-----------------------------------------------------------------------------------

|
|

**6.01 - Explain the status icons of objects on the map**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/ltm-concepts-11-4-0/1.html#unique\_1250686602 <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/1.html#unique_1250686602>`__

The Configuration utility includes a feature known as the network map.
The network map shows a summary of local traffic objects, as well as a
visual map of the virtual servers, pools, and pool members on the BIG-IP
system. For both the local traffic summary and the network map, you can
customize the display using a search mechanism that filters the
information that you want to display, according to criteria that you
specify. The system highlights in blue all matches from a search
operation.

Object summary

When you first open the Network Map screen, the screen displays a
summary of local traffic objects. This summary includes the type of
objects specified with the search mechanism, the number of each type of
object, and, for each object type, the number of objects with a given
status.

The summary displays data for these object types:

-  Virtual servers

-  Pools

-  Pool members

-  Nodes

-  iRules

*Note: A local traffic summary includes only those objects that are
referenced by a virtual server. For example, if you have configured a
pool on the system but there is no virtual server that references that
pool, the local traffic summary does not include that pool, its members,
or the associated nodes in the summary.*

The diagram below shows an example of a network map screen that
summarizes local traffic objects on the system.

|

.. image:: /_static/201/p14.png


|

For each object type listed in the summary, the system shows the number
of objects with each type of status. Table 1.3 shows the various status
indicators that the summary screen can display for a local traffic
object.

Table 1.3 Explanation of status icons in a local traffic summary

+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Status indicator                   | Explanation                                                                                                                                                                                                              |
+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p2.png     | The objects are enabled and available (able to receive traffic).                                                                                                                                                         |
|                                    |                                                                                                                                                                                                                          |
|                                    |                                                                                                                                                                                                                          |
+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p3.png     | The objects are enabled but are currently unavailable. However, the objects might become available later, with no user action required.                                                                                  |
|                                    |                                                                                                                                                                                                                          |
|                                    | An example of an object showing this status is a virtual server whose connection limit has been exceeded. When the number of connections falls below the configured limit, the virtual server becomes available again.   |
+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p4.png     | The objects are enabled but offline because an associated object has marked the object as unavailable. To change the status so that the object can receive traffic, you must actively enable the object.                 |
|                                    |                                                                                                                                                                                                                          |
|                                    |                                                                                                                                                                                                                          |
+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| .. image:: /_static/201/p6.png     | The status of the objects is unknown.                                                                                                                                                                                    |
|                                    |                                                                                                                                                                                                                          |
|                                    |                                                                                                                                                                                                                          |
+------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

**The network map display**

The network map presents a visual hierarchy of the names and status of
virtual servers, pools, pool members, nodes, and iRules defined on the
system. The map shows all objects in context, starting with the virtual
servers at the top. The Status, Type, and Search settings at the top of
the screen determine the objects that the map includes.

When you position the cursor over an object on the map, the system
presents hover text containing information about the object. When you
position the cursor over the status icon accompanying an object, the
system presents hover text containing information about the object's
status, text which also appears on the pool's Properties screen. The
system arranges objects in alphabetic order, and organizes the dependent
objects in a hierarchy. Due to the way that a network map presents
objects in context, the updated screen also shows objects of other
statuses, types, and names that relate to those objects. This is because
a network map always shows objects in context with the objects that
depend on them, and the objects they depend on.

For example, if you have an available virtual server with an available
pool and two pool members, one available and one offline, then selecting
Offline from the Status list causes the system to show the offline pool
member in context with the available virtual server and the available
pool. This is because the available virtual server and the available
pool depend on the offline pool member.

|

.. image:: /_static/201/p15.png


----

|

**6.01 - Explain what virtual servers, pools, nodes and pool members are**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/ltm-concepts-11-4-0/2.html - conceptid <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/2.html#conceptid>`__

**Virtual Server**

A virtual server is a traffic-management object on the BIG-IP system
that is represented by an IP address and a service. Clients on an
external network can send application traffic to a virtual server, which
then directs the traffic according to your configuration instructions.
The main purpose of a virtual server is often to balance traffic load
across a pool of servers on an internal network. Virtual servers
increase the availability of resources for processing client requests.

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

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/ltm-concepts-11-4-0/5.html - conceptid <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/5.html#conceptid>`__

**Pool and Pool Members**

A load balancing pool is a logical set of devices, such as web servers,
that you group together to receive and process traffic. Instead of
sending client traffic to the destination IP address specified in the
client request, Local Traffic Manager sends the request to any of the
servers that are members of that pool. This helps to efficiently
distribute the load on your server resources.

When you create a pool, you assign pool members to the pool. A pool
member is a logical object that represents a physical node (server), on
the network. You then associate the pool with a virtual server on the
BIG-IP system. Once you have assigned a pool to a virtual server, Local
Traffic Manager directs traffic coming into the virtual server to a
member of that pool. An individual pool member can belong to one or
multiple pools, depending on how you want to manage your network
traffic.

The specific pool member that the Local Traffic Manager chooses to send
the request to is determined by the load balancing method that you have
assigned to the pool. A load balancing method is an algorithm that Local
Traffic Manager uses to select a pool member for processing a request.
For example, the default load balancing method is Round Robin, which
causes Local Traffic Manager to send each incoming request to the next
available member of the pool, thereby distributing requests evenly
across the servers in the pool.

To configure and manage pools, log in to the BIG-IP Configuration
utility, and on the Main tab, expand Local Traffic, and click Pools.

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/ltm-concepts-11-4-0/4.html - conceptid <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/ltm-concepts-11-4-0/4.html#conceptid>`__

**Nodes**

A node is a logical object on the BIG-IP Local Traffic Manager system
that identifies the IP address of a physical resource on the network.
You can explicitly create a node, or you can instruct Local Traffic
Manager to automatically create one when you add a pool member to a load
balancing pool.

The difference between a node and a pool member is that a node is
designated by the devices IP address only (10.10.10.10), while
designation of a pool member includes an IP address and a service (such
as 10.10.10:80).

A primary feature of nodes is their association with health monitors.
Like pool members, nodes can be associated with health monitors as a way
to determine server status. However, a health monitor for a pool member
reports the status of a service running on the device, whereas a health
monitor associated with a node reports status of the device itself.

For example, if an ICMP health monitor is associated with node
10.10.10.10, which corresponds to pool member 10.10.10.10:80, and the
monitor reports the node as being in a down state, then the monitor also
reports the pool member as being down. Conversely, if the monitor
reports the node as being in an up state, then the monitor reports the
pool member as being either up or down, depending on the status of the
service running on it.

Nodes are the basis for creating a load balancing pool. For any server
that you want to be part of a load balancing pool, you must first create
a node, that is, designate that server as a node. After designating the
server as node, you can add the node to a pool as a pool member. You can
also associate a health monitor with the node, to report the status of
that server.

To configure and manage nodes, log in to the BIG-IP Configuration
utility, and on the Main tab, expand Local Traffic, and click Nodes.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 6.02 Use the dashboard to gauge the current running status of the system
------------------------------------------------------------------------------------

|
|

**6.02 - Interpret each of the statistic types displayed by the dashboard**

**GUI Study in the vLabs**

The main Dashboard screen is of the system overview. This screen
displays a graphical representation of CPU utilization, Memory
utilization, Connections and Throughput of the system.

|

.. image:: /_static/201/p16.png


----

|

**6.02 - Given a situation, predict the appropriate dashboard statistics**

**GUI Study in the vLabs**

Understand what situations and which configurations will affect the
different areas of the Dashboard statistics. For example, the more
features that are provisioned on the BIG-IP platform the higher the base
Memory utilization will be. Also, if ASM is running on the BIG-IP the
CPU utilization my get higher as additional policies are added to the
configuration under load.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 6.03 Review log files and identify possible events
--------------------------------------------------------------

|
|

**6.03 - Given log file snippets, describe an event sequence**

**GUI Study in the vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

Get familiar with looking at the event logs on the BIG-IP and learn to
reconstruct what has happened recently based on the events in the logs.

----

|

**6.03 - Given log file snippets, identify critical events**

**GUI Study in the vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

Get familiar with looking at the event logs on the BIG-IP and be able to
identify critical events. This may be hard to do in the lab unless you
are cresting your own system errors. Possible do the opposite and get
used to seeing what is there when all is good and then the errors will
stand out.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 6.04 Use iApps Analytics to gauge the current running status of application services
------------------------------------------------------------------------------------------------

|
|

**6.04 - Explain the purpose of iApps Analytics**

`https://support.f5.com/kb/en-us/products/big-ip\_analytics/manuals/product/avr-implementations-11-4-0/1.html?sr=54633323 <https://support.f5.com/kb/en-us/products/big-ip_analytics/manuals/product/avr-implementations-11-4-0/1.html?sr=54633323>`__

**What is Analytics?**

Analytics (also called Application Visibility and Reporting) is a module
on the BIG-IP system that lets you analyze performance of web
applications. It provides detailed metrics such as transactions per
second, server and client latency, request and response throughput, and
sessions. You can view metrics for applications, virtual servers, pool
members, URLs, specific countries, and additional detailed statistics
about application traffic running through the BIG-IP system.

Transaction counters for response codes, user agents, HTTP methods,
countries, and IP addresses provide statistical analysis of the traffic
that is going through the system. You can capture traffic for
examination and have the system send alerts so you can troubleshoot
problems and immediately react to sudden changes.

The Analytics module also provides remote logging capabilities so that
your company can consolidate statistics gathered from multiple BIG-IP
appliances onto syslog servers or SIEM devices, such as Splunk.

**About Analytics profiles**

An Analytics profile is a set of definitions that determines the
circumstances under which the system gathers, logs, notifies, and
graphically displays information regarding traffic to an application.
The Analytics module requires that you select an Analytics profile for
each application you want to monitor. You associate the Analytics
profile with one or more virtual servers used by the application, or
with an iApps application service. Each virtual server can have only one
Analytics profile associated with it.

In the Analytics profile, you customize:

• What statistics to collect

• Where to collect data (locally, remotely, or both)

• Whether to capture the traffic itself

• Whether to send notifications

The BIG-IP system includes a default Analytics profile called analytics.
It is a minimal profile that internally logs application statistics for
server latency, throughput, response codes, and methods. You can create
custom Analytics profiles for each application if you want to track
different data for each one.

Charts shown in the Overview > Statistics > Analytics screen display the
application data saved for all Analytics profiles associated with iApps
application services or virtual servers on the system. You can filter
the information, for example, by application or URL. You can also drill
down into the specifics on the charts, and click the tabs to further
refine the information in the charts.

----

|

**6.04 - Describe how to capture application statistics**

`https://support.f5.com/kb/en-us/products/big-ip\_analytics/manuals/product/avr-implementations-11-4-0/1.html?sr=54633323 <https://support.f5.com/kb/en-us/products/big-ip_analytics/manuals/product/avr-implementations-11-4-0/1.html?sr=54633323>`__

You can examine the statistics on the Analytics charts when Application
Visibility and Reporting (AVR) is provisioned. The system recalculates
the Analytics statistics and updates the charts every five minutes.

Before you can look at the application statistics, you need to have
created an Analytics profile so that the system is capturing the
application statistics internally on the BIG-IP system. You must
associate the Analytics profile with one or more virtual servers (in the
Analytics profile or in the virtual server). If you created an iApp
application service, the template provided allows you to associate the
virtual server. To view Analytics statistics properly, Adobe Flash
Player must be installed on the computer where you plan to view them.

The task summary of how to set up the BIG-IP system to collect
application performance statistics can be found in the “Setting up local
application statistics collection” section of the hyperlinked site.

The system can collect application statistics locally, remotely, or
both. You use these statistics for troubleshooting and improving
application performance.

You can collect application statistics for one or more virtual servers
or for an iApps application service. If virtual servers are already
configured, you can specify them when setting up statistics collection.
If you want to collect statistics for an iApps application service, you
should first set up statistics collection, creating an Analytics
profile, and then create the application service.

The system can send alerts regarding the statistics when thresholds are
exceeded, and when they cross back into the normal range. You can
customize the threshold values for transactions per second, latency,
page load time, and throughput.

----

|

**6.04 - Given a current running status, recognize significant statistics**

**GUI Study in the vLabs**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

Get familiar with looking at the status information in **Statistics -
Module Statistics - Local Traffic** under the different **Statistics
Types** drop menu on the BIG-IP and be able to identify significant
statistic levels. This may be hard to do in the lab unless you are
pushing load through the unit. Get used to how the reports look and how
to read them.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|
