Extended Application Verification (EAV)
=======================================

Create an EAV monitor
---------------------

#. Log on to the F5 DevCentral site **https://community.f5.com** and go to the following link:

   https://community.f5.com/kb/codeshare/http-monitor-curl-basic-get/277614

#. If you don't have an account then create one. You'll be glad you did.

   This monitor is also in **Module 3.14** of this document, but working from F5 DevCentral is more appropriate.

#. You will be using this monitor as your new external monitor, a copy of the code is on your desktop in a plain text file called \ **eav-http-monitor**.

#. The first two parameters of an EAV are always IP address and Port. When using an External monitor on a pool, the pool supplies these. Here you have to supply them.

   *Q1. What was the stdout output? Did this indicate the member was Available?*

#. Go to **System > File Management > External Monitor Program File List** and select **Import**

#. **Choose File** to find the **eav-http-monitor** on your desktop, name it **eav-http-monitor** and select **Import**

#. Create a monitor named **eav-http-monitor**, select type **External** and **eav-http-monitor** as your **External Program**.

#. Apply the **eav-http-monitor** monitor to **www\_pool**. Remove all other monitors.

   *Q2. Are your members up? What would happen if the external monitor returned* **DOWN**\ *?*
