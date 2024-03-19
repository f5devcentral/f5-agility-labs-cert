1.03 - Identify the difference between deployments (e.g., one arm, two arm, npath, Direct Server Return/DSR)
============================================================================================================

Overview: Layer 2 nPath routing
-------------------------------
With the Layer 2 nPath routing configuration, you can route outgoing server traffic around the BIG-IP® system directly to an outbound router. This method of traffic management increases outbound throughput because packets do not need to be transmitted to the BIG-IP system for translation and then forwarded to the next hop.
https://techdocs.f5.com/en-us/bigip-14-0-0/big-ip-local-traffic-manager-implementations-14-0-0/configuring-npath-routing.html

Overview: Layer 3 nPath routing
-------------------------------
Using Layer 3 nPath routing, you can load balance traffic over a routed topology in your data center. In this deployment, the server sends its responses directly back to the client, even when the servers, and any intermediate routers, are on different networks. This routing method uses IP encapsulation to create a uni-directional outbound tunnel from the server pool to the server.
You can also override the encapsulation for a specified pool member, and either remove that pool member from any encapsulation or specify a different encapsulation protocol. The available encapsulation protocols are IPIP and GRE.
https://techdocs.f5.com/en-us/bigip-14-0-0/big-ip-local-traffic-manager-implementations-14-0-0/configuring-layer-3-npath-routing.html
