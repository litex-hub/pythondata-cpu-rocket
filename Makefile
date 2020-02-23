clean:
	rm -rf build dist litex_data_*

venv-clean:
	rm -rf venv

venv:
	virtualenv --python=python3 venv

ACTIVATE=[[ -e venv/bin/activate ]] && source venv/bin/activate;

install:
	${ACTIVATE} python setup.py install

test:
	${ACTIVATE} python test.py
