#!/bin/bash

echo "Network Configuration Summary Report"
echo "===================================="
echo ""

# Interface Names and Model/NIC Descriptions
echo "Network Interfaces:"
ip -o link show | awk '{print "Interface: "$2}'
echo ""

# IP Addresses for Each Interface
echo "IP Addresses for Interfaces:"
ip -o -4 addr show | awk '{print "Interface: "$2, "IP Address: "$4}'
echo ""

# Default Gateway IP Address
echo "Default Gateway:"
ip route | grep default | awk '{print "Gateway IP: "$3}'
