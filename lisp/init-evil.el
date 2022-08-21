(use-package evil
  ;; 清空evil insert模式的map,使用默认
  :init (setcdr evil-insert-state-map nil)
  :config
  (evil-mode 1)
  :bind (
	 :map evil-insert-state-map
	 ("<escape>" . evil-normal-state))
  )
(use-package evil-leader
  :config
  ;; 激活evil的leaderKey
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  )

(provide 'init-evil)
