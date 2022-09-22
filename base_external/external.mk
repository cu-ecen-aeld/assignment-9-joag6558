
include $(sort $(wildcard $(BR2_EXTERNAL_project_base_PATH)/package/*/*.mk))

.PHONY: help
help: help

.PHONY: help
help:
	@echo  ''
	@echo  ''
	@echo  '$(sort $(wildcard $(BR2_EXTERNAL_project_base_PATH)/package/*/*.mk))'
	@echo  ''
	@echo  ''
