#!/bin/bash

main() {

	case "$1" in
		worker)
			run_worker
			;;
		*)
	    	exec "$@"
	    	;;
	esac
}

run_worker() {
   echo starting worker
   lightflow worker start
}

main "$@"
