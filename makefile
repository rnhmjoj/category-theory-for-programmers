title = 'category-theory-for-programmers'

root = $(shell pwd)
src  = $(root)/src
init = $(src)/init/cover.html $(src)/init/table.html $(src)/init/preface.html
chapters = $(shell find $(src)/part-* -name '*.html' | sort -V)

all: pdf epub

pdf:
	cd $(src)/init;              \
	pandoc                       \
		$(init)                    \
		$(chapters)                \
		$(root)/opt/metadata.yaml  \
		--standalone               \
		--smart                    \
		--number-sections          \
		-H $(root)/opt/tex         \
		--latex-engine=xelatex     \
		-o $(root)/$(title).pdf

epub:
	cd $(src)/init;              \
	pandoc                       \
		$(init)                    \
		$(chapters)                \
		$(root)/opt/metadata.yaml  \
		--standalone               \
		--smart                    \
		--number-sections          \
		-o $(root)/$(title).epub
