Virtual Server Status
=====================
Test Disabled Virtual Servers
-----------------------------

In this task, you will disable and enable various virtual servers and
note the behavior.

Make sure you have two SSH sessions opened to the BIG-IP.

- In window 1, have a tcpdump watching traffic to the **www_vs** virtual (**10.1.10.100**)
- In window 2, go into TMSH

Disable **www\_vs** from the **Virtual Server List** or from within the
**www\_vs** GUI interface.

Open **Local** **Traffic > Virtual Servers** and hover over status icons.

From window 2 (TMSH) type::

   show ltm virtual
   show ltm virtual www_vs

*Q1. What is the Availability of* **www\_vs**\ *? What is the State?*

*Q2. What symbol is used to represent* **www\_vs** *status?*

*Q3. Would you expect browsing to* **http://10.1.10.100** *to work?*

*Q4. Can you ping the virtual IP?*

Clear virtual server stats and browse to **http://10.1.10.100**

Observe the tcpdump (window 1) and connection statistics in the Virtual
Server statics GUI interface.

*Q5. Did the site work? What did the tcpdump show?*

*Q6. Did statistics counters for any virtual server increment?*

Establish ftp connection to **10.1.10.100** and ensure successful login.

- Logon credentials are **root/default**

Disable **ftp\_vs**.

*Q10. Does ftp session still work? Why?*

Open another window and establish ftp connection to **10.1.10.100**.

*Q11. Did new ftp session establish connection? Why not?*

.. WARNING::

   Make sure all virtual servers are **Enabled** before continuing.

Virtual Server Connection Limits and Status
-------------------------------------------

In this task, you will set the connection limit for the FTP virtual
server to 1 and note the status and behavior of different connection
scenarios.

Modify **ftp\_vs** for connection limit of **1**. The **Connection Limit**
option can be found under the **Advanced** virtual server menu.

Establish ftp connection to **10.1.10.100** and hold the logon open.

*Q1. Does FTP session work?*

*Q2. What is the virtual server symbol and status of* **ftp\_vs**\ **?**

Open another window and establish a second ftp connection to **10.1.10.100**.

*Q3. Did new ftp session establish connection? Why not?*

*Q4. Did tcpdump capture a connection reset?*

*Q5 Quit all FTP sessions and note* **ftp\_vs** *status.*