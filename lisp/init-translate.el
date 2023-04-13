(use-package youdao-dictionary
  :init
  (setq url-automatic-caching t)
  )

(fset 'wusd/add-pronunciation
   (kmacro-lambda-form [escape ?j ?0 ?v ?e f7 ?  tab ?y ?$ ?  tab ?p] 0 "%d"))









(provide 'init-translate)
