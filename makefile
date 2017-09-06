title = 'category-theory-for-programmers'

root = $(shell pwd)
src  = $(root)/src

chapters = $(shell find $(src)/part-* -name '*.html' | sort -V)

book:
	cd $(src)/init;             \
	pandoc                      \
		$(src)/init/preface.html  \
		$(chapters)               \
		--smart                   \
		--toc                     \
		--number-section          \
		--epub-stylesheet=$(root)/pandoc/style.css  \
		--epub-cover-image=$(root)/pandoc/cover.png \
		--epub-embed-font='$(src)/fonts/*.woff'     \
		-o $(root)/$(title).epub
