Module 4 - Support and Analytics
================================

Support, Status and Logs
------------------------

Qkview and iHealth
~~~~~~~~~~~~~~~~~~

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

Network Map
~~~~~~~~~~~

*Q1. What is a node?*

IP Address of Pool Member

*Q2. What icon is reflected for 10.1.20.11 on the Network map?*

Black

*Q3. What is the color of the icon for pool members based on 10.1.20.11?  Why?*

Grey Circle

*Q4. Does ftp\_vs still work as expected?*

No

*Q5. Where is irule reflected on Network Map?*

iRule is displayed between the Virtual Server and Pool

Dashboard
~~~~~~~~~

*Q1. What is longest duration available for reporting?*

1 Month

*Q2. How can report be exported?*

Reports may be exported as csv files.

Log files
~~~~~~~~~

*Q1. Was an alert logged?*

Yes

*Q2. Was the alert logged here?*

Yes

*Q3. What command is needed to find all instances of err in /var/log/ltm?*

grep err /var/log/ltm

iApps and Analytics
-------------------

Create iApps Analytics
~~~~~~~~~~~~~~~~~~~~~~

*Q1. Did both pool members respond? Why?*

No, only one responded because cookie persistence was built using the
iApp

*Q2. Can you determine which page took the longest to load?*

If you select Latency > Page Load Time from the top bar you will find
/bigtext.html took longest.

*O3. Could you add the pool member? Why?*

No, because iApp strictness is on by default and the application can
only be changed by going to the iApp application and selecting
Reconfigure from the top bar

*Q4. Can you add the custom_analytics profile to the ftp_vs? Why?*

No, analytics in v11.5 can only be done on HTTP and DNS virtual servers
with a HTTP or DNS profile attached.
