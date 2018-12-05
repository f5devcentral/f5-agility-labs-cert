Virtual Server Packet Processing
================================

In this task you will create a wildcard virtual server and pool, test and observe various types of traffic under different configurations to determine how virtual servers
process new inbound connections. You will be using tcpdump from window1,
virtual server statistics, as well as a browser to determine behavior.

Create additional Virtual Servers
----------------------------------

Create **wildcard\_vs** **10.1.10.100:\*** with a **TCP** profile, **Automap** and a
pool named **wildcard\_pool** with the following member **10.1.20.11:\***

To create the wildcard pool, go to **Local Traffic > Pools > Pool List**
and select **Create**.

+---------------+------------------+
| **Name**      | wildcard\_pool   |
+===============+==================+
| **Address**   | 10.1.20.11       |
+---------------+------------------+
| **Port**      | \*               |
+---------------+------------------+

.. HINT::

   Don't forget to **Add** the pool member to the **New Members** box
   before you hit **Finished.**

To create the wildcard virtual server, go to **Local Traffic > Virtual
Server** and select **Create**.

+----------------------------------+--------------------+
| **Name**                         | **wildcard\_vs**   |
+==================================+====================+
| **Destination**                  | 10.1.10.100        |
+----------------------------------+--------------------+
| **Service Port**                 | \*                 |
+----------------------------------+--------------------+
| **Source Address Translation**   | Automap            |
+----------------------------------+--------------------+
| **Default Pool**                 | wildcard\_pool     |
+----------------------------------+--------------------+

Don't forget to hit **Finished.**

You were not required to enter the source addresses allowed. Go to your new virtual
server and look at the **Source** configuration to see what the default is for 
source addresses allowed.

Testing Virtual Server Packet Processing Behavior
-------------------------------------------------

Many of your virtual servers have the same virtual address. You will now
test various behaviors.

Clear virtual server stats.

Observe connection statistics (VS stats) after each of the following tasks.

Browse to http://10.1.10.100:8080

*Q1. Which VS is used for web traffic over port 8080?*

FTP to 10.1.10.100

*Q2. Which VS is used for FTP traffic?*

Browse to http://10.1.10.100

*Q3. Which VS is used for this web traffic the default HTTP port? What
port was used?*

Clear virtual server stats.

Modify the **wildcard\_vs** to only allow connections from a **Source**
of 10.1.10.0/24.

.. NOTE::
   The source address your jumpbox should be connecting from is 10.1.10.51

Browse to http://10.1.10.100

Observe connection statistics (VS stats)

*Q4. Which VS is used for web traffic?*

Clean up your modifications

Clear virtual server stats.

Modify **wildcard\_vs** to include the default **Source** of 0.0.0.0/0.
