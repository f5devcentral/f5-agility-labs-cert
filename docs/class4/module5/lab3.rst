Module 3 – Administering the System Configuration
=================================================

Performance Statistics
----------------------

Observing performance statistics
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What is the longest time interval available for performance
statistics?*

30 Days

Self IP Port Lockdown
---------------------

*Q1. Was echo response received?*

Ping reply successful

*Q2. Was ssh successful? Why not?*

No. Port lockdown set to **Allow None** by default

*Q3. Did SSH work? Did browsing work?*

Yes

*Q4. What other ports are opened when you select Allow Defaults.*
        igmp:0
        ospf:0
        pim:0
        tcp:161
        tcp:22
        tcp:4353
        tcp:443
        tcp:53
        udp:1026
        udp:161
        udp:4353
        udp:520
        udp:53


*Q5. Did SSH work? Did browsing work?*

SSH worked, browsing (TMUI access) was blocked.

*Q6. Does existing SSH window still work?*

Yes

*Q7. Was new ssh session established?*

No
 
System Configuration
---------------------

No questions in this section.

UCS (BIG-IP Archive) and Support
--------------------------------

Create UCS Archive Files
~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What extension must Archive have?*

.ucs

*Q2. What is the default location for ucs files?*

/var/local/ucs

*Q3. What is command for loading ucs file?*

load /sys ucs <path to UCS>

load /sys ucs <path to UCS> no-license - This will not restore the license
file

*Q4. What issues will occur by restoring ucs file on RMA device?*

Licensing and device cert keys must be updated.

Support - Qkview and iHealth
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Are logs associated with qkview?*

Yes

*Q2. Where is default filename and location of qkview output?*

/var/tmp/hostname.qkview

*Q3. Where is the default filename and location of core dump?*

/var/core/

*Q4. What is Severity and Condition for unit failure in active/standby
pair?*

Severity 2, Site at Risk

*Q5. If support case was opened online with Severity 4 and no call has
been received in a week. What should you do?*

Call support, reference open case and ask to escalate. This may require
Duty Manager approval.

*Q6. What is the procedure to escalate support case?*

Call support, reference open case and ask to escalate. This may require
Duty Manager approval.

Maintaining the Device Service Cluster (DSC)
--------------------------------------------

No questions in this section.