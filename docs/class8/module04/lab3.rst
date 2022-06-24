Pool Member and Virtual Servers
===============================

Create a new monitor
~~~~~~~~~~~~~~~~~~~~

In this task, you will determine the effects of monitors on the status
of pools members.

Create **mysql** monitor for testing.

Go to **Local Traffic > Monitors** and select **Create**.

+----------------------+------------------+
| **Name**             | mysql\_monitor   |
+======================+==================+
| **Parent Monitor**   | mysql            |
+----------------------+------------------+
| **Interval**         | 15               |
+----------------------+------------------+
| **Timeout**          | 46               |
+----------------------+------------------+

Effects of Monitors on Members, Pools and Virtual Servers
---------------------------------------------------------

Go to **Local Traffic > Pools > www\_pool** and assign **mysql\_monitor** to the pool.

Observe Availability Status of **www\_pool.** The pool status
momentarily changes to **Unknown**.

*Q1. Since the* **mysql\_monitor** *will fail, how long will it take to
mark the pool offline?*

Go to **Local Traffic > Pool > www\_pool** and then **Member** from the
top bar and open member **10.1.20.13:80** and note the status of the
monitors.

Open **Local Traffic > Network Map > Show Map**

*Q2. What is the icon and status of* **www\_vs**?

*Q3. What is the icon and status of* **www\_pool**?

*Q4. What is the icon and status of the* **www\_pool** *members?*

*Q5. How does the status of the pool configuration effect the virtual
server status?*

Clear the virtual server statistics.

Browse to **http://10.1.10.100** and note the browser results,
statistics and tcpdump.

Disable **www\_vs** and clear the statistics and ping the virtual
server.

*Q6. What is the icon and status of* **www\_vs**?

Browse to **http://10.1.10.100** and note the browser results,
statistics and tcpdump.

*Q7. Did traffic counters increment for* **www\_vs**?

*Q8. What is the difference in the tcpdumps between Offline (Disabled) vs
Offline (Enabled)?*

.. WARNING::

   Make sure all virtual servers, pools and pool members are **Enabled** before continuing.

More on status and member specific monitors
-------------------------------------------

Go to **Local Traffic > Pool > www\_pool** and then **Member** from the
top bar and open member **10.1.20.13:80.** Enable the **Configuration:
Advanced** menus.

*Q1. What is the status of the Pool Member and the monitors assigned to
it?*

In **Health Monitors** select **Member Specific** and assign the
**http** monitor and **Update.**

Go to the **Network Map**.

*Q2. What is the status of* **www\_vs**, **www\_pool** *and the pool
members? Why?*

Browse to **http://10.1.10.100** and note results of browser and
tcpdump.

*Q3. Did the site work?*

*Q4. Which* **www\_pool** *members was traffic sent to?*
