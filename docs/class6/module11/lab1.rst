More Security Features
======================

Configure Audit Logging
-----------------------

Audit logging allows you to log changes made by BIG-IP administrators
and other users.

Audit logging is disabled by default. **Go to System > Logs > Configuration**.

Notice you can determine by role who is allowed to view the audit logs.

Audit Logging is toward the bottom of the page. **Enable** Audit Logging

In a private browser window, log on to the BIG-IP as **adminuser/password**.

Make a change to the **Description** of the FTP virtual server **ftp\_vs**.

Review the audit log at **System > Logs > Audit**. In the **Search**
box type **adminuser** and hit **Search**.

*Q1. Do you see when adminuser logged on? Do you see the change made in
the audit log?*

Limiting SSH access to the BIG-IP
---------------------------------

The jumpbox has two IPs, 10.1.1.51 on the management network, 10.1.10.51
on the client-side network.

Open **System > Platform** and in **SSH IP Allow** > **Specify Range**
of **10.1.20.0/24**

*Q1. Does existing an SSH window still work? Does a new SSH work?*

Change the **Specify Range** to the management network only **10.1.1.0/24**.

Open new SSH sessions to **10.1.1.245** and **10.1.10.245**.

*Q2. Were new ssh sessions established?*