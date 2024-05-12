SOURCE = $(shell find . -type f -name \*.el)
TARGET = $(patsubst %.el,%.elc,$(SOURCE)) init.elc

EMACS_BATCH = emacs --batch -Q

all: $(TARGET)

clean:
	@rm -f $(TARGET) *~ # -f also ignores missing files

%.el: %.org
#	rm -f $@
	$(EMACS_BATCH) \
		--eval "(require 'org)" \
		--eval "(org-babel-load-file \"$<\")"
#	@chmod 444 $@

%.elc: %.el
	@echo Compiling file $<
	$(EMACS_BATCH) -f batch-byte-compile $<
