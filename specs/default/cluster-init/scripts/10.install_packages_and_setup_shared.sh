#!/bin/bash
set -ex

# make a /mnt/resource/apps directory
# Azure VMs that have ephemeral storage have that mounted at /mnt/resource. If that does not exist this command will create it.
mkdir -p /mnt/resource/apps

# install packages for the subsequent installations
apt-get update && \
    apt-get install -y \
    python \
    dh-autoreconf \
    build-essential \
    libarchive-dev \
    openjdk-8-jre-headless

#service slurmctld restart