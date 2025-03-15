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