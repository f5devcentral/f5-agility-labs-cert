Packet Processing
=================

Open BIG-IP TMSH and TCPDump session
------------------------------------

#. In this task, you will open two SSH sessions to the BIG-IP. One for TMSH commands and the other for tcpdump of the client-side network.

#. Open PuTTY/terminal window (window1) to BIG-IP from the shortcut bar at the bottom of the jumpbox.

   .. code-block:: bash

      ssh root@10.1.1.4
      password: default.F5demo.com

#. Use tcpdump to monitor traffic from the client (10.1.10.199) destined to **ftp\_vs** (10.1.10.100)

   .. code-block:: bash

      tcpdump -nni client_vlan host 10.1.10.199 and 10.1.10.100

#. Open a second PuTTY/terminal window (window2) to BIG-IP and use **tmsh** to display the connection table.

   .. code-block:: bash

      ssh root@10.1.1.4
      password: default.F5demo.com

      tmsh

#. At the TMOS prompt **(tmos)#**

   .. code-block:: bash

      show sys connection

#. Do you see any connections from the jumpbox 10.1.10.199 to 10.1.1.4:22?

   *Q1. Why are the ssh management sessions not displayed in connection table?*

Establish ftp connection
------------------------

In this task you will open a third terminal window and establish an FTP session through the **ftp\_vs** virtual server. With the connection remaining open you will view the results in window1 (tcpdump) and window2 (tmsh).

#. Open a third command/terminal window (window3).  Use a Command Prompt from the JumpBox for this step.

   .. code-block:: bash

      ftp 10.1.10.100

#. It may take 15 to 20 seconds for the logon on prompt, just leave it at prompt to hold the connection open.

#. In window 1 you should see something similar to the tcpdump captured below.

   .. image:: /_static/201L/201ex211t2a-tcpdump.png

   *Q1. In the tcpdump above, what is client IP address and port and the server IP address port?*

#. In window2 (tmsh) run the **show sys conn** again, but strain out the noise of other connections (mirrored and selfIP) by just looking at connections from your jumpbox.

   .. code-block:: bash

      show sys conn cs-client-addr 10.1.10.199

#. The connection table on window2 will show the client-side and server-side connection similar to below:

   .. image:: /_static/201L/201ex211t2b-shsysconn.png

   *Q2. What is source ip and port as seen by ftp server in the example above?*

   *Q3. What happened to the original client IP address and where did 10.1.20.249 come from?*

.. HINT::
   You may have to review the configuration of **ftp\_vs** to determine
   the answer to question 3.

