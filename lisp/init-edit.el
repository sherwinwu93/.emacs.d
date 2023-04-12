;; ----------------------------------------Search and Replace
;; --------------------Search
;; 补全系统
(use-package ivy
  :config (ivy-mode 1)
  )
;; 搜索功能  
(use-package swiper)
;; 常用命令
(use-package counsel
  :config (counsel-mode 1))
(use-package avy
  :ensure t
  )
;; --------------------Replace

;; ----------------------------------------edit
;;选中输入时,替换而不是增加
(delete-selection-mode 1)
;; --------------------兼容windows编码
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq system-time-locale "C")
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(setq default-buffer-file-coding-system 'utf-8-unix)
;; --------------------fonts
(when (display-graphic-p)
  (dolist (charset '(kana han cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family "Microsoft YaHei Mono"
                                 :size 16))))
;; 字体行间距
(setq-default line-spacing 0.2)
;; --------------------CUDA
;; undo
(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode 1)
  :config
  (define-key evil-normal-state-map
    "u" 'undo-tree-undo)
  )
;; --------------------indent
;; 用制表符代替空格
(setq custom-tab-width 2)
;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs ()
	(define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
	(define-key global-map (kbd "TAB") 'tab-to-tab-stop)
	(setq indent-tabs-mode t)
	(setq tab-width custom-tab-width))
(add-hook 'prog-mode-hook 'enable-tabs)
(add-hook 'text-mode-hook 'enable-tabs)
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)

;; (defun my-setup-indent (n)
;;   ;; java/c/c++
;;   (setq c-basic-offset n)
;;   ;; web development
;;   (setq coffee-tab-width n) ; coffeescript
;;   (setq javascript-indent-level n) ; javascript-mode
;;   (setq js-indent-level n) ; js-mode
;;   (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
;;   (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
;;   (setq web-mode-css-indent-offset n) ; web-mode, css in html file
;;   (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
;;   (setq css-indent-offset n) ; css-mode
;;   )
;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)
(setq-default backward-delete-char-untabify-method 'hungry)

;; (setq-default python-indent-offset custom-tab-width) ;; Python
(setq-default evil-shift-width custom-tab-width)
;; --------------------web relation
;; (setq-default web-mode-markup-indent-offset custom-tab-width) ; web-mode, html tag in html file
;; (setq-default web-mode-css-indent-offset custom-tab-width) ; web-mode, css in html file
;; (setq-default web-mode-code-indent-offset custom-tab-width) ; web-mode, js code in html file
;; (setq-default css-indent-offset custom-tab-width) ; css-mode
;; (setq-default js-indent-level custom-tab-width) ;; Javascript
;; ----------------------------------------Abbreviation
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/abbrev_defs")
;; ----------------------------------------Flyspell
(flyspell-mode t)

(provide 'init-edit)
