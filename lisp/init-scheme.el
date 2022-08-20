(require 'xscheme)
(setq scheme-program-name "/usr/local/bin/mit-scheme --stack 10000")
(defun open-mit-scheme()
  (interactive)
  (execute-kbd-macro (kbd "C-x 2"))
  (execute-kbd-macro (kbd "C-x o"))
  (run-scheme "scheme --heap 512")
  (execute-kbd-macro (kbd "C-x o"))
)
(global-set-key (kbd "<f9>") 'open-mit-scheme)


(defun scheme-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-scheme.el"))

(provide 'init-scheme)
