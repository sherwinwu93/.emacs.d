;; ~/.emacs.d/init.el
;; ----------------------------------------project
(use-package projectile
  :config
  ;; 把它的缓存挪到 ~/.emacs.d/.cache/ 文件夹下，让 gitignore 好做
  (setq projectile-cache-file (expand-file-name ".cache/projectile.cache" user-emacs-directory))
  ;; 全局 enable 这个 minor mode
  (projectile-mode 1)
  )
(evil-leader/set-key "p" 'projectile-command-map)
;; --------------------search

;; ----------------------------------------neotree
(use-package neotree
 )
;; (global-set-key (kbd "s-p") 'neotree-toggle)
(defun neotree-doc()
  (interactive)
  (find-file "~/.emacs.d/lisp/neotree.org"))

(provide 'init-project)
