Remote Authentication
=====================

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
| Bind DN:                | Cn=Directory Manager   |
+-------------------------+------------------------+
| Bind Password/Confirm   | Default                |
+-------------------------+------------------------+
| Role                    | Administrator          |
+-------------------------+------------------------+

Open a new private browser window to **bigip01** at **https://10.1.1.245** and
logon using the LDAP account **adminuser/password**.

*Q1. Were you successful?*

Try logging with the local account **testuser/testpass**.

*Q2. Were you successful?*
