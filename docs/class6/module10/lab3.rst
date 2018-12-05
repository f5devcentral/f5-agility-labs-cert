Traffic Groups
==============

Build a New Traffic Group.
--------------------------

You are now going to build an active-active cluster by creating a new
traffic-group and forcing that traffic group to run on the Standby
BIG-IP.

On your **Active** BIG-IP, go to **Device Management > Traffic Groups** and
create a new traffic group called **tg-2**.

Place the **www\_vs** in the new **tg-2** traffic group.

Remember you place virtual address, not virtual servers, in a traffic
group.

Go the **Virtual Server List**, note the IP address of **www\_vs** and
select **Virtual Address** from the top bar.

Under the **Virtual Address** select the traffic group you want to
assign it to, **tg-2**.

*Q1. When you did this, what other virtual servers were assign to tg-2?*

On the **Active** BIG-IP, under **Device Management** select **tg-2**
note the **Next Active Device** and **Force to Standby**.

*Q2. What are the states of you BIG-IPs?*

Browse to **http://10.1.10.100** and ftp to **10.1.10.100**.

*Q3. Did the web site work? What was the client IP? Did ftp work? Why or
why not?*

It is important to get all the listeners that support an application
into the same traffic group.

Go to your ftp SNAT pool and note the address, then go to the **SNAT
Translation List** select the IP and place it in **tg-2**.

FTP to **10.1.10.100**.

*Q4. Did it work now?*
