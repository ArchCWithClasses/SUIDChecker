#!/bin/bash

OUTPUT=$(find / -perm -u=s -type f 2>/dev/null | xargs ls -l)
IFS=$'\n'
suidArray=($(find / -perm -u=s -type f 2>/dev/null | xargs ls -l | sed 's@.*/@@'))
orginalSuidArray=(${OUTPUT})
echo "arping at bwrap chfn chrome-sandbox chsh dbus-daemon-launch-helper dmcrypt-get-device exim4 fusermount gpasswd helper kismet_capture lxc-user-nic mount mount.cifs mount.ecryptfs_private mount.nfs newgidmap newgrp newuidmap ntfs-3g passwd ping ping6 pkexec polkit-agent-helper-1 pppd snap-confine ssh-keysign su sudo traceroute traceroute6 traceroute6.iputils ubuntu-core-launcher umount VBoxHeadless VBoxNetAdpCtl VBoxNetDHCP VBoxNetNAT VBoxSDL VBoxVolInfo VirtualBoxVM vmware-authd vmware-user-suid-wrapper vmware-vmx vmware-vmx-debug vmware-vmx-stats Xorg.wrap" > defFile
echo "aria2c arp ash awk base32 base64 basenc bash busybox byebug capsh cat chmod chown chroot column comm composer cp cpulimit csh csplit curl cut dash date dd dialog diff dmsetup docker ed emacs env eqn expand expect file find flock fmt fold gawk gdb gimp git grep gtester hd head hexdump highlight iconv iftop install ionice ip jjs join jq jrunscript ksh ksshell ldconfig ld.so less logsave look lwp-download lua lwp-request make mawk more mv mysql nano nawk nc nice nl nmap node nohup od openssl paste perl pg php pic pico pr pry python rake readelf restic rev rlwrap rpm rpmquery rsync run-parts rview rvim scp sed setarch shuf slsh socat soelim sort sqlite3 ss ssh-keyscan start-stop-daemon stdbuf strace strings sysctl systemctl tac tail tar taskset tbl tclsh tee telnet tftp time timeout troff ul unexpand uniq unshare update-alternatives uudecode uuencode view vim watch wget xargs xmodmap xxd xz zip zsh zsoelim" > gtfoFile
sed 's/ /\n/g' defFile > formattedDefFile
sed 's/ /\n/g' gtfoFile > formattedGTFOFile
rm gtfoFile
rm defFile
suidLength=${#suidArray[@]}
defSuidBinariesOnMachine=""
gtfoBinariesOnMachine=""
customBinariesOnMachine=""

for (( i=0; i<$suidLength; i++ ))   
 do  
 		defaultSuidCount=$(cat formattedDefFile | sed -n "/${suidArray[i]}/p" | wc -l)
 		gtfoSuidCount=$(cat formattedGTFOFile | sed -n "/${suidArray[i]}/p" | wc -l)
	 	
	if [ $defaultSuidCount -gt 0 ];
 	then
 		defSuidBinariesOnMachine="$defSuidBinariesOnMachine\n${orginalSuidArray[i]}"

 	elif [ $gtfoSuidCount -gt 0 ]; 
 	then
 	 	gtfoBinariesOnMachine="$gtfoBinariesOnMachine\n${orginalSuidArray[i]}"
 	else
 		customBinariesOnMachine="$customBinariesOnMachine\n${orginalSuidArray[i]}"
 	fi
 done

rm formattedDefFile
rm formattedGTFOFile
echo "Listing default SUID Binaries on the Machine."
echo -e "$defSuidBinariesOnMachine"
echo ""
echo ""
echo "Listing gtfo SUID Binaries on the Machine."
echo -e "$gtfoBinariesOnMachine"
echo ""
echo ""
echo "Listing custom SUID Binaries on the Machine."
echo -e "$customBinariesOnMachine"
