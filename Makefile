SOURCE=EserciziIstituzioniAnalisi
LIST=list.tex
compilecmd=pdflatex
SHELL := /bin/bash
dollar=$

all: $(SOURCE).tex $(LIST) $(wildcard tex/*)
	@$(compilecmd) $(SOURCE).tex

$(LIST): tex/
	-$(RM) $(LIST)
	for i in `ls tex/`; do j=`echo $$i|sed 's/_/ /g'|sed 's/.tex//'`; echo "\section{$$j} \subfile{tex/$$i}">>$(LIST); done


clean:
	-$(RM) texput.log
	-$(RM) $(LIST)
	-$(RM) $(SOURCE).bbl
	-$(RM) $(SOURCE).tex.blg
	-$(RM) $(SOURCE).toc
	-$(RM) $(SOURCE).lof
	-$(RM) $(SOURCE).blg
	-$(RM) $(SOURCE).out
	-$(RM) $(SOURCE).run.xml
	-$(RM) $(SOURCE).aux
	-$(RM) $(SOURCE).bcf
	-$(RM) $(SOURCE).log

