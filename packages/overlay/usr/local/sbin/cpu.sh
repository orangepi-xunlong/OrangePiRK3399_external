#!/bin/sh

Usage(){
	printf "\033[32mUsage: "
	printf "\t$0 [-h] [-f]... [-s <frequencies> <cpu number>]\n
Arguments:
  -h		Print Help (this message)
  -f          	CPU0~3 supported frequencies
  -F     	CPU4~5 supported frequencies
  -s            Set the maximum frequency of CPU0~5
  		e.g:  -s 1008000 1 (Set the maximum frequency of cpu1 to 1008000)
  -c            View the current frequency of cpu0~5
  -t            View the current CPU temperature
  -l            List CPU ID
  -i            Viewing cpu statistics
\033[0m"
}

while getopts ":hfFs:ctli" varname
do
	case $varname in
		h)
		Usage
		exit
		;;
		f)
		echo "CPU0~3 supported frequencies: "
		cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
		echo " "
		;;
		F)
		echo "CPU4~5 supported frequencies: "
		cat /sys/devices/system/cpu/cpu4/cpufreq/scaling_available_frequencies
		echo " "
		;;
		s)
		echo "Set the maximum frequency of CPU$3: $OPTARG"
		echo $OPTARG > /sys/devices/system/cpu/cpu$3/cpufreq/scaling_max_freq
		echo " "
		;;
		c)
		echo "The current frequency of cpu0~5: "
		cat /sys/devices/system/cpu/cpu[012345]/cpufreq/cpuinfo_cur_freq
		echo " "
		;;
		t)
		echo "The current CPU\033[31m (small core)\033[0m temperature: "
		cat /sys/class/thermal/thermal_zone0/temp
		echo "The current CPU\033[31m (large core)\033[0m temperature: "
		cat /sys/class/thermal/thermal_zone1/temp
		echo " "
		;;
		l)
		echo "List CPU ID: "
		hexdump /sys/bus/nvmem/devices/rockchip-efuse0/nvmem
		echo " "
		;;
		i)
		echo "Viewing cpu statistics: "
		lscpu
		echo " "
		;;
		?)
		echo "\033[31mUnknow Option, Please use 'cpu_sh -h' for more commands.\033[0m"
		exit 1;;
	esac
done

