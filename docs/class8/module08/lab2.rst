2.04 - Determine how to perform a software upgrade while maintaining application availability
=============================================================================================

The video below walks you through the steps to upgrade the BIG-IP HA Pair

The video covers.

 #. Installing the point release on the first device  
 #. Validating the configuration
 #. Verifying the Service check date
 #. Synchronizing the configuration
 #. Creating and saving a UCS archive
 #. Importing the ISO file
 #. Verifying the MD5 checksum
 #. Disabling the "Automatic with Incremental Sync" option
 #. Installing and rebooting to the new version
 #. Verifying the new point release version is active on the newly patched system
 #. Forcing a failover
 #. Installing the point release on the next device
 #. Repeat the same steps for the upgrade on the device that has not yet been upgraded 
 #. Verifying the new point release version is active on the newly patched system
 #. Forcing a failover
 #. Performing the final ConfigSync

https://www.youtube.com/watch?v=wcaBq-_zjbs


Prior to any upgrade  there are a number of things to consider.


The following article provides a general summary of the BIG-IP upgrade process and includes recommendations and considerations for planning 
a BIG-IP software upgrade. You can use this document as a guide to create an upgrade checklist for your specific upgrade scenario.

https://support.f5.com/csp/article/K84554955

