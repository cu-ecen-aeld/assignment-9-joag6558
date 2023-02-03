
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = daf94c6bcb64be5380c7170bca3aff3662a54382
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-joag6558.git
#AESD_ASSIGNMENTS_SITE = https://github.com/cu-ecen-aeld/assignments-3-and-later-joag6558.git
#AESD_ASSIGNMENTS_OVERRIDE_SRCDIR=/home/syslaptop/projects/msee/ecea-5305/week2b/assignment5part1/assignments-3-and-later-joag6558/server
#LDD_OVERRIDE_SRCDIR=/home/syslaptop/projects/msee/ecea-5306/week2/assignment7par2b


LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull


$(eval $(kernel-module))

define LDD_DO_STUFF_WITH_KERNEL_MODULE
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/misc-modules INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/scull INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef
LDD_POST_BUILD_HOOKS += LDD_DO_STUFF_WITH_KERNEL_MODULE

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/etc/init.d/scull_load
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/etc/init.d/scull_unload
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/etc/init.d/module_load
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/etc/init.d/module_unload
	$(INSTALL) -m 0755 $(@D)/misc-modules/S98lddmodules $(TARGET_DIR)/etc/init.d/S98lddmodules
endef

$(eval $(generic-package))
