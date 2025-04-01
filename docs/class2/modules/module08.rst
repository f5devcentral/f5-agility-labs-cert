Lab 8: BIG-IP Monitoring
====================================




===============
Monitoring BIG-IP LTM Using Syslog and SNMP v3 with LibreNMS
==================================================================

This guide demonstrates how to configure Syslog and SNMP v3 on a BIG-IP LTM device
and integrate it with LibreNMS for monitoring.

Lab Environment
-----------------

The following components are available in the lab:

* **BIG-IP LTM** instance, accessible via SSH or GUI.

* **LibreNMS Server**, accessible and configured as a SNMP and syslog server.

* SNMP v3 credentials planned:

  * **Username**: *nms*
  * **Authentication Password**: *f5UDFrocks!*
  * **Authentication Alogrithm**: *SHA*
  * **Crypto Password**: *f5UDFrocks!*
  * **Crypto Alogrithm**: *AES*

Pre-Lab: Configure DNS and NTP
------------------------------

Before starting the monitoring configuration, ensure that the DNS and NTP are properly set up on the BIG-IP LTM device to ensure proper connectivity and time synchronization.

Step 1: Configure DNS
----------------------

DNS configuration allows the BIG-IP LTM to resolve domain names to IP addresses.

**Configure Using the GUI**

1. Navigate to: ``System > Device > Configuration > DNS``
2. Click **Add** and enter the following details:
   - **DNS Server**: ``10.1.1.1`` (or your DNS server IP)
3. Click **Update** to apply the changes.

.. image:: /_static/101//dns.png
   :width: 400

**Configure Using TMSH**

.. code-block:: bash

   tmsh modify sys dns name-servers add { 10.1.1.1 }
   tmsh save /sys config

Configure Using the GUI
------------------------

1. Navigate to: ``System > Device > Configuration > NTP``
2. Click **Add** and enter the following details:
   - **NTP Server**: ``10.1.1.1`` (or your NTP server IP)
3. Click **Update** to apply the changes.

.. image:: /_static/101//ntp.png
   :width: 400

Configure Using TMSH
---------------------
.. code-block:: bash

   tmsh modify sys ntp servers add { 10.1.1.1 }
   tmsh save /sys config  

Configuration Steps
-------------------

This guide covers the following steps:

1. **Enable Syslog**
2. **Enable SNMP v3**
3. **Add BIG-IP to LibreNMS**
4. **Verify Monitoring**

Step 1: Enable Syslog
------------------------

Syslog enables the BIG-IP LTM to send operational and system logs to an external logging service.

**Configure Using the GUI**

   ``System > Logs > Configuration > Remote Logging``

#. Click **Create** and enter the following details:

   - **Remote IP**: ``10.1.1.8``
   - **Remote Port**: ``514``
   - **Local IP**: ``10.1.1.4``

#. Click **Add**, then **Update** to save:

   .. image:: /_static/101//bigip-syslog.png
      :height: 400
      :width: 400

   - **Configure Using TMSH**

   .. code-block:: bash

      tmsh modify /sys syslog remote-servers add { remoteSyslog { host 10.1.1.8 remote-port 514 local-ip 10.1.1.4 } }
      tmsh save /sys config


#. Verify the configuration:

   .. code-block:: bash   

      tmsh list /sys syslog

.. image:: /_static/101//tmsh-syslog-setting.png
   :width: 400

Step 2: Enable SNMP v3
-------------------------

SNMP v3 provides secure authentication and optional encryption for tracking system metrics.


**Configure Using the GUI**

#. Navigate to:
   ``System > SNMP > Agent > Access (v3)``

#. Click **Add** and enter the following details:

   - **Username**: ``nms``
   - **Authentication Protocol**: ``SHA``
   - **Authentication Password**: ``f5UDFrocks!``
   - **Privacy Protocol**: ``AES``
   - **Privacy Password**: ``f5UDFrocks!``

#. Click **Finish** to save.

  .. image:: /_static/101//bigip-snmp-setting.png
     :height: 400
     :width: 400

#. Navigate to:
   ``System > SNMP > Agent > Configuration``

#. Enter the LibreNMS IP address in the Address field, and click Add, and Update.

   .. image:: /_static/101//bigip-agent-setting.png
      :width: 400

   - **Configure Using TMSH**

      .. code-block:: bash

         tmsh modify sys snmp users add { nms { username nms oid-subset 1 auth-protocol sha auth-password f5UDFrocks! privacy-protocol aes privacy-password f5UDFrocks! } }
         tmsh modify sys snmp allowed-addresses add {10.1.1.8}
         tmsh save /sys config

#. Verify the SNMP configuration:

   .. code-block:: bash

      tmsh list /sys snmp users

  .. image:: /_static/101//tmsh-snmp-setting.png
     :width: 400



Step 3: Add BIG-IP to LibreNMS
---------------------------------------

#. Log in to LibreNMS.

   - Click the ``NMS device's > Access > NMS``
   - Log in with username: ``admin`` and password: ``f5UDFrocks!``


#. Navigate to ``Devices > Add Device``.

#. Enter the following configuration:

   * **Hostname or IP**: ``10.1.1.4``
   * **SNMP Version**: ``v3``
   * **Port Association Mode**: ``IfName``
   * **SNMPv3 Configuration**:

     * **Auth Level**: ``authPriv``
     * **Auth User Name**: ``nms``
     * **Auth Password**: ``f5UDFrocks!``
     * **Auth Alogrithm**: ``SHA``
     * **Crypto Password**: ``f5UDFrocks!``
     * **Crypto Alogrithm**: ``AES``

#. Click **Add Device**.

.. image:: /_static/101//LibreNMS-bigip01.png
   :height: 400
   :width: 400

Step 4: Verify Monitoring
-------------------------

Verify that logs and metrics are collected correctly.

Syslog Verification:
***********************

#. Generate test logs from BIG-IP:

   .. code-block:: bash

      logger -p local0.notice "Test message for monitoring lab"

#. Check your syslog on the LibreNMS server for entries from BIG-IP.

   - Click ``Overview > Dashboard > Default``
   - The test syslog is searchable in the syslog panel

   .. image:: /_static/101//nms-syslog.png


SNMP v3 Verification:
**************************
#. Log in to LibreNMS.
#. Click ``Devices > All Devices`` 
#. Click the IP address of BIG-IP01 (10.1.1.4)

   .. image:: /_static/101//nsm-bigip-tab.png
      :width: 400

#. Confirm the following information is visible:

   - Hostname, device uptime, polling status, and device type.
   - IP address, hardware version, and software details.

.. image:: /_static/101//librenms-device-stats.png
   :height: 400
   :width: 400

Summary
-------

You have successfully configured Syslog and SNMP v3 on a BIG-IP LTM device and integrated it with LibreNMS for monitoring. Device logs and performance metrics—including CPU, memory, and network statistics—are now accessible in LibreNMS. You can leverage LibreNMS to track resource utilization and troubleshoot operational issues securely and effectively.