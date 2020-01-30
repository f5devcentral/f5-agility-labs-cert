Inband Monitors
===============

In this exercise, you need to limited the amount of monitor traffic to
your back in servers. You will use the basic inband monitor, but you
would like the servers to come up faster than default of 5 minutes. 
You will combine Inband and Active monitors to accomplish this.

Create an Inband monitor and Active monitor with an Up Interval
---------------------------------------------------------------

Create an inband monitor named **my\_inband**.  Use all the defaults.

Note the 300 second retry timer, after 3 failures in a 30 second period the
BIG-IP will mark the member down and will not check the member again for
5 minutes.

Create a new custom monitor as the active monitor. Make the monitor an **http** monitor called **active\_http**, with an **Up Interval** of **60** seconds and a **Time Until Up** of **30** second.

Assign the Inband monitor to a pool and test
--------------------------------------------

You are going to begin by removing the current monitors for the
**www\_pool** and replacing them with the **my\_inband** monitor only.

Go to the **www\_pool** and remove all monitors and **Update**. Your
pool members show now be **Unchecked**.

*Q1. What is the status of the* **www\_pool** *and* **www\_vs**
*configuration objects? Is the web site accessible? Why?*

Add the **my\_inband** monitor to the **www\_pool**.

*Q2. What are the status of* **www\_pool** *and* **www\_vs**? *Can you access
the web site?*

Let's simulate a failure. Open a new browser tab to
**https://10.1.1.252:10000** this will bring you to **Webmin** on the
back-end server::

   Username: root 
   Password: default

Under **Servers** on the side-bar, select the **Apache Webserver** link.
In the upper right corner select the **Stop Apache** link. This will
effectively bring the web sites down.

Go to your pool statistics. After 30 seconds what is the status of the
**secure\_pool** and **www\_pool?**

*Q3. Why is the* **www\_pool** *still showing up?*

Attempt to access **http://10.1.10.100** and refresh several times.

*Q4. What is the status of the* **www\_pool** *now?*

In the **Webmin** tab, in the upper right corner, select **Start Apache**.

Once Apache is started, refresh you pool statistics page. Then try to
browse to **http://10.1.10.100/**

*Q5. What are the pool statuses and why?*

It will be 300 seconds before the BIG-IP attempts to send any traffic to
the offline pool members.

Go to the **www\_pool** and add the **active\_http** monitor to the
pool.

Open a terminal window to BIG-IP and run the following tcpdump::

   tcpdump -nni server_vlan -X -s0 port 80

*Q6. How often to you see monitor traffic to the* **www\_pool**?

In the **Webmin** tab, **Stop Apache** again and attempt to browse
**http://10.1.10.100** and refresh several times. Check the status of your
pools. The **secure\_pool** and **www\_pool** should be offline.

*Q7. How often to you see monitor traffic to the* **www\_pool**?

In the **Webmin** tab **Start Apache**.

*Q8. Did the www\_pool come up within 30 seconds without client traffic?
What did the tcpdump show?*
