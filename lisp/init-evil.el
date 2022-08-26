(use-package evil
  :config
  (evil-mode 1)
  )

(use-package evil-leader
  :config
  ;; 激活evil的leaderKey
  (global-evil-leader-mode)
  )

(provide 'init-evil)
