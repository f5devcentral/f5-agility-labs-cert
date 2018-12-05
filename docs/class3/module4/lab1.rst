Support, Status and Logs
========================

Qkview and iHealth
------------------

Open **System > Support** page.

Ensure **QKView** is selected then click **Start**.

Download the snapshot file and upload it to **https://ihealth.f5.com** 

.. NOTE::

   A login account is required to access iHealth.  If you do not have an account, now would be a good time to create one.   It may take one or two days for your account to activate.

*Q1. Are logs associated with qkview?*

From ssh window run qkview

*Q2. Where is default filename and location of qkview output?*

*Q3. Where is the default filename and location of core dump?*

*Q4. What is Severity and Condition for unit failure in active/standby
pair?*

*Q5. If support case was opened online with Severity 4 and no call has
been received in a week. What should you do?*

*Q6. What is the procedure to escalate support case?*

Network Map
-----------

You should be able to explain status icons of objects on network map.

Open **Local Traffic > Network Map** and hover over icons and observe
status info.

Ensure all icons are green. If an icon is red determine the reason why.

Note the top-down status relationship between VS, pools, pool members
and nodes.

*Q1. What is a node?*

Open **Local Traffic > Nodes** and disable node **10.1.20.11**

*Q2. What icon is reflected for 10.1.20.11 on the Network map?*

*Q3. What is the color of the icon for pool members based on 10.1.20.11?  Why?*

*Q4. Does* **ftp\_vs** *still work as expected?*

Select **www\_vs** from the Network Map. Select **Resources > Manage irules**

Enable **_sys_https_redirect** irule and click **Finished**.

*Q5. Where is irule reflected on Network Map?*

Dashboard
---------

Observe Dashboard statistics

Log on to the BIG-IP GUI using and go to **Statistics
> Dashboard**

.. Warning::

   Adobe Flash is required to view the dashboard.  If you are using the Ravello lab environment with the Xubuntu jumpbox you need to use Firefox to view the BIG-IP dashboard via the BIG-IP GUI.

*Q1. What is longest duration available for reporting?*

*Q2. How can report be exported?*

Log files
---------

Interpret the LTM log file

Open ssh window1 and enter the following command::

   tail -f /var/log/ltm

Disable **ftp\_vs**

*Q1. Was alert logged?*

Go to **System > Logs > Local Traffic**

*Q2. Was the alert logged here?*

From ssh window1 enter **<CTRL> c** and at the CLI prompt enter::

  grep alert /var/log/ltm
  grep www_pool/var/log/ltm

*Q3. What command is needed to find all instances of err in /var/log/ltm?*
