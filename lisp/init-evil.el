(defun init-evil-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-evil.el"))
(use-package evil
  :config
  (evil-mode 1)
  )
;; 解决rime被--insert--遮挡的问题
(setq evil-insert-state-message nil)

(use-package general)

(general-create-definer wusd/leader-def
  :states '(normal insert visual emacs)
  :keymaps 'override
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  :prefix-command 'tyrant-prefix-command
  :prefix-map 'tyrant-prefix-map)
(wusd/leader-def "q" '(:wk "quit"))

(wusd/leader-def "f" '(:wk "file"))
(wusd/leader-def "fe" '(:wk "dotfile"))
(wusd/leader-def "b" '(:wk "buffer"))
(wusd/leader-def "w" '(:wk "window"))

(wusd/leader-def "g" '(:wk "git"))
(wusd/leader-def "p" '(:wk "project"))

(general-create-definer wusd/mode-leader-def
  :states '(normal insert visual emacs)
  :keymaps 'override
  :prefix ","
  :non-normal-prefix "M-,")

(wusd/mode-leader-def :keymaps 'org-mode-map "c" 'org-capture)

(provide 'init-evil)
