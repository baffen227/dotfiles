(require 'package)

;; The Package Manager
;; M-x eval-buffer
;; M-x package-list-packages
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.org/packages/")))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;; (package-refresh-contents)

;; Download Evil
;; (unless (package-installed-p 'evil)
;;  (package-install 'evil))

;; Enable
(require 'evil)
(evil-mode 1)

(require 'dired-x)
(require 'helm)

(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

(setq apropos-sort-by-scores t)

;; rebind C-x o to M-o
(global-set-key (kbd "M-o") 'other-window)

;; to bind Imenu to M-i
(global-set-key (kbd "M-i") 'imenu)


;; Add this to your init file to switch to Hippie Expand:
(global-set-key [remap dabbrev-expand] 'hippie-expand)

;; from https://orgmode.org/manual/Activation.html#Activation
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; from https://orgmode.org/manual/Setting-up-capture.html#Setting-up-capture
;; from https://orgmode.org/manual/Using-capture.html#Using-capture
(setq org-default-notes-file (concat org-directory "/notes.org"))


