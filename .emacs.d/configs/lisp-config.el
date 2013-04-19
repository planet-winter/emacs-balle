(add-to-list 'load-path "~/.emacs.d/extensions/slime")
(require 'slime)

(setq inferior-lisp-program "/usr/bin/sbcl")
;(setq inferior-lisp-program "/usr/bin/clisp")

(setq slime-net-coding-system 'utf-8-unix)
(setq lisp-indent-function 'common-lisp-indent-function)
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)

;(slime-setup '(slime-repl))
(slime-setup '(slime-fancy))

(add-to-list 'auto-mode-alist '("\\.cl$" . lisp-mode))

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'lisp-mode-hook (lambda () (add-hook 'before-save-hook 'elint-current-buffer nil 'make-it-local)))
(add-hook 'interferior-lisp-mode-hook (lambda () (interferior-slime-mode t)))

(define-key slime-mode-map "\C-cx" 'slime-selector)
(define-key slime-mode-map "\C-ci" 'slime-inspect)

(define-key lisp-mode-map "C-c e b" 'do-eval-buffer)
(define-key lisp-mode-map "C-c e e" 'toggle-debug-on-error)
(define-key lisp-mode-map "C-c e f" 'emacs-lisp-byte-compile-and-load)
(define-key lisp-mode-map "C-c e s" 'scratch)
(define-key lisp-mode-map "C-h e f" 'find-function)
(define-key lisp-mode-map "C-h e l" 'find-library)
(define-key lisp-mode-map "C-h e v" 'find-variable)
(define-key lisp-mode-map "C-c C-r" 'eval-region)
