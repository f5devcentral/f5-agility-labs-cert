Securing Web Applications
=========================

Securing web applications with the HTTP profile
-----------------------------------------------

Here you are going to perform some custom profile alterations to help
secure the web site. You are going to make sure hackers cannot see error
codes returned, scrub the response headers of extraneous and potentially
dangerous information and encrypt the persistence cookie to prevent
tampering.

Obtain the cookie name and information by browsing to
**https://10.1.10.115/** and open the **Display Cookie**. The cookie name is
everything in front of the **=** sign. How BIG-IP creates cookies for
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

Under, **HTTP Request and Response Information** select the **Display
Cookie** link.

*Q5. What is different from the cookie at the start of the task?*

.. NOTE::

   Even though the data is encrypted between your browser and the
   virtual server, the LTM can still modify the data (i.e. resource
   cloaking) because the data is unencrypted and decompressed within TMOS.

Using iRules
------------

By now you should be thoroughly sick of trying to remember to type https:// in
every time you want to access your secure web site. Not only is that
easily rectify on the BIG-IP, but it is much more secure than opening up
port 80 on your secure web servers, so that they can perform a redirect.

While it would be easy to write your own redirect iRule, you note F5 has
one prebuilt that you can use.

Example of simple redirect iRule::

   when HTTP_REQUEST {
      HTTP::redirect https://[HTTP::host][HTTP::uri]
   }

Go to **Local Traffic > iRules**

In the search box at the top of the list of iRules, type **redirect**
and hit **Search**.

Open the iRule and take a quick look. This is a F5 Verified and F5
supported iRule.

Create your HTTP-to-HTTPS redirect virtual server.

Go to Local **Traffic > Virtual Servers** and create a new virtual
server.

+------------------------------+-------------------------------------------------------------+
| Name                         | redirect\_to\_secure\_vs                                    |
+==============================+=============================================================+
| Destination                  | <same IP as secure\_vs>                                     |
+------------------------------+-------------------------------------------------------------+
| Service Port                 | 80 (HTTP)                                                   |
+------------------------------+-------------------------------------------------------------+
| Source Address Translation   | None <you don't need this, this traffic is going nowhere>   |
+------------------------------+-------------------------------------------------------------+
| iRule                        | \_sys\_https\_redirect                                      |
+------------------------------+-------------------------------------------------------------+

Hit **Finished**

WOW! That didn't go too far did it. You just got an error. If you are
going to redirect the HTTP request you need the HOST and URI information
and that requires looking into the HTTP protocol.

Test your new virtual by going to **http://10.1.10.115**.

You should be redirected to the HTTPS virtual server.

As you can see very small iRules can make a very big difference. On the
exam, you may be asked to identify the iRule that would best solve an
issue. So, you should be familiar with basic iRules syntax.
