#!/usr/bin/bash
# DEPENDANCIES: pacman, python, pip.
# update arch linux system packages, piping output to null, with info, and success/error messages.
echo Updating System Packages ...
if sudo pacman -Syu --noconfirm > /dev/null ; then
    echo "Updated system packages :-)"
else
    echo "Error: failed to update or upgrade pacman system packages"
fi
# upgrade out of date pip packages, piping output to null, with info, and success/error messages.
echo Updating Pythons PIP Packages ...
if pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U > /dev/null ; then
    echo "Updated python pip packages :-)"
else
    echo "Error: failed to update python pip packages"
fi
