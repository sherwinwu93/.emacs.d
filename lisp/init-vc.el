(use-package magit)
(evil-leader/set-key
  "g" 'magit)

(defun vc-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-vc.el"))

(provide 'init-vc)
