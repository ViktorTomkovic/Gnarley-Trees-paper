default: gnarley-trees.pdf
gnarley-trees.pdf: *.tex */*.tex references.bib
	pdfcslatex gnarley-trees.tex
	bibtex gnarley-trees
	pdfcslatex gnarley-trees.tex

clean:
	rm -r *~
	rm -r *.aux
	rm -r *.log
	rm -r *.out
	rm -r *.bbl
	rm -r *.blg
