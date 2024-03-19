2.03 - Determine how to perform basic device configuration
==========================================================

NTP is essential for a number of BIG-IP functions, in particular, when
creating Device Service Clusters. DNS configured on the BIG-IP can also
be of value.

Configure DNS and NTP
---------------------

.. NOTE::

   The BIG-IP DNS has been preconfigured in the UDF environment

Go to **System > Configuration > Device > General**

Using the **Device** dropdown on the top-bar you can select DNS and NTP configuration UIs. 

Configure DNS to use **8.8.8.8** Google open DNS server and verify it
works. In BIG-IP command line terminal window test DNS from the CLI or
TMSH enter::

   dig pool.ntp.org

Now that you've configure DNS, configure NTP using **pool.ntp.org**.

Configure VLAN tagging
----------------------

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
