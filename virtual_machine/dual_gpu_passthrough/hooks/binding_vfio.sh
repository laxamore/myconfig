#!/bin/sh

# Load vfio
modprobe vfio
modprobe vfio_iommu_type1
modprobe vfio_pci

# let the devices know to override driver
echo "vfio-pci" > /sys/bus/pci/devices/0000:04:00.0/driver_override
echo "vfio-pci" > /sys/bus/pci/devices/0000:04:00.1/driver_override

# unbind devices from current driver
echo "0000:04:00.0" > /sys/bus/pci/drivers/nvidia/unbind
echo "0000:04:00.1" > /sys/bus/pci/drivers/snd_hda_intel/unbind

# bind devices to new driver
echo "0000:04:00.0" > /sys/bus/pci/drivers/vfio-pci/bind
echo "0000:04:00.1" > /sys/bus/pci/drivers/vfio-pci/bind

