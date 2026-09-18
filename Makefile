# Build the proposal. Requires a TeX distribution with latexmk and biber.
#   make          build main.pdf
#   make clean    remove auxiliary files
#   make cleanall remove auxiliary files and the PDF

MAIN = main

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex preamble.tex metadata.tex references.bib \
             $(wildcard frontmatter/*.tex) $(wildcard chapters/*.tex) $(wildcard backmatter/*.tex)
	latexmk -pdf -interaction=nonstopmode -halt-on-error $(MAIN).tex

clean:
	latexmk -c

cleanall:
	latexmk -C

.PHONY: all clean cleanall
