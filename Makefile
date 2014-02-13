TeXEngine?=pdflatex
MakeIndex?=makeindex
BibEngine?=biber

TeXFlags+=--shell-escape

default:

it-latex:
	${TeXEngine} ${TeXFlags} py4num-it

it: clean
	${TeXEngine} ${TeXFlags} py4num-it
	${BibEngine} py4num-it
	${MakeIndex} py4num-it
	${TeXEngine} ${TeXFlags} py4num-it
	${TeXEngine} ${TeXFlags} py4num-it

clean:
	rm -f *{.aux,.bbl,.bcf,.blg,.idx,.ilg,.ind,.log,.out,.toc,.xml}

clean-all: clean
	rm -f *.pdf

