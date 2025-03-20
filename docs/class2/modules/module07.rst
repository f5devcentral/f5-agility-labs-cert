Lab 7: Extra Lab Content
====================================




Resource Utilization and Provisioned Modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. On **bigip01.f5demo.com** 

a. Go to **System > Resource Provisioning**

b. You will be able to see what modules are provisoned and the license state on this page per your license on the BIG-IP.

.. image:: /_static/101/image70.png
   :width: 5.01042in
   :height: 4.59576in

Creating User on BIG-IP
~~~~~~~~~~~~~~~~~~~~~~~~~~~
1. On **bigip01.f5demo.com**

a. Go to **System > Users**

   i. Click Create

..    image:: /_static/101/image71.png
      :width: 7.5in
      :height: 1.59576in

b. Fill out information for Username and Password

   ii. For Role, please select **Administrator**

..    image:: /_static/101/image72.png
      :width: 5.4375in
      :height: 2.03332in

c. Add user to partition, give user TMSH access for Terminal Access and select **Finished**

..    image:: /_static/101/image73.png
      :width: 4.2837in
      :height: 2.06685in

d. Log out of the F5 at the top right and log back in with the new credentials you created

..    image:: /_static/101/image74.png
      :width: 7.5in
      :height: 1.59576in


Execute a UCS Backup and UCS Restore
------------------------

1. **System > Archives**

.. image:: /_static/101/image75.png
   :width: 5.01042in
   :height: 5.59576in

2. Select **Create**, to create a UCS backup

.. image:: /_static/101/image76.png
   :width: 7.5in
   :height: 2.19576in

3. Select **Finished** when ready to complete the UCS Backup 

.. image:: /_static/101/image77.png
   :width: 4.2837in
   :height: 2.06685in

4. Go to **Local Traffic > Virtual Servers** and delete **www_vs**

.. image:: /_static/101/image78.png
   :width: 4.2837in
   :height: 3.86685in

5. Next go to **System > Archives** and click on UCSBackup.UCS

.. image:: /_static/101/image79.png
   :width: 4.2837in
   :height: 3.86685in

6. Select **Restore** and restore the UCS backup

.. image:: /_static/101/image80.png
   :width: 4.2837in
   :height: 3.86685in


7. Go back to **Local Traffic > Virtual Servers** and ensure that **www_vs** was restored from the UCS Backup

.. image:: /_static/101/image81.png
   :width: 4.2837in
   :height: 3.86685in

Managing Software Images on the BIG-IP System
=============================================
In this section of the lab we will explore methods for managing software images on the BIG-IP.

**Before starting,** ensure you have located and downloaded the software image, point release, or hotfix and corresponding image verification file(s) from the F5 `Downloads <https://my.f5.com/manage/s/downloads>`_ site. 

Upload using the configuration utility
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. On **bigip01.f5demo.com** log into the configuration utility. 

2. Go to **System > Software Management**
3. Select **Import**

.. image:: /_static/101/image82.png
   :width: 17.576in
   :height: 3.013in

4. Select **Choose File** and choose the software image, point release, or hotfix, and the corresponding MD5 file to import.
5. Select **Import**
6. Log into a **bash** session on the BIG-IP.
7. Change directories to the **/shared/images** directory by typing the following command:

      .. code-block:: bash

         cd /shared/images

8. Verify the software image file integrity using either the MD5 checksum, SIG, or PEM files. For this lab we will use the MD5 checksum.

      .. code-block:: bash

         [root@bigip01:Active:Standalone] images # md5sum --check BIGIP-17.1.2.1-0.0.2.iso.md5
         BIGIP-17.1.2.1-0.0.2.iso: OK
         [root@bigip01:Active:Standalone] images #

Upload using SCP from the command line
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      
1. Secure copy (SCP) the **.iso** file and corresponding **.md5** file from your desktop computer to the **/shared/images** directory on the BIG-IP system.

**Example:**

   ``scp BIGIP-17.5.0-0.0.15.iso* admin@<BIG-IP_MGMT_IP>:/shared/images/``

2. Log into a **bash** session on the BIG-IP.
3. Change directories to the **/shared/images** directory by typing the following command:

      .. code-block:: bash

         cd /shared/images

4. Verify the software image file integrity using either the MD5 checksum, SIG, or PEM files. For this lab we will use the MD5 checksum.

      .. code-block:: bash

         [root@bigip01:Active:Standalone] images # md5sum --check BIGIP-17.1.2.1-0.0.2.iso.md5
         BIGIP-17.1.2.1-0.0.2.iso: OK
         [root@bigip01:Active:Standalone] images #

Show currently configured boot location
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. On **bigip01.f5demo.com:** log into the configuration utility.

#. Go to **System > Software Management > Boot Locations**

This screen will show the current configured boot locations. The **Status** column will show which is active:

.. image:: /_static/101/image83.png
   :width: 7.284in
   :height: 3.166in

Creating a new volume for software images
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
After the software image has been uploaded and verified, you can install it to a boot location. 

Using the Configuration Utility
-------------------------------

1. On **bigip01.f5demo.com** log into the configuration utility. 
2. Go to **System > Software Management**
3. For **Available Images**, select the box next to the software you want to install.
4. Select **Install**

.. image:: /_static/101/image84.png
   :width: 5.451in
   :height: 2.535in

5. In the **Install Software Image** pop-up window, for **Volume set name**, select a volume set or type the name of the new volume set. 

For example, if you type **2** for the volume set name, the BIG-IP system creates a **new** volume set at boot location **HD1.2**.

.. image:: /_static/101/image85.png
   :width: 3.173in
   :height: 2.174in

6. Once complete, select **Install** 
7. You can monitor the installation status in the Installed Images section of the **System > Software Management** page.

Using tmsh
----------
1. Log into **tmsh** by issuing the following command:
   ``tmsh11``

2. To install a software image, point release, or software fix, use the following command syntax:

   ``install /sys software <hotfix | image> <software>.iso volume <volume_number>``

   .. note:: You can use tab completion in **tmsh**. To see the available images for installation, press the Tab key after you type the **install sys software image** command. 
   
   In our lab, we will use the example below:

   ``install /sys software image BIGIP-17.5.0-0.0.15.iso volume HD1.2 create-volume``

3. To verify the software installation progress, type the following command:

   ``show sys software``

   The command output appears similar to the following example: 

            .. code-block:: bash

               root@(bigip02)(cfg-sync Standalone)(Active)(/Common)(tmos)# show sys software

               --------------------------------------------------------------------------------
               Sys::Software Status
               Volume  Product   Version   Build  Active                Status  Allowed Version
               --------------------------------------------------------------------------------
               HD1.1    BIG-IP  15.1.2.1  0.0.10      no              complete              yes
               HD1.2    BIG-IP    17.5.0  0.0.15      no installing 10.000 pct              yes
               HD1.3    BIG-IP  17.1.2.1   0.0.2     yes              complete              yes

