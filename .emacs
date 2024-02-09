(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   '(("LatexMk" "latexmk %(-PDF)%S%(mode) %(file-line-error) %(extraopts) %t" TeX-run-latexmk nil
      (plain-tex-mode latex-mode doctex-mode)
      :help "Run LatexMk")
     ("TeX" "%(PDF)%(tex) %(file-line-error) %`%(extraopts) %S%(PDFout)%(mode)%' %(output-dir) %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %T" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %(o-dir) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) %(o-dir) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %`%(extraopts) %S%(mode)%' %(output-dir) %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %(O?aux)" TeX-run-BibTeX nil
      (plain-tex-mode latex-mode doctex-mode context-mode texinfo-mode ams-tex-mode)
      :help "Run BibTeX")
     ("Biber" "biber %(output-dir) %s" TeX-run-Biber nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run Biber")
     ("Texindex" "texindex %s.??" TeX-run-command nil
      (texinfo-mode)
      :help "Run Texindex")
     ("Texi2dvi" "%(PDF)texi2dvi %t" TeX-run-command nil
      (texinfo-mode)
      :help "Run Texi2dvi or Texi2pdf")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx -o %(O?pdf) %d" TeX-run-dvipdfmx nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f %(O?pdf)" TeX-run-ps2pdf nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %(d-dir) %s" TeX-run-command nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run makeglossaries to create glossary file")
     ("Index" "makeindex %(O?idx)" TeX-run-index nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run makeindex to create index file")
     ("upMendex" "upmendex %(O?idx)" TeX-run-index t
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command")))
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "PDF Tools")
     (output-html "xdg-open")))
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" default))
 '(display-line-numbers t)
 '(package-selected-packages
   '(latex-preview-pane auctex-latexmk pdf-tools orderless vertico auctex zenburn-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq display-line-numbers-type t)
(setq display-line-numbers t)

(setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))

(defalias 'splitvert
   (kmacro "C-x 3 C-x o C-x C-b"))
(global-set-key (kbd "<f6>") 'splitvert)
(global-set-key (kbd "C-x C-b") 'buffer-menu)
(setq fancy-splash-image "~/doom_backup/.doom.d/splash/doom_church_emacs.png")
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )
(use-package savehist
  :init
  (savehist-mode))
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))
(if window-system
    (progn (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))
  )
(setq inhibit-startup-screen t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(require 'auctex-latexmk)
(auctex-latexmk-setup)
(setq TeX-source-correlate-mode t)
(setq auctex-latexmk-inherit-TeX-PDF-mode t)
(latex-preview-pane-enable)
