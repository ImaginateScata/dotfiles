#!/bin/bash

# See http://apple.stackexchange.com/questions/107307/how-can-i-install-the-command-line-tools-completely-from-the-command-line
set -x
echo "Checking Xcode CLI tools"

# Only run if the tools are not installed yet
# Check if xcode is installed and verify its path
if type xcode-select >&- && xpath=$( xcode-select --print-path ) &&
     test -d "${xpath}" && test -x "${xpath}" > /dev/null 2>&1 && [ -f '/Library/Developer/CommandLineTools/usr/bin/xcrun' ] ; then
  echo "Xcode CLI tools OK"
else
  echo "Xcode CLI tools not found. Installing them..."
  exit

  # install the tool for our specific OS version
  version=$(sw_vers -productVersion) 

  # sw_vers in 10.14 is 10.14 while for 10.13 its 10.13.x so need to strip out the last version 
  dots=$(echo "${version}" | grep -o "\." | wc -l)
  if [ "${dots}" -gt "1" ]; then
    version=$(echo "${version}" | sed "s:.[[:digit:]]*.$::g")
  fi

  if [ "${version}" == "10.15" ]; then
	version="-11"
  fi

  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;

  # get the specific Command Line Tools package name to install
  PROD=$(softwareupdate --list |
    grep "\*.*Command Line.*${version}" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/Label://' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate --install "${PROD}" --verbose; 
fi
