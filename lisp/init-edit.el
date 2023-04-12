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
                                 :size 15))))
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
;; Create a variable for our preferred tab width
(setq custom-tab-width 2)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Hooks to Enable Tabs
(add-hook 'prog-mode-hook 'enable-tabs)
;; Hooks to Disable Tabs
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)

;; Language-Specific Tweaks
(setq-default python-indent-offset custom-tab-width) ;; Python
(setq-default js-indent-level custom-tab-width) ;; Javascript

;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; (OPTIONAL) Shift width for evil-mode users
;; For the vim-like motions of ">>" and "<<".
(setq-default evil-shift-width custom-tab-width)

;; WARNING: This will change your life
;; (OPTIONAL) Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
;;(setq whitespace-style '(face tabs tab-mark trailing))
;;(custom-set-faces
;; '(whitespace-tab ((t (:foreground "#636363")))))
;;(setq whitespace-display-mappings
;;      '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '|'
;;(global-whitespace-mode) ; Enable whitespace mode everywhere

;; ----------------------------------------Abbreviation
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/abbrev_defs")
;; ----------------------------------------Flyspell
(flyspell-mode t)

(provide 'init-edit)
