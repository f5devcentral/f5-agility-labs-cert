Load Balancing
==============

Ratio Load Balancing
--------------------

Go to Local **Traffic > Pools** and select **www\_pool** and then
**Members** from the top bar or you could click on the **Members** link
in the **Pool List** screen.

.. HINT:: 

   When we created the pool, we performed all our configuration on
   one page, but when we modify a pool the Resource information is under
   the Members tab

Under **Load Balancing** section change the **Load Balancing Method** to **Ratio (Member)**

In drop-down menu, notice most load balancing methods have two options, **(Node)** or **(Member)**.

*Q1. What is the difference between Node and Member?*

Select the first member in the pool **10.1.20.11:80** and change the
**Ratio** of the member to **3**

Open the pool statistics and reset the statistics for **www\_pool**.

Browse to **http://10.1.10.100** and refresh the browser screen several
times.

*Q2. How many Total connections has each member taken? Is the ratio of
connections correct?*

Now go back and put the pool back to **Round Robin** Load Balancing
Method

Reset the pool statistics and refresh the virtual server page several
times.

*Q3. Does the ratio setting have any impact now?*

Priority Groups Lab
-------------------

Let's look at priority groups. In this scenario we will treat the 10.1.20.13
server as if it was is in a disaster recovery site that can be reached
over a backhaul. You want to maintain at least two members in the pool for
redundancy and load.  You would traffic to be distributed t0 10.1.20.13 only during maintenance of one on the two primary servers or if one to the two other pool members fails.

.. NOTE::

   Remove any caching profiles from the www\_vs virtual server (10.1.10.100).

Go to the **www\_pool** **Members** section. Make sure the load
balancing method is **Round Robin**.

Set the **Priority Group Activation** to less than **2** Available
Members.

Select the pool members **10.1.20.11** and **10.1.20.12** and set their
**Priority Group** to **10**.

Review your settings and let's see how load balancing reacts now.

Select the **Statistics** tab, reset the pool statistics, browse to
**http://10.1.10.100** and refresh several times.

*Q1. Are all members taking connections? Which member isn't taking
connections?*

Let's simulate a maintenance window or an outage by disabling a pool
member **10.1.20.11:80** in the highest priority group. This should
cause low priority group to be activated, since number of active members
in our high priority group has dropped below 2.

*Q2. Is the lower priority group activated and taking connections?*

Select a member in the **Priority Group** 10 and **Disable** that pool
member.

Once again, select **Statistics**, reset the pool statistics, browse to the
virtual server and see which pool members are taking hits now.

.. IMPORTANT::

   Once you are done testing re-enable your disabled pool member.

Simple (Source Address) Persistence 
===================================

You have already seen cookie persistence at work, but if the client or
application (ie. ftp) does not support cookies you must use and
alternate method. The most common is Simple Persistence which is based
on the source IP address/network.

Verify your **www\_pool** is using **Round Robin** load balancing and the
priority groups are disabled.

Browse to **http://10.1.10.100** and refresh several times. You should see
all 3 servers respond.

Go to **Local Traffic > Profiles** and select the **Persistence** tab and
from the **Persistence** **Profiles** screen select the **Create**
button.

Create a new persistence profile named **my-src-persist** with a
**Persistence Type** of **Source Address Affinity** and set the
**Timeout** to **120** seconds and leave **Mask: None**

.. NOTE:: 

   The **Mask: None** defaults to **255.255.255.255** which means each new IP address will create a new
   persistence record.

Now let's attach the new persistence profile to the **www\_vs** virtual
server.

.. HINT:: 

   When you create a Virtual Server everything is on a single page,
   when you return to modified the Virtual Server the Properties and
   Resources are on different pages.

Set the **Default Persistence Profile** to **my-src-persist**.

Test your Source Address Affinity persistence profile.

At this point you may want to open a second browser window to the BIG-IP
GUI.

Go to **Statistics > Module Statistic > Local Traffic** and select
**Persistence Records** from the **Statistics Type** menu.

In this window, you can watch you persistence records. You may want to
set **Auto Refresh** to 20 seconds.

In another BIG-IP GUI window go to **www\_pool** and clear the member
statistics.

Browser to **http://10.1.10.100** and refresh several times.

*Q1. How many members are taking traffic?*

*Q2. Check you Persists Records window, are the any persistence records?*

*Q3. Refresh you web page prior to the Age column reaching 120. What
happens?*

While the persistence recorded is still active **Disable** the member
you are persisted too and refresh the browser page.

*Q4. Could you access the web site? Why?*

While the persistence recorded is still active, go the member specific
menu of the member you are persisted too and do a **Force Offline** and
refresh the browser page.

*Q5. Could you access the web site? Why?*

.. IMPORTANT::

   Re-enable the pool members before continuing.