1.01 - Determine which configuration objects are necessary to optimally deploy an application
=============================================================================================

LTM profiles enable BIG-IP to decode and manipulate different portions of the traffic being processed.
BIG-IP is a full proxy solution and some profiles apply to only one side of the end-to-end traffic flow (client side or server side).
Some configuration objects have dependencies on other objects, such as *Web Acceleration* and *HTTP Compression* profiles, which require an *HTTP* profile to also be configured.

Working with profiles
---------------------

Create a new pool called **secure\_pool**, using the **https** default
monitor and add the following members, **10.1.20.11:443,
10.1.20.12:443** and **10.1.20.13:443.**

Create new virtual server **secure\_vs** at **10.1.10.115:443** with
**TCP** the profile using your new **secure\_pool**.

Open two separate PuTTy/Terminal windows to the BIG-IP and run the following
tcpdumps using the jumpbox 10.1.10.x IP address.

Window 1::

   tcpdump -nni client_vlan -X -s0 host 10.1.10.199 and 10.1.10.115

Window 2::

   tcpdump -nni server_vlan -X -s0 host 10.1.10.199

Verify your virtual server is available and then browse to
**https://10.1.10.115**. View the TCPDUMPs.

*Q1. Did site work? Did you try enabling SNAT? Did you need SSL
profiles?*

*Q2. Could you use L7 iRules or profiles to view or modify the HTML
request or response? Why or why not?*

Modify **secure\_vs** to use the HTTP (80) **www\_pool**.

Verify your virtual server is available and then browse to
**https://10.1.10.115**.  View the TCPdumps.

*Q3. Did site work? Why or not?*

Change SSL Profile to include the default **clientssl** then update.

Browse to **https://10.1.10.115** and observe the tcpdump.

*Q4. Did site work? What did you observe in the tcpdumps? Did you need an
HTTP profile?*

On the **secure\_vs** in the virtual server **Resources** section enable
**cookie** as the **Default Persistence Profile** and then **Update**.

*Q5. Did it work? What was needed to add cookie persistence?*

Browse to **https://10.1.10.115/** scroll and click **Request and Response Headers**
in the **HTTP Request and Response Information** section on the web page.

*Q6. Which node do the pictures come from? What is the name of the cookie
inserted begin with?*

Assign the **secure\_pool** to the **secure\_vs** once again. Browse to
**https://10.1.10.115**

*Q5. Did site work? Why or why not?*

Troubleshoot and fix.

*Q6. What profile was needed to correct the error?*


TCP Profiles
------------

Set client-side and server-side TCP profiles on your virtual server
properties.

From the drop-down menus place the **f5-tcp-wan** profile on the
client-side and the **f5-tcp-lan** profile on the server-side and click **Update**.

Inspect each of the TCP profiles you used. Note the custom boxes. 

*Q1. What is the idle timeout in each profile? Why might you want to
change it?*

*Q2. What is the Nagle selection in the default TCP, f5-tcp-wan
and f5-tcp-lan profiles? Why might you want to change it?*

*Q3. What happens if you increase the proxy buffer sizes?*

1.02 - Determine whether or not an application can be deployed with only the LTM module provisioned
===================================================================================================

A virtual server requires an HTTP profile in order to manipulate HTML payloads.

Creating and Importing SSL Certs and Key
----------------------------------------

You want the highest levels of encryption between the BIG-IP and the
client, but you do not require the same levels of encryption between the
BIG-IP and the server and you would like to save server processing
power. You are going to create new SSL certificates with 2048 bit keys
for client-side SSL and import a certificate you own that has a 1024 bit
keys for the server-side SSL processing.

Create the client-side SSL certificate and key.

Go to **System >> Certificate Management >> Traffic Certificate Management >> SSL Certificate List**
and select **Create** and enter the following information.

+----------------------------+----------------------------+
| Name                       | **new\_ssl\_cert**         |
+============================+============================+
| Issuer                     | **Self**                   |
+----------------------------+----------------------------+
| Common Name                | **ltm301a.f5demo.com**     |
+----------------------------+----------------------------+
| Division                   | **Training**               |
+----------------------------+----------------------------+
| Organization               | **F5**                     |
+----------------------------+----------------------------+
| Locality                   | **Lab**                    |
+----------------------------+----------------------------+
| State or Province          | **Washington**             |
+----------------------------+----------------------------+
| Country                    |  **United States**         |
+----------------------------+----------------------------+
| Email                      | **example@f5demo.com**     |
+----------------------------+----------------------------+
| Subject Alternative Name   | **<leave this blank>**     |
+----------------------------+----------------------------+

By default, a self-sign certificate starts with a Lifetime of 365 days
and the key type is 2048 bit RSA.

Import an external SSL certificate and key to the BIG-IP to be used for
server-side encryption by selecting **Import**.

You can find the cert and key in A text file located on your Windows
jumbox's desktop. Look for the **Cert 301a LTM Architect.txt** file.

You may want to import the Key first, as it will validate the certificate if
your naming both the same. If you were to import the certificate first
and then import a Key with the same name you could technically attached
an invalid key to the certificate.

Import the **Key** (Type), with new name **import\_ssl\_cert**, leave the
**Password** blank. Select *Paste Text* for the *Key Source*, then select and copy all lines of text between the 
*BEGIN RSA PRIVATE KEY* and *END RSA PRIVATE KEY* lines inclusively.

Next import the certificate.  Type **Certificate** and new name **import\_ssl\_cert**.
Select *Paste Text* for the *Certificate Source*, then select and copy all lines of text between the
*BEGIN CERTIFICATE* and *END CERTIFICATE* lines inclusively.

*Q1. What is the common name of your imported certificate and when does
it expire?*

SSL Profile and Virtual Servers
-------------------------------

Now you will create a custom client and server side SSL profiles using
your new certificates and key and attach them to you **secure\_vs** and
test.

Create a custom client SSL profile using your **new\_ssl\_cert**
certificate, by going to **Profiles > SSL > Client**.

Name you new profile **my-client-ssl** and place **new\_ssl\_cert** in
the **Certificate** and **Key** drop-downs.

Make sure you **Add** the certificate and key before you Finish.

Go to the SSL Server profiles and create a new profile named
**my-server-ssl** with your **import-ssl-cert** certificate and key.

Replace the current default client-side and server-side SSL profiles
with your new SSL profiles.

Browse to **http://10.1.10.115**

*Q1. Did it work?*
