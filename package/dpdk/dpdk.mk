################################################################################
#
# DPDK
#
#################################################################################

DPDK_VERSION = main
# DPDK_VERSION ?= v24.03
DPDK_SITE = $(call github,DPDK,dpdk,$(DPDK_VERSION))
DPDK_SITE_METHOD = git
DPDK_LICENSE = BSD-3-Clause
DPDK_LICENSE_FILES = license/bsd-3-clause.txt license/README license/bsd-2-clause.txt license/exceptions.txt license/gpl-2.0.txt license/isc.txt license/lgpl-2.1.txt license/mit.txt
DPDK_DEPENDENCIES = host-pkgconf libbsd

$(eval $(meson-package))
