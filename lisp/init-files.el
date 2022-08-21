;; ----------------------------------------file
(global-set-key (kbd "s-d") 'dired-jump)
(global-set-key (kbd "s-f") 'counsel-find-file)
;; 更改默认目录
(setq default-directory "~/notes/")
;; 自动同步硬盘文件
(global-auto-revert-mode 1)
;; --------------------auto save
;; 自动保存
(require 'auto-save)
(auto-save-enable)
;; 关闭生成init.el~文件
(setq make-backup-files nil)
;; 关闭auto-save目录的文件
(setq auto-save-default nil)
; quietly save
(setq auto-save-silent t)   
(setq auto-save-disable-predicates
      '((lambda ()
	  (string-suffix-p
	   "gpg"
	   (file-name-extension (buffer-name)) t))))
;; --------------------recentf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(evil-leader/set-key "h" 'recentf-open-files)



;; ----------------------------------------buffer
(evil-leader/set-key
  "<SPC>" 'switch-to-buffer
  )
;; --------------------mini buffer
;; C-M-j: new immediate
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode))


;; ----------------------------------------window
;; 绘制弹窗
(use-package popwin
  :config
  (popwin-mode 1)
  )
(window-numbering-mode 1)
(evil-leader/set-key
  "o" 'other-window
  "-" 'shrink-window
  "=" 'enlarge-window
  "[" 'shrink-window-horizontally
  "]" 'enlarge-window-horizontally
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  "5" 'select-window-5
  "w0" 'delete-window
  "w1" 'delete-other-windows
  "w2" 'split-window-below
  "w3" 'split-window-right
  )

(global-set-key (kbd "s-0") 'delete-window)
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-2") 'split-window-below)
(global-set-key (kbd "s-3") 'split-window-right)
;; 设置dired-mode只有一个buffer
;; (put 'dired-find-alternate-file 'disabled nil)
;; (with-eval-after-load 'dired
;;   (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; ----------------------------------------frames





(provide 'init-files)
