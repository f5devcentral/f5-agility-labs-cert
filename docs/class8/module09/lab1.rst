2.05 - Determine how to configure HA
====================================

Base Networking and HA VLAN for DSC (Device Service Cluster)
------------------------------------------------------------

You will be creating a high availability cluster using the second BIG-IP
(bigip2.f5demo.com) in your lab.  You'll begin by prepping **bigip01.f5demo.com** (your current BIG-IP) by creating a high availability VLAN that you will use to pass network polling, configuration changes and mirroring information between the two BIG-IPs.

.. WARNING::

   If you haven't already **archived** your work **DO IT NOW!**

Begin by making sure the base network configuration is created on both
devices.

Prepare bigip01
~~~~~~~~~~~~~~~

On **bigip01.f5demo.com** (10.1.1.4), this should already have been
accomplished. You will be using interface 1.3 VLAN 30 and IP 10.1.30.245
for Network Failover and ConfigSync and Mirroring.

High availability requires certain ports to be open on the Self IP; TCP port 4353 for
ConfigSync and TCP port 1026 for Network Failover and TCP port 6699 for
the Master Control Program.

Go to you **10.1.30.245** self IP and set **Port Lockdown** to **Allow
Defaults**. This will ensure the ports we require are open.

Go to **https://10.1.1.5** which is **bigip02.f5demo.com** and login with
**admin/admin.F5demo.com**.

Prepare bigip02
~~~~~~~~~~~~~~~

Your second BIG-IP, **bigip02,** has already been licensed and minimal basic
setup has been completed. You need to make sure the appropriate base networking is configured on **bigip02**.

+-------------+----------------+------------------------+----------------+---------------+-----------------+------------------+----+
| Interface   | VLAN name      | Tag (blank untagged)   | Self IP Name   | Self IP       | Mask            | Port Lockdown    |    |
+=============+================+========================+================+===============+=================+==================+====+
| 1.1         | client\_vlan   |                        | client\_ip     | 10.1.10.246   | 255.255.255.0   | None             |    |
+-------------+----------------+------------------------+----------------+---------------+-----------------+------------------+----+
| 1.2         | server\_vlan   |                        | server\_ip     | 10.1.20.246   | 255.255.255.0   | None             |    |
+-------------+----------------+------------------------+----------------+---------------+-----------------+------------------+----+
| 1.3         | vlan-30        | 30                     | HA\_IP         | 10.1.30.246   | 255.255.255.0   | Allow Defaults   |    |
+-------------+----------------+------------------------+----------------+---------------+-----------------+------------------+----+

*Q1. What is the status your BIG-IPs?*

.. NOTE::

   Check the upper left-hand corner next to the F5 ball.

Prepare each BIG-IP for High Availability
-----------------------------------------

On each BIG-IP you will update the device and device trust certificate
and configured the failover IPs for each device.

On **EACH** BIG-IP, prior to building the Device Trust it is
recommended, but not mandatory, that you renew the BIG-IP self-signed
certificate with valid information and re-generate the local Device
Trust certificate.

Under **System >> Certificate Management >> Device Certificate Management >> Device Certificate** select the
**Renew** button.

**Common Name:** <the Hostname of the BIG-IP in the upper left corner>

**Country:** United States (or your country of preference)

**Lifetime:** 3650

.. IMPORTANT::

   Lifetime is important, when your certificate expires your HA setup will FAIL.
   You should always make sure you device certificate has a long lifetime.

Select **Finished**. Your browser will ask to exchange certs with the BIG-IP again.

Under **Device Management > Device Trust > Local Domain** select **Reset Device Trust**

In the **Certificate Signing Authority** select **Generate New Self-Signed Authority**.

On each BIG-IP configure the device object failover parameters the
BIG-IP will send to other BIG-IPs that want to be a part of a sync-only
or sync-failover group.

Under **Device Management > Device**, select the local BIG-IP. It will
have the (Self) suffix.

Under **Device Connectivity**:
   - On the top bar select **ConfigSync** and use the **HA-IP** for your **Local Address**.

Under **Network Failover**:
   - In the **Failover Unicast Configuration** section select the **Add** button

Use the Self IP address the **HA VLAN** for your Address and leave the **Port** at the default setting of **1026**.

*Q1. If you were to add multiple IP address to the Failover Unicast, when
would the BIG-IP failover?*

.. NOTE::
   Multicast is for Viprion chasses only.

Under **Mirroring**:
   - Primary Local Mirror Address: **<use the HA-IP>**
   - Secondary Local Mirror Address: **None**

.. IMPORTANT::

   On each BIG-IP archive your work in a UCS called: **lab11\_ha\_prep**

Build the Device Trust and Device Group
---------------------------------------

In the task you will build a trust between bigip01 and bigip02. Once the
trust between the devices is built you will be build a Sync-Failover
device group and place the BIG-IPs in the new group. You will build this
from bigip01 and sync its good configuration to bigip02.

On **bigip01.f5demo.com**, under **Device Management > Device Trust >
Device Trust Members** and select **Add**

**Device IP Address**: **10.1.1.5** <management IP address of the BIG-IP to add>

.. NOTE::
   You could use any Self IP if the out-of-band management interface is not
   configured and you have the appropriate ports (22 and 443) open as you build the trust.

Enter the **Administrator** username and password of the BIG-IP you are
trusting.

Select **Retrieve Device Information**

The certificate information and name from the other BIG-IP should appear

Click **Device Certificate Matches**, verify that the infomation is correct and click **Add Device**.

On each BIG-IP check the other BIG-IP in the Peer Authorities list.

*Q1. Is all the information there?*

