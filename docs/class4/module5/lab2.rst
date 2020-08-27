Module 2 - Virtual Server and Pool Behavior and Status
======================================================

Virtual Server Status
---------------------

Test Disabled Virtual Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What is the Availability of* **www\_vs**\ *? What is the State?*

Availability: available, State: disabled

*Q2. What symbol is used to represent* **www\_vs** *status?*

Black Circle

*Q3. Would you expect browsing to http://10.1.10.100 to work?*

No

*Q4. Can you ping the virtual IP?*

Yes, the virtual address still responds to pings

*Q5. Did the site work? What did the tcpdump show?*

No, the tcpdump showed the virtual server 10.1.10.100:80 responding to
SYNs with Resets

*Q6. Did statistics counters for any virtual increment?*

No

*Q7. Why do you think the* **wildcard\_vs** *didn't pick up the packets?*

www\_vs was the most specific virtual server so it responded. Because the www_vs was disabled the response was to reset the connection.  This make sense if you think about it.  What good would it do to disable a virtual server just to have another virtual server pick up the traffic either process incorrectly or send it to servers you just tried to prevent traffic from going too.

*Q8. What symbol is used to represent* **wildcard\_vs**\ *? Why is symbol a
square?*

The status symbol is a black square. Black because the virtual server
was administratively disabled and square because there is no monitor and
the state is Unknown

*Q9. What is the reason given for current state?*

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

*Q2. What is the virtual server status of ftp\_vs?*

Yellow Triangle - Availability: unavailable - State: enabled

*Q3. Did new ftp session establish connection? Why not?*

No, the virtual server's connection limit has been reached.

*Q4. Did tcpdump capture show a connection reset?*

Yes, tcpdump revealed **R** TCP reset the connection.

*Q5. Quit all FTP sessions and note* **ftp\_vs** *status.*

Once all the FTP have been terminated and you have drop below the maximum connection limit the virtual server should become **Available**

Pool Member and Virtual Servers
-------------------------------

Effects of Monitors on Members, Pools and Virtual Servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Since the* **mysql\_monitor** *will fail, how long will it take to
mark the pool offline?*

60 seconds, the monitor will have to fail 4 times at 15 second intervals
before it exceeds the 46 second timeout value.

*Q2. What is the icon and status of* **www\_vs**\ *?*

Red Diamond - Availability: offline - State: enabled - The children pool
member(s) are down

*Q3. What is the icon and status of* **www\_pool**\ *?*

Red Diamond - Availability: offline - State: enabled - The children pool
member(s) are down

*Q4. What is the icon and status of the* **www\_pool** *members?*

Red Diamond - Availability: offline - State: enabled - Pool member has
been marked down by a monitor

*Q5. How does the status of the pool configuration effect the virtual
server status?*

The status of the pool members can affect the status of the virtual
server.  If all the the pool members are offline, then the pool is offline and therefore the virtual server goes offline.

*Q6. What is the icon and status of* **www\_vs**\ *?*

Black Diamond - Availability: offline - State: disabled - The children
pool member(s) are down

*Q7. Did traffic counters increment for* **www\_vs**\ *?*

No

*Q8. What is the difference in the tcpdumps between Offline (Disabled) vs
Offline (Enabled)?*

Offline (Disabled) - immediate connection reset, you will see no virtual
server statistics.

Offline (Enabled) - initial connection accepted then reset, the virtual server stats are
incremented

More on status and member specific monitors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What is the status of the Pool Member and the monitors assigned to
it?*

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

Traffic was distributed to availble pool members.

Load Balancing
--------------

Load Balancing
~~~~~~~~~~~~~~

*Q1. Which* **www\_pool** *members was traffic sent to?*

Traffic was distributed to 10.1.20.12 and 10.1.20.13

*Q2. Did member 10.1.20.12 receive the most traffic? Why not?*

No, because LB method is Round Robin, Ratio and Priority Group
configurations on pool members do not apply.

*Q3. Which* **www\_pool** *members was traffic sent to?*

Traffic was distributed to 10.1.20.12 and 10.1.20.13

*Q4. Did member 10.1.20.12 receive the most traffic?*

10.1.20.12 received 5x more traffic than 10.1.20.12

Priority Group Activation
~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Which* **www\_pool** *members was traffic sent* to?

Traffic was distributed to 10.1.20.11 and 10.1.20.12

*Q2. Which* **www\_pool** *members was traffic sent to? Why?*

Traffic was distributed to 10.1.20.12 and 10.1.20.13. Pool member
availability dropped below 2 available members in the highest priority
group and the next lowest priority group was activated.

*Q3. Would the results have been different if 10.1.20.11:80 had been
marked offline or marked with a yellow triangle?*

No, both mark the member as Unavailable, dropping the Available members
below 2.

The Effects of Persistence on Load Balancing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Why was a http profile required?*

The http profile was required to tell the BIG-IP to parse the http
request/response sequence for the virtual server so it could insert and
read cookies in the http headers.

*Q2. Was traffic evenly distributed to all* **www\_pool** *members? Why
not?*

Traffic went to only on pool member because of persistence,

*Q3. Did you persist to the Disabled member? Why?*

Yes, a Disable pool member will still receive new connections if a
persistence record points to it.

*Q4. Does traffic continue to persist to the member Forced Offline?*

No, another available member was selected and a new persistence record
was created

*Q5. If cookies were disable on your browser would persistence still
work? Why?*

Yes, source address persistence would be used to persist to a pool
member