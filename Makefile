.PHONY: help clean test coverage install
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

regex_pattern = r'^([a-zA-Z_-]+):.*?## (.*)$$'

for line in sys.stdin:
	match = re.match(regex_pattern, line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef

export PRINT_HELP_PYSCRIPT

PACKAGE_NAME = "sappio"

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

clean: clean-test clean-dist ## remove all test coverage

clean-test: # remove test and coverage artifacts
	rm -fr coverage/

clean-dist: # remove dist artifacts
	rm -fr dist/

install: clean ## build the package
	npm install -g serve @vue/cli
	snap install vue --classic

build: clean ## build the package
	npm run build

serve: build ## serve the package 
	serve -s dist

lint: ## check styling
	npm run lint	