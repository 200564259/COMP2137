#!/bin/bash

echo "Storage Summary Report"
echo "======================"
echo ""

# Disk Models and Sizes
echo "Disk Models and Sizes:"
lsblk -o NAME,MODEL,SIZE | grep -E "sd|nvme"
echo ""

# Size and Utilization of ext4 Filesystems
echo "ext4 Filesystem Usage:"
df -hT | grep ext4
