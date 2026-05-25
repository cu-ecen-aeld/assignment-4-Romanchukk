
##############################################################
#
# LDD
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = 5c3cae6ddc96b8645dfa6f6bc4ddbba08aae8789
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-Romanchukk.git
LDD_SITE_METHOD = git
LDD_MODULE_SUBDIRS = scull misc-modules

# define LDD_BUILD_CMDS
# 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
# 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
# endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/

	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/

	sed -i 's/insmod .\/$$module.ko/modprobe $$module/' $(TARGET_DIR)/usr/bin/scull_load
	sed -i 's/insmod .\/$$module.ko/modprobe $$module/' $(TARGET_DIR)/usr/bin/module_load

	$(INSTALL) -m 0755 $(LDD_PKGDIR)/ldd-start-stop $(TARGET_DIR)/etc/init.d/S98lddmodules
endef

$(eval $(kernel-module))
$(eval $(generic-package))
