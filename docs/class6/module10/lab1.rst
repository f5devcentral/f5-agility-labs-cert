Building a DSC (Device Service Cluster)
=======================================

Base Networking and HA VLAN
---------------------------

You will be creating a high availability cluster using the second BIG-IP
(bigip2.f5demo.com) in your lab.  You'll begin by prepping **bigip01.f5demo.com** ( your current BIG-IP by creating a high availability VLAN that you will use to pass network polling, configuration changes and mirroring information between the two BIG-IPs.

.. WARNING::

   If you haven't already **archived** your work **DO IT NOW!**

Begin by making sure the base network configuration is created on both
devices.

Prepare bigip01
~~~~~~~~~~~~~~~

On **bigip01.f5demo.com** (10.1.1.245), this should already have been
accomplished. You will be using interface 1.3 VLAN 30 and IP 10.1.30.245
for Network Failover and ConfigSync and Mirroring.

High availability requires certain ports to be open on the Self IP; TCP port 4353 for
ConfigSync and TCP port 1026 for Network Failover and TCP port 6699 for
the Master Control Program.

Go to you **10.1.30.245** self IP and set **Port Lockdown** to **Allow
Defaults**. This will ensure the ports we require are open.

Go to **https://10.1.1.246** which is **bigip02.f5demo.com** and login with
**admin/admin**.

Prepare bigip01
~~~~~~~~~~~~~~~

Your second BIG-IP, **bigip02,** has already been licensed and the basic
setup completed. You need to make sure the BIG-IPs are provisioned the
same **(LTM and AVR)** and set up the base networking on **bigip02**.

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

Under **System > Device Certificate > Device Certificate** select the
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
Peer List** and select **Add**

**Device IP Address:** <management IP address of the BIG-IP to add>

.. NOTE:: 
   You could use any Self IP if the out-of-band management interface is not
   configured and you have the appropriate ports (22 and 443) open as you build the trust.

Enter the **Administrator** username and password of the BIG-IP you are
trusting.

Select **Retrieve Device Information**

The certificate information and name from the other BIG-IP should appear

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
box and check the **Network Failover** setting for the group.

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

You ended up with an error because of configuration dependencies with
**avr2\_virtual**. This is why building you device service cluster early
is a good idea, but you can't always do that. You could have a device
cluster pair that you are adding a third BIG-IP. You are going to have
to correct the error, synchronize and the re-add **avr\_virtual.**

On **bigip01** delete the virtual server **avr\_virtual2.**

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
