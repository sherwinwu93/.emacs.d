(defun init-evil-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-evil.el"))
(use-package evil
  :config
  (evil-mode 1)
  )
(add-hook 'dashboard-mode-hook (lambda() (evil-motion-state)))
;; 解决rime被--insert--遮挡的问题
(setq evil-insert-state-message nil)

(use-package general)


(provide 'init-evil)
