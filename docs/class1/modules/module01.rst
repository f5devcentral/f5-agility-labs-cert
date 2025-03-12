Lab 1: The Basics (Networking, Pools and Virtual Servers)
=========================================================

In this lab we will access the Management GUI. We will then create the
VLANs, and assign a self IP addresses to our VLAN. As mentioned during
our lecture portion, BIG-IPs may be put in-line or one-armed depending
on your customer’s requirements and topology.

Log on to the BIG-IP TMUI (GUI) Interface:
  - **UDF** - Under Components, select the **Access** drop-down and then **TMUI**

Creating VLANs
--------------

You will need create two untagged VLANs, one client-side VLAN (**client_vlan**) and one server-side VLAN (**server_vlan)** for the devices in your network.

1. From the sidebar select **Network** **> VLANs** then select
   **Create**

.. image:: /_static/101/image10.png
   :width: 3.29032in
   :height: 2.625in

a. Under **General Properties**:

   i. **Name**: client_vlan

b. The name is for management purposes only, you could name them after
   your children or pets

   i. **Tag**: <leave blank>

      1. Entering a tag is only required for “\ **Tagged**\ ” (802.1q)
         interfaces, “\ **Untagged**\ ” interfaces will automatically
         get a tag which is used for internal L2 segmentation of
         traffic.

c. Under **Resources** in the **Interfaces** section:

   i.   **Interface**: 1.1

   ii.  **Tagging**: Untagged

   iii. Select the **Add** button. Leave all other items at the default
        setting.

.. image:: /_static/101/image11.png
   :width: 2.39187in
   :height: 1.66681in

iv. When you have completed your VLAN configuration, hit the
    **Finished** button

.. important::
   Now create another untagged VLAN named **server_vlan** on interface **1.2.**

Assigning a Self IP addresses to your VLANs
-------------------------------------------

1. Go to **Network > Self IPs**, select **Create**.

.. image:: /_static/101/image12.png
   :width: 5.8125in
   :height: 3.08766in

a. Create a new self IP, for the **server_vlan** and **client_vlan**
   VLANs. In **Network >> Self IPs >> New Self IP**, under
   **Configuration** enter:

+---------------+---------------+---------------+
|    Option     |  Server-side  |  Client-side  |
+===============+===============+===============+
| Name          | server_ip     | client_ip     |
+---------------+---------------+---------------+
| IP Address    | 10.1.20.245   | 10.1.10.245   |
+---------------+---------------+---------------+
| Netmask       | 255.255.255.0 | 255.255.255.0 |
+---------------+---------------+---------------+
| VLAN          | server_vlan   | client_vlan   |
+---------------+---------------+---------------+
| Port Lockdown | Allow None    | Allow None    |
+---------------+---------------+---------------+

.. caution::
   A common mistake is to forgot to change the VLAN/Tunnel selection to the appropriate VLAN.  Make sure your self IPs are in the appropriate VLAN. 

- The default **Port Lockdown** setting of **Allow None** means the Self IP only responds to ICMP requests.
- The **Allow Defaults** selection opens the following on the self IP of the VLAN.
   - TCP: ssh, domain, snmp, https
   - TCP: 4353, 6699 (for F5 protocols, such as HA and iQuery)
   - UDP: 520, cap, domain, f5-iquery, snmp
   - PROTOCOL: ospf

b. When you have completed your selfIP configuration, hit the **Finished**
   button. You should have something similar to the following:

.. image:: /_static/101/image14.png
   :width: 5.84768in
   :height: 1.30208in

Assigning the Default Gateway
-----------------------------

1. Go to **Network > Routes** and then **Add**.

   a. Here is where we assign our default gateway (and other static
      routes as desired)

.. image:: /_static/101/image15.png
   :width: 3.96875in
   :height: 2.33043in

b. Under **Properties**

   i.   **Name**: def_gw

   ii.  **Destination**: 0.0.0.0

   iii. **Netmask**: 0.0.0.0

   iv.  **Resource**: Use Gateway…

   v.   **Gateway** **Address**: 10.1.10.1

   vi.  When you have completed defining your default gateway, hit the
        **Finished** button

1. Verify your network configuration

   b. Use SSH or WebShell (UDF Only) to access your BIG-IP.

      i.  Ping your default gateway, 10.1.10.1

      ii. Ping a web server at 10.1.20.11.

Creating Pools
--------------
In this lab we will build a pool and virtual serve to support our web
site and verify our configurations by accessing our web servers through
the BIG-IP. Verification will be performed visually and through various
statistical interfaces.

1. From the sidebar select **Local Traffic >>** **Pools** then select
   **Create**. Here we will create our new pool

.. image:: /_static/101/image16.png
   :width: 3.46998in
   :height: 3.07292in

a. Under **Configuration**:

   i.   **Name**: www_pool
          - The name is for management purposes only, no spaces can be used
   ii.  **Description**: <optional>

   iii. **Health** **Monitor**: http

