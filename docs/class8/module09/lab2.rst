Remote Authentication
=====================

We will setup a LDAP authentication on the BIG-IP for user authentication to perform BIG-IP tasks.

Authenticate against LDAP
-------------------------

#. Go to **System > Users > Authentication** and select **Change** under **User Directory**.

#. Now select **LDAP** from the **User Directory** drop-down and enter the following

   +-------------------------+------------------------+
   | Host                    | 10.1.20.252            |
   +-------------------------+------------------------+
   | Port                    | 389                    |
   +-------------------------+------------------------+
   | Remote Directory Tree   | dc=f5demo,dc=com       |
   +-------------------------+------------------------+
   | Bind DN:                | cn=Directory Manager   |
   +-------------------------+------------------------+
   | Bind Password/Confirm   | default                |
   +-------------------------+------------------------+
   | Role                    | Administrator          |
   +-------------------------+------------------------+
   | SSL                     | Disabled               |
   +-------------------------+------------------------+

#. Open a new private browser window to **bigip01** at **https://10.1.1.4** and logon using the LDAP account **adminuser/password**.

      *Q1. Were you successful?*

#. Try logging with the local account **testuser/testpass**.

      *Q2. Were you successful?*

#. Set Authentication back to Local (**System > Users > Authentication** and select **Local** under **User Directory**)
