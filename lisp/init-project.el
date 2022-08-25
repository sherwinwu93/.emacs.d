;; ~/.emacs.d/init.el
;; ----------------------------------------project
(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile")
  )

(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))
(evil-leader/set-key "p" 'projectile-command-map)

;; ----------------------------------------neotree
(use-package neotree
  :bind (("M-`" . neotree-toggle))
  )

(provide 'init-project)
