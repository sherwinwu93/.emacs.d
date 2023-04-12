(defun init-keymaps-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-keymaps.el"))

;;; 所有快捷键
;; ------------------------------------------------------------evil
;; 清空evil insert模式的map,使用默认
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
;; ------------------------------------------------------------input
(define-key rime-active-mode-map (kbd "<tab>") 'rime-inline-ascii)
(define-key rime-mode-map (kbd "C-`") 'rime-send-keybinding)
(define-key rime-mode-map (kbd "M-j") 'rime-force-enable)
;; ------------------------------------------------------------better-defaults
;; ----------------------------------------系统级按键
;; C-g键改为CapsLock 由autohotkey实现
;; 改键<menu>为modifier
(define-key global-map (kbd "<menu>") nil)
(define-key key-translation-map (kbd "<menu>") 'event-apply-super-modifier)
;; --------------------Ctrl
;; (define-key key-translation-map (kbd "<SPC> x") (kbd "C-x"))
;; (define-key key-translation-map (kbd "<SPC> c") (kbd "C-c"))
;; (define-key key-translation-map (kbd "<SPC> h") (kbd "C-h"))
;; ----------------------------------------navigation
(define-key global-map (kbd "C-f") 'scroll-up-command)
(define-key global-map (kbd "C-b") 'scroll-down-command)
;; jump
;; "j" 'avy-goto-char-2
;; "k" 'avy-goto-line
;; "l" 'recenter-top-bottom
;; ----------------------------------------Command
(define-key global-map (kbd "s-e") 'wusd/eval-last-sexp)
;; ----------------------------------------emacs
(wusd/leader-def "qq" 'save-buffers-kill-terminal)

;; ------------------------------------------------------------files
;; ----------------------------------------file
(define-key global-map (kbd "s-d") 'dired-jump)
(wusd/leader-def "ff" 'counsel-find-file)
(wusd/leader-def "fs" 'save-buffer)
(wusd/leader-def "fr" 'recentf-open-files)
(wusd/leader-def "d" 'dired-jump)
;; --------------------dotfile
(wusd/leader-def "fed" 'init-file)
(wusd/leader-def "fee" 'init-evil-file)
(wusd/leader-def "fek" 'init-keymaps-file)
(wusd/leader-def "fer" 'load-init-file)
;; ----------------------------------------buffer
(wusd/leader-def "bb" 'switch-to-buffer)
(wusd/leader-def "bk" 'kill-buffer)
;; ----------------------------------------window
(wusd/leader-def "wo" 'other-window)
(wusd/leader-def "wd" 'delete-window)
(wusd/leader-def "wm" 'delete-other-windows)
;;   "w2" 'split-window-below
;;   "w3" 'split-window-right
;;   "-" 'shrink-window
;;   "=" 'enlarge-window
;;   "[" 'shrink-window-horizontally
;;   "]" 'enlarge-window-horizontally
(wusd/leader-def "1" 'select-window-1)
(wusd/leader-def "2" 'select-window-2)
(wusd/leader-def "3" 'select-window-3)
(wusd/leader-def "4" 'select-window-4)
(wusd/leader-def "5" 'select-window-5)

;; ------------------------------------------------------------edit
;; ----------------------------------------query and replace
(define-key global-map (kbd "s-f")  'swiper)
(define-key global-map (kbd "s-r") 'query-replace)
(define-key global-map (kbd "C-S-f") 'counsel-projectile-grep)
(define-key global-map (kbd "C-S-r") 'projectile-replace)
;; ----------------------------------------CUDA
;;对应Windows上面的Ctrl-a 全选
(define-key global-map (kbd "s-a") 'mark-whole-buffer)
;;对应Windows上面的Ctrl-c 复制
(define-key global-map (kbd "s-c") 'kill-ring-save)
;; 对应Windows上面的Ctrl-s 保存
;; (define-key global-map (kbd "s-s") 'save-buffer)
;;对应Windows上面的Ctrl-v 粘贴
(define-key global-map (kbd "s-v") 'yank)
;;对应Windows上面的Ctrol-z 撤销
(define-key global-map (kbd "s-z") 'undo)
;;对应Windows上面的Ctrol-x 剪切
(define-key global-map (kbd "s-x") 'kill-region)
;; ------------------------------------------------------------project
(wusd/leader-def
  "p" 'projectile-command-map
  "ps" 'projectile-grep)
;; ------------------------------------------------------------code
(define-key global-map (kbd "C-M-l") 'indent-region-or-buffer)
(wusd/leader-def ";" 'evilnc-comment-or-uncomment-lines)
;; ------------------------------------------------------------macros
(define-key global-map (kbd "<f5>")  'name-last-kbd-macro)
(define-key global-map (kbd "<f6>")  'insert-kbd-macro)
;; ------------------------------------------------------------org
(define-key global-map (kbd "<f11>")  'org-capture)
(define-key global-map (kbd "<f12>")  'org-agenda)
;; ------------------------------------------------------------shell
;; ------------------------------------------------------------translate
(define-key global-map (kbd "<f7>")  'youdao-dictionary-search-at-point)
(define-key global-map (kbd "<f8>")  'youdao-dictionary-search-at-point+)
;; ------------------------------------------------------------vc
(wusd/leader-def "gs" 'magit)
;; ------------------------------------------------------------scheme
;; ------------------------------------------------------------help
(define-key global-map (kbd "<f9>")  'describe-key)
(define-key global-map (kbd "<f10>")  'describe-mode)
(define-key global-map (kbd "C-h f")  'counsel-describe-function)
(define-key global-map (kbd "C-h v")  'counsel-describe-variable)
(define-key global-map (kbd "C-h o")  'counsel-describe-symbol)
(define-key global-map (kbd "C-h l")  'counsel-find-library)

(provide 'init-keymaps)
