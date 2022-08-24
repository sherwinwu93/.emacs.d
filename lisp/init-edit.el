
;; ----------------------------------------Display
;; 光标
(setq-default cursor-type 'bar)
;; 高亮当前行
(global-hl-line-mode 1)
;; 显示相对行号
(global-display-line-numbers-mode 1)
(setq-default display-line-numbers-type 'relative)

;; ----------------------------------------Search
;; --------------------Search
;; 补全系统
(use-package ivy
  :init
  :config
  (ivy-mode 1)
  )
;; 搜索功能  
(use-package swiper
  :bind
  (("C-s" . 'swiper)))
;; 常用命令
(use-package counsel
  :config
  (counsel-mode 1)
  :bind (("C-h f" . counsel-describe-function)
	 ("C-h v" . counsel-describe-variable)
	 ("C-h o" . counsel-describe-symbol)
	 ("C-h l" . counsel-find-library))
  )
(use-package avy
  :ensure t
  :config
  (evil-leader/set-key
    "s" 'avy-goto-char-2
    ;; 跳line
    "f" 'avy-goto-line
    ))
;; --------------------Replace
(global-set-key (kbd "s-s") 'query-replace)

;; ----------------------------------------edit
(evil-leader/set-key
  "j" 'scroll-other-window
  "k" 'scroll-other-window-down
  "l" 'recenter-top-bottom)
;; 设置自动换行字数
(setq-default fill-column 1024)
;; 临时标记模式
(setq-default transient-mark-mode nil)
;;选中输入时,替换而不是增加
(delete-selection-mode 1)
;; 关闭缩进
;; (electric-indent-mode -1)
;; --------------------兼容windows编码
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq system-time-locale "C")
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(setq default-buffer-file-coding-system 'utf-8-unix)
;; --------------------Font
;; 字体大小
;;(set-face-attribute 'default nil :height 105)
;; 字体行间距
(setq-default line-spacing 0.2)
;; undo
(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode 1)
  :config
  (define-key evil-normal-state-map
    "u" 'undo-tree-undo
    )
  )
;; --------------------CUDA
;;对应Windows上面的Ctrl-a 全选
(global-set-key (kbd "s-a") 'mark-whole-buffer)
;;对应Windows上面的Ctrl-c 复制
(global-set-key (kbd "s-c") 'kill-ring-save)
;; 对应Windows上面的Ctrl-s 保存
;; (global-set-key (kbd "s-s") 'save-buffer)
;;对应Windows上面的Ctrl-v 粘贴
(global-set-key (kbd "s-v") 'yank)
;;对应Windows上面的Ctrol-z 撤销
(global-set-key (kbd "s-z") 'undo)
;;对应Windows上面的Ctrol-x 剪切
(global-set-key (kbd "s-x") 'kill-region)
;; --------------------多光标操作

;; ----------------------------------------Abbreviation
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/abbrev_defs")
;; ----------------------------------------Flyspell
(flyspell-mode t)

(provide 'init-edit)
