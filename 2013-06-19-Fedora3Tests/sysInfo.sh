#/bin/sh
# A script for extracting the system information

#Define file and lines

f="systemInfo.txt";
a="========================================";
b="----------------------------------------";

# File headers
echo "Information of system where tests were run" >> $f;
echo "Date: `date`" >> $f;
echo "Hostname: `hostname -A`" >> $f;

# CPU information
echo "" >> $f;
echo $a >> $f;
echo "CPU" >> $f;
echo $b >> $f;
cat /proc/cpuinfo >> $f;

#Memory info
echo "" >> $f;
echo $a >> $f;
echo "Memory" >> $f;
echo $b >> $f;
free -m >> $f;

#OS
echo "" >> $f;
echo $a >> $f;
echo "OS" >> $f;
echo $b >> $f;
uname -mrs >> $f;
uname -a >> $f;
cat /proc/version >> $f;

#Hard disk
echo "" >> $f;
echo $a >> $f;
echo "Hard disk" >> $f;
echo $b >> $f;
df -h >> $f;

