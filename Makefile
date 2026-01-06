TEX_DIR := latex
TEX_MAIN := main.tex
PDF := $(TEX_DIR)/main.pdf
HTML := docs/index.html

.PHONY: all pdf html clean

all: pdf

pdf:
	latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error -output-directory=$(TEX_DIR) $(TEX_DIR)/$(TEX_MAIN)

html:
	mkdir -p docs
	pandoc $(TEX_DIR)/$(TEX_MAIN) -s -o $(HTML)

clean:
	latexmk -C -output-directory=$(TEX_DIR)
	rm -f $(PDF)
