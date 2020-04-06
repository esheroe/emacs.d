;; open init.el file
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; p-project f-find
(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "s-/") 'hippie-expand)

(global-set-key (kbd "M-s o") 'occur-dwim)

(global-set-key (kbd "C-=") 'er/expand-region)

(global-set-key (kbd "M-s i") 'counsel-imenu) ; need to expand

(global-set-key (kbd "M-s e") 'iedit-mode)






(provide 'init-keybindings)
