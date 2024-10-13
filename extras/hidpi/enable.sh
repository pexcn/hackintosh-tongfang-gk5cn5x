#!/bin/sh

VID=9e5
PID=747

mkdir -p /Library/Displays/Contents/Resources/Overrides/DisplayVendorID-${VID}/
curl https://github.com/pexcn/hackintosh-tongfang-gk5cn5x/raw/master/extras/hidpi/DisplayVendorID-${VID}/DisplayProductID-${PID} \
  -L -O --output-dir /Library/Displays/Contents/Resources/Overrides/DisplayVendorID-${VID}/

defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
