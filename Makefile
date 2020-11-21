.PHONY: all
all: index.html

venv: requirements-dev.txt Makefile
	rm -rf venv
	virtualenv venv
	venv/bin/pip install -r requirements-dev.txt

index.html: venv bin/make-index index.html.tmpl content.md
	venv/bin/python bin/make-index

.PHONY: push
push: venv
	venv/bin/markdown-to-presentation push \
		.nojekyll README.md CNAME *.html favicon.ico css img

.PHONY: clean
clean:
	rm -rf venv index.html

.SECONDARY:
