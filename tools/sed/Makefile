# 
# Copyright (C) 2006-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME:=sed
PKG_VERSION:=4.2.2

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@GNU/$(PKG_NAME)
PKG_HASH:=f048d1838da284c8bc9753e4506b85a1e0cc1ea8999d36f6995bcb9460cddbd7
PKG_CAT:=bzcat
export SED:=

HOST_BUILD_PARALLEL:=1

HOSTCC := $(HOSTCC_NOCACHE)
HOSTCXX := $(HOSTCXX_NOCACHE)

include $(INCLUDE_DIR)/host-build.mk

HOST_CONFIGURE_ARGS += \
	--disable-acl \
	--disable-nls \

HOST_CONFIGURE_VARS += \
	ac_cv_search_setfilecon=no \
	ac_cv_header_selinux_context_h=no \
	ac_cv_header_selinux_selinux_h=no \

define Host/Compile
	+$(MAKE) $(HOST_JOBS) -C $(HOST_BUILD_DIR) SHELL="$(BASH)"
endef

define Host/Install
	$(INSTALL_BIN) $(HOST_BUILD_DIR)/sed/sed $(STAGING_DIR_HOST)/bin/
endef

define Host/Clean
	rm -f $(STAGING_DIR_HOST)/bin/sed
endef

$(eval $(call HostBuild))
