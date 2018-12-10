Extended Application Verification (EAV)
=======================================

Create an EAV monitor
---------------------

Log on to the F5 DevCentral site **http://devcentral.f5.com** and go to the
following link:

https://devcentral.f5.com/codeshare/http-monitor-curl-basic-get

If you don't have an account then create one. You'll be glad you did.

This monitor is also in **Module 3.14** of this document, but working from
F5 DevCentral is more appropriate.

You will be using this monitor as your new external monitor, a copy of
the code is on your desktop in a plain text file called
\ **eav-http-monitor**.

A copy of this monitor is also in the **/root** directory on the BIG-IP. To
get a feel of how it works go to the BIG-IP CLI and test it against once
of the **www\_pool** members::

   cd /root
   /bin/sh eav-http-monitor 10.1.20.11 80

The first two parameters of an EAV are always IP address and Port. When using an
External monitor on a pool, the pool supplies these. Here you have to supply them.

*Q1. What was the stdout output? Did this indicate the member was
Available?*

Go to **System > File Management > External Monitor Program File List** and
select **Import**

**Choose File** to find the **eav-http-monitor** on your desktop, name
it **eav-http-monitor** and select **Import**

Create a monitor named **eav-http-monitor**, select type **External**
and **eav-http-monitor** as your **External Program**.

Apply the **eav-http-monitor** monitor to **www\_pool**. Remove all
other monitors.

*Q2. Are your members up? What would happen if the external monitor returned* **DOWN**\ *?*
