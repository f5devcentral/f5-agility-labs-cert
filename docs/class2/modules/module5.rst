Section 5 - Open a support ticket with F5
=========================================

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 5.01 Identify the appropriate supporting components and severity levels for an F5 support ticket
------------------------------------------------------------------------------------------------------------

|
|

**5.01 - Identify the necessary components for all support cases (Qkview
uploaded to iHealth/ or attached to case, serial number of device,
problem description, other supporting data)**

`https://support.f5.com/kb/en-us/solutions/public/0000/100/sol135.html <https://support.f5.com/kb/en-us/solutions/public/0000/100/sol135.html>`__

F5 Technical Support can help resolve issues more quickly when you
provide a full description of the issue and the details of your
configuration. To help you gather all the required information, use the
following guidelines to prepare for opening a case:

**General Information**

Provide the following information when you open a case with F5 Technical
Support:

1) **A full description of the issue, including the following details:**

-  The symptoms of the issue

-  The approximate time the issue first occurred

-  The number of times the issue has recurred

-  Any error output provided by the system

-  Steps to reproduce the issue

-  Any changes you made to the system before the issue first occurred

-  Any steps you have attempted to resolve the issue

2) **A description of the impact the issue is having on your site, using
   the following definitions:**

-  Site Down - All network traffic has ceased, causing a critical impact
   to your business.

-  Site at Risk - Primary unit has failed resulting in no redundancy.
   Site is at risk of going down.

-  Performance Degraded - Network traffic is partially functional
   causing some applications to be unreachable.

3) **The hours that you are available to work on the issue and any
   alternative contacts that can work on the issue if you are not
   available.**

4) **Remote access information, if possible.**

-  Remote access to your network environment is important, because it is
   the most effective method for collecting information and
   troubleshooting technical issues. If you cannot provide remote
   access, F5 Technical Support will work directly with you to resolve
   the issue over the phone; however, this method can often be more time
   consuming and may require file transfers, replication, and additional
   testing.

Collect the following information from the affected systems and provide
the information when you open the case.

**qkview or “tech.out” file**

    The qkview utility is a BIG-IP program that an administrator can use
    to automatically collect configuration and diagnostic information
    from BIG-IP and Enterprise Manager systems.

    Starting in BIG-IP 10.0.0, the qkview utility is an executable
    program that generates machine-readable (XML) diagnostic data from
    the BIG-IP or Enterprise Manager system and combines the data into a
    single compressed tar file. The diagnostic file can then be uploaded
    to BIG-IP iHealth, or given to F5 Technical Support to aid in
    troubleshooting.

    *Note: If you are running BIG-IP version 10.x or later, you can use
    BIG-IP iHealth to diagnose a qkview file. BIG-IP iHealth diagnoses
    the health and proper operation of your BIG-IP system when you
    upload the qkview file to the BIG-IP iHealth website. For more
    information, refer to the BIG-IP iHealth website.*

**Log files**

    *Note: The qkview utility automatically gathers 5MB of log files and
    includes them with qkview in a .tar output.*

    If the systems logs are heavy and more of the logs are needed,
    provide all the log files on the system by performing the following
    procedure:

    Log in to the command line.

    Create a tar archive named logfiles.tar.gz in the /var/tmp directory
    which contains all the files in the /var/log directory, by typing
    the following command:

    tar -czpf /var/tmp/logfiles.tar.gz /var/log/\*

**Packet traces**

    If the issue involves the network, perform a packet trace while the
    issue is occurring and provide the packet trace when you open the
    case.

    *Note: For more information about performing packet traces with
    tcpdump, refer to SOL4714: Performing a packet trace and providing
    the results to F5 Technical Support.*

**UCS archive**

    If you cannot give F5 Technical Support remote access to your
    system, you may need to provide a UCS archive of the current
    configuration. For more information, refer to SOL4423: Overview of
    UCS archives.