b. Under **Resources**

   i.   **Load Balancing Method**: <leave at the default Round Robin>

   ii.  **Priority Group Activation**: <leave at default>

   iii. **New Members**:

+-------------+------------------+
| **Address** | **Service Port** |
+=============+==================+
| 10.1.20.11  | 80               |
+-------------+------------------+
| 10.1.20.12  | 80               |
+-------------+------------------+
| 10.1.20.13  | 80               |
+-------------+------------------+

1. As you enter each IP address and port combination hit **Add** button

c. When you have complete your pool configuration, hit the **Finished**
   button

.. image:: /_static/101/image17.png
   :width: 4.375in
   :height: 1.27287in

Creating Virtual Servers
------------------------

Now let’s build our virtual server

1. Under **Local Traffic** select **Virtual Servers** then select
   **Create**.

.. image:: /_static/101/image18.png
   :alt: C:\Users\RASMUS~1\AppData\Local\Temp\SNAGHTML5118b969.PNG
   :width: 3.71994in
   :height: 3.08333in

a. Under **General Properties**

   i.   **Name:** www_vs

   ii.  **Description**: <optional>

   iii. **Type:** Standard

   iv.  **Source/Address:** <leave blank>

        .. note:: The default is 0.0.0.0/0, all source IP address are allowed

   v.   **Destination** **Address/Mask:** 10.1.10.100

        .. note:: The default mask is /32

   vi.  **Service Port**: 80 or HTTP

b. Under **Configurations**

   i.  The web servers do not use the BIG-IP LTM as the default gateway.
       This means return traffic will route around the BIG-IP LTM and
       the TCP handshake will fail. To prevent this we can configure
       SNAT Automap on the Virtual Server. This will translate the
       client IP to the self IP of the egress VLAN and ensure the
       response returns to the BIG-IP.

   ii. **Source Address Translation**: Auto Map

  .. image:: /_static/101/image19.png
      :alt: C:\Users\RASMUS~1\AppData\Local\Temp\SNAGHTML58387b2.PNG
      :width: 2.97587in
      :height: 0.99517in

c. Under **Resources**

   i.   **iRules**: none

   ii.  **Policies**: none

   iii. **Default Pool**: From the drop down menu, select the pool
        (**www_pool**) which you created earlier

   iv.  **Default Persistence Profile**: None

   v.   **Fallback Persistence Profile**: None

1. When you have complete your pool configuration, hit the **Finished**
   button

2. You have now created a Virtual Server

.. image:: /_static/101/image20.png
   :width: 6.75892in
   :height: 1.44179in

.. note:: Items in the GUI that are blue are links ie. shortcuts

3. Now let’s see if our virtual server works!
     - **UDF** - from the ubu-jumpbox go to http://10.1.10.100
     - **AWS** - from your PC go to http://<Bigip1VipEipTo100> in your stack Output tab

   a. Open the browser to the Virtual Server you just created

   b. Refresh the browser screen several times (use “<ctrl>” F5)

.. image:: /_static/101/image21.png
   :width: 2.65963in
   :height: 1.40625in

a. Go to your BIG-IP and view the statistics for the **www_vs** virtual
   server and the **www_pool** pool and its associated members

c. Go to **Statistics > Module Statistics > Local Traffic**

   i. Choose **Virtual Servers** from drop down

.. image:: /_static/101/image22.png
   :width: 2.98593in
   :height: 1.44792in

a. Go to **Local** **Traffic>Virtual Servers>Statistics**

d. Go to **Local** **Traffic>Pools>Statistics**

   i.   Did each pool member receive the same number of connections?

   ii.  Did each pool member receive approximately the same number of
        bytes?

   iii. Note the Source and Destination address when you go to directly
        and through the virtual server

1. Let’s archive our configuration in case we have to fall back later.

   a. Go to **System >> Archives** and select **Create**.

      i. Name your archive **lab2_the_basics_net_pool_vs**

ExtraCredit!
------------

You can also review statistics via the CLI, simply SSH to the management
IP of your BIG-IP. Refer to your Student Information page and Network
Diagram for the IP address.

1. Check out the Linux CLI and TMSH

   a. Review the information of the following command:

      iii. **bigtop –n**

           1. Type **q** to quit.

   a. Take a look at the TMOS CLI, type “\ **tmsh**\ ” to enter the
      Traffic Management Shell.

      i.   (tmos)# **show ltm pool**

      ii.  (tmos)# **show ltm pool detail**

           1. show statistics from all pools

      iii. (tmos)# **show ltm virtual**

      iv.  (tmos)# **show ltm virtual detail**

           1. Show statistics of all virtual servers

2. Check out the Dashboard!

   a. Go to **Statistics>Dashboard**

.. image:: /_static/101/image23.png
   :alt: C:\Users\RASMUS~1\AppData\Local\Temp\SNAGHTML59e5bf2.PNG
   :width: 3.13542in
   :height: 1.81755in

2. Click the Big Red F5 ball. This will take you to the Welcome page.
   Here you can find links to:

   a. User Documentation, Running the Setup Utility, Support, Plug-ins,
      SNMP MIBs
