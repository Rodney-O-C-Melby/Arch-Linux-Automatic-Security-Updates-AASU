#!/bin/bash
sudo rm -rf /usr/bin/aasu  # remove program from path location for clean uninstall
sudo rm -rf /etc/systemd/system/aasu.service  # remove service from systemd for clean uninstall
echo "Successfully uninstalled Arch-Linux Automatic Security Updates (AASU)."
