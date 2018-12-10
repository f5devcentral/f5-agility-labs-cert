Module 6 - Modify and Troubleshoot Pools and Virtual Servers
============================================================

Modify and Troubleshoot Virtual Servers
---------------------------------------

Troubleshooting virtual servers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Q1. Where would you start?*

I would go on the BIG-IP and test connectivity from the BIG-IP to the
pool members.

*Q2. Attempt to ping one of the pool members. Does it work? What does
this tell you?*

The ping should be successful. This means the server IP is up and I have
basic connectivity.

*Q3. Attempt a* **curl -i** *against a pool member. Does it work? What does
this tell you?*

The curl should be successful and you should see the request come back.
The application is running.

*Q4. Since the problem affects all pool members, what would you suspect
as a possible issue?*

Since I can see all pool members are functioning I would suspect the
monitor is the issue. You could start debugging the monitor directly, or
you could put the default HTTP monitor and see if the pool members
come up. If they do, then the monitor is the issue and needs correction.
In the case, you would check the Send and Receive strings. I would use a
curl -i (to include the header and response codes) to look for the
receive string. In this case it's obvious, we are looking for a 200 OK
(successful reponse), but have fat-finger 020 OK in the Receive box.
Correct the receive string and reapply the monitor. The pool should come
up Available (Green).

.. Note:: 

   The default HTTP monitor usually, but does not always, work on an HTTP application.

*Q5. Did you correct the issue?* 

Yes

*Q6. Now the pool is working and purple\_vs is available can you access
the page through the virtual?*

No

*Q7. What do you think would be the next step in debugging the issue
would be?*

I would clear the virtual server statistics and try again and see if the
traffic is hitting purple\_vs. The virtual server statistics should show
traffic being processed.

*Q8. What command(s) could you use to watch traffic hit the virtual
server and leave toward the pool?*

I would create two tcpdumps one on the client-side and the other on the
server-side. I would want to limit the captures to watch for my PC IP
address 10.1.10.51. You will need two terminal windows.

Terminal Window 1 (Client to BIG-IP)

**tcpdump -i client\_vlan -X -s0 host 10.1.10.51 and 10.1.10.105**

(This command will only watch client-side traffic between the PC and
virtual server. The -s0 command will dump the entire packet -X command
will dump hex and ascii code of the packet. You will be able to see the
HTTP request and response in the dump)

Terminal Window 2 (BIG-IP to Pool)

**tcpdump -i server\_vlan -X -s0 host 10.1.10.51**

(This command will only watch server-side traffic from the PC and to the
pool. The -s0 command will dump the entire packet -X command will dump
hex and ascii code of the packet. You will be able to see the HTTP
request and response in the dump)

*Q9. Did you see traffic hit the virtual server? Did you see BIG-IP send
traffic to a pool member?*

You should have seen traffic hit the virtual server in Window 1 and in
Window 2 BIG-IP should have picked a pool member and sent traffic to it.

*Q10. Did you see the return traffic? If there was no response, what is
your step?*

No, you should not have received a response. Because the BIG-IP is not
the default gateway, so the response went someplace else.

1. You can add and SNAT Pool or do SNAT Automap on the virtual server.

2. You can add 10.1.20.240 as a self IP address on the BIG-IP. This
   should be a floating IP in traffic\_group\_1 so that the default
   gateway for the servers is still available upon failover.

Working with profiles
~~~~~~~~~~~~~~~~~~~~~

*Q1. Did site work? Why not?*

SSL connection error

*Q2. Did site work?*

Yes

*Q3. What was needed to add cookie persistence?*

http profile

*Q4. What is the name of the cookie inserted begin with?*

BIGipServerwww\_pool

*Q5. Did site work?*

No

*Q6. What profile was needed to correct the error?*

Server side ssl profile