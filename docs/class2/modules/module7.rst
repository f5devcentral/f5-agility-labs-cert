Section 7 - Maintain system configuration
=========================================

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 7.01 Create and restore a UCS archive under the appropriate circumstances
-------------------------------------------------------------------------------------

|
|

**7.01 - Discuss scenarios in which restoring a UCS archive is appropriate**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/tmos-concepts-11-4-0/6.html - conceptid <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-concepts-11-4-0/6.html#conceptid>`__

Once you have created the configuration data for the BIG-IP system, you
can replicate all of this set of data in a separate file. You can then
use this replicated data later, for these reasons:

-  As an archive for disaster recovery

Using the Archives feature, you can back up the current configuration
data, and if necessary, restore the data at a later time. We highly
recommend that you use this feature to mitigate the potential loss of
BIG- IP system configuration data. To create an archive, you can use the
Configuration utility, which stores the configuration data in a special
file known as a user configuration set, or UCS file. You can then use
the UCS file to recover from any loss of data, in the unlikely event
that you need to do so.

----

|

**7.01 - Discuss the tasks involved in successfully restoring a UCS archive**

`https://support.f5.com/kb/en-us/solutions/public/13000/100/sol13132.html?sr=34127482#restoreui <https://support.f5.com/kb/en-us/solutions/public/13000/100/sol13132.html?sr=34127482#restoreui>`__

There are a few different ways to do a UCS restore on a BIG-IP platform.

**Restoring configuration data by using the Configuration utility**

Impact of procedure: The BIG-IP system replaces any existing
configuration with the UCS archive file configuration.

If you are restoring a UCS archive on a BIG-IP 6400, 6800, 8400, or 8800
hardware platform other than the system from which the backup was
created, such as when replacing an RMA system, you must perform the
procedure in the “Restoring configuration data from the command line by
using the tmsh utility” section of this article to restore the
configuration.

To restore a configuration in a UCS archive by using the Configuration
utility, review the considerations described in the Considerations for
restoring configuration data section of this article before performing
the following procedure:

1) Log in to the Configuration utility.

2) Click System.

3) Click Archives.

4) Click the name of the UCS archive you want to restore.

5) If the UCS archive is encrypted, type the passphrase for the
   encrypted UCS archive file in the Restore Passphrase field. If the
   UCS archive is not encrypted, you can skip this step.

6) To initiate the UCS archive restore process, click Restore.

7) When the restore process is completed, examine the status page for
   any reported errors before proceeding to the next step.

8) To return to the Archive List page, click OK.

If you restored the UCS archive on a different device and received the
errors noted in the “Considerations for restoring configuration data”
section of this article, you must reactivate the BIG-IP system license.

After relicensing the system, restart the system to ensure that the
configuration is fully loaded. To restart the system, navigate to System
> Configuration, and then click Reboot.

If the system you restored contains the FIPS 140 HSM, you must configure
the FIPS 140 HSM Security World after completing steps 1 through 9. For
additional information about recovering FIPS information after a system
recovery, refer to the Configuring and Maintaining a FIPS Security
Domain chapter in the Platform Guide: 6900 and 8900.

**Restoring configuration data from the command line by using the tmsh utility**

Impact of procedure: The BIG-IP system replaces any existing
configuration with the UCS archive file configuration.

1) Log in to tmsh by typing the following command:

*tmsh*

1) Restore the UCS archive file by using the following command syntax.
   Replace <path/to/UCS> with the full path of the UCS archive file you
   want to restore: *load /sys ucs <path/to/UCS>*

If you do not specify the path, the BIG-IP system performs as if the UCS
archive file is located in the default /var/local/ucs directory.

1) If the UCS archive file was encrypted with a passphrase during the
   backup, you are prompted to enter the passphrase for the archive
   file.

2) If you are running BIG-IP on a 6400, 6800, 8400, or 8800 hardware
   platform, type the following command to switch to the bash shell:

*run /util bash*

1) Type the following command to verify that the new or replaced secure
   shell (SSH) keys from the UCS file are synchronized between the
   BIG-IP system and the Switch Card Control Processor (SCCP):

*keyswap.sh sccp*

1) Type the following command to switch back to tmsh:

