tcpdump Packet Capture
======================

In this exercise are going to perform **tcpdump** packet captures and
review the results.

Packet Captures of multiple interfaces simultaneously
-----------------------------------------------------

Open SSH session window1, and enter on one line::

    tcpdump -ni client_vlan -eXs 0 -w /var/tmp/dump.cap & tcpdump -ni
    server_vlan -eXs 0 -w /var/tmp/dump2.cap &

This starts two tcpdumps, one on the **client_vlan** and one on the **server_vlan**

Browse to **http://10.1.10.100**.

Type **fg** then **<cr>** then **<crtl> c**.

Again, type **fg** then **<cr>** then **<crtl> c** then::

    tcpdump -r /var/tmp/dump.cap & tcpdump -r /var/tmp/dump2.cap

*Q1. What is the alternate method for capturing two interfaces
simultaneously?*

*Q2. What interface does 0.0 represent?*

*Q3. What interface typically represents the management interface?*

*Q4. What is recommended method for packet captures on high load system?*

*Q5. Will tcpdump capture PVA accelerated traffic?*