UCS (BIG-IP Archive) and Support
================================

Create UCS Archive Files
------------------------

Open **System > Archives** page.

Create new archive named **backup-of-my-201-lab**.

.. HINT::
   If you want to save your backup to your device go to the **Components** in the UCS lab and on **bigip01** select **TMUI** from the access drop-down menu.  From there you can log on and download the UCS.

.. admonition:: TMSH

   You can also create backups via TMSH: 
   **save sys ucs <filename>**

*Q1. What extension must an archive have?*

*Q2. What is the default location for ucs files?*

*Q3. What is command for loading ucs file?*

*Q4. What issues will occur by restoring ucs file on RMA device?*

Support - Qkview and iHealth
----------------------------

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