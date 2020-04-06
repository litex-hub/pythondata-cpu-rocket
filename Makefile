ACTIVATE=[[ -e venv/bin/activate ]] && source venv/bin/activate;

SHELL := /bin/bash

clean:
	rm -rf build dist litex_data_*

.PHONY: clean

venv-clean:
	rm -rf venv

.PHONY: venv-clean

venv:
	virtualenv --python=python3 venv

.PHONY: venv

build:
	${ACTIVATE} python setup.py sdist bdist_wheel

.PHONY: build

upload-test:
	${ACTIVATE} twine upload --repository-url https://test.pypi.org/legacy/ dist/*

.PHONY: upload-test

upload:
	${ACTIVATE} twine upload

.PHONY: upload

install:
	${ACTIVATE} python setup.py install

.PHONY: install

test:
	${ACTIVATE} python test.py

.PHONY: test
