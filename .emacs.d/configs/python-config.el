;(epy-setup-checker "pyflakes %f")
(epy-setup-checker "epylint %f --rcfile=~/.emacs.d/configs/pylint.rc | grep -v 'Class has no __init__ method' | grep -v '_ is not callable'")

(add-hook 'python-mode-hook '(lambda ()
	(add-hook 'before-save-hook 'delete-trailing-whitespace)
	(setq imenu-create-index-function 'python-imenu-create-index)
        (outline-minor-mode)
	    (global-set-key [f10] 'flymake-goto-prev-error)
	    (global-set-key [f11] 'flymake-goto-next-error)
	    (define-key python-mode-map (kbd "C-c <right>") 'balle-python-shift-right)
	    (define-key python-mode-map (kbd "C-c <left>") 'balle-python-shift-left)
	    (define-key python-mode-map "\C-co" 'balle-show-python-functions)
	    (define-key python-mode-map "\C-cd" 'rope-show-calltip)
	    (define-key python-mode-map "\C-ci" 'rope-auto-import)
	    (define-key python-mode-map "\C-ff" 'python-fill-paragraph-function)
	    (setq ropemacs-autoimport-modules '("os.*" "shutil.*" "string.*" "sys.*" "logging" "logging.*" "urllib" "urllib2" "django.*" "piston.*"))
))
