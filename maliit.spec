%define rel_date %(date +'%%Y%%m%%d%%H%%M')
Name: flatpak-maliit-plugin-qt
Version: 1.%{rel_date}
Release: 1
Summary: Maliit Qt plugin for Flatpak
License: GPLv3+
URL: https://github.com/sailfishos-flatpak/pkg-flatpak-maliit-plugin
Source: extension.%{_arch}.tgz

# there are no requirements from Sailfish OS packages
%define __requires_exclude ^.*$

# Don't run strip
%define __strip /bin/true

# No buildid links
%define _build_id_links none

# No provides
%define __provides_exclude_from ^/opt/.*$

%description
Maliit Qt plugin for use inside Flatpak container

%prep
%setup -q -n extension

%build
pwd
ls
#rm -rf extension || true
#tar zxvf extension.%{_arch}.tgz

%install
mkdir -p %{buildroot}/opt/flatpak/maliit/
cp -a * %{buildroot}/opt/flatpak/maliit/

%files
%defattr(-,root,root,-)
/opt/flatpak/maliit
