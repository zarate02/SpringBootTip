#!/bin/sh

#modfpoint
DIR=/ersssys/PTT
SERVICE=("PttChatServer-2018.04.20" "PttConfigServer-2018.04.20" "PttEurekaServer-2018.04.20" "PttLoginServer-2018.04.20" "PttWebServer-2018.04.20")
JAVA_HOME="/ersssys/NGAVL7/java/bin"
JAVA_OPT="-Xms1G -Xmx1G -XX:PermSize=256m -XX:MaxPermSize=512m"

for SERVICE_NAME in "${SERVICE[@]}"; do

	PATH_TO_JAR=${DIR}/${SERVICE_NAME}.jar
	PID=`ps fax|grep java|grep "${PATH_TO_JAR}"|awk '{print $1}'`

	case $1 in

	    start)
		if [ -n "${PID}" ]; then
		    echo "$SERVICE_NAME is already running";
		else
		
		

		    if [ "PttConfigServer-2018.04.20" == "$SERVICE_NAME" ]; then
			nohup $JAVA_HOME/java -jar $JAVA_OPT $PATH_TO_JAR --spring.config.location=${SERVICE_NAME}.properties 1> /dev/null 2>&1 &
		    else
			nohup $JAVA_HOME/java -jar $JAVA_OPT $PATH_TO_JAR 1> /dev/null 2>&1 &
		    fi
		    
		    echo "$SERVICE_NAME started ..."
		fi
	    ;;

	    stop)
		if [ -n "${PID}" ]; then
		    kill -9 ${PID}
		    echo "$SERVICE_NAME is exit (pid: ${PID})";
		else		    
		    echo "$SERVICE_NAME is not running ..."
		fi
	    ;;

	esac

done