
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = 7504ee2f27e36e7d58375dd9abcdc3c4b36050ae
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
#LDD_SITE = git@github.com:cu-ecen-aeld/assignment-3-and-later-joag6558.git
LDD_SITE = https://github.com/cu-ecen-aeld/assignments-3-and-later-joag6558.git
#AESD_ASSIGNMENTS_OVERRIDE_SRCDIR=/home/syslaptop/projects/msee/ecea-5305/week2b/assignment5part1/assignments-3-and-later-joag6558/server
#LDD_OVERRIDE_SRCDIR=/home/syslaptop/projects/msee/ecea-5306/week2/assignment7par2b


LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = aesd-char-driver



$(eval $(kernel-module))

define LDD_DO_STUFF_WITH_KERNEL_MODULE
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/aesd-char-driver INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
endef
LDD_POST_BUILD_HOOKS += LDD_DO_STUFF_WITH_KERNEL_MODULE

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/etc/init.d/aesdchar_load
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/etc/init.d/aesdchar_unload
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/S98lddmodules $(TARGET_DIR)/etc/init.d/S98lddmodules
endef

$(eval $(generic-package))
