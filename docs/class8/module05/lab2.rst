1.11 - Describe how to deploy applications using iApp templates
===============================================================

iApps is the BIG-IP® system framework for deploying services-based, template-driven configurations on BIG-IP systems.
An iApps Template is where the application is described and the objects (required and optional) are defined through presentation and implementation language.


Using iApps
-----------

Go to **iApps >> Application Services** and click **Create**.

Name your applicaiton **SimpleApp** and select the **f5.http** *Template*.

Review the information and questions presented by the f5.http template you chose. Note the mandatory fields are highlighted with a blue vertical line.

Type valid values for the mandatory fields (i.e., **1.1.1.1** for the *IP address** parameter and **test.local** for the *Host* parameter) and click **Finished**.

The **Components** tab opens and lists every configuration object that was created for you (i.e., pool, monitor, virtual address, virtual server, profiles, etc...).

Click on the virtual server's name (**SimpleApp_vs**) which opens the **Local Traffic >> Virtual Servers >> Virtual Server List >> SimpleApp_vs** page.

Notice the value of the **Application** parameter at the top of the page below the virtual server name.

Change the *Service Port* to **HTTPS** and click **Update**. Why are you not able to modify the virtual server properties?

.. HINT::
    The default value for the **Strict Updates** setting on the iApp's **Properties** tab prevents modification of the corresponding configuration objects.

Go to the iApp's **Reconfigure** tab and review the parameters in the *SSL Encryption* section.

How do you quickly delete every configuration object that was created by an iApp?