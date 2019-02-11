#!/bin/bash
case "$1" in
    bash) # execute bash shell
        exec /bin/bash
        ;;
    julia) # run julia with arguments
        /bin/julia "${@:2}"
        ;;
    *)
        echo "ERROR: Missing argument in entrypoint.sh"
        exit 1
        ;;
esac
