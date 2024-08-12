################################################################################
#
# DPDK
#
#################################################################################

DPDK_VERSION = main
# DPDK_VERSION ?= v24.03
DPDK_SITE = https://dpdk.org/git/dpdk
DPDK_SITE_METHOD = git
DPDK_LICENSE = BSD-3-Clause
DPDK_LICENSE_FILES = license/bsd-3-clause.txt license/README license/bsd-2-clause.txt license/exceptions.txt license/gpl-2.0.txt license/isc.txt license/lgpl-2.1.txt license/mit.txt

DPDK_DEPENDENCIES += host-pkgconf
DPDK_DEPENDENCIES += host-python-pyelftools
DPDK_DEPENDENCIES += libbsd
DPDK_DEPENDENCIES += libexecinfo
DPDK_DEPENDENCIES += jansson
DPDK_DEPENDENCIES += libpcap
DPDK_DEPENDENCIES += zlib
#not yet DPDK_DEPENDENCIES += openssl
#not yet DPDK_DEPENDENCIES += libbpf

DPDK_MARCH = $(BR2_ARCH)
DPDK_MTUNE = $(BR2_ARCH) # not used yet
ARCH=$(DPDK_MARCH)
GCC_TARGET_CPU=$(BR2_GCC_TARGET_ARCH)

# see meson_options.txt from DPDK
#
DPDK_CONF_OPTS += -Ddeveloper_mode=enabled

DPDK_CONF_OPTS += -Dcpu_instruction_set=$(DPDK_MARCH)

# platform can be: native, all, cn9k, cn10k
DPDK_CONF_OPTS += -Dplatform=generic

$(eval $(meson-package))
