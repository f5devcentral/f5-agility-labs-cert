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

SSH to **bigip01** at 10.1.1.245.

*Q2. Attempt to ping he pool members. Does it work? What does this tell
you?*

*Q3. Attempt a* **curl -i** *against the pool members. Does it work? What
does this tell you?*

*Q4. Since the problem affects all pool members, what would you suspect
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
from the BIG-IP to the pool.

*Q8. What command(s) could you use to watch traffic hit the virtual
server and leave toward the pool?*

.. HINT::
   
   Try to figure it out, if you need help go to **Appendix I - Answer Key** and one version of the commands

*Q9. Did you see traffic hit the virtual server? Did you see BIG-IP send
traffic to a pool member?*

*Q10. Did you see the return traffic? If there was no response, what is
your step?*

Remember the server's default gateway is 10.1.20.240, which is an **unused** IP
address on the 10.1.20.0/24 network.

There were two ways to resolve the virtual server issue. Your purple\_vs
should now be available.

Working with profiles
---------------------

Create new virtual server **secure\_vs 10.1.10.100:443** with **TCP** profile,
use SNAT and the **www\_pool**. Open tcpdumps to view traffic on both sides of the proxy. Browse to **https://10.1.10.100** and view the tcpdumps.

*Q1. Did site work? Why not?*

Change SSL Profile to include clientssl then update Browse to
**https://10.1.10.100** and observe tcpdumps.

*Q2. Did site work?*

Enable cookies Default Persistence Profile and update? Note error and
troubleshoot to fix.

*Q3. What was needed to add cookie persistence?*

Open the Chromium inspect window (right-click and Inspect in the browser window. Browse to **https://10.1.10.100/index.php** and find the header information and the cookie(s).

*Q4. What does the name of the BIG-IP cookie inserted begin with?*


