TMSH Commands
=============

Cut and paste these commands at the TMSH prompt **(tmos)#**::

   #
   # bigip01
   #
   # Client-side networking
   create net vlan client_vlan interfaces add { 1.1 { untagged } }
   create net self client_ip address 10.1.10.245/24 vlan client_vlan
   
   # Server-side networking
   create net vlan server_vlan interfaces add { 1.2 { untagged } }
   create net self server_ip address 10.1.20.245/24 vlan server_vlan

   # Default route
   create net route def_gw network 0.0.0.0/0 gw 10.1.10.1

   # Pool and Virtual Server v11.5.3
   create ltm pool www_pool members add { 10.1.20.11:80 10.1.20.12:80 10.1.20.13:80 } monitor http
   create ltm virtual www_vs destination 10.1.10.100:80 pool www_pool ip-protocol tcp source-address-translation { type automap }

   # Write changes to disk
   save sys config

   # Archive your change
   save sys ucs lab1-base-config