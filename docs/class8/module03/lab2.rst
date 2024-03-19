1.05 - Choose virtual server type and load balancing type to fit application requirements
=========================================================================================

In this module you will look at the effects of load balancing methods and
configuration parameters on connection distribution to the pool members.

Ratio Load Balancing
--------------------

Go to **Local Traffic > Pools** and select **www\_pool** and then
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

.. HINT:: Consider removing **Persistance** on your virtual server's *Resources* settings...

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

   Remove all *HTTP Compression* and *Web Acceleration* profiles from the www\_vs virtual server (10.1.10.100).

Go to the **www\_pool** **Members** section. Make sure the load
balancing method is **Round Robin**.

Set the **Priority Group Activation** to less than **2** Available
Members.

Select the pool members **10.1.20.11:80** and **10.1.20.12:80** and set their
**Priority Group** to **10**.

Review your settings and let's see how load balancing reacts now.

Select the **Statistics** tab, reset the pool statistics, browse to
**http://10.1.10.100** and refresh several times.

*Q1. Are all members taking connections? Which member isn't taking
connections?*

Simulate a maintenance window or an outage by disabling pool
member **10.1.20.11:80** in the highest priority group. This should
cause low priority group to be activated, since number of active members
in our high priority group has dropped below 2.

*Q2. Is the lower priority group activated and now taking connections?*

.. IMPORTANT::

   Once you are done testing re-enable your disabled pool member.
