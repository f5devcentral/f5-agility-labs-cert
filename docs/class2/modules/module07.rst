Lab 7: Extra Lab Content
====================================




Resource Utilization and Provisioned Modules
~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. On **bigip01.f5demo.com** 

a. Go to **System > Resource Provisioning**

b. You will be able to see what modules are provisoned and the license state on this page per your license on the BIG-IP.

.. image:: /_static/101/image70.png
   :width: 5.01042in
   :height: 5.59576in

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
      :width: 5.01042in
      :height: 5.59576in

c. Add user to partition, give user TMSH access for Terminal Access and select **Finished**

..    image:: /_static/101/image73.png
      :width: 5.01042in
      :height: 3.59576in

d. Log out of the F5 at the top right and log back in with the new credentials you created