Remote Authentication
=====================

.. NOTE::

   Changes to the lab environment no longer allow this lab to work, but it does give
   you the general concept of how remote authentication is set up.

Authenticate against LDAP
-------------------------

Go to **System > Users > Authentication** and select **Change** under **User
Directory**.

Now select **LDAP** from the **User Directory** drop-down and enter the
following

+-------------------------+------------------------+
| Host                    | 10.1.20.252            |
+-------------------------++-----------------------+
| Remote Directory Tree   | dc=f5demo,dc=com       |
+-------------------------+------------------------+
| Bind DN:                | cn=Directory Manager   |
+-------------------------+------------------------+
| Bind Password/Confirm   | default                |
+-------------------------+------------------------+
| Role                    | Administrator          |
+-------------------------+------------------------+

Open a new private browser window to **bigip01** at **https://10.1.1.4** and
logon using the LDAP account **adminuser/password**.

*Q1. Were you successful?*

Try logging with the local account **testuser/testpass**.

*Q2. Were you successful?*
