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
   '("087f308c58ba2f5ad24f3ff7255c45b15bc5642428323e914c267771ac956cae" "72315d0bdbde1c249ce69714b64e564158c5588514411fe64723d0efd8df7543" "9e11cc5d94d51e548b0a2991c63c49864a12da6c221570e94177392a6d8fba42" "c857e38e6b07a1d9367de99f150080e721695c1be8a21f21148e9dab68e60e3a" "db7a16cbe167cfaa3d6c56ecbc6315b6e76e4319adb405822a647186ad201751" "a10e629a808f5b54a145658b951bbebacc04dd2fe9dff9b20b5307d8a7b67e85" "429841b4b0b7b6594a4d83f42b944ed6a2ae511df36c3bbafd97b85b806e0cc8" "31cf6c56a167ea8b84ce48ca57b193ea2e0de78183a719820c1197cb82deda9b" "4ffe15994ba515a91b68f8aeff0e0c2158d01efb3143257b9e6069a5242fdb93" "951f7c098a75610ed37319d5e8a36635cb0fe467034678e11db12de7c1a9f83a" "849cd3e525b89a28ad04ed2c52fc33eebe46f18bd7e8b79910fd575cb7b19e47" "9cd57dd6d61cdf4f6aef3102c4cc2cfc04f5884d4f40b2c90a866c9b6267f2b3" "b95f61aa5f8a54d494a219fcde9049e23e3396459a224631e1719effcb981dbd" "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" default))
 '(display-line-numbers t)
 '(package-selected-packages
   '(company utop dune flycheck-ocaml merlin tuareg multiple-cursors slack miasma-theme ox-reveal org-roam obsidian jsonrpc editorconfig drag-stuff treemacs wgrep ssh-deploy undo-tree magit compat gnu-elpa-keyring-update systemtap-mode kaolin-themes helpful latex-preview-pane auctex-latexmk pdf-tools orderless vertico auctex zenburn-theme))
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

;(zone-when-idle 300)


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

(add-to-list 'load-path "/home/yann/.emacs.d/elpa/copilot.el")
(require 'copilot)
(define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
(define-key copilot-completion-map (kbd "<backtab>") 'copilot-accept-completion-by-word)

(load-theme 'miasma)


(defun frac-macro ()
  "wrapper for latex frac command"
  (interactive)
  (setq num (read-string "Numerator: "))
  (setq den (read-string "Denominator: "))
  (insert (concat "\\frac{" num "}{" den "}"))
  )

  
  
(put 'narrow-to-region 'disabled nil)


(use-package cc-vars)
(add-to-list 'c-default-style '(c-mode . "linux"))


(use-package obsidian
  :ensure t
  :demand t
  :config
  (obsidian-specify-path "~/obsidian")
  (global-obsidian-mode t)
  :custom
  ;; This directory will be used for `obsidian-capture' if set.
  (obsidian-inbox-directory "inbox")
  ;; Create missing files in inbox? - when clicking on a wiki link
  ;; t: in inbox, nil: next to the file with the link
  ;; default: t
					;(obsidian-wiki-link-create-file-in-inbox nil)
  ;; The directory for daily notes (file name is YYYY-MM-DD.md)
  (obsidian-daily-notes-directory "dailynotes")
  ;; Directory of note templates, unset (nil) by default
					;(obsidian-templates-directory "Templates")
  ;; Daily Note template name - requires a template directory. Default: Daily Note Template.md
					;(obsidian-daily-note-template "Daily Note Template.md")
  :bind (:map obsidian-mode-map
	      ;; Replace C-c C-o with Obsidian.el's implementation. It's ok to use another key binding.
	      ("C-c M-o" . 'obsidian-hydra/body)	      
	      ("C-c C-o" . obsidian-follow-link-at-point)
	      ;; Jump to backlinks
	      ("C-c C-b" . obsidian-backlink-jump)
	      ;; If you prefer you can use `obsidian-insert-link'
	      ("C-c C-l" . obsidian-insert-wikilink)
	      )
  )


(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/orgmode/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  (org-roam-setup)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))


(defhydra org-roam-hydra (:color red
				 :hint nil)
  "
Org Roam
capture daily _j_ournal    _q_uit
togg_l_e org roam buffer   _i_nsert node link
_f_ind node
_c_apture
"
  ("j" org-roam-dailies-capture-today)
  ("l" org-roam-buffer-toggle)
  ("f" org-roam-node-find)
  ("i" org-roam-node-insert :color blue)
  ("c" org-roam-capture)
  ("q" nil :color blue))

(define-key global-map (kbd "C-c n") 'org-roam-hydra/body)

(setq org-reveal-root "file:///home/yann/reveal.js")

(defun linux-c-mode ()
"C mode with adjusted defaults for use with the Linux
kernel."
(interactive)
(c-mode)
(setq c-indent-level 8)
(setq c-brace-imaginary-offset 0)
(setq c-brace-offset -8)
(setq c-argdecl-indent 8)
(setq c-label-offset -8)
(setq c-continued-statement-offset 8)
(setq indent-tabs-mode nil)
(setq tab-width 8))


(push "/home/yann/.opam/cs320-s25/share/emacs/site-lisp" load-path) ; directory containing merlin.el
;; (setq merlin-command "<BIN_DIR>/ocamlmerlin")  ; needed only if ocamlmerlin not already in your PATH
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook #'merlin-mode)
(add-hook 'caml-mode-hook #'merlin-mode)
;; Uncomment these lines if you want to enable integration with the corresponding packages
;; (require 'merlin-iedit)       ; iedit.el editing of occurrences
;; (require 'merlin-company)     ; company.el completion
;; (require 'merlin-ac)          ; auto-complete.el completion
;; To easily change opam switches and pick the ocamlmerlin binary accordingly,
;; you can use the minor mode https://github.com/ProofGeneral/opam-switch-mode
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
