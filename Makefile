HUGO=bin/hugo
OUTPUTDIR=overkill-io.github.io

website:
	$(HUGO)

test: website
	$(HUGO) server

publish: website
	cd $(OUTPUTDIR) && git add . && git commit -m "Sync website" && git push
	git add $(OUTPUTDIR)
	git commit -m "Refresh submodule"
	git push

.PHONY: website test publish
