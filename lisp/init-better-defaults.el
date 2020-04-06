(setq ring-bell-function 'ignore)

(global-hl-line-mode 1)

;; modify by others, the init.el will auto revert
(global-auto-revert-mode t)

(abbrev-mode t)

;; input shot-name+<space>+<enter>
(define-abbrev-table 'global-abbrev-table '(
					    ("ln" "long-name")
					    ))

(setq make-backup-files nil)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

(defun indent-buffer()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(setq hippie-expand-try-functions-list '(
					 try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name
					 try-complete-file-name-partially
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol
					 try-complete-lisp-symbol-partially))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;; disable the dired-mode create a lot of buffers
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired ; lazy load dired-mode-map
 (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; open directory of current buffer C-x C-j

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Hightlight enclosing parents."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

(provide 'init-better-defaults)

