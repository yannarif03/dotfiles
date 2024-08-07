;; CUSTOMIZE SHENANS (EW)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "PDF Tools")
     (output-html "xdg-open")))
 '(custom-safe-themes
   '("9cd57dd6d61cdf4f6aef3102c4cc2cfc04f5884d4f40b2c90a866c9b6267f2b3" "b95f61aa5f8a54d494a219fcde9049e23e3396459a224631e1719effcb981dbd" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" default))
 '(display-line-numbers t)
 '(package-selected-packages
   '(drag-stuff treemacs wgrep ssh-deploy undo-tree magit compat gnu-elpa-keyring-update systemtap-mode kaolin-themes helpful latex-preview-pane auctex-latexmk pdf-tools orderless vertico auctex zenburn-theme))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; MELPA INIT
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;(package-refresh-contents)
(package-initialize)

;;; If gpg key whines and complains:
					; (setq package-check-signature nil)
					; (package-install gnu-elpa-keyring-update)
					; (package-refresh-contents)
					; (setq package-check-signature 'allow-unsigned)

(setq num 0)
(setq pinit nil)
(while  (< num (length package-selected-packages))
  (setq package (nth num package-selected-packages))
  (unless (package-installed-p package)
    (unless pinit
	(package-refresh-contents)
	(setq pinit t)
      )
    (package-install package)
    )
  (setq num (+ num 1))
  )


;; REQUIRED PACKAGES

(require 'drag-stuff)

;; USE PACKAGE STATEMENTS
(use-package vertico
  :ensure t
  :init
  (vertico-mode)

  ;; Grow and shrink the Vertico minibuffer
  (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )
(use-package savehist
  :ensure t
  :init
  (savehist-mode))

(use-package orderless
  :ensure t
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(setq inhibit-startup-screen t)
(setq display-line-numbers-type t)
(setq display-line-numbers t)
(setq fancy-splash-image "~/doom_backup/.doom.d/splash/doom_church_emacs.png")
(setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
(setq vc-follow-symlinks t)


;; KEY BINDINGS
(defalias 'splitvert
   (kbd "C-x 3 C-x o C-x C-b"))

(global-set-key (kbd "<f6>") 'splitvert)

(global-set-key (kbd "C-x C-b") 'buffer-menu)
(global-set-key (kbd "C-c c") 'compile)

; drag-stuff

(global-set-key (kbd "M-<up>") 'drag-stuff-up)
(global-set-key (kbd "M-<down>") 'drag-stuff-down)

; binding revert buffer command
(global-set-key (kbd "C-c R") 'revert-buffer)


;; GENERAL DISPLAY CONFIGS
(if window-system
    (progn (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))
  )



(global-undo-tree-mode)

(zone-when-idle 300)


;(require 'auctex-latexmk)
;(auctex-latexmk-setup)
;(setq TeX-source-correlate-mode t)
;(setq auctex-latexmk-inherit-TeX-PDF-mode t)
;(latex-preview-pane-enable)


;; CUSTOM FUNCTIONS

; CS330 proof macro
(defun latex-insert-alg-proof ()
  "Inserts a solution format for and algorithm description.
Include a header, as well as sub headers for Description,
 Complexity, I/O, and Proof of Correctness"
  (interactive)
  (push-mark)
  (insert "\\subsubsection*{Analysis}\n\\paragraph*{Input/Output}\n\\paragraph*{Description}\n\\paragraph*{Proof of Correctness}\n\\paragraph*{Complexity}")
  (indent-region (mark) (point))
  (pop-mark)
  )

; Opens emacs config file. assumes file is in default ~/.emacs location
(defun open-config ()
  "opens the file and brings up the buffer for .emacs"
  (interactive)
  (progn (find-file "~/.emacs")))
(use-package kaolin-themes
  :ensure t
  :init
  )

(load-theme 'kaolin-aurora)


