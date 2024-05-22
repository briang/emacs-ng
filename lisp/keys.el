(defun perl-save-and-run ()
  "run current buffer with perl"
  (interactive)
  (save-buffer)
  (compile (concat "perl " buffer-file-name)))

(eval-after-load 'cperl-mode ;; https://stackoverflow.com/a/5505855
  '(progn (define-key cperl-mode-map (kbd "<f12>") #'perl-save-and-run)
          (define-key cperl-mode-map (kbd "C-h f") #'cperl-perldoc)
          (define-key cperl-mode-map (kbd "M-<f1>") #'cperl-perldoc-at-point)))

;; remove indent guide from spacemacs startup page
(add-hook 'spacemacs-buffer-mode-hook
          #'spacemacs/toggle-indent-guide-off)

;; global set-keys
(global-set-key (kbd "<f2>") #'magit-status)
(global-set-key (kbd "C-#") #'other-window) ; not working in org
(global-set-key (kbd "M-DEL") #'evil-delete-backward-word)
(global-set-key (kbd "C-d") #'spacemacs/duplicate-line-or-region)

;; deleting lines
(setq kill-whole-line t) ; Killing line also deletes \n
(global-set-key (kbd "M-k") #'kill-whole-line) ; M-k deletes whole line

;; M-SPC is spacemacs SPC (is done in ~/.spacemacs/init.el)
;; C-SPC is just-one-space
(global-set-key (kbd "C-SPC") #'just-one-space)

;; move to previous/next buffer
(global-set-key (kbd "C-S-<prior>") #'previous-buffer)
(global-set-key (kbd "C-S-<next>")  #'next-buffer)

;; goto line
(global-set-key (kbd "C-g") #'goto-line)