*exit*

1) Restart the system by typing the following command:

*reboot*

If you installed the UCS archive on the same device on which the backup
was created, it loads the restored configuration after the system
restarts. If you restored the backup on a different device and received
the first error noted in the Considerations for restoring configuration
data section of this article, you must reactivate the BIG-IP system
license. Alternatively, you can replace the /config/bigip.license file
with the original bigip.license file that you backed up from the target
system.

1) If the system you restored contains the FIPS 140 HSM, you must
   configure the FIPS 140 HSM Security World after completing steps 1
   through 5. For additional information about recovering FIPS
   information after a system recovery, refer to the Configuring and
   Maintaining a FIPS Security Domain chapter in the Platform Guide:
   6900 and 8900.

**Restoring configuration data on a replacement RMA unit**

F5 recommends that you use the following procedure when you restore the
archive on a different device than the system on which the backup was
created, such as an RMA system. If you do not use this procedure when
restoring the archive on a different device, the configuration load may
fail and the mcpd process generates an error message that appears
similar to the following example to both stdout and the /var/log/ltm
file:

mcpd[2395]: 01070608:0: License is not operational(expired or digital
signature does not match contents)

F5 expects this message, and you can correct the issue by re-licensing
the system, which is discussed later in the procedure.

Impact of procedure: The BIG-IP system replaces any existing
configuration with the UCS archive file configuration.

1) Activate the license on the unit according to the steps detailed in
   SOL7752: Overview of licensing the BIG-IP system.

2) Log in to tmsh by typing the following command:

*tmsh*

1) Restore the UCS archive file by using the following command syntax.
   Replace <path/to/UCS> with the full path of the UCS archive file you
   want to restore:

*load /sys ucs <path/to/UCS> no-license*

If you do not specify the path, the BIG-IP system performs as if the UCS
archive file is located in the default /var/local/ucs directory.

1) If the UCS archive file was encrypted with a passphrase during the
   backup, you are prompted to enter the passphrase for the archive
   file.

2) If you are running the BIG-IP system on a 6400, 6800, 8400, or 8800
   hardware platform, switch to the bash utility by entering the
   following command:

run /util bash

1) To verify that the new or replaced SSH keys from the UCS file are
   synchronized between the BIG-IP and the SCCP, enter the following
   command:

*keyswap.sh sccp*

1) To switch back to tmsh, type the following command:

*exit*

1) Restart the system by typing the following command:

*reboot*

1) If the system you restored contains the FIPS 140 HSM, you must
   configure the FIPS 140 HSM Security World after completing steps 1
   through 5. For additional information about recovering FIPS
   information after a system recovery, refer to the Configuring and
   Maintaining a FIPS Security Domain chapter in the Platform Guide:
   6900 and 8900.

**Restoring UCS archives on BIG-IP systems running later software versions**

Impact of procedure: The BIG-IP system replaces any existing
configuration with the UCS archive file configuration.

F5 recommends that the BIG-IP system run the same version of the BIG-IP
software from which it was backed up. However, in some cases, it is
possible to restore a UCS archive that was obtained from an earlier
software version on a target BIG-IP system running a later software
version. For example, if you saved a UCS archive on a system running
BIG-IP 10.2.3, it is possible to restore the version BIG-IP 10.2.3
archive file on a BIG-IP system running 11.x. To restore a UCS archive
on a BIG-IP system running a later software version, perform the
following procedure:

1) Verify that a supported upgrade path exists between the software
   version from which the UCS archive was obtained and the software
   version running on the target system.

For example, there is a supported upgrade path between BIG-IP 10.x and
BIG-IP 11.x. As a result, you can successfully restore a BIG-IP 10.x UCS
archive file on a BIG-IP system running 11.x. However, there is no
supported upgrade path between BIG-IP 9.x and BIG-IP 11.x. As a result,
you cannot restore a BIG-IP 9.x UCS archive file on a BIG-IP system
running 11.x.

For information about supported upgrade paths, refer to the product
release notes for your specific software version.

1) Review the previous section, Considerations for restoring
   configuration data.

2) Manually copy the UCS archive file to the /var/local/ucs/ directory
   on the target system.

