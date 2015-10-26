file_no_ext=kurt_cv
cv_and_cover="Kurt McAlpine's CV and Cover Letter"
cv_only="Kurt McAlpine's CV"
cover_only="Kurt McAlpine's Cover Letter"

cv_and_cover:
	pdflatex $(file_no_ext).tex
	rm ./*.aux
	rm ./*.out
	rm ./*.log
	mv $(file_no_ext).pdf $(cv_and_cover).pdf

seperate_cv_coverletter:
	pdflatex $(file_no_ext).tex
	rm ./*.aux
	rm ./*.out
	rm ./*.log
	./seperate.sh $(file_no_ext).pdf $(cv_only).pdf $(cover_only).pdf
	rm $(file_no_ext).pdf

clean:
	rm ./*.pdf

spellcheck:
	aspell --personal=./.aspell.en.pws --lang=en_GB --mode=tex check $(file_no_ext).tex
