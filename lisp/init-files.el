;; ----------------------------------------file
;; 更改默认目录
(setq default-directory "~/notes/")
;; 自动同步硬盘文件
(global-auto-revert-mode 1)
;; --------------------auto save
;; 自动保存
(use-package auto-save
  :load-path "~/.emacs.d/lisp/extensions/auto-save.el"
  :init
  ;; 关闭生成init.el~文件
  (setq make-backup-files nil)
  ;; 关闭auto-save目录的文件
  (setq auto-save-default nil)
  ;; quietly save
  (setq auto-save-silent t)   
  (setq auto-save-disable-predicates
	      '((lambda ()
	          (string-suffix-p
	           "gpg"
	           (file-name-extension (buffer-name)) t))))
  :config
  (auto-save-enable))

;; --------------------recentf
(use-package recentf
  :init
  (setq recentf-max-menu-item 10)
  :config
  (recentf-mode 1)
  )


;; ----------------------------------------buffer


;; ----------------------------------------window
(use-package window-numbering
  :config
  (window-numbering-mode 1)
  )
;; 绘制弹窗
(use-package popwin
  :config
  (popwin-mode 1)
  )

;; 设置dired-mode只有一个buffer
;; (put 'dired-find-alternate-file 'disabled nil)
;; (with-eval-after-load 'dired
;;   (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(defun split-window-right-and-focus()
  (interactive)
  (split-window-right)
  (other-window 1))
(defun split-window-below-and-focus()
  (interactive)
  (split-window-below)
  (other-window 1))
;; ----------------------------------------frames




(provide 'init-files)
