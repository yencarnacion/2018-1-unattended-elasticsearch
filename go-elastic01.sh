#!/bin/bash

virt-install \
--name=elastic01.example.com \
--vcpus=1 \
--memory=2048 \
--nographics \
--os-type=linux \
--location=http://us.archive.ubuntu.com/ubuntu/dists/xenial/main/installer-amd64/ \
--disk path=/var/lib/libvirt/images/elastic01.example.com,size=10 \
--initrd-inject=./ks/ubuntu-16_04/ks.cfg \
--extra-args="ks=file:/ks.cfg  console=ttyS0,115200"

