1.10 - Given a basic iRule's functionality, determine the profiles and configuration options necessary to implement the iRule
=============================================================================================================================

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
| Destination                  | 10.1.10.115 (same IP as secure\_vs)                         |
+------------------------------+-------------------------------------------------------------+
| Service Port                 | 80 (HTTP)                                                   |
+------------------------------+-------------------------------------------------------------+
| Source Address Translation   | None (you don't need this, this traffic is going nowhere)   |
+------------------------------+-------------------------------------------------------------+
| iRule                        | \_sys\_https\_redirect                                      |
+------------------------------+-------------------------------------------------------------+

Hit **Finished**

WOW! That didn't go too far did it. You just got an error. If you are
going to redirect the HTTP request you need the HOST and URI information
and that requires looking into the HTTP protocol.

Change your virtual server's *HTTP Profile (Client)* from **None** to **http** and test your new virtual by going to **http://10.1.10.115**.

You should be redirected to the HTTPS virtual server.

As you can see very small iRules can make a very big difference. On the
exam, you may be asked to identify the iRule that would best solve an
issue. So, you should be familiar with basic iRules syntax.
