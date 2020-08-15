Virtual Server Status
=====================

Test Disabled Virtual Servers
-----------------------------

In this task, you will disable and enable various virtual servers and
note the behavior.

Disable **www\_vs** from the **Virtual Server List** or from within the
**www\_vs** GUI interface.

Open **Local** **Traffic > Virtual Servers** and hover over status icons.

From window2 (TMSH) type::

   show ltm virtual
   show ltm virtual www_vs

*Q1. What is the Availability of* **www_vs** *? What is the state?*

*Q2. What symbol is used to represent* **www\_vs** *status?*

*Q3. Would you expect browsing to* **http://10.1.10.100** *to work?*

*Q4. Can you ping the virtual IP?*

Clear virtual server stats and browse to **http://10.1.10.100**

Observe the tcpdump (window1) and connection statistics in the Virtual
Server statics GUI interface.

*Q5. Did the site work? What did the tcpdump show?*

*Q6. Did statistics counters for any virtual increment?*

*Q7. Why do you think the* **wildcard\_vs** *didn't pick up the packets?*

Disable **wildcard\_vs** and note the State and Availability of the
virtual servers.

*Q8. What symbol is used to represent* **wildcard\_vs**?   *Why is the 
symbol a square?*

*Q9. What is the Reason given for current state?*

Establish ftp connection to 10.1.10.100 and ensure successful login::
 
   Username: root 
   Password: default

Disable **ftp\_vs**.

*Q10. Does ftp session still work?   Why?*

Open another window and establish ftp connection to 10.1.10.100.

*Q11. Did new ftp session establish connection?   Why not?*

.. IMPORTANT::

   Make sure all virtual servers are **Enabled** before continuing.

Virtual Server Connection Limits and Status
-------------------------------------------

In this task, you will set the connection limit for the FTP virtual
server to 1 and note the status and behavior of different connection
scenarios.

.. NOTE::
      `K8457: Connection limits for a CMP system are enforced per TMM instance <https://support.f5.com/csp/article/K8457>`__ states that connection limits should not be lower than the number of TMM instances on a BIG-IP or you may get unpredicitable results.  The UDF BIG-IPs have 4 vCPU and therefore 4 TMMs. When we set the connection limit to 1 on the virtual server we may get up to 2 connections before the connection limit is reached.

Modify **ftp\_vs** for connection limit of 1. The **Connection Limit**
option can be found under the **Advanced** virtual server menus.

Establish ftp connection to **10.1.10.100** and hold the logon open.

*Q1. Does FTP session work?*

*Q2. What is the virtual server symbol and status of* **ftp_vs**\ *?*

Open 2 more windows and establish a second  and third ftp connection to
**10.1.10.100**.

*Q3. Did new ftp session establish connection? Why not?*

*Q4. Did tcpdump capture a connection reset?*

*Q5. Quit all FTP sessions and note* **ftp\_vs** *status.*
