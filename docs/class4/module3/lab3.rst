System Configuration
====================

Licensing and the Service Check Date
------------------------------------

You can determine what the BIG-IP is licensed for in a number of ways on the **System >> License** page, on the **System >> Resource Provisioning** page, via TMSH or by viewing the ``/config/bigip.license`` file. 

Go to the license and provisioning pages and review the information. The **Resource Provisioning** page will show you which modules are provisioned.  A module must be licensed and provisioned for the module to be able to process application traffic.

One thing the license and provisioning pages do not show you is the **Service Check Date**.  The **Service Check Date** is vitality important when you are performing upgrades as date determines which BIG-IP upgrade are available to you.  Go into tmsh and run the show license command and find the **Service Check Date**.

.. admonition:: TMSH

    show sys license

Adding and modifying users
--------------------------

For purposes of reviewing authentication let's add a new user.  This user will have operator privileges and only be allowed access to the GUI.

.. NOTE::
    Operator privileges allows the user read only access to the BIG-IP TMUI and the ability to enable and disable pool members and nodes.

Go to **System >> Users >> User List** and select **Create**.  

+----------------------------------+------------------------------------+
| **Name**                         | opuser                             |
+----------------------------------+------------------------------------+
| **Password**                     | <your choice>                      |
+----------------------------------+------------------------------------+
| **Role**                         | Operator                           |
+----------------------------------+------------------------------------+

**Add** the Role to the Partition Access box.

.. NOTE::
   Note the default **Terminal Access** which is disabled.  This means *opuser* has no access to the BIG-IP CLI.  If you had selected **tmsh** when *opuser* SSH'd into the BIG-IP they would go directly to a TMSH prompt, but have no access to bash (linux).

Using a private browsing window (or log off and on) log on as *opuser*.  Go to the **www_pool**.  Note configuration fields are greyed out. Attempt to diable and enable a pool member.

Check the logs
--------------

Go to **System >> Logs >> Local Traffic**  and check the logs to see the notices.

.. HINT::
   If you click the arrow on the **Timestamp** column you can move the latest log entries to the top.

Go to **System >> Logs >> Audit** and search on **opuser**. 

Attempt to SSH to the BIG-IP as *opuser*.

Check DNS and NTP are configured and functioning
------------------------------------------------

Go to **System > Configuration > Device > General** and review the
DNS and NTP setting

In BIG-IP command line terminal window (window2) check to see if DNS is running and test DNS from the CLI or TMSH enter:

.. code-block:: bash

   tmsh show sys dns
   dig pool.ntp.org

.. admonition:: TMSH

   show sys dns  
   run util dig pool.ntp.org


In BIG-IP command line terminal window (window2) check to see if NTP is running and test connectivity to the NTP server:

.. code-block:: bash
   
   tmsh show sys ntpd
   ntpq -np