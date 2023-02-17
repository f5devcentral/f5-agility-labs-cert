1.08 - Determine which configuration objects are necessary for applications that need the original client IP address
====================================================================================================================

SNAT Pools
----------

You will build a new FTP application, to take a closer look at SNATs and
SNAT Pools using the **tcpdump** tool and view the connection table.

When building the FTP application you will use the default
**FTP** profile and use **Auto Map** for the Source Translation address.

Go to **Local Traffic > Pools** and create a new pool.

.. list-table::
   :widths: 40 30

   *  - Name
      - **ftp_pool**
   *  - Health Monitor
      - **tcp**
   *  - Address
      - **10.1.20.15**
   *  - Service Port
      - **21**

Go to **Local Traffic > Virtual Servers** and create a new virtual server.

.. list-table::
   :widths: 40 30

   *  - Name
      - **ftp_vs**
   *  - Destination Address
      - **10.1.10.100**
   *  - Service Port
      - **21**
   *  - FTP Profile
      - **ftp**
   *  - Source Address Translation
      - **Auto Map**
   *  - Default Pool
      - **ftp_pool**

Verify your FTP virtual server and pool are **Available**.

Open up a terminal window and SSH to the BIG-IP::

   ssh root@10.1.1.4
   Password: default.F5demo.com

Or use PuTTY::

   Username: root
   Password: default.F5demo.com

At the BIG-IP CLI prompt do a tcpdump of the server-side traffic and
watch the FTP pool member::

  tcpdump -nni server_vlan host 10.1.20.15

From a command prompt on your Windows Jumpbox, FTP to 10.1.10.100. The logon credentials
are **root/default**. It may take 15-20 seconds to connect.

*Q1. Do you see traffic destined for the for the FTP server? What is the source IP?*

Imagine a dozen virtual servers using Auto Map. It would be extremely difficult to watch for particular client traffic from a particular virtual server. Not to mention a SNAT IP address can only handle 65535. SNAT pools can make management and debugging a little easier and keep port exhaustion at bay.

Create a SNAT pool and assign it to the FTP server.

Go to **Local Traffic > Address Translation** on the sidebar and select **SNAT Pool List**
and create a new SNAT pool named **SNATpool\_249** with **10.1.20.249**
as a member.

*Q2. Why might you require more than one IP address in the SNAT pool?*

Go to the **ftp\_vs** and change the **Source Address Translation** to
the **SNATpool\_249** pool.

Let's try the tcpdump we did earlier, but have it limited to the pool
member and SNAT pool IP::

   tcpdump -nni server_vlan host 10.1.20.15 and 10.1.20.249

Now there is no extraneous traffic being seen. From the command prompt, ftp to **10.1.10.100** and log on to the ftp server. User: **root**
Password: **default**

*Q3. What is the client IP that shows up in the tcpdump?*

Open up another SSH session to the BIG-IP, go into **TMSH** and dump the
connection table::

   show sys connection

Find the connection with your client IP 10.1.10.199 and the SNAT pool IP 10.1.20.249.

*Q4. What are the ephemeral port numbers on your client-side source IP
and server-side source IP?*

More SNATs and NATs
-------------------

Let's take a look at using SNATs to allow internal resources to access
external resources more securely and the difference between a SNAT and
a NAT.

The **LAMP** server used for the internal server farm has a default gateway
of **10.1.20.240** and has no external access at this time, but you can SSH
to it via the out-of-band management network at **10.1.1.252**.

On the BIG-IP, add a new self IP address named **server\_gw** to the VLAN
**server\_vlan**, with an IP address of **10.1.20.240** and netmask of **255.255.255.0**

From the jumpbox, SSH to the LAMP server at **10.1.1.252**. You can open PuTTY, load the LAMP (10.1.1.252) server profile and SSH to the LAMP server or open a terminal window and **ssh root@10.1.1.252**.  It may take up to 30 seconds for the prompt to become responsive when you attempt to login.

Credntials::

   Username: root
   Password: default

At the command prompt, attempt to hit the Google open DNS server::

   dig @8.8.4.4

*Q1. Did the command succeed?*

On the BIG-IP, open the **Local Traffic > Address Translation > SNAT List** and select **Create**

Create a new SNAT translation Name: **server\_snat,** used the IP
address **10.1.10.248** for the Translation and limit the allowed
ingress traffic to VLAN **VLAN \/ Tunnel Traffic: Enabled on...: server\_vlan**.

In a BIG-IP terminal window, do a **tcpdump** on the **client\_vlan**,
limited to the **10.1.10.248** and **8.8.4.4**.

From the LAMP server try the **dig** command again and then try to **ping
8.8.4.4** from the LAMP server.

*Q2. Did the dig work? What was the source IP?. Did the ping work? What
was the result?*

From the Linux prompt attempt to FTP to **10.1.10.248**.

*Q3. What happened when you try to FTP to the SNAT address?*

Go to **Statistics >> Module Statistics >> Local Traffic** and select
**Statistics Type: SNAT Translations** and review the information.

Under **Local Traffic > Address Translation** go to the **NAT List** and create a NAT
named **server\_15\_nat** with a **NAT Address** of **10.1.10.15** and
an **Origin: Address List** with **Address/Prefix Lenght** set to **10.1.20.15/32** (don't forget to click **Add** before clicking **Finished**).

Attempt to FTP to 10.1.10.15. Attempt to ping 10.1.10.15.

*Q4. When you attempted to FTP and ping 10.1.10.15 and access 10.1.20.15
behind the BIG-IP were you successful?*
