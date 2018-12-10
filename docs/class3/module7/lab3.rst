Module 3 - Trouble-shooting the BIG-IP
======================================

Trouble-shooting Hardware
-------------------------
End User Diagnostics
~~~~~~~~~~~~~~~~~~~~

*Q1. What three methods are available for running EUD on F5 Hardware?*

USB CDROM, USB Bootable Drive, Hardware Boot Menu

*Q2. How do you determine EUD version?*

EUD image downloaded or eud\_info

*Q3. What is the filename and location of the EUD output?*

/shared/log/eud.log

LCD Panel 
~~~~~~~~~

*Q1. How do you halt the unit via the LCD panel?*

Press X, select system menu, press check, select halt, press check to
confirm

*Q2. Holding the X for 4 seconds does what?*

Powers down unit

*Q3. Holding the Check button for 4 seconds does what?*

Reboots the unit

Hardware Log Files
~~~~~~~~~~~~~~~~~~

*Q1. What is the filename and location of the logs for LTM?*

/var/log/ltm

*Q2. Where will power supply, fan and hard disk related issues be logged?*

/var/log/ltm

HA and Failover
~~~~~~~~~~~~~~~

*Q1. Is failover sometimes used to determine issues related to hardware or software?*

hardware

*Q2. How do you initiate failover to standby unit?*

From Active unit select Network > Traffic Groups, select traffic group, select Force to Standby

*Q3. What persistence profile cannot be mirrored?*

Cookie persistence is not mirrored

*Q4. What two connections types are re-mirrored after failback?*

Only FastL4 and SNAT connections are re- mirrored after failback

*Q5. When would you recommend using connection mirroring?*

Long lived connections

*Q6. Where is connection mirroring configured?*

You can configure connection mirroring at VS and SNAT

*Q7. Where is persistence mirroring configured?*

You can configure persistence mirroring at Persistence

*Q8. What tmsh command is used to view mirrored connections?*

show /ltm persistence persist-records

*Q9. What tmsh command is used to view mirrored persistence?.*

show /ltm persistence persist-records

*Q10. What can be the cause of primary unit returning to active state after initiating failover to standby?*

Show /sys connection all-properties

tcpdump Packet Capture
----------------------

Packet Captures of multiple interfaces simultaneously
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What is the alternate method for capturing two interfaces
simultaneously?*

tcpdump -ni eth1 -w /var/tmp/dump1.cap **&** tcpdump -ni eth2 -w
/var/tmp/dump2.cap

*Q2. What interface does 0.0 represent?*

All interfaces

*Q3. What interface typically represents the management interface?*

eth0

*Q4. What is recommended method for packet captures on high load system?*

F5 recommends that you mirror traffic to a dedicated sniffing device

*Q5. Will tcpdump capture PVA accelerated traffic?*

No, you must disable PVA to capture traffic

Performance Statistics
----------------------

Observing performance statistics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What is the longest time interval available for performance
statistics?*

30 Days

Connectivity Troubleshooting
----------------------------

Connectivity troubleshooting tools
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Was echo response received?*

Ping reply was successful

*Q2. What is the status of the virtual servers?*

ftp\_vs and www\_vs available, disabled - wildcard\_vs unknown, disabled

*Q3. Was echo response received?*

Ping reply successful

Self IP Port Lockdown
---------------------

Effects of Port Lockdown
~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Was echo response received?*

Ping reply successful

*Q2. Was ssh successful? Why not?*

No. Port lockdown set to **Allow None** by default

*Q3. Was ssh successful?*

Yes

*Q4. Does existing ssh window still work?*

No

*Q5. Was new ssh session established?*

No
 