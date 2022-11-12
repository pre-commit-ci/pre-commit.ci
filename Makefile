.PHONY: all
all: index.html lite.html cookie_notice.html privacy_policy.html

venv: requirements-dev.txt Makefile
	rm -rf venv
	virtualenv venv
	venv/bin/pip install -r requirements-dev.txt

index.html: content/index.md venv bin/make-page tmpl/index.html.tmpl
	venv/bin/python bin/make-page tmpl/index.html.tmpl $<

lite.html: content/lite.md venv bin/make-page tmpl/lite.html.tmpl
	venv/bin/python bin/make-page tmpl/lite.html.tmpl $<

%.html: content/%.md venv bin/make-page tmpl/other.html.tmpl
	venv/bin/python bin/make-page tmpl/other.html.tmpl $<

.PHONY: push
push: venv
	venv/bin/markdown-to-presentation push \
		.nojekyll README.md CNAME *.html favicon.ico img

.PHONY: clean
clean:
	rm -rf venv index.html

.SECONDARY:
