Modify and Troubleshoot Virtual Servers
=======================================

Troubleshooting virtual servers
-------------------------------

By now, I am sure you are dying to know what's up with the
**purple\_vs**. Here's a chance to find out. You are going to some
troubleshooting with a little guidance.

Go to **Network Maps** and take a look at the status of the
**purple\_vs** and its components.

It is obvious that all pool members are offline which could be anything,
a network issue, a server issue, a BIG-IP configuration issue.

*Q1. Where would you start?*

SSH to **bigip01** at 10.1.1.4.

*Q2. Attempt to ping he pool members. Does it work? What does this tell
you?*

*Q3. Attempt a* **curl -i** *against the pool members. Does it work? What
does this tell you?*

*Q4. If you can ping and curl to the pool members, what would you suspect
as a possible issue?*

Find and correct the issue.

*Q5. Did you correct the issue?* 

.. HINT::

   If not go to **Appendix I - Answer Key** and see how the issue was fixed.

*Q6. Now the pool is working and purple\_vs is available can you access
the page through the virtual?*

*Q7. What is your next step in debugging? Is the virtual server
processing traffic?*

You need to watch traffic from your PC to the BIG-IP virtual server and
from the BIG-IP to the pool.  The IP address of you client machine on the client subnet is 10.1.10.6.

*Q8. What command(s) could you use to watch traffic hit the virtual
server and leave toward the pool?*

.. HINT::
   
   Try to figure it out, if you need help go to **Appendix I - Answer Key** and one version of the commands

*Q9. Did you see traffic hit the virtual server? Did you see BIG-IP send
traffic to a pool member?*

*Q10. Did you see the return traffic? If there was no response, what can you do to guarantee traffic returns to the BIG-IP?*

Working with profiles
---------------------

Create new virtual server **secure\_vs 10.1.10.100:443** with **TCP** profile,
set the source address translation (SNAT) to **Auto Map** and the **www\_pool**. Open tcpdumps to view traffic on both sides of the proxy. Browse to **https://10.1.10.100** and view the tcpdumps.

*Q1. Did site work? Why not?*

Change SSL Profile to include clientssl then Update.  Browse to
**https://10.1.10.100** and observe tcpdumps.

*Q2. Did site work? What did the traffic look like on either side of the tcpdumps?*

Enable cookies Default Persistence Profile and update? Note error and
troubleshoot to fix.

*Q3. What was needed to add cookie persistence?*

Open the Chromium inspect window. Browse to **https://10.1.10.100/** right-click on the page and select **Inspect**. Refresh the page. Select **Network** from the Inspect window, select any response and look in the header information to find the cookie(s).

*Q4. What does the name of the BIG-IP cookie inserted begin with?*


