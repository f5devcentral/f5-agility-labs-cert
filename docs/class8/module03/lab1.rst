Working with Analytics (AVR)
============================

AVR Lab Setup - Verify provisioning, iRules and Data Group
----------------------------------------------------------

In this task you prep the BIG-IP for the Application Visibility and
Reporting (AVR) lab. In the interest of time AVR has already been
provisioned, a data group has been built and two iRules have been
prepopulated on the BIG-IP.

AVR is **NOT** provisioned by default, but should be already be
provisioned on this BIG-IP. You can verify this by going to **System >>
Resource Provisioning**. Application Visibility and Reporting should be
set to Nominal.

*Q1. What resources does AVR require to be provisioned?*

Go to **Local Traffic > iRules > iRules List** and select **Data Group
List** from the top-bar

A **Data Group** named **user\_agents** has already been created for
you.

+--------------+-------------+
| **String**   | **Value**   |
+==============+=============+
| agent        | IE9         |
+--------------+-------------+
| agent1       | IE11        |
+--------------+-------------+
| agent2       | IE11        |
+--------------+-------------+
| agent3       | Chrome      |
+--------------+-------------+
| agent4       | Firefox     |
+--------------+-------------+
| agent5       | Safari      |
+--------------+-------------+
| agent6       | iPhone5     |
+--------------+-------------+
| agent7       | iPhone6     |
+--------------+-------------+
| agent8       | iPhone6     |
+--------------+-------------+
| agent9       | Android     |
+--------------+-------------+

To save time and typing errors, the iRules required for this lab have
already been configured on the BIG-IP. Find the iRules below under
**Local Traffic > iRules > iRule List** and verify the iRules exist.
We use these iRules to modify traffic and give Analytics something
interesting to see.

**random\_client\_ip** - randomizes the client IPs and user agents using
the data group you built::

   when CLIENT_ACCEPTED {
   # Create a random IP address and use it to replace the client IP to simulate many clients
   # going through the virtual
      snat [expr int(rand()*255)].[expr int(rand()*255)].[expr int(rand()*255)].[expr int(rand()*254)]
      virtual avr_virtual2
   }
   when HTTP_REQUEST {
   # When the HTTP request comes in, select a random user agents and put that agent
   # in the user-agent HTTP header to simulate many different user agents
      set my_index [expr int(rand()*10)]
      set user_agent [class element -value $my_index user_agents]
         HTTP::header replace user-Agent $user_agent
   }

*Q2. Review the iRule, what profiles are required on the virtual server?*

**delay_server** - introduces delay into server-side traffic::

   when LB_SELECTED {
   # After a member has been selected by the load balancing algorithm introduce delay
   # (in milliseconds) on the specified URL or server
      if {([LB::server addr] equals "10.1.20.13") and ([HTTP::uri] equals "/welcome.php")} { after 10}
	
      if {[LB::server addr] equals "10.1.20.13"} {after 20}
   }

*Q3. Review the iRule, what profiles are required on the virtual server?*

Create an Analytics Profile
---------------------------

Create an analytics profile that will be used with a virtual server.

In the Configuration Utility, open the **Local Traffic > Profiles >
Analytics** page, and then click **Create**.

Create an analytics profile using the following information, and then
click **Finished**.

+--------------------------+-----------------------------------------+
| **Profile Name**         | custom_analytics                        |
+==========================+=========================================+
| **Collected Metrics**    | Max TPS Throughput                      |
|                          |                                         |
|                          | Page Load Time                          |
+--------------------------+-----------------------------------------+
| **Collected Entities**   | URLs                                    |
|                          |                                         |
|                          | Countries                               |
|                          |                                         |
|                          | Client IP Addresses                     |
|                          |                                         |
|                          | Client Subnets                          |
|                          |                                         |
|                          | Response Codes                          |
|                          |                                         |
|                          | User Agents                             |
|                          |                                         |
|                          | Methods                                 |
+--------------------------+-----------------------------------------+
 
Create a Web Application
------------------------

.. NOTE:: 

   The **avr_virtual2** destination address is the default gateway of the web servers.

.. list-table::
   :widths: 40 30

   *  - Name 
      - **avr_virtual2**
   *  - Destination Address
      - **10.1.20.240**
   *  - Service Port
      - **80 (HTTP)**
   *  - Configuration
      - **Advanced**
   *  - HTTP Profile
      - **http**
   *  - Source Address Translation
      - **Auto Map**
   *  - Analytics Profile
      - **custom_analytics**
   *  - iRules 
      - **delay_server**
   *  - Default Pool 
      - **www_pool**
 
Create another virtual server using the following information, and then
click Finished.

.. NOTE:: 

   Within the iRule attached to this virtual you are pointing traffic to the virtual server you created above, so avr_virtual2 had to be created first.

.. list-table::
   :widths: 40 30

   *  - Name 
      - **avr_virtual1**
   *  - Destination Address
      - **10.1.10.90**
   *  - Service Port
      - **80 (HTTP)**
   *  - HTTP Profile
      - **http**
   *  - iRules 
      - **random_client_ip**

Visit the Web Site to Generate AVR Data 
---------------------------------------

Use a web browser to access the virtual server, and then view the
**Analytics** statistics.

Use a new tab to access **http://10.1.10.90**. It is recommended you use
private browsing.

Type **<Ctrl>F5** several times to refresh the page. Do this for each of
the next steps.

Click the **Welcome** link, and then click the banner at the top of the
page to return to the home page.

Click the **Stream Profile Example** link. Click the banner at the top
to return to the home page.

Click on the **Multiple Stream Example** link. Click the banner at the
top of the page to return home.

Click the **Request and Response Headers** link. Click the banner at the
top of the page to return home.

Close the F5 vLab Test Web Site tab.

Open the **Statistics > Analytics > HTTP > Overview page**.

.. HINT::

   If you don't see anything, set your Auto Refresh to 1 minute. It may
   take up to 5 minutes for analytics data to load.

View the Analytics Reports
--------------------------

Use the **Analytics** page to view statistics information on the BIG-IP
system.

In the Configuration Utility, refresh the **Statistics > Analytics >
HTTP > Overview** page until you see statistics.

Once you have data set the **Override** time range to list box, select
**Last Hour**.

Open the **Transactions** page from the top bar. Let's review some of
the various data compiled.

From the **View By** list box, select **Pool Members**.

From the **View By** list box, select **URLs**.

From the **View By** list box, select **Response Codes**.

Users are complaining of intermittent slow responses.

Open the **Latency > Server Latency** page, and then from the **View
By** list box, select **Pool Members**.

*Q1. Does a particular pool member seem to be an issue?*

In the **Details** section, click **10.1.20.13:80**, and then from the
**View By** list box, select **URLs**.

Go to **Transactions**.

*Q2. What country has the most transactions?*

*Q3. What are the top two User Agents?*
