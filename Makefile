HUGO=bin/hugo
OUTPUTDIR=overkill-io.github.io
COMMIT=$(shell git rev-parse --short HEAD)

website:
	cd ${OUTPUTDIR} && git fetch && git reset --hard origin/master
	$(HUGO)

test: website
	$(HUGO) server

publish: website
	cd $(OUTPUTDIR) && git add . && git commit -m "Sync website to ${COMMIT}" && git push
	git add $(OUTPUTDIR)
	git commit -m "Refresh submodule"
	git push

.PHONY: website test publish
