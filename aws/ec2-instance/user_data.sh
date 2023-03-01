#!/bin/bash

modprobe br_netfilter
sysctl -w net.bridge.bridge-nf-call-iptables=1
sysctl -w net.ipv4.ip_forward=1
echo "net.bridge.bridge-nf-call-iptables=1" >> /etc/sysctl.d/k8s.conf
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.d/k8s.conf