3) Restore the UCS archive on the BIG-IP system:

-  If you are restoring the archive on a different device than the
   system on which the backup was created, follow the “Restoring
   configuration data on a replacement RMA unit” procedure.

-  If you are restoring the archive on a different device than the
   system on which the backup was created, follow the “Restoring
   configuration data from the command line by using the tmsh utility”
   procedure.

----

|

**7.01 - Given a scenario, discuss when it is appropriate to create a
UCS archive**

**GUI Study in the vLabs**

Any time the system administrator makes changes to the configuration of
the system a UCS archive should be taken prior to the change and after
the change. This will allow for a restore to the point prior to the
change and also provides a backup of the new current state. This should
be done on both the Active and stand by systems in an HA pair.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 7.02 Identify which high-level tasks can be automated using BIG-IQ
------------------------------------------------------------------------------

|
|

**7.02 - Identify which high-level tasks can be automated using BIG-IQ**

`https://support.f5.com/kb/en-us/products/big-iq-adc/manuals/product/bigiq-adc-administration-4-5-0/1.html - unique\_1381791279 <https://support.f5.com/kb/en-us/products/big-iq-adc/manuals/product/bigiq-adc-administration-4-5-0/1.html#unique_1381791279>`__

BIG-IQ Application Delivery Controller (ADC) makes it possible for you
to monitor and manage the Local Traffic Manager (LTM) configuration on
BIG-IP devices. This module helps the user:

-  Create efficient work flows to view the LTM configurations in a
   relational and dynamic user interface.

-  Control access to configuration objects using fine-grained,
   role-based access control (RBAC). This allows administrators to
   delegate frequently performed operations (for example, enabling or
   disabling pool members) to the correct team member.

-  Maintain ultimate control of the LTM configuration by providing a
   staging option. Delegated team members make all relevant changes,
   then the administrator can apply them after a quick review.

BIG-IQ ADC has two primary interfaces; Configuration and Deployment.

-  Use the Configuration interface to work with the settings for the
   devices the BIG-IQ device manages. The Configuration interface has
   two interactive modes: On BIG-IQ and On BIG-IP.

-  When BIG-IP is selected, the settings that display for the managed
   devices are from the most recent sync. You cannot make changes to
   these settings when BIG-IP is selected.

-  When On BIG-IQ is selected, the settings that display for the managed
   devices still include the most recent sync settings, but also include
   any revisions you have made.

-  Use the Deployment interface to apply configuration changes, that
   were made on the BIG-IQ device, to the managed devices.

To get familiar with BIG-IQ for the exam you should download the VE of
BIG-IQ and set it up in your vLAB environment.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 7.03 Manage software images
---------------------------------------

https://support.f5.com/kb/en-us/solutions/public/k/34/sol34745165.html?sr=54637095

The BIG-IP system allows you to install and delete additional software
images on separate boot locations, also called volumes. You can then
boot the BIG-IP system to a specific volume and begin processing traffic
using that specific software version. By default, the BIG-IP system has
three volumes that appear similar to the following example:

----

Sys::Software Status

Volume Product Version Build Active Status

----

HD1.1 BIG-IP 11.5.2 0.0.141 no complete

HD1.2 BIG-IP 11.5.3 0.0.163 yes complete

HD1.3 none none none no complete

You can find the step-by-step instructions on loading software onto the
BIG-IP in this sections hyperlink.

**Potential impact of booting a device into another volume**

Booting the BIG-IP platform into another volume may put the system in an
inaccessible state if the circumstances are right. Just because there is
an OS loaded onto a volume does not mean there is any configuration
other than the default configuration on the volume. The out of band
management may still be set to the default IP address and you could lose
your management connection the unit. Or if this was a volume that was
used in the past it will likely be in the state it was in when the
system was booted into another volume. This could mean that it is
running some older configuration that is not the same as the current
configuration in the current volume, or the system could even be
licensed differently leaving some functions of the OS not even enabled.

The **cpcfg** command allows you to copy a configuration from a
specified source boot location to a specified target boot location. If
the specified target boot location is an earlier version than the source
boot location, the command fails with an error message. If the specified
target boot location is the active boot location, the command fails with
an error message.

