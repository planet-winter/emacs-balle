; latex
(load "~/.emacs.d/extensions/auctex-11.86/auctex.el" nil t t)
(require 'reftex)
(require 'preview-latex)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-electric-escapy t)
(setq-default TeX-master "../main")
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
(setq TeX-show-compilation nil)
(setq TeX-toggle-debug-boxes nil)
(setq file_line_error_style t)
(setq TeX-view-program-list '(("Acrobat" "acroread %o")))
(setq TeX-view-program-selection '((output-pdf "Acrobat")))

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

; auto-completion
(add-to-list 'load-path "~/.emacs.d/extensions/auto-complete-1.3")
(require 'auto-complete-config nil t)
(require 'ac-math)
(add-to-list 'ac-modes 'LaTeX-mode)
(add-to-list 'ac-modes 'latex-mode)

(defun ac-latex-mode-setup ()         ; add ac-sources to default ac-sources
  (setq ac-sources
     (append '(ac-source-math-latex ac-source-latex-commands  ac-source-math-unicode)
               ac-sources))
)

(auto-complete-mode)
(ac-config-default)

;; Make RefTeX faster
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)

(setq LaTeX-mode-hook
 '(lambda ()
    (ac-latex-mode-setup)
    (reftex-mode)
    (flyspell-mode)
    (define-key LaTeX-mode-map "\C-cu" 'LaTeX-find-matching-begin)
    (define-key LaTeX-mode-map "\C-cd" 'LaTeX-find-matching-end)
    (define-key LaTeX-mode-map "\C-ci" 'LaTeX-insert-item)
))