.. WARNING::

   Occasionally some of the information is missing due to configuration errors or other failures.  If any of the information is missing delete the trust, correct the problem and try again.

*Q2. What are the statuses of your BIG-IPs now?*

They should be **In Sync**. ``But wait!`` We haven't even created a device
group! Remember the Device Trust creates a **Sync-Only** group for the
certificates under the covers (device-trust-group) for the trust.  It is the **device-trust-group** that is in sync.

On **bigip01.f5demo.com** create a new **Sync-Failover** device group

Under **Device Management > Device Group** create a new device group
named **my\_device\_group** with a type of **Sync-Failover**

Add the members of the group (bigip01 and bigip02) to the **Includes**
box and make sure the **Network Failover** *advanced* setting is checked/selected for this group.

Check **Device Groups** on each BIG-IP.

*Q3. Did you have to create the Device Group on the other BIG-IP?*

*Q4. Is the full configuration synchronized yet?*

*Q5. What is the status and sync status on the BIG-IPs?*

On your configured BIG-IP (bigip01), click on the sync status
(**Awaiting Initial Sync**) or go to **Device Management > Overview**.

.. WARNING::

   Click the device with the configuration you want to
   synchronize to the other BIG-IPs (that would be bigip01). The Sync
   Options should appear.

.. NOTE::

   You can push or pull a configuration from the device the cluster or the cluster to a device.  The warning above applies.  **Always** understand what BIG-IP you are on and which direction you are syncing.

**Sync Device to Group**. It could take up to 30 seconds for
synchronization to complete.

.. WARNING::

   During the **Awaiting Initial Sync** phase either BIG-IP can perform the synchronization and the other BIG-IP will be overwritten.

Check each BIG-IP **Device Management > Overview**.

*Q6. Did the configuration synchronize? What, if any, errors do you see?*

If you performed the AVR lab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you went through the optional AVR LAB#6, you might have encountered an error because of configuration dependencies with
**avr2\_virtual**. This is why building you device service cluster early
is a good idea, but you can't always do that. You could have a device
cluster pair that you are adding a third BIG-IP. You are going to have
to correct the error, synchronize and the re-add **avr\_virtual.**

If required, on **bigip01** delete the virtual server **avr\_virtual2.**

*Q7. Any issue with that?*

Maybe the easier route is to remove the iRule from **avr\_virtual1**
(which references **avr\_virtual2**), synchronize and then add it back.

*Q8. What is the sync status of bigip02 once you made the change?*

Sync **bigip01** to the group.

*Q9. Are the BIG-IPs In Sync? Are the configurations the same?*

Browse to **http://10.1.10.100**

*Q10. Could you access the site? Which BIG-IP passed the traffic?*

Place the **random\_client\_ip** iRule back on **avr\_virtual2** and
synchronize the changes.

Testing Failover
----------------

Now that you have created your HA environment let's play with it. In
this lab, you will set up mirroring and perform failover and
synchronization of updates.

Ensure **bigip02** is the **Active** BIG-IP. If **bigip01** is the
**Active** BIG-IP then go to **Device Management >> Traffic Groups**.
Select **traffic-group-1** and hit the **Force to Standby** button.

Browse to **http://10.1.10.100**.

*Q1. What is the source Client IP address in the* **Request Details**? Why?

On bigip01, remove SNAT on your **sercure_vs** virtual server and click **Update**.
Click the yellow **Changes Pending** warning at the top left of your screen next to the F5 ball and push the configuration from bigip01 to the group. 

Browse to **http://10.1.10.115** again with bigip02 active.

*Q2. What happened? Why?*

The default gateway for the servers in the **secure\_pool** is
**10.1.20.240**. This IP is currently assigned to
**traffic-group-local-only** in **bigip01** and resides in the
**bigip\_base.conf**. We need this IP address to float to the active
BIG-IP upon failover. Because we are changing this from a base IP to a
floating IP you will encounter an error when trying to sync the configuration.
Incremental updates are the default sync method, but sometimes a full overwrite is required (BIG-IP will prompt you to confirm when this occurs).

On **bigip01**, open the self IP **server\_gw** (10.1.20.240) and
assign it to the default floating traffic group **traffic-group-1.**
Select **Changes Pending** or **Device Management** > **Oveview**, select **bigip01.f5demo.com** and click **Sync**.

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

Open you **www\_vs** virtual server and select **my-src-persist** as your
**Default Persistence Profile**.

On each BIG-IP go to **Statistics >> Module Statistics > Local Traffic** and select
**Persistence Record** for the *Statistics Type*.

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

   show /ltm persistence persist-records

Note the CLI/TMSH prompt, you can find the sync status and the BIG-IP
state.

For this lab, if you have any persistence records delete them::

  delete /ltm persistence persist-records

Browse to **http://10.1.10.100** and refresh the page few times.

Check the persistence records on each of your BIG-IPs, you should see
the records are mirrored on each device.

*Q2. If you had persistence records existing prior to mirroring would
they appear on the standby box?*

On the active BIG-IP, go to **Device Management > Traffic Groups**. Select the default traffic
group **traffic-group-1** and check out the **Next Active Device**.

Refresh the web page at **http://10.1.10.100**, and in **traffic-group-1**,
select **Force to Standby**.

Browse or refresh **http://10.1.10.100**.

*Q3. Did you persist to the correct pool member? What is the client IP?*

Build a New Traffic Group
-------------------------

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

On the **Active** BIG-IP, sync your changes (push from active bigip to group), then go to **Device Management** select **tg-2**,
note the **Next Active Device** and click **Force to Standby**.

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
