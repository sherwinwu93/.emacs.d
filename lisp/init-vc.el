(use-package magit
  :config
  :bind (
	:map magit-mode-map
	("<escape>" . magit-mode-bury-buffer))
  )
(evil-leader/set-key
    "g" 'magit)

(provide 'init-vc)
