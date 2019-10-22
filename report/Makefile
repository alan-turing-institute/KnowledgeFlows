backbrief.pdf : report.md bibliography.md
	pandoc --bibliography biblio.bib --filter pandoc-citeproc --toc --toc-depth=2 --number-sections -s report.md bibliography.md -o report.pdf
