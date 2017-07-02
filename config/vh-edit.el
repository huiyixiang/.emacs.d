;; bar-mode setting
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; tab bar name
(setq frame-title-format "%b")

;; Disable start message
(setq inhibit-startup-message 1)
(setq gnus-inhibit-startup-message 1)

;; Font setting
(set-face-attribute 'default nil :height 160)

;; Dispaly time setting
(display-time)
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; Enable number line
(setq column-number-mode t)
(setq line-number-mode t)
(global-linum-mode t)

;; highlighting lin
(global-hl-line-mode 1)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; Disable auto backup
(setq make-backup-files nil)


;; space tab width
(setq 
    tab-width 4
    indent-tabs-mode t
    c-basic-offset 4
    default-fill-column 80)

;; recent file selected men
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; swap the char that mark as some char
(delete-selection-mode 1)

;; auto load file
(global-auto-revert-mode 1)

;; Disable error ring bell
(setq ring-bell-function 'ignore)

;; Theme

(require-package 'github-modern-theme)
(require-package 'spacemacs-theme)
(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)

(setq-default custom-enabled-themes '(sanityinc-tomorrow-bright))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-day))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(sanityinc-tomorrow-bright))
  (reapply-themes))


;; keymap
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;; smex setting

(when (maybe-require-package 'smex)
  ;; Change path for ~/.smex-items
  (setq-default smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
  (global-set-key [remap execute-extended-command] 'smex))

(require-package 'popwin)
(require 'popwin)
(popwin-mode 1)



(provide 'vh-edit)
