# SUIDChecker
A shell script to check for default, custom or GTFOBin SUIDs on Linux machine.

Citing SUID3NUM as source for default SUID binaries found in shell script. Anon-Exploiter SUID3NUM is also the source for the idea of seperating out SUID binaries into the default,GTFOBin, and custom categories. 

https://github.com/Anon-Exploiter/SUID3NUM

Citing GTFOBins as source for GTFOBin SUID binaries found in shell script.

https://gtfobins.github.io/#+suid

Author: ReconDeveloper

Currently in beta testing phase and not being distributed. The suidChecker.sh script should be used for educational, ctf, or ethical hacking.

The suidChecker.sh script will work on all Debian-based distributions, Red Hat-based distributions, and ArchLinux. The suidChecker.sh script won't work on FreeBSD, macOS, NetBSD, or OpenBSD because of those operating systems implementation of sed.  
