;; (use-package youdao-dictionary
;;   :load-path "~/.emacs.d/lisp/extensions"
;;   :init
;;   (setq url-automatic-caching t)
;;   )

;; (fset 'wusd/add-pronunciation
;;    (kmacro-lambda-form [escape ?j ?0 ?v ?e f7 ?  tab ?y ?$ ?  tab ?p] 0 "%d"))

(use-package bing-dict
  :load-path "~/.emacs.d/lisp/extensions"
  :init
  ;; (setq bing-dict-cache-auto-save t)
  )
(defun show-dict-result-in-other-window()
  (interactive)
	(switch-to-buffer-other-window "*wusd*")
  (erase-buffer)
	(insert wusd/dict-result)
  (evil-beginning-of-line)
  (select-window-1))

(fset 'wusd/add-pronunciation
   (kmacro-lambda-form [escape f10 ?0 ?v ?e ?  tab ?v ?E ?E ?h ?y ?  tab ?p ?j ?0] 0 "%d"))
(fset 'wusd/bing-dict-brief
   (kmacro-lambda-form [f7 return] 0 "%d"))

(provide 'init-translate)







