(use-package cnfonts)
(use-package posframe)
;; 之后就可以使用它了。
;; 要使用简体中文，记得修改defualt.yml
(use-package rime
  :custom
  (default-input-method "rime")
 :bind
  (:map rime-active-mode-map
   ("<tab>" . 'rime-inline-ascii)
   :map rime-mode-map
   ("C-`" . 'rime-send-keybinding)    ;; <----
   ("M-j" . 'rime-force-enable))
)
(setq rime-show-candidate 'posframe)

(defun input-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-input.el"))

(provide 'init-input)
