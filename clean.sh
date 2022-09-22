#!/bin/bash

#cd `dirname $0`
#ASSIGNMENT4_PRJ=`dirname $0`
ASSIGNMENT4_PRJ=$(realpath $(dirname $0))
EXTERNAL_REL_BUILDROOT=${ASSIGNMENT4_PRJ}/base_external

if [ -d "${EXTERNAL_REL_BUILDROOT}/buildroot" ]
then
    echo "Saving linux defconfig"
    make -C ${EXTERNAL_REL_BUILDROOT}/buildroot distclean
fi
