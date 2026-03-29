#!/bin/sh
# Clean script for distclean buildroot

BLRTDIR=./buildroot

make -C ${BLRDIR} distclean
