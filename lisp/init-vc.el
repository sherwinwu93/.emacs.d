(use-package magit
  :config
  (evil-leader/set-key
    "g" 'magit)
  :bind (
	:map magit-mode-map
	("<escape>" . magit-mode-bury-buffer))
  )

(provide 'init-vc)
