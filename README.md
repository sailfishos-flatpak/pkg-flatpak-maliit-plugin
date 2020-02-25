# DEPRICATED

Use https://github.com/flathub/org.kde.PlatformInputContexts.MaliitSailfishOS instead.

Old README below.


### Packaging of Maliit plugin for Flatpak

Maliit plugin has to be incorporated into Flatpak runtime to get
support for touchscreen keyboard. This is done by compiling the plugin
against the supported Flatpak platforms, packaging them into Sailfish
RPMs, installing as RPMs, and mounting the plugin into container
during its run.

#### Building plugins

To build plugins, install `flatpak-builder` and setup the environment
by running
```
prepare_platforms.sh
```

Build using
```
build_extensions.sh
```

This will create extension archives for supported architectures.

#### Building RPMs

Make a new project at OBS and upload there `maliit.spec` together with
the built extension archives. The packages will be built by the
service.
