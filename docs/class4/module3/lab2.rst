Self IP Port Lockdown and more
==============================

Effects of Port Lockdown
------------------------

Ping **10.1.10.245**

*Q1. Was echo response received?*

SSH to **10.1.10.245**

*Q2. Was ssh successful? Why not?*

Open **Network > Self IPs > 10.1.10.245** and change **Port Lockdown**
to **Allow Defaults**

SSH to **10.1.10.245**

Browse to **https://10.1.10.245**

*Q3. Did SSH work? Did browsing work?*

*Q4. What other ports are opened when you select Allow Defaults.*

Open **Network > Self IPs > 10.1.10.245** and change **Port Lockdown** to
**Allow Custom** and add **Port 22**

SSH to **10.1.10.245**

Browse to **https://10.1.10.245**

*Q5. Did SSH work? Did browsing work?*

Open **System > Platform**

On **SSH IP Allow** > **Specify Range** of **10.1.1.10-20**

*Q6. Does existing SSH window still work?*

Open new SSH session to **10.1.1.245**

*Q7. Was new ssh session established?*