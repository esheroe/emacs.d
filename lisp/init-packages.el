(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; common lisp extension
(require 'cl)

 ;; Add Packages
(defvar esheroe/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      expand-region 
		      iedit
		      ;; --- Major Mode ---
	  
		      ;; --- Minor Mode ---

		      ;; --- Themes ---
		      dracula-theme
		      ;; solarized-theme
		      ) "Default packages")

(setq package-selected-packages esheroe/packages)

(defun esheroe/packages-installed-p ()
  (loop for pkg in esheroe/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (esheroe/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg esheroe/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'smartparens-config)
(add-hook `emacs-lisp-mode-hook 'smartparens-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode)

(global-company-mode t)
;; theme

;; popwin



(provide 'init-packages)