**Common issues related to the migration of a device to a new software version**

`http://support.f5.com/kb/en-us/solutions/public/13000/100/sol13123.html <http://support.f5.com/kb/en-us/solutions/public/13000/100/sol13123.html>`__

If the device you are migrating, to a new version of software, is not an
HA pair. The upgrade will cause an outage so plan accordingly.

When dealing with an HA pair of devices, upgrades should be done on the
units in the standby state to minimize outages. A hotfix to an existing
software version is normally non-impactful to the operation of the unit,
however it is still a best practice to upgrade the standby unit first,
confirm the upgrade, failover the pair and proceed with upgrading the
now standby unit.

Always follow the F5 Solutions or SOLs for installing the software.

Some common issues that can be impactful to an environment when doing
software upgrades are know issues with the release, iRule compatibility
with the newer version and older version configurations migrating
forward successfully.

Before upgrading to the next desired version of OS the administrator
should read all the release notes to make sure that the known issues on
that release will not impact with the configurations currently running.

iRules are compiled scripts running on the system’s current version of
code. Changes in the OS can change how the iRule functions (or functions
at all) between versions. Testing the OS upgrade in a lab environment is
the best way to make sure there are no failing iRules after an upgrade.
Also reading through the DevCentral reference on Commands and Events by
version is a good plae to start.
https://devcentral.f5.com/wiki/iRules.BIGIP_Commands_by_Version.ashx

When migrating from older releases to a newer major release of OS, there
can be issues with configuration migration to the newer release. You
should always read the release notes and follow the recommended
migration path for the version on the Ask F5 site.
http://support.f5.com/kb/en-us.html

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 7.04 Given an HA pair, describe the appropriate strategy for deploying a new software image
---------------------------------------------------------------------------------------------------------

|
|

**7.04 - Given an HA pair, describe the appropriate strategy for deploying a new software image**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/bigip-upgrade-active-standby-11-4-0/1.html - unique\_305366860 <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/bigip-upgrade-active-standby-11-4-0/1.html#unique_305366860>`__

The upgrade process involves preparation of the two BIG-IP devices
(Device A and Device B) configured in an active-standby implementation,
followed by the installation and verification of version 11.0 on each
device. When you upgrade each device, you perform several tasks.
Completing these tasks results in a successful upgrade to version 11.0
on both BIG-IP devices, with a traffic group configured properly for an
active-standby implementation.

In a properly configured HA pair of BIG-IP devices, a software upgrade
should always be done on the standby unit in the pair. This allows the
upgrade to be hitless to the extent of nothing greater than a failover
between functioning units in the HA pair.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 7.05 Understand the processes of licensing, license reactivation, and license modification (add-ons)
----------------------------------------------------------------------------------------------------------------

|
|

**7.05 - Understand the processes of licensing, license reactivation,
and license modification (add-ons)**

`https://support.f5.com/kb/en-us/solutions/public/7000/700/sol7752.html?sr=54637267 <https://support.f5.com/kb/en-us/solutions/public/7000/700/sol7752.html?sr=54637267>`__

Before you can configure and use the BIG-IP system, you must activate a
valid license on the system. To license the BIG-IP system, you must
perform the following procedures:

Obtaining a registration key

Obtaining a dossier

Activating the license

**Obtaining a registration key**

Before you can activate the license for the BIG-IP system, you must
obtain a base registration key. The base registration key is a
27-character string that instructs the license server which F5 products
you can license. The base registration key is pre-installed on new
BIG-IP systems. When you connect to the Configuration utility, the
Licensing screen opens and displays the registration key.

**Obtaining a dossier**

The dossier is an encrypted list of key characteristics used to identify
the platform, which you can obtain from the BIG-IP software. The dossier
is generated by your F5 product after you choose a license activation
method.

**Activating the license**

If your BIG-IP system is not yet licensed and you connect to the
Configuration utility, you are prompted to enter the base registration
key. Certain systems may require you to enter keys for additional
modules in the Add-On Registration Key List box.

To activate the license on the BIG-IP system using the Configuration
utility, you can use either the automatic activation method or the
manual activation method. The activation method specifies the method by
which you want the system to communicate with the F5 License Server. The
license activation date is unique to the device that the dossier is
derived from.

