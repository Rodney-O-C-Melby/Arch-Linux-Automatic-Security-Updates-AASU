#!/bin/bash
sudo systemctl stop aasu.timer  # stop service
sudo systemctl disable aasu.timer  # disable service
sudo rm -rf /usr/bin/aasu  # remove program from path location for clean uninstall
sudo rm -rf /etc/systemd/system/aasu.*  # remove service from systemd for clean uninstall
sudo rm -rf /usr/lib/systemd/system/aasu.*
sudo rm -rf /etc/systemd/system/multi-user.target.wants/aasu.*
echo "Successfully uninstalled Arch-Linux Automatic Security Updates (AASU)."
