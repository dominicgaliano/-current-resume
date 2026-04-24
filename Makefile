TEX := dgaliano-resume.tex

PDF_BASE := dgaliano-resume.pdf
PDF_WITH := dgaliano-resume-with-address.pdf
TXT := dgaliano-resume.txt

all: $(PDF_BASE) $(PDF_WITH) $(TXT)
	$(MAKE) clean

# -------------------------
# DEFAULT (no address)
# -------------------------
$(PDF_BASE): $(TEX)
	pdflatex -interaction=nonstopmode -jobname=dgaliano-resume "\input{$<}"

# -------------------------
# WITH ADDRESS
# -------------------------
$(PDF_WITH): $(TEX)
	pdflatex -interaction=nonstopmode -jobname=dgaliano-resume-with-address "\def\WITHADDRESS{1} \input{$<}"
	mv dgaliano-resume-with-address.pdf $@

# -------------------------
# TEXT
# -------------------------
$(TXT): $(TEX)
	pandoc $< -t plain -o $@

clean:
	rm -f *.aux *.log *.out *.toc *.nav *.snm

distclean: clean
	rm -f $(PDF_BASE) $(PDF_WITH)

.PHONY: all clean distclean
