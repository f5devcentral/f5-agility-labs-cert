Roles and Partitions
====================

Create a partition
------------------

Partitions are basically configuration containers. Users assigned to a
partition can only view their partition configuration and configuration items in the **Common** partition. Depending on their role a user may modify and create configuration items within their partition and use (but not modify) configuration items in
the common partition.

To create a new partition, go to **System > Users > Partition List** and
select create

Create a new partition named **my\_partition**. There is really not a
whole lot to it.

Create and place a user in a partition
--------------------------------------

Create a new local user by going to **System > Users > User List** and
selecting create.

Create a new user **testuser** with **testpass** as the password and set
their **Role** to **Manager**, assign them to the **test\_partition**
partition and give them **tmsh Terminal Access**

Open a new private browser to the BIG-IP, or log out and log back in
under your current browser as the new user **testuser/testpass**.

*Q1. In the upper right of the BIG-IP WebUI what partition are you in?*

Look at the virtual servers. You can see these because they were all
built in the Common partition, but you cannot modify them. If you go
into a virtual server you will see the selections greyed out.

As you can see, you can view but not change things in common. But you
can use things in the **Common** partition to build your own configuration.

Build a new HTTP virtual server named **test\_vs**, with a destination
IP of **10.1.10.120** and used the **www\_pool** in the **/Common**
partition as the default pool.

In this case we are taking advantage of the **Common** partition nodes and
pools to build are virtual server.

Log out and log in as **admin** (or go to your other browser window that is
logged in as admin)

Go to the **Virtual Server List**.

*Q2. Do you see the* **test\_vs** *just created?*

Go to the upper right-hand corner and select **test\_partition**. You
can now see the **test\_vs** virtual server. Since you are an admin you
can also modify the virtual server as necessary

SSH to your BIG-IP and log in with the new user name and password.  You should be
taken directly into the **tmsh**.

Note the prompt, your partition name is there.

Now let's make a change to the test\_vs::

   mod ltm virtual test\_vs description "Partition Testing"

In the BIG-IP WebUI go to your **test_vs** virtual server.

*Q3. Do you see your change? Is your change permanent?*

.. NOTE::

    **The following lab portion is probably not on the 301, but as I have you playing with
    partitions this is something if feel you should know.**

SSH to the BIG-IP and log in as **root**. **cat** or **more** bigip.conf
and look for you **test\_vs** virtual::

   cat bigip.conf
   more bigip.conf

*Q4. Did you find it in /config/bigip.conf?*

Each partition gets its own "folder" where its configuration is stored
under the **partitions** directory in the **/config** directory. At the
BIG-IP CLI prompt::

   cd /config/partitions/test_partition
   ls
   cat bigip.conf

*Q5. Did you find your virtual server? Is the tmsh change you made in
there?*

As **testuser** at the tmsh prompt type: **save sys config**

Look at your **bigip.conf** in the **test_partition**.

**Q6. Do you see the change now?**

Attempt to exit tmsh to get to the Linux CLI.

*Q7. Where you able to?*