EMACS_BATCH = emacs --batch -Q

all:
	@rm -f init.el early-init.el
	$(EMACS_BATCH) \
		--init-directory "$(PWD)" \
		--eval "(require 'org)" \
		--eval "(org-babel-load-file \"init.org\")"

clean:
	@rm -f *~ init.el early-init.el

.PHONY: all clean
