(use-package evil
  :config
  (evil-mode 1)
  ;; 清空evil insert模式的map,使用默认
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
  )
(use-package evil-leader
  :config
  ;; 激活evil的leaderKey
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  )

(provide 'init-evil)
