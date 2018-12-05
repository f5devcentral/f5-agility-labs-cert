SSL Certificates and Profiles
=============================

Creating and Importing Certs and Key
------------------------------------

You want the highest levels of encryption between the BIG-IP and the
client, but you do not require the same levels of encryption between the
BIG-IP and the server and you would like to save server processing
power. You are going to create new SSL certificates with 2048 bit keys
for client-side SSL and import a certificate you own that has a 1024 bit
keys for the server-side SSL processing.

Create the client-side SSL certificate and key.

Go to **System >> File Management >> SSL Certificate List** and select
**Create** and enter the following information\ **.**

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
| Country                    | **United States**          |
+----------------------------+----------------------------+
| State                      | **Washington**             |
+----------------------------+----------------------------+
| Email                      | **example@f5demo.com**     |
+----------------------------+----------------------------+
| Subject Alternative Name   | **<leave this blank>**     |
+----------------------------+----------------------------+

By default, a self-sign certificate starts with a Lifetime of 365 days
and the key type is 2048 bit RSA.

Import the SSL certificate and key below to the BIG-IP to be used for
server-side encryption by selecting **Import**.

You can find the cert and key under the **Lab Guides** link on your
browser bookmark bar. Look for the **Cert 301a LTM Architect.txt**
file/link. Open the link and the certificate and key are in there under
**LAB 5 - SSL**

You may want to import the Key first, as it will validate certificate if
your naming both the same. If you were to import the certificate first
and then import a Key with the same name you could technically attached
an invalid key to the certificate.

Import the **Key** (Type), named **import\_ssl\_cert**, leave the
**Password** blank.

**RSA Private Key**::

   -----BEGIN RSA PRIVATE KEY-----
   MIICXQIBAAKBgQCobsrka60VT1TLfQsamdtQCbvfnGC9ibiTtPjaHXRBpNV70prY
   rihQqj3pBNlE4dvK0ucF49gGF5HXpKZDqZWXai3AnJhia248FRyT/ezxAjVqamFh
   c3Lhx5ykSIxWzzw+VBuwTIvg2MS3aE3P/2CQ8MI02/uiLsya0eydw3EyiQIDAQAB
   AoGBAKPN3BP5hALNfDHKEhp0tw1H6ia19n9eiNtdjQbSzlVo8RXS5DUGar7IUh1k
   UcjjvtWp9nOL+nMySOvnfKshKhDbB/73NRg7VZ1eZL6K/0vv37KbDSU8KTQssSb3
   myKxrRVMbxxpPujpUNT3gd6XqdUXyPjWuJOkCGLgVfGhANHhAkEA2ssfpYXgID2a
   0B+VC+FaAB0GBg5P/oQF3mTPSj460totqGWeXi7beuYXgFYLbn5BNHCsDeVclZMy
   ws7k4SZiiwJBAMUTSRX3rjeZBpl0zF6xr/JFfw0Fd4lgKDO+hFZvrbhDUYIU9D08
   ROyH+FViQ0IoV2BtW9IZDtN/GzoroLE/hbsCQQCG5cwaSwOX/UOxZHeJ/qR2A28O
   Vs69dvsDVpZ0CRBNppWWCSlummdaS/lbeDHOK2vagEmku7CszDf04ok9xGPnAkAl
   5rubmfLLhoaaZLgZThsEgREaM/71UKTqrq1M4lWKpoe6eMUwMbMfulasNSWyR4fm
   Z6HNGjybuEpIObPB4vGZAkBo1LKCZXas+mxRfZeucfzPLOx5a8XmwtV57br+ivnK
   n0OIrSExckYHeeWb4sFl8Y/S85yyBqHS5q5v9s/x2fvp
   -----END RSA PRIVATE KEY-----

Import the certificate.  Type **Certificate** and named **import\_ssl\_cert**

**Certificate**::

   -----BEGIN CERTIFICATE-----
   MIIBuzCCASQCCQCTVAeV4noavTANBgkqhkiG9w0BAQUFADAiMSAwHgYDVQQDExds
   aW51eDMyc2VydmVyMS5mNXNlLmNvbTAeFw0xMDA2MTkyMTI2NTZaFw0yMDA2MTYy
   MTI2NTZaMCIxIDAeBgNVBAMTF2xpbnV4MzJzZXJ2ZXIxLmY1c2UuY29tMIGfMA0G
   CSqGSIb3DQEBAQUAA4GNADCBiQKBgQCobsrka60VT1TLfQsamdtQCbvfnGC9ibiT
   tPjaHXRBpNV70prYrihQqj3pBNlE4dvK0ucF49gGF5HXpKZDqZWXai3AnJhia248
   FRyT/ezxAjVqamFhc3Lhx5ykSIxWzzw+VBuwTIvg2MS3aE3P/2CQ8MI02/uiLsya
   0eydw3EyiQIDAQABMA0GCSqGSIb3DQEBBQUAA4GBAH1e+FXvNOnKlP5RO5wKVjG0
   C8F4Xww462beL2LeYZvV3ZjDoTUU0CNkkOnOKMbLkaiTICpBdd836sIiloAyV8M1
   2YZwxgwP/fV4ycTjHUnloEBmmmBVmW3M5DzLGA1k9cB1dUly5koIoRE9mYRWm9V2
   ZzYkbZf96KMh8zH47R4y
   -----END CERTIFICATE-----

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

Browse to **http://10.1.10.115**.

*Q1. Did it work?*
 