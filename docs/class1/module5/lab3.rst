BIG-IQ
======

Peruse BIG-IQ
-------------

In this lab you will talk a short walk through the BIG-IQ interface and
perform a few tasks.

Logon to the BIG-IQ at **https://10.1.1.235**::
  Username: admin
  Password: admin

Go to **BIG-IQ > Device > Configuration > Overview** view the
various panes.

*Q1. What BIG-IPs are being managed?*

Select the Backups pane, select (**+**) and the **Add Backup**

.. image:: /_static/201bigiq.png 

Back up **bigip01.f5demo.com**.

Go to **BIG-IQ > ADC** and review the information in the panels.

*Q2. Where are configurations currently being display from?*

*Q3. What is the difference between displaying from BIG-IQ and displaying
from BIG-IP?*

Select **bigip02** and the hover the mouse over the **Nodes** title.

Now select the **BIG-IQ** radio button from above, select **bigip02**,
and then hover over the **Nodes** title.

*Q4. What now appears in the* **Nodes** *title when you hover the mouse
over it?*

Make a modification via the BIG-IQ
----------------------------------

With, **BIG-IQ** and **bigip02** selected hover over **Nodes** and hit
the plus sign (**+**) and add a new node to **bigip02** named
**new\_node** with an IP address of **10.1.20.252.**

*Q1. Was new\_node added to bigip02?*

Let's have BIG-IQ deploy the change. Select **Deployment** next to
**ADC** on the top bar.

Next to **Deployments**, select the plus sign (**+**) and **Deploy
Configuration Changes**. Select the **review Pending Changes** link.

*Q2. What is being added? What is in the New Version window.?*

Name deployment **deploy\_new\_node**, select the **bigip02** device and
click on **Deploy** in the upper left.

*Q3. Check bigip02, was new\_node created?*
