doc   = pgfmanual
TEXINPUTS := ../../text-en:$(TEXINPUTS)

ex_src= $(wildcard *-examples-*.tex)

all: $(doc).html

pgfmanual.idx: 
	touch pgfmanual.idx

pgfmanual.ind: pgfmanual.idx 
	makeindex $(doc).idx

pgfmanual.html: $(doc).tex $(doc).ind 
	TEXINPUTS="$(TEXINPUTS)" make4ht -ulm draft -e pfg.mk4 -c pgfmanual-tex4ht.cfg -d out $(doc).tex "" " -cmozhtf"

pdf:
	TEXINPUTS="$(TEXINPUTS)" lualatex -shell-escape $(doc).tex

examples-extract: 
	TEXINPUTS="$(TEXINPUTS)" lualatex  $(doc)-examples.tex

examples: $(ex_src)
	-TEXINPUTS="$(TEXINPUTS)" lualatex --interaction=nonstopmode $^;

clean:
	rm -f  \
		plots/* \
		pgfmanual.out \
		pgfmanual.log \
		pgfmanual.idx \
		pgfmanual.ind \
		pgfmanual.ilg \
		pgfmanual.pdf \
		pgfmanual.toc \
		pgfmanual.bbl \
		pgfmanual.blg \
		pgfmanual.ps \
		pgfmanual.*gif \
		pgfmanual.*html \
		pgfmanual.*svg \
		pgfmanual.xref \
		pgfmanual.css \
		pgfmanual.4ct \
		pgfmanual.4tc \
		pgfmanual.dvi \
		pgfmanual.lg \
		pgfmanual.idv \
		pgfmanual*.aux \
		*.png
