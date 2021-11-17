.PHONY: clean all

SRCS     = $(shell find -name \*.tex)
NAME     = main
BIB      = ./references.bib
OBJDIR   = build
LATEX    = pdflatex
LATEXOPT = -output-directory=$(OBJDIR)
PDF      = $(OBJDIR)/$(NAME).pdf
MAIN     = $(NAME).tex
BBL      = $(OBJDIR)/$(NAME).bbl
AUX      = $(OBJDIR)/$(NAME).aux

all: $(PDF)

$(PDF): $(OBJDIR) $(MAIN)
	TEXINPUTS=".:sty/:" $(LATEX) $(LATEXOPT) $(MAIN)
	TEXINPUTS=".:sty/:" $(LATEX) $(LATEXOPT) $(MAIN)

$(OBJDIR):
	mkdir -p $@

$(NAME).zip:
	git ls-files | xargs zip -9 $@ .git

clean:
	rm -rf ./build

show:
	zathura $(OBJDIR)/main.pdf