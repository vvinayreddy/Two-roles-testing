#systemd unit file for tomcat 7 
[Unit]
Description=Apache Tomcat Web Application Container
After=syslog.target network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_PID=/opt/apache-tomcat-7.0.61/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/apache-tomcat-7.0.61
Environment=CATALINE_BASE=/opt/apache-tomcat-7.0.61
Environment='CATALINE_OPTS=-Xms128M -Xmx765M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.haedless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/apache-tomcat-7.0.61/bin/startup.sh
ExecStop=/opt/apache-tomcat-7.0.61/bin/shutdown.sh

User=tomcat
Group=tomcat

[Install]
WantedBy=multi-user.target
