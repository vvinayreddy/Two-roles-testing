#!/bin/sh  
### BEGIN INIT INFO  
# Provides:          jbossas7  
# Required-Start:    $local_fs $remote_fs $network $syslog  
# Required-Stop:     $local_fs $remote_fs $network $syslog  
# Default-Start:     2 3 4 5  
# Default-Stop:      0 1 6  
# Short-Description: Start/Stop JBoss AS 7  
### END INIT INFO  
# chkconfig: 35 92 1  
  
JBOSS_HOME=/usr/share/jboss-as
   
AS7_OPTS="$AS7_OPTS -Dorg.apache.tomcat.util.http.ServerCookie.ALLOW_HTTP_SEPARA
TORS_IN_V0=true"  
AS7_OPTS="$AS7_OPTS -Djboss.bind.address.management=0.0.0.0" 
AS7_OPTS="$AS7_OPTS -Djboss.bind.address=0.0.0.0" 
   
case "$1" in 
    start)  
        /bin/echo "Starting JBoss AS 7..." 
        su - root -c "sudo ${JBOSS_HOME}/bin/standalone.sh $AS7_OPTS > /dev/null
 & " 
    ;;  
    stop)  
        /bin/echo "Stopping JBoss AS 7..." 
        su - root -c "${JBOSS_HOME}/bin/jboss-cli.sh --connect command=:shutdown
"   
    ;;  
    *)  
        /bin/echo "Usage: /etc/init.d/jboss {start|stop}"; exit 1;  
    ;;  
esac 
   
exit 0
