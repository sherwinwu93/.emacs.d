;; ~/.emacs.d/init.el
;; ----------------------------------------project
(use-package projectile
  :config
  ;; 把它的缓存挪到 ~/.emacs.d/.cache/ 文件夹下，让 gitignore 好做
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  ;; 全局 enable 这个 minor mode
  (projectile-mode 1)
  (evil-leader/set-key "p" 'projectile-command-map)
  )
(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))

;; ----------------------------------------neotree
(use-package neotree
  :bind (("M-`" . neotree-toggle))
  )

(provide 'init-project)
