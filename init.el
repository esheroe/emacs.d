;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

;; close the tool bar

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)

(setq enable-recursive-minibuffers t)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)


