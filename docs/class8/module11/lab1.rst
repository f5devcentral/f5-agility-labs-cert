2.07 - Determine how configuration changes affect existing and new connections
==============================================================================

Impact of configuration changes on connections
----------------------------------------------

Configuration changes to local traffic objects do not affect existing connections: https://support.f5.com/csp/article/K13253 

To demonstratte this behavior, let's try modifying a virtual server's SNAT configuration to ovserve the impact on the corresponding connections table for connections established before and after the change.

First, make sure your virtual server is configured with SNAT set to *none* and remove any connection limit that you might have configured in a previous lab exercise::

    modify ltm virtual ftp_vs connection-limit 0 source-address-translation { type none }

Open a *Command Prompt* on your Windows Jumpbox run the command: **ftp 10.1.10.100**. Keep the FTP connection open at the *User* prompt.

Next, while your FTP connection is still open, add SNAT to your virtual server's configuration::

    modify ltm virtual ftp_vs source-address-translation { type automap }

On your Windows jumpbox, open a new FTP connection to **10.1.10.100** from a new *Command Prompt*.

Compare the *Client Addr* values under the *ServerSide* columns for both the old and the new connections reported in your BIG-IP's connection table::
    
    show sys connection virtual-server ftp_vs

2.08 - Explain the uses of user roles, administrative partitions, and route domains
===================================================================================

Create a partition
------------------

Partitions are basically configuration containers. Users assigned to a
partition can only view their partition configuration and configuration items in the **Common** partition. Depending on their role a user may modify and create configuration items within their partition and use (but not modify) configuration items in
the common partition.

To create a new partition, go to **System > Users > Partition List** and
select create

Create a new partition named **my\_partition**. There is really not a
whole lot to it.

Create and place a user in a partition with a specific role
-----------------------------------------------------------

Create a new local user by going to **System > Users > User List** and
selecting create.

Create a new user **testuser** with **testpass** as the password and set
their **Role** to **Manager**, assign them to the **my\_partition**
partition and give them **tmsh Terminal Access**

Open a new private browser to the BIG-IP, or log out and log back in
under your current browser as the new user **testuser/testpass**.

*Q1. In the upper right of the BIG-IP WebUI what partition are you in?*

Look at the virtual servers. You can see these because they were all
built in the Common partition, but you cannot modify them. If you go
into a virtual server you will see the selections greyed out.

As you can see, you can view but not change things in common. But you
can use things in the **Common** partition to build your own configuration.

Build a new HTTP virtual server named **test\_vs**, with a destination
IP of **10.1.10.120** and used the **www\_pool** in the **/Common**
partition as the default pool.

In this case we are taking advantage of the **Common** partition nodes and
pools to build are virtual server.

Log out and log in as **admin** (or go to your other browser window that is
logged in as admin)

Go to the **Virtual Server List**.

*Q2. Do you see the* **test\_vs** *just created?*

Go to the upper right-hand corner and select **my\_partition**. You
can now see the **test\_vs** virtual server. Since you are an admin you
can also modify the virtual server as necessary

SSH to your BIG-IP and log in with the new user name and password.  You should be
taken directly into the **tmsh**.

Note the prompt, your partition name is there.

Now let's make a change to the test\_vs::

   mod ltm virtual test\_vs description "Partition Testing"

In the BIG-IP WebUI go to your **test_vs** virtual server.

*Q3. Do you see your change? Is your change permanent?*

.. NOTE::

    **The following lab portion is probably not on the 301, but as I have you playing with
    partitions this is something I feel you should know.**

SSH to the BIG-IP and log in as **root**. **cat** or **more** bigip.conf
and look for you **test\_vs** virtual::

   cat bigip.conf
   more bigip.conf

*Q4. Did you find it in /config/bigip.conf?*

Each partition gets its own "folder" where its configuration is stored
under the **partitions** directory in the **/config** directory. At the
BIG-IP CLI prompt::

   cd /config/partitions/test_partition
   ls
   cat bigip.conf

*Q5. Did you find your virtual server? Is the tmsh change you made in
there?*

As **testuser** at the tmsh prompt type: **save sys config**

Look at your **bigip.conf** in the **test_partition**.

**Q6. Do you see the change now?**

Attempt to exit tmsh to get to the Linux CLI.

*Q7. Where you able to?* 

2.09 - Determine how to deploy or upgrade vCMP guests and how the resources are distributed
===========================================================================================

* If in any doubt open a pre-emptive upgrade suppport case: https://support.f5.com/csp/article/K16022

Pre-Requisites
--------------

Please review the vCMP host and compatible guest version for vCMP.

https://support.f5.com/csp/article/K14088

Review the hardware/software compatibility matrix.

https://support.f5.com/csp/article/K9476


Upgrade path for systems that are Not Viprion
---------------------------------------------

For Systems that are not Viprions read the following guide for upgrading vCMP.
The guide provides detailed step by step information about how to upgrade a system (non VIPRION based)
that is running vCMP.

https://support.f5.com/csp/article/K75476930


Upgrade path for Viprion based systems running vCMP
---------------------------------------------------

For Viprion systems please read the following guide.
The guide provides detailed step by step information about how to upgrade a Viprion based system that is runnning vCMP.

https://support.f5.com/csp/article/K14166297

Please review the Viprion vCMP upgrade video

https://www.youtube.com/watch?v=ti2pOFdY8D0
