Lab 6: Device Service Clusters (DSC) 
====================================

.. important::

   To save costs this lab is NOT available in the AWS lab environment.  It may be added in the future.
   
To familiarize you with the concept of Device and Traffic Groups as well
as the building of Active-Standby, Active-Active BIG-IP pairs. While
there is a wizard, for this lab configuration will be done manually. The
wizard will only build A/S HA groups, to build Active-Active and beyond
a pair you will need to know the four steps to add a device object to a
cluster. This lab is based on the Device/Traffic Group lab in the V11
update course.

Base Networking and HA VLAN
~~~~~~~~~~~~~~~~~~~~~~~~~~~

You will be creating a high availability cluster using the second BIG-IP
(**bigip2)** in your lab , so let’s prep our current BIG-IP and we will
be creating a high availability VLAN.

1. On **bigip01.f5demo.com** archive your configuration in case you need
   to revert.

a. Go to **System > Archives** and create a new archive.

b. You will be using your third interface (1.3) for Network Failover and
   ConfigSync. This requires certain ports to be open on the Self IP;
   TCP port 4353 for ConfigSync and TCP port 1026 for Network Failover
   and TCP port 6699 for the Master Control Program.

   i.  Build a new untagged VLAN **ha_vlan** on interface **1.3**

   ii. Add a self-IP address to the VLAN, **10.1.30.245** net mask
       **255.255.255.0.**

       1. Under **Port Lockdown**, select **Allow Default**, to open
          ports required for HA communications.

          a. Optionally you could select: **Allow Custom** and add TCP
             ports 4353,1026 and 6699

1. Go to **https://10.1.1.246** which is **bigip02.f5demo.com** and
   login with the credentials **admin/f5UDFrocks!**.

   a. **bigip02** has already been licensed and provisioned. You will
      need to set up the base networking.

+----------------+----------------+-----------------+-----------------+
| **Interface**  | **Untagged     | **Self IP**     | **Netmask**     |
|                | VLAN**         |                 |                 |
+================+================+=================+=================+
| 1.1            | client_vlan    | 10.1.10.246     | 255.255.255.0   |
+----------------+----------------+-----------------+-----------------+
| 1.2            | server_vlan    | 10.1.20.246     | 255.255.255.0   |
+----------------+----------------+-----------------+-----------------+
| 1.3            | ha_vlan        | 10.1.30.246     | 255.255.255.0   |
+----------------+----------------+-----------------+-----------------+

b. On the **ha_vlan** ip configure set **Port Lockdown** to **Allow
   Default**

c. Build the default gateway destination **0.0.0.0**, mask **0.0.0.0**,
   gateway ip address **10.1.10.1**

d. What is the status your BIG-IPs? Check the upper left-hand corner
   next to the F5 ball.

Configure HA
~~~~~~~~~~~~

1. **On each BIG-IP**, prior to building the Device Trust it is
   recommended renewing the BIG-IP self-signed certificate with valid
   information and re-generating the local Device Trust certificate.

a. Under **System > Device Certificate > Device Certificate** select the
   **Renew…** button

   i.   **Common Name**: <the Hostname of the BIG-IP in the upper left
        corner>

   ii.  **Country**: United States (or your country of preference)

   iii. **Lifetime**: 3650

        1. Lifetime is important, if your cert expires your HA setup
           will fail.

   iv.  Select **Finished**. Your browser will ask to exchange certs
        with the BIG-IP again.

b. Under **Device Management > Device Trust > Local Domain** select
   **Reset Device Trust…**

i. In the **Certificate Signing Authority** select **Generate New
   Self-Signed Authority** and hit **Update**.

2. **On each BIG-IP** configure the device object failover parameters
   the BIG-IP will send to other BIG-IPs that want to be a part of a
   sync-only or sync-failover group.

   a. Under **Device Management>Device**, select the local BIG-IP. It
      will have the **(Self)** suffix.

      i.  Under **Device Connectivity** on the top bar select:

          1. **ConfigSync**

          2. Use the Self IP address of the HA VLAN for your **Local
             Address**.

      ii. **Network Failover**

          1. In the **Failover Unicast Configuration** section select
             the **Add** button

          2. Use the Self IP address the HA VLAN for your **Address**

          3. Leave the **Port** at the default setting of 1026

          4. **Note:** Multicast is for Viprion chasses only.

      i. **Mirroring**

         1. **Primary Local Mirror Address**: use the Self IP address of
            the HA VLAN for your

         2. **Secondary Local Mirror Address:** None

