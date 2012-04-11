default: gnarley-trees.pdf
gnarley-trees.pdf: *.tex */*.tex references.bib obrazky/*
	pdfcslatex gnarley-trees.tex
	bibtex gnarley-trees
	pdfcslatex gnarley-trees.tex

clean:
	rm `find -name '*~'`
	rm -r *.aux
	rm -r *.log
	rm -r *.out
	rm -r *.bbl
	rm -r *.blg
