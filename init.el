;; add config file path

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

;; Measure startup time
;;(require 'init-benchmarking)
;;

;; Disable the spell check
(defconst *spell-check-support-enabled* nil)

;; init config
(require 'vh-elpa)
(require 'vh-edit)
(require 'vh-org)
(require 'vh-company)

;; personal config
;;(require 'vh-org)

;; global user setting
(setq user-full-name "Burgess Chang"
    user-mail-address "vhtq18w@gmail.com")



(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)


(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(package-selected-packages
   (quote
    (capture company spacemacs-theme github-modern-theme fullframe color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
