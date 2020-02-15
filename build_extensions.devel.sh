#!/bin/bash -e

for arch in arm; do
    rm -rf extension
    for qt_version in 5.12; do
        cp org.sailfish.maliit.qt.devel.yaml org.sailfish.maliit.qt.$qt_version.yaml
        sed -i "s/RUNTIMEVERSION/$qt_version/g" org.sailfish.maliit.qt.$qt_version.yaml
        echo
        RUNTIME=`flatpak info --show-runtime org.kde.Platform/$arch/$qt_version`
        echo Runtime: $RUNTIME
        flatpak-builder --arch=$arch --repo=flatpak-repo --force-clean flatpak-build org.sailfish.maliit.qt.$qt_version.yaml
        mkdir -p extension/$RUNTIME
        cp -a flatpak-build/files/lib/plugins/platforminputcontexts extension/$RUNTIME
        rm org.sailfish.maliit.qt.$qt_version.yaml
    done
    find extension -type f -exec touch {} +
    find extension -type d -exec touch {} +
    tar zcf extension.$arch.tgz --owner=root --group=root extension
done
