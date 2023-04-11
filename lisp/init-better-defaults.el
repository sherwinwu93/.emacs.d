;; ----------------------------------------其他
(use-package which-key
  :config
  (which-key-mode 1))
;; 关闭按键提示功能
(setq suggest-key-bindings nil)
;; yes no -> y n
(fset 'yes-or-no-p 'y-or-n-p)

;; ----------------------------------------Commmand
;; 显示最新调用的命令
(use-package amx
  :ensure t
  :init (amx-mode 1))
;; 移动到最后并执行代码
(defun wusd/eval-last-sexp()
  (interactive)
  (execute-kbd-macro (kbd "<escape>"))
  (execute-kbd-macro (kbd "A"))
  (execute-kbd-macro (kbd "C-x C-e"))
  (execute-kbd-macro (kbd "<escape>")))


;; ----------------------------------------Emacs画面
;; 设置Emacs默认全屏
(setq initial-frame-alist '((fullscreen . maximized)))
;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;; 关闭工具栏
(tool-bar-mode -1)
;; 关闭菜单栏
(menu-bar-mode -1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
(set-frame-position (selected-frame) 800 100)
(set-frame-width (selected-frame) 110)
(set-frame-height (selected-frame) 50)
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
			  (projects . 5)
			  ;; 显示多少个最近书签
			  ;;(bookmarks . 10)
			  ;; 显示多少个最近文件
			  (recents  . 5)
			  ;; 显示多少个最近项目
			  ))
  (dashboard-setup-startup-hook))
(use-package good-scroll
  :init (good-scroll-mode))

;; ----------------------------------------主题
(use-package spacemacs-dark-theme
  :load-path "~/.emacs.d/lisp/extensions/spacemacs-dark-theme.el"
  :config
  (load-theme 'spacemacs-dark 1))

;; ----------------------------------------fonts
(when (display-graphic-p)
  (dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family "Microsoft YaHei Mono"
                                 :size 15))))


(provide 'init-better-defaults)
