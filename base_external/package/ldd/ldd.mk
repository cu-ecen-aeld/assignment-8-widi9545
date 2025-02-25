
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = '24ea316'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-widi9545.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
CROSS_COMPILE=aarch64-none-linux-gnu-

define LDD_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules 
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull 
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define LDD_INSTALL_TARGET_CMDS

	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/etc/misc-modules
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/etc/misc-modules

	$(INSTALL) -m 0755 $(@D)/scull/scull.init $(TARGET_DIR)/etc/scull
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/etc/scull
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/etc/scull

endef
#	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket







$(eval $(generic-package))
