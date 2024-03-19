2.01 - Determine how to secure SelfIPs
======================================

Effects of Port Lockdown
------------------------

In the exercise, you will do some basic configuration of DNS and NTP and
work with port lockdown.

Working with port lockdown on self IPs.

Ping **10.1.10.245**

*Q1. Was echo response received?*

SSH to **10.1.10.245**

*Q2. Was ssh successful? Why not?*

Open **Network > Self IPs > client_ip (10.1.10.245)** and change **Port Lockdown**
to **Allow Defaults**

SSH to **10.1.10.245**

Browse to **https://10.1.10.245**

*Q3. Did SSH work? Did browsing work?*

*Q4. What other ports are opened when you select* **Allow Defaults**.

.. HINT::
   Go to the **Help** tab for the **Network >> Self IPs >> client_ip** page and expand the *Port Lockdown* section for the answer.

Open **Network > Self IPs > client_ip (10.1.10.245)** and change Port Lockdown to
**Allow Custom** and add **TCP** port **22**

SSH to **10.1.10.245**

Browse to **https://10.1.10.245**

*Q5. Did SSH work? Did browsing work?*

2.02 - Determine how to secure virtual servers
==============================================

Leveraging HTTP Profiles
------------------------

Here you are going to perform some custom profile alterations to help
secure the web site. You are going to make sure hackers cannot see error
codes returned, scrub the response headers of extraneous and potentially
dangerous information and encrypt the persistence cookie to prevent
tampering.

Obtain the cookie name and information by browsing to
**https://10.1.10.115/** and click the **Request and Response Headers** link.
The cookie name is everything in front of (to the left of) the **=** sign. How BIG-IP creates cookies for
Cookie Insert persistence can be found at https://support.f5.com/csp/article/K6917. After reading this article you could craft a cookie to hit a particular server.

*Q1. What is the cookie name? Note the information after the cookie.*

Let's begin by creating a custom HTTP profile.

+----------------------------------------+------------------------------------------+---------------------------------------------+
| Name:                                  | **secure-my-website**                    |                                             |
+========================================+==========================================+=============================================+
| Set the Fallback Host                  | **http://www.f5.com**                    |                                             |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Fallback on Error Codes                | **404 500-505**                          | The fallback site if an error is received   |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Response Headers Allowed               | **Content-Type Set-Cookie Location**     |                                             |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Encrypt Cookies                        | **<cookie name you obtained earlier>**   |                                             |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Cookie Encryption Passphrase           | **xcookie**                              |                                             |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Confirm Cookie Encryption Passphrase   | **xcookie**                              |                                             |
+----------------------------------------+------------------------------------------+---------------------------------------------+
| Insert XForwarded For                  | **Enable**                               | Example of modify headers                   |
+----------------------------------------+------------------------------------------+---------------------------------------------+

*Q2. What is in the X-Forwarded-For header? Why might you want to enable
it?*

Attach your new HTTP Profile to your **secure\_vs** virtual server

Browse to **https://10.1.10.115**.

Do the web pages appear normal? On the web page under, **HTTP Request
and Response Information** select the **Request and Response Headers**
link.

Open a new browser to **http://10.1.10.100**. On the web page under, **HTTP
Request and Response Information** select the **Request and Response
Headers** link.

*Q3. Are they the same? What is different?*

Now browse to a bad page.

For example, **https://10.1.10.115/badpage**

*Q4. What is the result?*

.. NOTE::

   Even though the data is encrypted between your browser and the
   virtual server, the LTM can still modify the data (i.e. resource
   cloaking) because the data is unencrypted and decompressed within TMOS.
