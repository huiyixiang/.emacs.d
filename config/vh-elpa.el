(require 'package)

;; Install into separate package dirs for each Emacs version,
;; to prevent bytecode incompatibility
;; Author: Steve Purcell
(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                         user-emacs-directory)))
  (when (file-directory-p package-user-dir)
    (message "Default package locations have changed in this config: renaming old package dir %s to %s."
             package-user-dir
             versioned-package-dir)
    (rename-file package-user-dir versioned-package-dir))
  (setq package-user-dir versioned-package-dir))
;;

;; package repositories add to list 
;; gnu elpa
(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
	     '("gnu-mirror" . "https://elpa.emacs-china.org/gnu/"))

;; marmalade
(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("marmalade-mirror" . "https://elpa.emacs-china.org/marmalade/"))

;; melpa
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-mirror" . "https://elpa.emacs-china.org/melpa/"))

;; China mainland archive
(add-to-list 'package-archives
             '("popkit" . "http://elpa.popkit.org/packages/"))

;; Org-mode's repository
(add-to-list 'package-archives
	     '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
	     '("org-mirror" . "https://elpa.emacs-china.org/org/") t)
;;

;; package install setting
;;(defun vh/reqiure-package (package &optional no-refresh)
 ;;   "Install given PACKAGEIf NO-REFRESH is non-nil, the available package lists
  ;;   will not be re-downloaded in order to locate PACKAGE."
   ;; (if (or (assoc package package-archive-contents) no-refresh)
    ;;   (if (boundp 'package-selected-packages)
     ;;       (package-install package nil)
;;	    (package-install package))
 ;;       (progn (package-refresh-contents)
;;	       (vh/require-package package t))))
;; init


;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
    "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
    (if (package-installed-p package min-version)
        t
      (if (or (assoc package package-archive-contents) no-refresh)
          (if (boundp 'package-selected-packages)
              ;; Record this as a package the user installed explicitly
              (package-install package nil)
              (package-install package))
          (progn
              (package-refresh-contents)
              (require-package package min-version t)))))

(defun maybe-require-package (package &optional min-version no-refresh)
    "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
    (condition-case err
        (require-package package min-version no-refresh)
        (error
            (message "Couldn't install optional package `%s': %S" package err)
            nil)))


(setq package-enable-at-startup nil)
(package-initialize)


(require-package 'fullframe)
(fullframe list-packages quit-window)

;; Common Lisp Extensio
(require-package 'cl-lib)
(require 'cl-lib)

(provide 'vh-elpa)
