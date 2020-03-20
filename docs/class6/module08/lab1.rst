Self IP Port Lockdown and more
==============================

Effects of Port Lockdown
------------------------

In the exercise, you will do some basic configuration of DNS and NTP and
work with port lockdown.

Working with port lockdown on self IPs.

Ping **10.1.10.245**

*Q1. Was echo response received?*

SSH to **10.1.10.245**

*Q2. Was ssh successful? Why not?*

Open **Network > Self IPs > 10.1.10.245** and change **Port Lockdown**
to **Allow Defaults**

SSH to **10.1.10.245**

Browse to **https://10.1.10.245**

*Q3. Did SSH work? Did browsing work?*

*Q4. What other ports are opened when you select* **Allow Defaults**.

Open **Network > Self IPs > 10.1.10.245** and change Port Lockdown to
**Allow Custom** and add **TCP** port **22**

SSH to **10.1.10.245**

Browse to **https://10.1.10.245**

*Q5. Did SSH work? Did browsing work?*

Configure DNS and NTP 
---------------------

NTP is essential for a number of BIG-IP functions, in particular, when
creating Device Service Clusters. DNS configured on the BIG-IP can also
be of value.

Configure DNS and NTP.

.. NOTE::

   The BIG-IP DNS has been preconfigured in the UDF environment

Go to **System > Configuration > Device > General**

Using the **Device** dropdown on the top-bar you can select DNS and NTP configuration UIs. 

Configure DNS to use **8.8.8.8** Google open DNS server and verify it
works. In BIG-IP command line terminal window test DNS from the CLI or
TMSH enter::

   dig pool.ntp.org

Now that you've configure DNS, configure NTP using **pool.ntp.org**.

VLAN Tagging
------------

Here you will set up multiple VLANs on the same interface and assign IP
addressing. You will be using one of these VLANs when you do the High
Availability lab.

Go to **VLANs** and create two **tagged** VLANs on interface **1.3**.

The first VLAN will be named **vlan-30** have a
tag of **30** and on interface **1.3** will be placed in the **Tagged** box.

The second tagged VLAN will be named **vlan-40** on interface **1.3** and have
a tag of **40**.

Make sure you place the interface into correct box.

Create a new self IP named **HA-IP** and **10.1.30.245/24** and assign
it to vlan **vlan-30**.

You will be using this IP address for building a device service cluster
in a later lab.