For step-by-step procedures please review the content via the hyperlink.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 7.06 Identify which modules are licensed and/or provisioned
-----------------------------------------------------------------------

|
|

**7.06 - Identify which modules are licensed and/or provisioned**

`https://support.f5.com/kb/en-us/solutions/public/12000/100/sol12111.html?sr=54657583 <https://support.f5.com/kb/en-us/solutions/public/12000/100/sol12111.html?sr=54657583>`__

Using the Configuration utility, you can easily display the licensed
software and see which of the software modules are provisioned to run on
the platform. Simply go to System > Resource Provisioning to see the
current configuration.

|

.. image:: /_static/201/p17.png


|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 7.07 Explain how to create a user
---------------------------------------------

|
|

**7.07 - Explain how to create a user**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/tmos-concepts-11-4-0/10.html?sr=54654799 <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-concepts-11-4-0/10.html?sr=54654799>`__

An important part of managing the BIG-IP system is creating and managing
user accounts for BIG-IP system administrators. By creating user
accounts for system administrators, you provide additional layers of
security. User accounts ensure that the system:

-  Verifies the identity of users logging into the system
   (authentication)

-  Controls user access to system resources (authorization)

To enable user authentication and authorization, you assign passwords
and user roles to your user accounts. Passwords allow you to
authenticate your users when they attempt to log in to the BIG-IP
system. User roles allow you to control user access to BIG-IP system
resources.

You can create and store BIG-IP administrative accounts either locally
on the BIG-IP system, or remotely on a separate authentication server.
If you want your user accounts to reside locally on the BIG-IP system,
you create those user accounts on the BIG-IP system and assign user
roles to them.

If you want your user accounts to reside remotely on a separate
authentication server, you do not use the BIG-IP system to create the
accounts. Instead, you use the mechanism provided by the server vendor,
and you use the BIG-IP system strictly to assign user roles to those
remote accounts and to maintain those user role assignments over time.
The types of servers that you can use to remotely store BIG-IP system
user accounts are:

-  Lightweight Directory Access Protocol (LDAP) servers

-  Active Directory servers

-  Remote Authentication Dial-in User Service (RADIUS) servers

User account types

There are two types of user accounts on the BIG-IP system: The system
maintenance account and a set of standard user accounts.

The system maintenance account

The system maintenance account is a user account that you maintain using
the Setup utility. The name of the system maintenance account is root.
This account resides locally on the BIG-IP system and grants full access
to BIG-IP system resources. You configure and maintain this account
using the Setup utility and the Configuration utility, respectively.

Standard user accounts

Standard user accounts are user accounts that you create for other
BIG-IP system administrators to use. Standard user accounts can reside
either locally on the BIG-IP system, or remotely on a remote
authentication server. You create and maintain these accounts using the
browser-based Configuration utility or the command line interface.
Creating standard user accounts allows you to assign various user roles
to those accounts as a way to control system administrator access to
BIG-IP system resources. A special standard user account is the admin
account, which automatically exists on any BIG-IP system.

You are not required to have any user accounts other than the root and
admin accounts, but F5 recommends that you create other user
accounts, as a way to intelligently control administrator access to
system resources.

Administrative partitions

When you create configurable objects for the BIG-IP system, you have the
option of putting those objects into administrative partitions. An
administrative partition is a logical container of BIG-IP system objects
such as virtual servers, pools, and monitors. When you first install the
BIG-IP system, a default partition already exists named Common.

By putting objects into partitions, you establish a finer granularity of
access control. Rather than having control over all resources on the
BIG-IP system or no resources whatsoever, users with certain permissions
can control resources within a designated partition only. For example,
users with the role of Operator can mark nodes up or down, but can only
mark those nodes that reside within their designated partition.

User accounts are another type of object that you can put into a
partition. You put user accounts into administrative partitions strictly
for the purpose of giving other users administrative access to those
accounts. For example, you can put user accounts into partition B, and
then assign a set of permissions (known as a user role) to user Jane so
that she is allowed to modify user accounts in partition B.

Each user account on the BIG-IP system has a property known as Partition
Access. The Partition Access property defines the partitions that the
user can access. A user account can have access to either one partition
or all partitions. Access to all partitions is known as universal
access.

This figure shows how partition access can differ for different user
accounts on the BIG-IP system.

|

.. image:: /_static/201/p18.png


|


In this example, the BIG-IP system objects reside in multiple
partitions. Note that user accounts are also a type of BIG-IP system
object, and as such, reside in a partition named Users. (Although you
are not required to group user accounts together in a separate
partition, for security purposes F5 highly recommends that you
do so.)

To continue with the example, each user account in partition Users has
access to specific, but different, partitions. Note that user accounts
sjones, cjohnson, and gnelson can access one partition only, while the
tbrown account has universal access.

To summarize, an administrative partition defines a set of objects,
including user accounts, that other administrative users can potentially
manage. This gives computing organizations greater control over user
access to specific objects on the BIG-IP system.

**What are user roles?**

User roles are a means of controlling user access to BIG-IP system
resources. You assign a user role to each administrative user, and in so
doing, you grant the user a set of permissions for accessing BIG-IP
system resources.

The BIG-IP system offers several different user roles that you can
choose from when assigning a role to an administrative user. A user role
is a property of a user account. Each user role grants a different set
of permissions. More specifically, a user role defines:

The resources that a user can manage

User roles define the types of resources, or objects, that a user can
manage. For example, a user with the role of Operator can enable or
disable nodes and pool members only. By contrast, a user with the Guest
role cannot manage any BIG-IP system resources.

The tasks that a user can perform

For example, a user with the role of Operator can enable or disable
nodes and pool members, but cannot create, modify, or delete them.
Conversely, a user with the Manager role can perform all tasks related
to partitioned objects (except for user accounts), including nodes and
pool members.

Important: A role defines the type of objects that a user can manage and
the tasks that a user can perform on those object types. A role does not
define the set of specific, existing objects that the user can access.

**User roles on the BIG-IP system**

**Administrator:** This role grants users complete access to all
partitioned and non-partitioned objects on the system. In addition,
accounts with the Administrator role can change their own passwords.

**Resource Administrator**: This role grants users complete access to
all partitioned and non-partitioned objects on the system, except user
account objects. In addition, accounts with the Resource Administrator
role can change their own passwords.

**User Manager**: Users with the User Manager role that have access to
all partitions can create, modify, delete, and view all user accounts
except those that are assigned the Administrator role, or the User
Manager role with different partition access. Accounts with the User
Manager role that have access to all partitions can also change their
own passwords.

Users with the User Manager role that have access only to a single
partition can create, modify, delete, and view only those user accounts
that are in that partition and that have access to that partition only.
For example, if your user account has a User Manager role and has access
to Partition A only, then you can manage only those user accounts that
both reside in and have access to Partition A only.

User accounts with the User Manager role can change their own passwords.

**Manager**: This role grants users permission to create, modify, and
delete virtual servers, pools, pool members, nodes, custom profiles,
custom monitors, and iRules. These users can view all objects on the
system and change their own passwords.

**Certificate Manager:** This role grants users permission to manage
device certificates and keys, as well as perform Federal Information
Processing Standard (FIPS) operations.

iRule Manager: This role grants users permission to create, modify, and
delete iRules. Users with this role cannot affect the way that an iRule
is deployed. For example, a user with this role can create an iRule but
cannot assign it to a virtual server or move the iRule from one virtual
server to another. A user with this role can be assigned universal
access to administrative partitions.

**Application Editor**: This role grants users permission to modify
nodes, pools, pool members, and monitors. These users can view all
objects on the system and change their own passwords.

**Acceleration Policy Editor**: This role allows users to view, create,
modify, and delete all WebAccelerator policy objects in all
administrative partitions. Users can also view, create, update, and
delete Web Acceleration profiles.

**Application Security Administrator**: This role grants a user access
to all Application Security Manager security policy objects on the
BIG-IP system. These users have read-only permission for these profile
types: HTTP, FTP, and SMTP. These users have no access to other LTM
objects, nor to any TMOS objects. They can, however, change their own
passwords. With respect to security policy objects, this role is similar
to the Administrator role. You can assign this role only when the BIG-IP
system includes the BIG-IP Application Security Manager component.

**Web Application Security Editor:** This role allows a user to
configure or view most parts of the Application Security Manager
component, in a specified administrative partition only. Specifically,
these users have limited access to LTM objects, namely read-only
permission for these profile types: HTTP, FTP, and SMTP.

These users have no access to other LTM objects, nor to any TMOS
objects. They can, however, change their own passwords.

You can assign this role only when the BIG-IP system includes the
Application Security Manager component.

**Operator**: This role grants users permission to enable or disable
nodes and pool members. These users can view all objects and change
their own passwords.

**Auditor**: This role grants users permission to view all configuration
data on the system, including logs and archives. Users with this role
cannot create, modify, or delete any data, nor can they view SSL keys or
user passwords.

**Guest**: This role grants users permission to view all objects on the
system except for sensitive data such as logs and archives. Users with
this role can change their own passwords.

**No Access**: This role prevents users from accessing the system.

**Local user account creation**

You can create a new user in the GUI as well as tmsh. To create a user
in the GUI, go to System > Users and then click Create.

When you create a local user account, you must give the account a name
and a password. You must also set the user role, either by retaining the
default user role or by assigning a new one. The default user role for
local, non-system maintenance accounts is No Access.

Only users who have been granted the Administrator or User Manager role
can create user accounts. If the user role assigned to your account is
Administrator, you can create a user account in any partition on the
system. If the user role assigned to your account is User Manager, you
can create a user account in any partition to which you have access.

**Properties of a local BIG-IP system user account**

**User Name:** Specifies the name of the user account. The BIG-IP system
is case-sensitive, which means that names such as JONES and Jones are
treated as separate user accounts. No default value

**Partition:** When viewing the properties of an existing user account,
displays the name of the partition in which the user account resides.
All partitionable BIG-IP system objects (including user account objects)
have the Partition property. Note that you cannot edit the value of this
setting. No default value

**Password**: Specifies a password that the user will use to log in to
the BIG-IP system. No default value

**Role**: Specifies the user role that you want to assign to the user
account. Default Value No Access

**Partition Access**: Specifies the partition to which the user has
access when logged on to the BIG-IP system. If you have permission to do
so, you can assign this value to a new user account, or change this
value on an existing user account. This setting appears only when the
user role for the account is not Administrator. (Accounts with the
Administrator role always have universal partition access, that is,
access to all partitions.) Default Value All

**Terminal Access**: Specifies the level of access to the BIG-IP system
command line interface. Possible values are: Disabled and Advanced
shell. Users with the Administrator or Resource Administrator role
assigned to their accounts can have advanced shell access, that is,
permission to use all BIG-IP system command line utilities, as well as
any Linux commands. Default Value Disabled

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 7.08 Explain how to modify user properties
------------------------------------------------------

|
|

**7.08 - Explain how to modify user properties**

`https://support.f5.com/kb/en-us/products/big-ip\_ltm/manuals/product/tmos-concepts-11-4-0/10.html?sr=54654799 <https://support.f5.com/kb/en-us/products/big-ip_ltm/manuals/product/tmos-concepts-11-4-0/10.html?sr=54654799>`__

