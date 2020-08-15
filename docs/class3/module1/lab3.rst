Packet Filter Lab
=================

You are going to test how packet filters impact packet processing by
creating a packet filter to block ftp connections to 10.1.10.100.

Create a packet filter
----------------------

Go to **Network > Packet Filters > Rules** and **Create** a filter using
the following:

+--------------------------------------+---------------+
| **Name**                             | block\_ftp    |
+--------------------------------------+---------------+
| **Order**                            | First         |
+--------------------------------------+---------------+
| **Action**                           | Discard       |
+--------------------------------------+---------------+
| **Logging**                          | Enabled       |
+--------------------------------------+---------------+
| **Destination Port List**            | 21 (FTP)      |
+--------------------------------------+---------------+


Make sure you select **Add** after entering a host/network or a port.

Test the FTP packet filter
--------------------------

Ensure ftp connection is currently established to **10.1.10.100**.  You can log on to FTP using the credentials **f5student/f5UDFrocks!**.

Go to **Network > Packet Filters > General** and select **Enable** and
then **Update**.

*Q1. Was the existing ftp connection in the connection table affected?   Why?*

Quit ftp and clear virtual server statistics by going to **Local Traffic
> Virtual Servers > Statistic**, select the virtual server and hit
**Reset**.

Attempt to establish an ftp connection to 10.1.10.100.
Watch tcpdump capture you built in window1.

*Q2. Was ftp connection successful? Why?*

*Q3. What did tcpdump reveal? Did the connection timeout or reset?*

*Q4. What did virtual server statistics for* **ftp_vs** *reveal? Why are
counters not incrementing?*

*Q5. Prioritize the packet processing order below from 1-7:*

Virtual Server\_\_\_ SNAT\_\_\_ AFM/Pkt Filter\_\_\_ NAT\_\_\_ Existing
Connections\_\_\_ Self IP\_\_\_ Drop \_\_\_

Review the Packet Filter Logs and Packet Filter Statistics, then disable
the Packet Filters.

Go to **Network > Packet Filters > Statistics** and review the
information.

Go to **System > Logs > Packet Filters** and review the information.

Go to **Network > Packet Filters > General** and select **Disable** and
then **Update**