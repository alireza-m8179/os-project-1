#!/bin/bash

#command line application
for i in $1 $2 $3  # loop over input parameters
do
	if  [ -z $i ]  #if one of input params is null, ignore it
	then
		continue;
	fi
	case $i in
		"sgi" )  #system general information
		echo "system general information";
		#TODO
		#overall cpu information
		oci=$(cat /proc/cpuinfo)
		#name and version of os
		nvos=$(cat /proc/cpuinfo)
		#kernel specification	
		kn=$(uname --kernel-name)
		kr=$(uname --kernel-release)
		kv=$(uname --kernel-version)
		#os distro
		osd=$(hostnamectl | grep 'Operation System' | cut -d ' ' -f 5-)
		#desktop specification
		ds=$()
		#number of active processes 
		nap=$(ps aux --no-headers | wc -l)
		#15 top processes with highest memory usage
		hmu=$(ps aux | sort -rnk 4 | head -15)
		echo "overall cpu information:\n$oci"
		echo "name and version of operating system:\n$nvos" 
		echo "kernel specification:\nname: $kn\nrelease: $kr\nversion: $kv"
		echo "distro of operating system:\n$osd"
		echo "number of active processes in this system:$nap"
		echo "15 top processes with highers memory usage:\n$hmu"
		;;
		"ssi" )  #system security info.
		echo "system security information";
		#TODO
		;;
		"shi" )  #system hardware info.
		echo "system hardware information";
		#TODO
		;;
		* )  #if param is not any of abow
		echo "unknown parameter!";
		;;	
	esac
done