Using the Configuration utility, you can easily display a list of
existing local user accounts and view the properties of an individual
account. Only users who have been granted the Administrator or User
Manager roles can view the settings of other user accounts.

If the user role assigned to your account is Administrator, you can view
any user account on the BIG-IP system, in any partition. If the user
role assigned to your account is User Manager, you can view any user
account in any partition to which you have access on the BIG-IP system.

To summarize, depending on their own partition access, users with a User
Manager role can do some or all of the following:

-  Change another user’s password

-  Change another user’s user role

-  Change the partition in which the user can access objects (applies
   only to users who have both a User Manager role and access to all
   partitions)

-  Enable or disable terminal access

**Local user account modification**

You use the Configuration utility to modify the properties of any
existing local user account, other than the root account. When modifying
user accounts, consider the following:

-  Only users who have been granted either the Administrator or User
   Manager role can modify user accounts other than their own account.

-  A user with the User Manager role can modify only those accounts that
   reside in the partition to which that user has access. For example,
   if user nelson has a User Manager role and has access to partition B
   only, he can modify only those user accounts that reside in partition
   B. Even in this case, however, for user accounts in partition B, user
   nelson cannot modify a user’s Partition Access property. If, however,
   user nelson has a User Manager role and has access to all partitions,
   he can modify all user accounts on the system. This includes changing
   another user’s Partition Access property.

