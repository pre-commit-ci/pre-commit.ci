.PHONY: all
all: index.html

venv: requirements-dev.txt Makefile
	rm -rf venv
	virtualenv venv
	venv/bin/pip install -r requirements-dev.txt

%.py: %.tmpl venv
	venv/bin/cheetah-compile $<

%.html: %.py venv
	venv/bin/python $< > $@

.PHONY: push
push: venv
	venv/bin/markdown-to-presentation push \
		.nojekyll README.md CNAME *.html favicon.ico css img

.PHONY: clean
clean:
	rm -rf venv index.html index.py

.SECONDARY:
