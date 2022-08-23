;; ----------------------------------------其他
(use-package which-key
  :config
  (which-key-mode 1))
;; 关闭按键提示功能
(setq suggest-key-bindings nil)
;; yes no -> y n
(fset 'yes-or-no-p 'y-or-n-p)
;; ----------------------------------------系统级按键
;; (global-set-key (kbd "<escape>")  'keyboard-escape-quit)
;; 把Capslock改为C-g键
(define-key key-translation-map (kbd "<f10>") (kbd "C-g"))
(global-set-key (kbd "<f10>") 'keyboard-escape-quit)

;; 改键<menu>为modifier
(global-set-key (kbd "<menu>") nil)
(define-key key-translation-map (kbd "<menu>") 'event-apply-super-modifier)
;; --------------------Ctrl
(define-key key-translation-map (kbd "<SPC> x") (kbd "C-x"))
(define-key key-translation-map (kbd "<SPC> c") (kbd "C-c"))
(define-key key-translation-map (kbd "<f12>") (kbd "C-h"))
;; --------------------方向
(define-key key-translation-map (kbd "C-k") (kbd "<up>"))
(define-key key-translation-map (kbd "C-j") (kbd "<down>"))
(define-key key-translation-map (kbd "C-h") (kbd "<left>"))
(define-key key-translation-map (kbd "C-l") (kbd "<right>"))

;; ----------------------------------------Commmand
;; 显示最新调用的命令
(use-package amx
  :ensure t
  :init (amx-mode 1))
;; 移动到最后并执行代码
(global-set-key (kbd "<f5>") (lambda()
			       (interactive)
			       (execute-kbd-macro (kbd "<escape>"))
			       (execute-kbd-macro (kbd "A"))
			       (execute-kbd-macro (kbd "C-x C-e"))
			       (execute-kbd-macro (kbd "<escape>"))))

;; ----------------------------------------Emacs画面
;; 设置Emacs默认全屏
;; (setq initial-frame-alist '((fullscreen . maximized)))
;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭菜单栏
(menu-bar-mode -1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
;; (add-to-list 'default-frame-alist '(width . 110))
;; (add-to-list 'default-frame-alist '(height . 45))
(use-package dashboard
  :ensure t
  :config
  ;; 个性签名，随读者喜好设置
  (setq dashboard-banner-logo-title "Wusd, welcome to Emacs!")
  ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-projects-backend 'projectile)
  ;; 也可以自定义图片
  (setq dashboard-startup-banner 'official)
  (setq dashboard-items '(
			  ;; 显示多少个最近书签
			  (bookmarks . 10)
			  ;; 显示多少个最近文件
			  (recents  . 5)
			  ;; 显示多少个最近项目
			  (projects . 5)))
  (dashboard-setup-startup-hook))
(use-package good-scroll
  :init (good-scroll-mode))

;; ----------------------------------------主题
(use-package monokai-theme
  :load-path "~/.emacs.d/lisp/extensions/monokai-theme.el"
  :config
  (load-theme 'monokai 1))



(provide 'init-better-defaults)
