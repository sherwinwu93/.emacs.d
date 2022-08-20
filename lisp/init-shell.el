(use-package nodejs-repl)
(use-package exec-path-from-shell)
(evil-leader/set-key "'" 'shell)

(defun shell-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-shell.el"))
(provide 'init-shell)
