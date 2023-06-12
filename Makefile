DIR=./repo

import:
	$(DIR)/import-configs
import-dry:
	$(DIR)/import-configs -d

export:
	$(DIR)/export-configs
export-dry:
	$(DIR)/export-configs -d

install:
	$(DIR)/install-apps

init:
	git config core.hooksPath .githooks

release:
	$(DIR)/release $(filter-out $@,$(MAKECMDGOALS))
