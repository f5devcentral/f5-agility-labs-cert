iApps and Analytics
===================

iApps is barely mentioned in the 201 blueprint and analytics not at all, but they were in the previous 201 and I decided to put them under the challenge labs for your edification and enjoyment.  And just in case there are a question or two on them.

Create an iApps and add Analytics
----------------------------------

As you saw in the first lab, Application Visibility and Reporting has
already been provisioned. You are going to create an analytics profile
and attach it to an HTTP iApp application you will create.

Open **Local Traffic > Profiles > Analytics** page.

Create an analytics profile checking the following boxes to obtain the 
desired information, and then click **Finished**.

+--------------------------+-----------------------------------------+
| **Profile Name**         | custom\_analytics                       |
+==========================+=========================================+
| **Collected Metrics**    | Max TPS                                 |
|                          |                                         |
|                          | Throughput                              |
|                          |                                         |
|                          | Page Load Time                          |
+--------------------------+-----------------------------------------+
| **Collected Entities**   | URLs                                    |
|                          |                                         |
|                          | Countries                               |
|                          |                                         |
|                          | Client IP Addresses                     |
|                          |                                         |
|                          | Client Subnets                          |
|                          |                                         |
|                          | Response Codes                          |
|                          |                                         |
|                          | User Agents                             |
|                          |                                         |
|                          | Methods                                 |
+--------------------------+-----------------------------------------+

Go to **iApps > Application Services** and select **Create**.

Select the **f5.http** template, name it **iapp\_lab** and review the
**Basic** selections.

In the **Template Options** section set the configuration mode to
**Advanced - Configure advanced options**.

Build the iApp using the following information:

+---------------------------+---------------------+
| **Virtual Server IP**     | 10.1.10.110         |
+===========================+=====================+
| **Virtual Server Port**   | 80                  |
+---------------------------+---------------------+
| **FQDN**                  | iapp.f5demo.com     |
+---------------------------+---------------------+
| **Pool member 1**         | 10.1.20.14:80       |
+---------------------------+---------------------+
| **Pool member 2**         | 10.1.20.15:80       |
+---------------------------+---------------------+
| **Analytics Profile**     | custom\_analytics   |
+---------------------------+---------------------+

Review the status and components built by the iApp.

From a couple of Chromium Incognito windows go to **http://10.1.10.110**
and refresh the page several times and the select the following links
from the page on each browser.

**Request and Response Headers Allowed** *(review the request and
response headers)*

**Multiple Stream Example**

*Q1. Did both pool members respond? Why?*

Go to **Statistics > Analytics > HTTP** and review the information.

.. NOTE::

   It may take up to 10 minutes for Analytic statistics to be available.

*Q2. Can you determine which page took the longest to load?*

Go to **Local Traffic > Pools** and attempt to add **10.1.20.13:80** to
the **iapp\_lab\_pool**.

*O3. Could you add the pool member? Why?*
