SOURCE=EserciziIstituzioniAnalisi
LIST=list.tex
compilecmd=pdflatex
SHELL := /bin/bash

all: $(SOURCE).tex $(LIST) $(wildcard tex/*)
	@$(compilecmd) $(SOURCE).tex
	@mv $(SOURCE).pdf output/$(SOURCE).pdf

$(LIST): tex/
	-$(RM) $(LIST)
	for i in `ls tex/|grep -v "~"`; do j=`echo $$i|sed 's/_/ /g'|sed 's/.tex//'`; echo "\section{$$j} \subfile{tex/$$i}">>$(LIST); done


clean:
	-$(RM) texput.log
	-$(RM) $(LIST)
	-$(RM) $(SOURCE).aux
	-$(RM) $(SOURCE).bbl
	-$(RM) $(SOURCE).bcf
	-$(RM) $(SOURCE).blg
	-$(RM) $(SOURCE).lof
	-$(RM) $(SOURCE).log
	-$(RM) $(SOURCE).out
	-$(RM) $(SOURCE).run.xml
	-$(RM) $(SOURCE).tex.blg
	-$(RM) $(SOURCE).thm
	-$(RM) $(SOURCE).toc

