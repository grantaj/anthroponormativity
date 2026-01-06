TEX_DIR := latex
TEX_MAIN := main.tex
PDF := $(TEX_DIR)/main.pdf
HTML := docs/index.html
RELEASE_DIR := docs/releases
RELEASE_NAME := anthroponormativity-$(VERSION).pdf

.PHONY: all pdf html release clean

all: pdf

pdf:
	latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=$(TEX_DIR) $(TEX_DIR)/$(TEX_MAIN)

html:
	mkdir -p docs
	pandoc $(TEX_DIR)/$(TEX_MAIN) -s -o $(HTML)

release: pdf
	@test -n "$(VERSION)" || (echo "VERSION is required, e.g. make release VERSION=0.3" && exit 1)
	mkdir -p $(RELEASE_DIR)
	cp $(PDF) $(RELEASE_DIR)/$(RELEASE_NAME)

clean:
	latexmk -C -output-directory=$(TEX_DIR)
	rm -f $(PDF)