**Core files**

    Core files contain the contents of the system memory at the time a
    crash occurred. If the system has been configured to save core
    files, they will be located in the /var/savecore directory (BIG-IP
    versions 9.0 through 9.2.5) or /var/core directory (BIG-IP versions
    9.3 and later). Provide any existing core files when you open the
    case.

    *Note: For information about requirements when submitting core files
    to F5, refer to SOL10062: Submitting core files for analysis to F5
    Technical Support.*

----

|

**5.01 - Identify severity levels and the associated response times**

`https://www.f5.com/pdf/customer-support/guidelines-and-policies-ds.pdf <https://www.f5.com/pdf/customer-support/guidelines-and-policies-ds.pdf>`__

All F5 Network Support Centers uphold the following case severity
definitions and target response times to ensure that the appropriate
resources are used to resolve all technical issues as efficiently as
possible. F5 will endeavor to respond to Severity 1 and Severity 2
issues within one hour. Understanding that unforeseen events could delay
attempts, F5 expects that the majority of Severity 1 and Severity 2
issues will be responded to within this service level. Initial response
is defined as the time from when the F5 case was created to when a
Network Support Engineer first attempts to contact the case contact for
troubleshooting and updates the case log reflecting this action.

**SEVERITY 1**

    1-hour response - Software or hardware conditions on your F5 device
    are preventing the execution of critical business activities. The
    device will not power up or is not passing traffic.

**SEVERITY 2**

    1-hour response - Software or hardware conditions on your F5 device
    are preventing or significantly impairing high-level commerce or
    business activities.

**SEVERITY 3**

    4-business hour response - Software or hardware conditions on your
    F5 device are creating degradation of service or functionality in
    normal business or commerce activities.

**SEVERITY 4**

    24-hour response - Questions regarding configurations (“how to”),
    troubleshooting non-critical issues, or requests for product
    functionality that is not part of the current product feature set.

When a case is logged as Severity 1, F5 Network Support Managers are
immediately notified to ensure the case is assigned within the
appropriate timeframe to an appropriately skilled Network Support
Engineer.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 5.02 Given an issue, determine the appropriate severity according to F5 guidelines
----------------------------------------------------------------------------------------------

`https://www.f5.com/pdf/customer-support/guidelines-and-policies-ds.pdf <https://www.f5.com/pdf/customer-support/guidelines-and-policies-ds.pdf>`__

**SEVERITY 1**

    Software or hardware conditions on your F5 device are preventing the
    execution of critical business activities. The device will not power
    up or is not passing traffic.

**SEVERITY 2**

    Software or hardware conditions on your F5 device are preventing or
    significantly impairing high-level commerce or business activities.

**SEVERITY 3**

    Software or hardware conditions on your F5 device are creating
    degradation of service or functionality in normal business or
    commerce activities.

**SEVERITY 4**

    Questions regarding configurations (“how to”), troubleshooting
    non-critical issues, or requests for product functionality that is
    not part of the current product feature set.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|

Objective - 5.03 Provide quantitative and relevant information appropriate for a given issue
--------------------------------------------------------------------------------------------

|
|

**5.03 - Distinguish between qualitative/quantitative statements in
order to assemble an accurate problem description**

**General Network Study**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

Quantitative observations are observations that can be precisely
measured. (i.e. There is taking an additional 20 seconds per connection
over the connection times this morning.)

Qualitative observations have more to do with characteristics of what is
being observed. (i.e. It seems to be taking longer to connect than it
did this morning.)

----

|

**5.03 - Distinguish between relevant/irrelevant information in order to
assemble an accurate problem description**

**General Network Study**

This blueprint topic is related to choosing the correct answer for a
scenario type of question. For most questions like these you must have
exposure to supporting the BIG-IP platform in a production environment
or understand many of the different issues that may arise around the
topic and the best practice method of solving the issue. Hands-on study
is the best way to master these types of topics.

Is the information that you are gathering relative to the issue you are
experiencing? Troubleshooting can lead to many rat holes where you can
get lost from the real issues.

|

.. raw:: html

   <iframe width="560" height="315" src="https://www.youtube.com/embed/3uDzuRZ47FA?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

|

====

|
