#!/bin/bash

if test -e /etc/libvirt/ && ! test -e /etc/libvirt/hooks; then
  mkdir -p /etc/libvirt/hooks;
fi

if test -e /etc/libvirt/hooks/qemu; then
  mv /etc/libvirt/hooks/qemu /etc/libvirt/hooks/qemu_last_backup
fi

if test -e /usr/bin/binding_vfio.sh; then
  mv /usr/bin/binding_vfio.sh /usr/bin/binding_vfio.sh.bkp
fi

if test -e /usr/bin/binding_nvidia.sh; then
  mv /usr/bin/binding_nvidia.sh /usr/bin/binding_nvidia.sh.bkp
fi

if test -e /etc/systemd/system/; then
  cp systemd/user/binding-nvidia.service /etc/systemd/system/binding-nvidia.service
fi

cp hooks/binding_vfio.sh /usr/bin/binding_vfio.sh
cp hooks/binding_nvidia.sh /usr/bin/binding_nvidia.sh
cp hooks/qemu /etc/libvirt/hooks/qemu

chmod +x /usr/bin/binding_vfio.sh
chmod +x /usr/bin/binding_nvidia.sh
chmod +x /etc/libvirt/hooks/qemu
