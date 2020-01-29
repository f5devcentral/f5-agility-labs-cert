Basic Monitoring
================

Default Monitors
----------------

You will be setting up a default monitor to test any node created. You
can also choose to use custom monitors and monitor on a per node basis.

Go to **Local Traffic > Nodes**, note the status nodes.

As you can see the nodes in this table, even though they were never
specifically configured in the Node portion of the GUI. Each time a unique IP
address is placed in a pool a corresponding node entry is added and
assigned the default monitor, if configured.

Also note, the node status is currently a blue square (**Unchecked**).

*Q1. What would happen if a node failed?*

Select the **Default Monitors** tab.

Notice you have several options, for nodes you want a generic monitor,
so we will choose *icmp*.

Select **icmp** from **Available** and place it in **Active**.

Select **Node List** or **Statistics** from the top tab.

*Q2. What are your node statuses?*

Select **Statistics > Module Statistics > Local Traffic**

*Q3. What are the statuses of your nodes, pool and virtual server?*

Content Monitors
----------------

The default monitor simply tells us the IP address is accessible, but we
really don't know the status of the particular application the node
supports. We are now going to create a monitor to specifically test the
application we are interested in. We are going to check our web site and
its basic authentication capabilities.

Browse to **http://10.1.10.100** virtual server and select the **Basic
Authentication** link under **Authentication Examples**. Log on with the
credentials **user.1/password**.

.. HINT::

   You may have to scroll down the page to find the link.

You could use text from this page or text within the source code to test
for availability. You could also use HTTP statuses or header
information. You will be looking for the HTTP status **200 OK** as
the receive string to determine availability.

Note the URI is **/basic/**. You will need this for your monitor.

Select **Local Traffic > Monitor** on the side-bar and create and new
HTTP monitor called **www_test**.

.. list-table::
   :widths: 40 100

   *  - Name 
      - **www_test**
   *  - Type
      - **http**
   *  - Send String
      - **GET /basic/ \\r\\n**
   *  - Receive String
      - **200 OK**
   *  - User Name
      - **user.1**
   *  - Password
      - **password**

.. NOTE:: In case you were wondering, the receive string is NOT case sensitive.
 
   By default, in v11.x (which you are being tested on) the default HTTP monitor uses HTTP v1.0.  
   If you application required HTTP 1.1 you would require a different send string, something like
   **GET /basic/ HTTP/1.1 \\r\\n Host: <host name>\\r\\n\\r\\n**.
   
   An excellent reference for crafting HTTP monitors can be found on ASK F5 at https://support.f5.com/csp/article/K2167. 
   

Click **Finish** and you will be taken back to **Local Traffic > Monitors**

Do you see your new Monitor?

.. HINT:: 

   Check the lower right hand corner of the Monitors list, here you
   can go to the next page or view all Monitors. You can change the number of records 
   displayed per page in **System > Preferences**.

Go to **www\_pool** and replace the default **http** monitor with your
**www\_test** monitor.

*Q1. What is the status of the pool and its members?*

*Q2. Go to* **Virtual Servers** *or* **Network Map** *, what is the status of
your virtual server?*

Just for fun **Reverse** the monitor. Now when **200 OK** is returned it
indicates the server is not responding successfully.

*Q3. What is status of your pool and virtual server now?*

You can see where this would be useful if you were looking for a 404
(bad page) or 50x (server error) response and pulling the failed member
out of the pool.

.. WARNING::

   Be sure to un-reverse your monitor before continuing.
