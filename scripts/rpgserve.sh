#! /bin/sh -

# idiomatic parameter and option handling in sh

case "$1" in
    start)
        service postgresql start
        service redis start
        ;;
    stop)
        service postgresql stop
        service redis stop
        ;;
    --*) echo "bad option $1"
        ;;
    *) echo "argument $1"
        ;;
esac

echo "##########DATABASE##########"
service postgresql status

echo "##########BROKER##########"
service redis status

exit 0