-  Users with any role but No Access can modify their own user accounts
   to change the password. These users cannot modify any other
   properties of their own user accounts. *Note: When a user changes his
   own password, the system automatically logs the user off of the 
   Configuration utility. The system then requires the user to use the new 
   password for subsequent logins. This behavior applies even when the new 
   password matches the old password.*

-  Users with the role of User Manager can modify all of the properties
   of their own user accounts, except their user role and partition
   access.

If you have an Administrator user role, you can also change some
properties of the root account. Specifically, you can change the
password of the root account, and you can enable or disable access to
the BIG-IP system through SSH.

*Warning: The Administrator user role provides access to the BIG-IP
system prompt. If a user with the Administrator user role is currently
logged on to the system, and you change the user role to a role other
than Administrator or Resource Administrator, the user can still run
commands at the BIG-IP system prompt until he or she logs off of the
system.*

**Delete local user accounts**

If the account you are using has the Administrator or User Manager user
role, you can delete other local user accounts. A user with the
Administrator role can delete any user account on the BIG-IP system in
any partition. A user with the User Manager role can delete user
accounts on the BIG-IP system in only those partitions to which she has
access.

When you delete a local user account, you remove it permanently from the
local user-account database on the BIG-IP system.

*Note: You cannot delete the admin user account, nor can you delete the
user account with which you are logged in.*