7. On **bigip01.f5demo.com** build the Device Trust.

   a. Under **Device Management>Device Trust> Device Trust Members** and
      select **Add** to add other BIG-IP(s) you will trust.

      i.   **Device IP Address**: <management IP address of the BIG-IP
           to add>

           1. You could use any Self IP if the out-of-band management
              interface is not configured.

      ii.  Enter the Administrator Username and Password of the BIG-IP
           you are trusting.

      iii. Select **Retrieve Device Information**

           1. The certificate information and name from the other BIG-IP
              should appear

           2. Select **Device Certificate Matches**

      iv.  Select **Add Device**.

           1. On each BIG-IP check the other BIG-IP in the **Peer
              Authorities** list. **Is all the information there?**

..

   .. image:: /_static/101/image66.png
      :width: 4.5974in
      :height: 0.53243in

v. If some information is missing delete the trust and try again.

..

   .. image:: /_static/101/image67.png
      :width: 4.51948in
      :height: 0.50506in

vi. What are the statuses of your BIG-IPs now?

    1. They should be **In Sync**. But wait! We haven’t even created a
       device group! But remember the **Device Trust** creates a
       **Sync-Only** group for the certificates under the covers
       (*device-trust-group*) and that should be in sync.

    2. Click on **In Sync** in the upper right corner or **Device
       Management>Overview** to see the **device_trust_group**.

8. On bigip01.f5demo.com create a new **Sync-Failover** device group

   a. **Under Device Management>Device Groups** create a new device
      group.

      i.    **Name:** my-device-group

      ii.   **Group Type**: Sync-Failover

      iii.  Add the members of the group to the **Includes** box and
            select **Finished**.

      iv.   Check **Device Groups** on each BIG-IP.

      v.    Did you have to create the Device Group on the other BIG-IP?

            1. Is the full configuration synchronized yet? (No! Only the
               Device Group is sync’d)

      vi.   What is your sync status?

            1. It should be **Awaiting Initial Sync**

      vii.  Click on the sync status or go to **Device
            Management>Overview** (or click on **Awaiting Initial**
            Sync) of the BIG-IP with the **good/current** configuration.

      viii. Click the device with the configuration you want to
            synchronize. **Sync Options** should appear.

      ix.   **Push the selected device configuration to the group**. It
            could take up to 30 seconds for synchronization to complete.

            1. What are the statuses of your BIG-IPs? Do you have an
               active-standby pair?

            2. Are the configurations the same?

9. Now that you have created your HA environment. HA selections will
   show up for SNAT addressed (not tied to your base network),
   persistence profiles and connection mirroring on virtual servers.

   a. Go to your **Active** BIG-IP.

   b. Go to your persistence profile **my-src-persistence** and check
      the **Mirror Persistence** box.

   c. Go to your **www_vs** virtual server and set the **Default
      Persistence Profile** to **my-src-persistence.**

   d. Synchronize your changes. Did the changes sync?

   e. On each BIG-IP go to **Module Statistics > Local Traffic** and
      bring up the persistence record statistics.

      i.  Go to the home page of you www_vs web service
          (`http://10.1.10.100 <http://10.128.10.100>`__). Refresh a few
          times.

      ii. Check the persistence records on each of your BIG-IPs, you
          should see the records are mirrored on each device.

1. Go to **Device Management>Traffic Groups**. As you can see the
   default traffic group “\ **traffic-group-1**\ ” already exists.

   a. Select **traffic-group-1**, check out the page information and
      then select **Force to Standby**.

   b. What are the statuses of your BIG-IPs? Go to your web page. What
      is the client IP?

   c. Go to your self-IP addresses. What traffic group are they in? What
      does it mean?

   d. Archive your work.

