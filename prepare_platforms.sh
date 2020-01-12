#!/bin/bash -e

echo "Install missing extensions and SDKs"

for qt_version in 5.12; do
    for arch in x86_64 arm i386; do
        flatpak info --show-runtime org.kde.Sdk/$arch/$qt_version ||
            flatpak install --user org.kde.Platform/$arch/$qt_version org.kde.Sdk/$arch/$qt_version
    done
done
