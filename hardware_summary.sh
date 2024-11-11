#!/bin/bash

echo "Hardware Summary Report"
echo "======================="
echo ""

# Operating System Name and Version
echo "Operating System:"
lsb_release -d
echo ""

# CPU Name and Model Number
echo "CPU Model:"
grep -m 1 'model name' /proc/cpuinfo
echo ""

# Amount of RAM Installed
echo "Total RAM Installed:"
grep MemTotal /proc/meminfo
