############################
# Thomas Clavier
# Modif. by Nicolas Mauger
# My generic LaTeX Makefile
# 10 mar. 2016
############################

CLEAN_LOG=*~ *.rtf *.ps *.log *.aux *.out *.css *.bak *.toc *.pl *.4ct *.4tc *.lg *.sxw *.tmp *.xref *.idv *.tns *.nav *.snm
CLEAN_OUTPUT=*.pdf *.dvi *.html
# Use ":=" when the variable's definition need to resolve others variables
TEXFILES := $(wildcard *.tex)
# To not compile the includes files !
TEXFILES := $(filter-out includes.tex, $(TEXFILES))
TEXFILES := $(filter-out exemple.tex, $(TEXFILES))
SVGFILES = $(wildcard includes/*.svg)

all: pdf

%.pdf: %.tex
	pdflatex  $<
	pdflatex  $<

# Read inkscape manual page for more information
%.png: %.svg
	inkscape -f $< -e $@

clean:
	-rm -f $(CLEAN_LOG)

mrproper:
	-rm -f $(CLEAN_LOG) $(CLEAN_OUTPUT)

png: $(patsubst %.svg,%.png,$(SVGFILES))
pdf: png $(patsubst %.tex,%.pdf,$(TEXFILES))
