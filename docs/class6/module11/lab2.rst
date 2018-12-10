BIG-IP Remote Logging
=====================

Your customer would like to integrate BIG-IP system messages with
their central logging system, to be processed by their correlation
software. They would like you to send mcpd informational messages (to external logging server(s)).

Configuring a logging pool
--------------------------

Create a pool with the logging server(s). This will be the destination for
high speed logging. You will be logging to **syslog\_ng** over TCP port **514**.
You will be using a combination of an inband monitor and an active
monitor to determine the log server's availability. This monitor will
combination will reduce network activity and superfluous log messages to
the syslog server.

Configure the **Logging Pool**.

Because the syslog server is using the TCP protocol, we can use inband monitors.  Create an **inband** monitor named **syslog\_inband** and use the default configuration.

Create an active **TCP** monitor named **syslog\_active** and set the
**Up Interval** to **180** seconds.

This monitor will poll the syslog server every three minutes while the inband
monitor is showing the server available. If the server goes down, it
will be polled every 5 seconds.

.. NOTE::

   The purpose of the monitors is to reduce logging to the syslog server, which will 
   log the monitor request as they come in.  The inband monitor will use message traffic the monitor the syslog server without generating message traffic, but if the syslog server goes down the active monitor will return it to service much faster than the default inband timeout. 

Create a logging pool named **logging_pool**, with the
**syslog_inband**, **syslog_active** monitors and the member
**10.1.20.252:514**.

Configure the logging destinations
----------------------------------

Remember at least two log destinations need to be created. The first one
will be the High Speed Logging (HSL) Destination where the messages will
be sent (the Logging\_Pool you just created) and the protocol that will be
used, TCP or UDP. The second Log Destination created will specify the
message format and the HSL Destination where formatted messages go too.

High Speed Logging (HSL) Log Destination
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First you will create a Log Destination to tell the BIG-IP where to send
the log messages and the protocol to use.

.. NOTE::

   The reason we have to define an HSL destination is because the is no way to assign a protocol to a pool.

Go to **System > Logs > Configurations > Log Destinations** and create a
HSL destination named **hsl\_logging\_dest** of a type **Remote
High-Speed Log** and the pool name is **logging\_pool**

Formatted Log Destination
~~~~~~~~~~~~~~~~~~~~~~~~~

This log destination will be used to format the log output. You are
sending the messages to a syslogng server, so you will want them in a
syslog format. You will send the formatted log events to the HSL Log
Destination you created earlier.

**In Logging Destinations** select **Create** and build a formatted
destination named **formatted\_dest** with a type of **Remote Syslog**
and with the **Syslog Format** of **Syslog** and the **High Speed Log
Destination** set to **hsl\_logging\_dest.**

Log Publisher and Filtering Messages
------------------------------------

The log publisher is a way to associate individual or multiple log
destinations to a logging profile. In this case, any messages through
this publisher will go to local log files and the remote logs via
formatted\_dest.

Go to **System > Logs > Configurations > Log Publishers** and select
**Create**.

Name: **logging\_pub**

Destinations: Move **formatted\_dest** and **local-syslog** to the
**Selected** box.

Select **Finished** when done.

This step created a log publisher that will send Syslog formatted events
to a remote server, the local database, and the local syslog. Normally
you wouldn't want to go to all three, but this is one way to show how BIG-IP can
send to multiple destinations for demonstration purposes. And while you can log everything off the BIG-IP you will probably want some local logging available, so you can log on to the BIG-IP and check events without going through the syslog server.

System Logging Filter
~~~~~~~~~~~~~~~~~~~~~

Now you will create a system logging filter. This will demonstrate how
we can log systems events off box, as well as on box. We do NOT want to
take the defaults as logging down to the debug level would cause the
BIG-IP to drop log messages and could fill up the log files to the point
where the BIG-IP runs out of disk space. You are going to send
informational messages from the MCPd daemon to the published
destinations.

Go to **System > Log > Configuration > Log Filters** and select Create
   - Name: **my-mcpd-filter**
   - Severity: **Informational**
   - Source: **mcpd**
   - Log Publisher: **logging\_pub**

Test your logging configuration
-------------------------------

Generate and view a **mcpd** event.

SSH to the syslog-ng server at **10.1.1.252** (credentials are **root/default**)..

Watch the **bigip.log** syslog file for your events::

   tail -f /var/log/syslog | grep bigip

Go to **Local Traffic > Pools** and select the **www\_pool**. Disable
one of the pool members.

*Q1. Did you see messages on the syslog servers?* 
