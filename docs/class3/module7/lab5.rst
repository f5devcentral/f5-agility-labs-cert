Module 5 - Managing the BIG-IP
==============================


UCS, BIG-IP Archive
-------------------

Create UCS Archive Files
~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. What extension must Archive have?*

.ucs

*Q2. What is the default location for ucs files?*

/var/local/ucs

*Q3. What is command for loading ucs file?*

load /sys ucs <path to UCS>

load /sys ucs <path to UCS> no-license - This will not restore the license
file

*Q4. What issues will occur by restoring ucs file on RMA device?*

Licensing and device cert keys must be updated.

Upgrading a BIG-IP Device Service Clusters (DSC)
------------------------------------------------

Upgrading software
~~~~~~~~~~~~~~~~~~

*Q1. You are about to start your upgrade to 12.1, which device will you
upgrade first?*

You would begin the upgrade on the standby device, in this case that
should be bigip02.

*Q2. True or false? Once the install is complete, the BIG-IP will
automatically reboot to the new volume.*

False, you will have to set the new volume as the Active volume and then
reboot the BIG-IP

*Q3. What steps would be required to complete the upgrade?*

1. Set the new volume to the active volume

2. Reboot the BIG-IP

3. Confirm the reboot was successful and the BIG-IP is running

4. Force the BIG-IP with the old software to Standby, making virtual
   servers, and other listeners active on the upgraded BIG-IP

5. Test that traffic is passing correctly.

6. Upgrade the BIG-IP with the older software.

BIG-IQ
------

Peruse BIG-IQ
~~~~~~~~~~~~~

*Q1. What BIG-IPs are being managed?*

bigip01.f5demo.com and bigip02.f5demo.com

*Q2. Where are configurations currently being display from?*

The configuration displayed was retrieved from the BIG-IP

*Q3. What is the difference between displaying from BIG-IQ and displaying
from BIG-IP?*

If you are displaying configuration from BIG-IP the configuration is
maintained and updated on that BIG-IP. If you are displaying
configuration from the BIG-IQ, then BIG-IQ owns the configuration and
can push changes out to the BIG-IP, no change should be made to the
BIG-IP directly.

*Q4. What now appears in the Nodes title when you hover the mouse over
it?*

A (**+**) appears in the title area because you can now modify the device
via the BIG\_IQ.

Make a modification via the BIG-IQ
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Was new\_node added to bigip02?*

No, it was not.

*Q2. What is being added? What is in the New Version window.?*

new\_node is being added and the REST commands to do that are show in
the New Version window.

*Q3. Check bigip02, was new\_node created?*

Yes
