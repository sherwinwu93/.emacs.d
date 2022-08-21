;; 输入法的中文字体
(use-package cnfonts)
;; 输入法的显示框
(use-package posframe)
;; 之后就可以使用它了。
;; 要使用简体中文，记得修改defualt.yml
(use-package rime
  :init
  ;; 输入法显示框
  (setq rime-show-candidate 'posframe)
  :custom
  (default-input-method "rime")
  :bind
  (:map rime-active-mode-map
	("<tab>" . 'rime-inline-ascii)
	:map rime-mode-map
	("C-`" . 'rime-send-keybinding)    ;; <----
	("M-j" . 'rime-force-enable))
  )

(provide 'init-input)
