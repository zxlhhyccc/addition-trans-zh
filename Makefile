#
# Copyright (C) 2016-2017 GitHub 
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=addition-trans-zh
PKG_VERSION:=1.1
PKG_RELEASE:=51
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/addition-trans-zh
  SECTION:=luci
  CATEGORY:=LuCI
  TITLE:=LuCI support for Default Settings
  PKGARCH:=all
  DEPENDS:=+luci-base +@LUCI_LANG_zh-cn
endef

define Package/addition-trans-zh/description
	Language Support Packages.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/addition-trans-zh/install

	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/tools
	$(INSTALL_DATA) ./status/status.lua $(1)/usr/lib/lua/luci/tools/
	$(INSTALL_BIN) ./files/zzz-default-settings $(1)/etc/uci-defaults/99-default-settings
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	po2lmo ./i18n/default.zh-hans.po $(1)/usr/lib/lua/luci/i18n/default.zh-hans.lmo
	po2lmo ./i18n/more.zh-hans.po $(1)/usr/lib/lua/luci/i18n/more.zh-hans.lmo
	po2lmo ./i18n/sqm.zh-hans.po $(1)/usr/lib/lua/luci/i18n/sqm.zh-hans.lmo
endef

$(eval $(call BuildPackage,addition-trans-zh))