Bonus Lab – Traffic groups, iApps and Active-Active
===================================================

If you have time this is a bonus lab. Here you will create a new traffic
group. You will use iApps to an create a new HTTP application that
resides in that address group and you will create a floating IP address
that will be used as the default gateway that also resides in that
traffic group.

Building a new traffic group and floating IP.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. On you **Active** BIG-IP, go to **Device Management>Traffic Groups**
   and hit Create.

   a. Use the f5.http template, which was designed for general web
      services

      i.  **Name**: iapp_tg

      ii. Take the defaults for the rest.

2. Add a floating SelfIP to the **server_vlan**. Go to **Network>Self
   IP**

   a. **Name:** server_gateway

   b. **IP Address:**\ 10.1.20.240

   c. **Netmask:** 255.255.255.0

   d. **VLAN/Tunnel:** server_vlan

   e. **Traffic Group:** iapp_tg (floating)

Building an HTTP application using an iApp template.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Go to **iApp>Application** **Services** and hit **Create**.

   a. Use the f5.http template, which was designed for general web
      services

      i.   Set the **Template Selection** to **Advanced.**

      ii.  **Name**: my_new_iapp

      iii. **Traffic Group:** iapp_tg (floating)

           1. You will have to uncheck the **Inherit traffic group from
              current partition / path**.

      iv.  Under **Template Options**

1. Select the **Advanced – Configure advanced options** for the
   configuration mode.

   i. Under **Network**

1. **How have you configured routing on your web servers?:** Servers
   have a route to the clients through the BIG-IP system.

   a. In other words, the BIG-IP is the default gateway for the servers.

   b. Otherwise the template would use SNAT by default.

   i. Under **Virtual Server and Pools**

1. Your virtual server IP is **10.1.10.110**

2. Your hostname will be `www.f5demo.com <http://www.f5agility.com>`__
   because you have to put one in.

3. Create a new pool with the members **10.1.20.14:80** and
   **10.1.20.15:80**

   a. **If you hit add after the last pool member and have a new row,
      you will need to delete the row prior to finishing.**

   i. Hit **Finished** at the bottom of the page.

2. Go to **iApp>Application Services** and select the new application
   you created.

   a. Select **Components** from the top bar.

      i.  Here you will see all the configuration items created by the
          iApp

      ii. Do you see anything created that you weren’t asked about?

3. Remember the concept of strictness? Let’s test that out.

a. Go to Local Traffic>>Pools>>Pool List

i.  Select the pool created by your iApp **my_new_iapp_pool**

ii. Attempt to add **10.1.20.13:80** to your **my_new_iapp_pool**.

    1. Did it fail?

b. Go to your iApp and select Reconfigure from the top bar.

i.  Now attempt to add your new pool member.

ii. You can check the Components tab to verify your success.

**SYNCHRONIZE YOUR CHANGES**

Active-Active Setup
~~~~~~~~~~~~~~~~~~~

1. Now, let’s make our sync-failover group active-active. On the
   **Active** BIG-IP:

   a. Go to **Device Management > Traffic Groups**

      i.  Go to you **iapp_tg** traffic group.

      ii. Under **Advanced Setup Options**

          1. You are going to set up **iapp_tg** to prefer to run on
             **bigip02.f5demo.com** and auto failback to **bigip02** if
             **bigip02** should go down and come back up later.

          1. Is this normally a good idea?

      i.   **Failover Method:** HA Order

      ii.  **Auto Failback:** <checked>

      iii. **Failover Order:** **bigip02.f5demo.com**\ then
           **bigip01.f5demo.com**

      iv.  Ensure you synchronized the change to the other BIG-IP.

10. If the traffic group is active on the wrong BIG-IP initially you
    will have to do a Force to Standby on the traffic group to make it
    active on BIG-IP you want it on by default.

    a. What is the ONLINE status of each of your BIG-IPs

    b. Reboot the BIG-IP with your second traffic group on it. Watch to
       see if the becomes active on other BIG-IP during the reboot and
       if it falls back to the Default Device once the BIG-IP has come
       back up.

    c. You can verify this by checking your traffic groups or going to
       the web server and looking at the client IP.