*Warning: The Administrator user role provides access to the BIG-IP
system prompt. If a user with the Administrator user role is currently
logged in to the system and you delete the user account, the user can
still run commands at the BIG-IP system prompt until he or she logs off
of the system.*

**Remote user account management**

Rather than store user accounts locally on the BIG-IP system, you can
store them on a remote authentication server. In this case, you create
all of your standard user accounts (including user names and passwords)
on that remote server, using the mechanism supplied by that server’s
vendor.

Once you have created each user account on the remote server, you can
then use the BIG-IP system to assign authorization properties (user
role, partition access, and terminal access) for each account, for the
purpose of controlling user access to BIG-IP system resources.

*Important: You can assign authorization properties to remotely-stored
user accounts on a group basis. You can then use the single
configuration file (SCF) feature to propagate those properties to other
BIG-IP devices on the network.*

The Configuration utility stores all local and remote access control
information in the BIG-IP system’s local user-account database. When a
user whose account information is stored remotely logs into the BIG-IP
system and is granted authentication, the BIG-IP system then checks its
local database to determine the access control properties that you
assigned to that user.

*Note: The Configuration utility refers to remote user accounts as
external users. An external user is any user account that is stored on a
remote authentication server.*

*Important: Only users with the role of Administrator can manage user
roles for remote user accounts. Also, if a user with a local user
account is logged on to the BIG-IP system, and you subsequently switch
the system from local authentication to remote authentication, the local
user remains authenticated until the user’s login session terminates.*

**Remote user-account server specification**

One of the tasks you perform with the Configuration utility is to
specify the type of remote user-account server that currently stores
your remote user accounts. The available server types that you can
specify are:

-  Active Directory or Lightweight Directory Access Protocol (LDAP)

-  Remote Authentication Dial-In User Service (RADIUS)

-  Terminal Access Controller Access-Control System Plus (TACACS+)

When you specify the type of remote server, you can also configure some
server settings. For example, you can specify the user role you would
like the BIG-IP system to assign to a remote account if you do not
explicitly assign one.

Once you have configured the remote server, if you want any of the
remote accounts to have a non-default user role, you can explicitly
assign a user role to those accounts.

If the remote authentication server is an Active Directory or LDAP
server and is set up to authenticate SSL traffic, there is an additional
feature that you can enable. You can configure the BIG-IP system to
perform the server-side SSL handshake that the remote server would
normally perform when authenticating client traffic. In this case, there
are some preliminary steps you must perform to prepare for remote
authentication using SSL.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|
