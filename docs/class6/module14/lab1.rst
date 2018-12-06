EAV Monitor - HTTP Monitor cURL Basic GET
=========================================

Code::

   #!/bin/sh
   #
   # (c) Copyright 1996-2007 F5 Networks, Inc.
   #
   # This software is confidential and may contain trade secrets that are the
   # property of F5 Networks, Inc. No part of the software may be disclosed
   # to other parties without the express written consent of F5 Networks, Inc.
   # It is against the law to copy the software. No part of the software may
   # be reproduced, transmitted, or distributed in any form or by any means,
   # electronic or mechanical, including photocopying, recording, or information
   # storage and retrieval systems, for any purpose without the express written
   # permission of F5 Networks, Inc. Our services are only available for legal
   # users of the program, for instance in the event that we extend our services
   # by offering the updating of files via the Internet.
   #
   # @(#) $Id: http\_monitor\_cURL+GET,v 1.0 2007/06/28 16:10:15 deb Exp $
   # (based on sample\_monitor,v 1.3 2005/02/04 18:47:17 saxon)
   #
   # these arguments supplied automatically for all external monitors:
   # $1 = IP (IPv6 notation. IPv4 addresses are passed in the form
   # ::ffff:w.x.y.z
   # where "w.x.y.z" is the IPv4 address)
   # $2 = port (decimal, host byte order)
   #
   # Additional command line arguments ($3 and higher) may be specified inthe monitor template
   # This example does not expect any additional command line arguments
   #
   # Name/Value pairs may also be specified in the monitor template
   # This example expects the following Name/Vaule pairs:
   # URI = the URI to request from the server
   # RECV = the expected response (not case sensitive)
   #
   
   # remove IPv6/IPv4 compatibility prefix (LTM passes addresses in IPv6 format)
   IP=\`echo ${1} \| sed 's/::ffff://'\`
   PORT=${2} 

   PIDFILE="/var/run/\`basename ${0}\`.${IP}\_${PORT}.pid"
   # kill of the last instance of this monitor if hung and log current pid
   if [ -f $PIDFILE ]
   then

      echo "EAV exceeded runtime needed to kill ${IP}:${PORT}" \| logger -p
      local0.error
      kill -9 \`cat $PIDFILE\` > /dev/null 2>&1

   fi

   echo "$$" > $PIDFILE

   # send request & check for expected response
   curl -fNs http://${IP}:${PORT}${URI} \| grep -i "${RECV}" 2>&1 > /dev/null

   # mark node UP if expected response was received
      if [ $? -eq 0 ]
   then
      rm -f $PIDFILE
      echo "UP"
   else
      rm -f $PIDFILE
   fi

   exit