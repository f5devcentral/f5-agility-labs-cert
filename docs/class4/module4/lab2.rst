Upgrading BIG-IP Device Service Clusters (DSC)
================================================

This lab is based on the instructions provided in the YouTube video provided by F5 `Updating BIG-IP HA systems with a point release <https://www.youtube.com/watch?v=wcaBq-_zjbs>`_.

BIG-IP TMOS version 15.1.0.4 is already available on the BIG-IPs, but you can feel free to download any version you want to the jumpbox and upload it to the BIG-IP to get the full upgrade experience.

   Part 1: 
      - 0:13 Installing the point release on the first device  
      - 0:40 Validating the configuration
      - 1:53 Verifying the Service check date
      - 3:23 Synchronizing the configuration
      - 4:32 Creating and saving a UCS archive
      - 5:52 Importing the ISO file
      - 7:05 Verifying the MD5 checksum
      - 7:45 Disabling the "Automatic with Incremental Sync" option
      - 8:30 Installing and rebooting to the new version
      - 14:16 Verifying the new point release version is active on the newly patched system
      - 15:00 Forcing a failover
   Part 2: 
      - 16:20 Installing the point release on the next device
      - 16:25 Repeat these steps 
      - 16:49 Verifying the new point release version is active on the newly patched system
      - 17:46 Forcing a failover
   Part 3: 
      - 19:25 Performing the final ConfigSync

