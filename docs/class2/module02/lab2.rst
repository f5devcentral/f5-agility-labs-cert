Application Acceleration
========================

TCP Express
-----------

Set client-side and server-side TCP profiles on your virtual server
properties.

From the drop-down menus place the **tcp-wan-optimized** profile on the
client-side and the **tcp-lan-optimized** profile on the server-side.

Note the custom boxes in each of the TCP profiles you used.

*Q1. What is the idle timeout in each profile? Why might you want to
change it?*

*Q2. What is the Nagle selection in the default TCP, tcp-wan-optimized
and tcp-lan-optimized profiles? Why might you want to change it?*

*Q3. What happens if you increase the proxy buffer sizes?*

HTTP Optimization - RamCache Lab
--------------------------------

Go to your virtual server and refresh server times. Note the Source Node
for the pictures of the BIG-IPs. They change depending on where the
connection is coming from. The Source Node information is part of the
picture.

Go to **Local Traffic > Profiles > Services > Web Acceleration** or 
**Acceleration > Profiles > Web Acceleration**

Create a new profile named **www-opt-caching** using
**optimized-caching** as the Parent Profile.

Take all the defaults, no other changes are required.

*Q1. What resource would be consumed if you increased the* **Cache Size** *setting?*

Open up your **www\_vs** virtual server.

At the HTTP Profile drop down menu make sure http is selected.

Under **Acceleration** at **Web** **Acceleration** **Profile** select
your new caching profile; **www-opt-caching**

Clear the statistics on the **www\_pool**.

Browse to **http://10.1.10.100**. Refresh the main web page several times.

*Q2. The pictures do not change. Why do you think that is?*

*Q3. Go to your pool. Are all pool members taking connections?*

Now go to **Statistics > Module Statistics > Local Traffic** on the sidebar,
from the **Statistics Type** drop down menu select **Profiles Summary**
and select the **Web Acceleration** profile view link. Note the
information.

You can get more detailed information on Web Acceleration profils and cache entries at the
CLI level

Log onto the CLI of your BIG-IP via SSH using the root account (root/default).

At the CLI go into **tmsh** at the (tmos)# prompt and enter::

   show ltm profile ramcache www-opt-caching

HTTP Optimization - HTTP Compression Lab
========================================

Browse to **http://10.1.10.100**. On the web page under, **HTTP Request and
Response Information** select the **Request and Response Headers** link.

*Q1. Does the browser accept compression?*

Go to Local **Traffic > Profiles > Service > HTTP** **Compression** or
**Acceleration > Profiles > HTTP Compression**

Create a new profile, named **www-compress** using the
**wan-optimized-compression** default profile.

*Q2. At what point would the BIG-IP quit compressing responses?*

Open up your **www\_vs** virtual server.

At the **Web Acceleration** drop down menu select **None**

.. NOTE::

  For purpose of this lab we don't want caching interfering with our
  response headers.

At the **HTTP Compression** drop down menu select the HTTP compression
profile you just created.

Browse the virtual server web site and on the web page under **Content Examples
on This Host** select the **HTTP Compress Example** and **Plaintext
Compress Example** link.

Now off to **Statistics** on the sidebar, under the **Local Traffic**
drop down menu select **Profiles Summary**

Select the **View** link next to the **HTTP Compression** profile type

On the web page under, **HTTP Request and Response Information** select
the **Request and Response Headers** link. Notice you no longer see the
**Accept-Encoding** header in the **Request Headers Received** at the
Server section.

You can also browse to **https://10.1.10.115** and note what the
request/response looks like unchanged.

