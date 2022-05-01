#!/bin/bash
username=$USER  # get current user
if sudo cp aasu.sh /usr/bin/aasu ; then # copy program to path location for system wide execution e.g. aasu
    echo "Copying files ..."
else
    echo "Failed to copy files!"
fi
if sed 's/^User=.*/User='$username'/g' aasu.service > aasu.test ; then # add user to service file
    echo "Adding user to service file ..."
else
    echo "Failed to add user to the service file!"
fi
#if sudo cp aasu.test /usr/lib/systemd/system/aasu.service ; then # copy service to systemd for hourly run
if sudo cp aasu.test /usr/lib/systemd/system/aasu.service ; then # copy service to systemd for hourly run
    echo "Creating aasu service ..."
else
    echo "Failed to create aasu service!"
fi
if sudo cp aasu.timer /usr/lib/systemd/system/aasu.timer ; then # copy service to systemd for hourly run
    echo "Creating aasu timer ..."
else
    echo "Failed to create aasu timer!"
fi
rm -rf aasu.test  # remove file used to add user to service
if sudo systemctl enable aasu.timer ; then  # enable aasu service
    echo "Enabled aasu service timer."
else
    echo "Failed to enable aasu service timer."
fi
#if sudo systemctl start aasu.timer ; then  # start aasu service
#    echo "Started aasu service."
#else
#    echo "Failed to start aasu service."
#fi
echo "Successfully Installed Arch-Linux Automatic Security Updates (AASU) :-)"
