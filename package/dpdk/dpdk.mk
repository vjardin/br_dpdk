################################################################################
#
# dpdk
#
################################################################################

DPDK_VERSION = 24.03
DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
DPDK_SITE = http://fast.dpdk.org/rel
DPDK_LICENSE = \
	BSD-3-Clause, \
	BSD-2-Clause,\
	GPL-2.0, \
	ISC, \
	LGPL-2.1, \
	MIT

DPDK_LICENSE_FILES = \
	license/README \
	license/bsd-3-clause.txt \
	license/bsd-2-clause.txt \
	license/exceptions.txt \
	license/gpl-2.0.txt \
	license/isc.txt \
	license/lgpl-2.1.txt \
	license/mit.txt \

DPDK_DEPENDENCIES = \
	host-pkgconf \
	host-python-pyelftools \
	libbsd \
	jansson \
	libpcap \
	zlib \

ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
DPDK_DEPENDENCIES += libexecinfo
endif

DPDK_CONF_OPTS += -Dcpu_instruction_set=$(BR2_GCC_TARGET_ARCH)
#DPDK_CONF_OPTS += -Dplatform=generic

$(eval $(meson-package))
