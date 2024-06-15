EMACS_BATCH = emacs --batch -Q
EL_FILES = init.el early-init.el
SAVE_FILES = $(subst .el,.el.save,$(EL_FILES))

all:
	@rm -f $(EL_FILES)
	$(EMACS_BATCH) \
		--init-directory "$(PWD)" \
		--eval "(require 'org)" \
		--eval "(org-babel-load-file \"init.org\")"

backup:
	@cp -p init.el init.el.save
	@cp -p early-init.el early-init.el.save

clean:
	@rm -f *~ $(EL_FILES)

.PHONY: all backup clean
