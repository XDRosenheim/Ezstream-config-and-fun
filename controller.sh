#!/bin/bash
#Tool to change song streaming with EZStream, refresh playlist, or kill instance
#Ethan Irish
#1/22/2014
#https://allthingsgeek.wordpress.com/2009/06/01/stream-media-with-icecast-and-ezstream/
#Edit by XDRosenheim

header="\n %4s %9s\n"
format=" %06d %5s\n"

services=$(pgrep -lf "ezstream" | grep "ezstream")

while :
do
	echo " Tool To Manage Ezstream"
	echo " By Ethan Irish"
	echo " Edit by XDRosenheim"
	echo ""
	echo " Services"
	printf "$header" "PID" "SERVICE"
	printf " $services"
	printf "\n"
	echo -n "Select PID: "
	read pid
	if [[ -z "$pid" ]]; then
		echo "\"Nothing\" is not a valid PID."
		printf "\nPlease select a PID to change status: "
		read pid
	else
		echo "Enter 1 to skip song"
		echo "Enter 2 to refresh playlist"
		echo "Enter 3 to refresh metadata"
		echo "Enter 4 to Kill this Process"
		echo "Enter 5 to Exit Ezstream Menu"
		echo -n "Option: "
		read opt
	fi
	case "$opt" in
		1) kill -SIGUSR1 $pid; echo "Skipping.";;
		2) kill -SIGHUP $pid; echo "Refreshing playlist.";;
		3) kill -SIGUSR2 $pid; echo "Updating metadata.";;
		4) kill -15 $pid; echo "Killing stream";;
		5) break; echo "Goodbye";;
		*) echo "Invalid selection";;
	esac
done
