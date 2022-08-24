(use-package youdao-dictionary
  :init
  (setq url-automatic-caching t)
  :config
  (evil-leader/set-key "t" 'youdao-dictionary-search-at-point+)
  (evil-leader/set-key "y" 'youdao-dictionary-search-at-point)
  )










(provide 'init-translate)
