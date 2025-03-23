Securing BIG-IP Self IPs Lab Guide
==================================

**Objectives:**

1. Understand Port Lockdown settings for Self-IPs.
2. Configure and test Firewall Rules for Self-IPs.
3. Interpret Port Lockdown settings and their impact.

Step 1: Setup Environment
--------------------------

#. **Create VLAN (Named internal)**:

   - Log in to the **TMUI** (BIG-IP web-based GUI) 
   - Navigate to **Network** -> **VLANs**.
   - Click **Create** to define a new VLAN.
   - Provide the following details:
   
      - **Name**: ``internal``
      - **Tag**: Leave blank for an untagged VLAN
      - **Interfaces**: Select the interface(s) to associate with the VLAN (e.g., ``1.2``).

   - Click **Finished** to create the VLAN.

   .. image:: /_static/101//vlan.png
      :width: 400

   **TMSH Method**:

   .. code-block:: bash

      tmsh create net vlan internal interfaces add { 1.2 }

#. **Create a Self IP**:

   - Navigate to ``Network`` -> ``Self IPs``.
   - Click **Create** to add a new self IP.
   - Provide the following details:
     
     - **Name**: ``Internal-self-IP``
     - **IP Address**: ``10.1.20.4``
     - **Netmask/Subnet**: ``255.255.255.0`` (adjust based on your network setup)
     - **VLAN**: Select the VLAN ``internal`` created earlier.
     - **Port Lockdown**: Set to ``Allow All``.

   - Click **Finished** to apply the configuration.

   .. image:: /_static/101//self-ip.png
      :width: 400

   **TMSH Method**:

   .. code-block:: bash

      tmsh create /net self Internal-self-IP address 10.1.20.4/24 allow-service all vlan internal


Step 2: Test Initial Access
---------------------------

1. Verify basic access from the Jumpbox using `curl`:

   .. code-block:: bash

      curl -k https://10.1.20.4

2. Run a port scan using `nmap` from the Jumpbox to identify open ports:

   .. code-block:: bash

      nmap 10.1.20.4 --max-retries 0

Step 3: List Current Port Lockdown Settings
-------------------------------------------

1. **TMUI Method**:

   - Log in to the BIG-IP Configuration Utility (TMUI).
   - Navigate to **Network** -> **Self IPs**.
   - Locate the self IP and view its Port Lockdown settings.

   .. image:: /_static/101//port-lockdown.png
      :width: 400

2. **TMSH Method**:

   Run the following command in the BIG-IP shell to display current port lockdown settings:

   .. code-block:: bash

      tmsh list net self Internal-self-IP


Step 4: Customize Port Lockdown
-------------------------------

1. **TMUI Method**:

   Edit the self IP, change Port Lockdown to ``Allow Custom``, and manually specify ports/protocols to allow 443. Click Network > Self IPs > Internal-self-IP.

   - Add Port 443

   .. image:: /_static/101//custom-ports.png
      :width: 400

2. **TMSH Method**:

   .. code-block:: bash

      tmsh modify net self 10.1.20.4 allow-service replace { tcp:443 }
      save sys config

3. **Validate Configuration**:

   - From the Jumpbox, test the allowed ports:

     .. code-block:: bash

      nmap -p 22,443 10.1.20.4
      curl https://10.1.20.4
      ssh admin@10.1.20.4

Step 5: Test Packet Filter Rules for Self-IPs
---------------------------------------------

1. **Add Packet Filter Rules**:

   Configure a packet filter rule that drops ICMP traffic and allows traffic to TCP port ``443`` for a specific IP range (e.g., ``10.1.20/24``).

   **TMUI**
   
   - Click Network > Packet Filters > Rule

   - Create Drop ICMP Rule 

      - **Name**: ``imcpdrop``
      - **Action**: ``Discard``
      - **Protocol**: ``TCP``
      - **Source Hosts and Network**: 10.1.20.0/24
   
   .. image:: /_static/101//icmp-filter.png
      :width: 400

   - Create Drop HTTP Rule

      - **Name**: ``my_https_filter``
      - **Action**: ``Discard``
      - **Protocol**: ``TCP``
      - **Source Hosts and Network**: 10.1.20.6
      - **Destination Port**: 443

   .. image:: /_static/101//http-filter.png
      :width: 400

   **TMSH Method**:

   - Create a rule that drops ICMP packets for a subnet:
     
     .. code-block:: bash

        tmsh create /net packet-filter icmpdrop order 5 action discard rule "( proto ICMP ) and ( src net 10.1.20.0/24 )"

   - Create a rule that allows HTTPS traffic for a specific source subnet:
     
     .. code-block:: bash

        tmsh create /net packet-filter my_https_filter order 10 action discard  rule "( ( ip proto TCP or ip6 proto TCP )  ) and ( src host 10.1.20.6 ) and ( dst port 443 )"
        save sys config

2. **Verify Packet Filter Rules**:

   List the current packet filter rules to confirm the configuration:

   .. code-block:: bash

      tmsh list /net packet-filter

   Ensure that both the `icmpdrop` and `my_https_filter` rules are properly configured with the correct order and action properties.

3. **Enable Packet Filtering**:

   Enable packet filtering globally on the BIG-IP system if not already enabled:

   **TMUI**

      - Click Network > Packet Filters > General
      - Set **Packet Filtering**: ``Enable``

   .. image:: /_static/101//enable-filter.png
      :width: 400

   .. code-block:: bash

   **TMSH**

      tmsh modify /sys db packetfilter value enable

4. **Test Packet Filter Behavior Using curl and ping**:

   **From the Jumpbox (e.g., within 10.1.20.0/24):**

   - Access HTTPS port ``443``:

     .. code-block:: bash

        curl -v https://10.1.20.4

   - Attempt to send ICMP packets. They should be dropped:

     .. code-block:: bash

        ping 10.1.20.4


5. **Clean Up**:

   If you want to disable packet filtering after testing, run the following commands:

   .. code-block:: bash

      tmsh modify /sys db packetfilter value disable
      tmsh delete /net packet-filter icmpdrop
      tmsh delete /net packet-filter my_https_filter

Closing
-------

This guide provides clear steps to configure and secure BIG-IP self IPs using port lockdown and packet filtering. By restricting access to essential services and managing traffic at a granular level, administrators can enhance the security and control of their BIG-IP systems. These practices ensure only authorized connections are allowed while protecting against unwanted or malicious traffic.