Getting Started
---------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

.. NOTE::
	 All work for this lab will be performed exclusively from a Xubuntu
	 jumphost via RDP or console via your web browser. No installation or interaction 
	 with your local system is required.

Lab Topology
~~~~~~~~~~~~

The following components have been included in your lab environment:

- 2 x F5 BIG-IP VE (v11.5.1)
- 1 x F5 |bip| |biq| (v4.5) (201 lab only)
- 1 x Linux LAMP Webserver (xubuntu 14.04)
- 1 x Xubuntu Jumphost (xubuntu 17.04)

.. NOTE::
	 Although the 201 certification is based of TMOS v11.4 for purposes of
	 simiplifying the environment for multiple certifications v11.5 was used.
	 As far as testing, there are no differences in the 201 labs between the two
	 versions.

BasicLab Diagram
^^^^^^^^^^^^^^^^

.. image:: /_static/lab-diagram.jpg

Lab Components
^^^^^^^^^^^^^^

The following table lists VLANS, IP Addresses and Credentials for all
components:

.. list-table::
    :widths: 20 40 40
    :header-rows: 1
    :stub-columns: 1

    * - **Component**
      - **VLAN/IP Address(es)**
      - **Credentials**
    * - Xubuntu Jumpbox
      - - **Management:** 10.1.1.51
        - **client_vlan:** 10.1.10.51
        - **server_vlan:** n/a
      - ``f5student``/``f5DEMOs4u``
    * - bigip01
      - - **Management:** 10.1.1.245
        - **client_vlan:** 10.1.10.245
        - **server_vlan:** 10.1.20.245
      - ``admin``/``admin``
    * - bigip02
      - - **Management:** 10.1.1.246
        - **client_vlan:** 10.1.10.246
        - **server_vlan:** 10.1.20.246
      - ``admin``/``admin``
    * - LAMPv4
      - - **Management:** 10.1.1.252
        - **client_vlan:** 10.1.10.252
        - **server_vlan:** 10.1.20.252
      - ``root``/``default``


