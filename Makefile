SOURCE = $(shell find . -type f -name \*.el)
TARGET = $(patsubst %.el,%.elc,$(SOURCE)) init.elc

all: $(TARGET)
#all: *.elc lisp/*.elc

clean:
	@rm -f $(TARGET) *~ # -f ignores missing files

%.el: %.org
#	rm -f $@
	emacs -Q -L lisp \
		--eval "(require 'org)" \
		--eval "(org-babel-load-file \"$<\")"
#	@chmod 444 $@

%.elc: %.el
	@echo Compiling file $<
	emacs -Q -L lisp --batch -f batch-byte-compile $<
