#!/bin/bash
#Script to save the modified configuration as modified_qemu_aarch64_virt_defconfig and linux kernel configuration.
#Author: Siddhant Jajoo.

#cd `dirname $0`
#ASSIGNMENT4_PRJ=`dirname $0`
ASSIGNMENT4_PRJ=$(realpath $(dirname $0))
EXTERNAL_REL_BUILDROOT=${ASSIGNMENT4_PRJ}/base_external

source shared.sh

mkdir -p ${EXTERNAL_REL_BUILDROOT}/configs/
make -C ${EXTERNAL_REL_BUILDROOT}/buildroot savedefconfig BR2_DEFCONFIG=${AESD_MODIFIED_DEFCONFIG_REL_BUILDROOT}

if [ -e ${EXTERNAL_REL_BUILDROOT}/buildroot/.config ] && [ -e ${EXTERNAL_REL_BUILDROOT}/buildroot/output/build/linux-*/.config ]; then
	grep "BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE" ${EXTERNAL_REL_BUILDROOT}/buildroot/.config > /dev/null
	if [ $? -eq 0 ]; then
		echo "Saving linux defconfig"
		make -C ${EXTERNAL_REL_BUILDROOT}/buildroot linux-update-defconfig
	fi
fi
