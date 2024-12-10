#!/bin/sh
#https://unix.stackexchange.com/questions/20357/how-can-i-make-a-script-in-etc-init-d-start-at-boot


start() {
    start-stop-daemon -S -n aedsocket --exec /usr/bin/aedsocket 

}
   
stop() {
    start-stop-daemon --stop --signal SIGTERM --name aedsocket --retry 3 

}

restart(){
    stop
    sleep 10
    start
}
   
case "$1" in 
    start)
       start
       ;;
    stop)
       stop
       ;;
    restart)
        restart

       ;;
    *)
       echo "Usage: $0 {start|stop|restart}"
esac
   
exit 0 