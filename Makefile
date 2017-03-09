all:
	virtualenv venv
	venv/bin/pip install --upgrade pip
	venv/bin/pip install -q --editable .
	venv/bin/pip install -q -r requirements.txt

test:	all
	venv/bin/pytest tests

cover:	all
	venv/bin/pytest --cov=. tests

coveralls:
	venv/bin/coveralls

fetch:	all
	venv/bin/python bin/fetch.py

update:	all
	venv/bin/python bin/update.py

docker:
	docker build -f Dockerfile .

clean:
	rm -rf venv *.pyc .cache tests/__pycache__
