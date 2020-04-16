Failover and Mirroring
======================

Testing Failover
----------------

Now that you have created your HA environment let's play with it. In
this lab, you will set up mirroring and perform failover and
synchronization of updates.

Ensure **bigip02** is the **Active** BIG-IP. If **bigip01** is the
**Active** BIG-IP then go to **Device Management >> Traffic Groups**.
Select **traffic-group-1** and hit the **Force to Standby** button.

Browse to **http://10.1.10.100**?

*Q1. What is the source IP in the* **Request Details**?

Browse to **http://10.1.10.115**?

*Q2. What happened? Why?*

The default gateway for the servers in the **secure\_pool** is
**10.1.20.240**. This IP is currently assigned to
**traffic-group-local-only** in **bigip01** and resides in the
**bigip\_base.conf**. We need this IP address to float to the active
BIG-IP upon failover. Because we are changing this from a base IP to a
floating IP you will encounter an error when trying to sync the configuration. Incremental updates are the default sync method, but sometimes a full overwrite is required.

On **bigip01**, open the self IP **server\_gw** (10.1.20.240) and
assign it to the default floating traffic group **traffic-group-1.**
Select **Changes Pending** or **Device Management** > **Oveview**.

From the **Overview** page, select **bigip01.f5demo.com**, select **Sync Device to
Group**, select **Overwrite Configure** and select **Sync**.

Browse to **http://10.1.10.115**.

*Q3. Did the site work? What was the client IP?*  

Browse to **http://10.1.10.100**.

*Q4. What was the client IP address that the server saw (under* **Request
Details** *on the main page)? Why?*

Failover the active BIG-IP by going to **Device Management  > Devices
>** **<device name> (self)** and at the bottom of the page select
**Force to Standby**. This is how a system level failover is performed.

*Q5. Does http://10.1.10.115 still work? What is the client IP?*

Mirroring
---------

Once you place a BIG-IP in a device group, mirroring selections will
show up for SNAT objects, persistence profiles and connection mirroring
on virtual servers. The BIG-IP will only mirror records created after
mirroring is enabled. Let's see how mirroring persistence works, as an
example.

Go to your **Active** BIG-IP.

Open you **www\_vs** virtual server and add **my-src-persist** as your
**Persistence Profile**.

On each BIG-IP go to **Module Statistics > Local Traffic** and bring up
the **Persistence Record** statistics.

Browse to **http://10.1.10.100**.

*Q1. Do you have a persistence record on each BIG-IP? What would happen
if you did a failover?*

Go to your persistence profile **my-src-persist** and check the **Mirror
Persistence** box.

Synchronize your changes.

On each BIG-IP go to **Module Statistics > Local Traffic** and bring up
the **Persistence Record** statistics.

SSH to your active BIG-IP and view your persistence records. In TMSH run
the following command::

   show /ltm persistence persistence-records

Note the CLI/TMSH prompt, you can find the sync status and the BIG-IP
state.

For this lab, if you have any persistence records delete them::

  delete /ltm persistence persistence-records

Browse to **http://10.1.10.100** and refresh the page few times.

Check the persistence records on each of your BIG-IPs, you should see
the records are mirrored on each device.

*Q2. If you had persistence records existing prior to mirroring would
they appear on the standby box?*

Go to **Device Management > Traffic Groups**. Select the default traffic
group **traffic-group-1** and check out the **Next Active Device**.

Refresh the web page at **http://10.1.10.100**, and in **traffic-group-1**,
select **Force to Standby**.

Browse or refresh **http://10.1.10.100**.

*Q3. Did you persist to the correct pool member? What is the client IP?*