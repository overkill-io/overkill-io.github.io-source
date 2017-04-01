HUGO=bin/hugo
OUTPUTDIR=overkill-io.github.io

website:
	$(HUGO)

test: website
	$(HUGO) server

.PHONY: website test
