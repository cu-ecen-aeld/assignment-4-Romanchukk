#!/bin/sh
# Clean script for distclean buildroot

BUILDROOTDIR=./buildroot

make -C ${BUILDROOTDIR} distclean
