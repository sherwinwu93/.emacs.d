;;; 所有快捷键
;; ------------------------------------------------------------evil
;; 清空evil insert模式的map,使用默认
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
;; leader key
(evil-leader/set-leader "<SPC>")
;; ------------------------------------------------------------input
(define-key rime-active-mode-map (kbd "<tab>") 'rime-inline-ascii)
(define-key rime-mode-map (kbd "C-`") 'rime-send-keybinding)
(define-key rime-mode-map (kbd "M-j") 'rime-force-enable)
;; ------------------------------------------------------------better-defaults
;; ----------------------------------------系统级按键
;; 先sharpKey改Capslock键, 把Capslock改为C-g键
(define-key key-translation-map (kbd "<f10>") (kbd "C-g"))
(define-key global-map (kbd "<f10>") 'keyboard-escape-quit)
(define-key key-translation-map (kbd "<f12>") (kbd "C-h"))
;; 改键<menu>为modifier
(define-key global-map (kbd "<menu>") nil)
(define-key key-translation-map (kbd "<menu>") 'event-apply-super-modifier)
;; --------------------Ctrl
(define-key key-translation-map (kbd "<SPC> x") (kbd "C-x"))
(define-key key-translation-map (kbd "<SPC> c") (kbd "C-c"))
(define-key key-translation-map (kbd "<SPC> h") (kbd "C-h"))
;; --------------------方向
;; 都不要了,直接用方向键,保护手指
;; (define-key key-translation-map (kbd "C-k") (kbd "<up>"))
;; (define-key key-translation-map (kbd "C-j") (kbd "<down>"))
;; (define-key key-translation-map (kbd "C-h") (kbd "<left>"))
;; (define-key key-translation-map (kbd "C-l") (kbd "<right>"))
(define-key global-map (kbd "C-f") 'scroll-up-command)
(define-key global-map (kbd "C-b") 'scroll-down-command)
;; ----------------------------------------Command
(define-key global-map (kbd "<f5>") 'wusd/eval-last-sexp)
;; ------------------------------------------------------------files
(define-key global-map (kbd "s-f") 'counsel-find-file)
(define-key global-map (kbd "s-d") 'dired-jump)
(evil-leader/set-key
  "f" 'find-file
  "d" 'dired-jump
  "<SPC>" 'switch-to-buffer
  "r" 'recentf-open-files
  ;; view
  "bb" 'ivy-switch-view
  "bs" 'wusd/ivy-push-view
  "bd" 'wusd/ivy-pop-view
  ;; jump
  "j" 'avy-goto-char-2
  "k" 'avy-goto-line
  "l" 'recenter-top-bottom
  ;; windows
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  "o" 'other-window
  "-" 'shrink-window
  "=" 'enlarge-window
  "[" 'shrink-window-horizontally
  "]" 'enlarge-window-horizontally
  "w0" 'delete-window
  "w1" 'delete-other-windows
  "w2" 'split-window-below
  "w3" 'split-window-right
  "5o" 'other-frame
  "5f" 'find-file-other-frame
  )
;; ------------------------------------------------------------edit
(define-key global-map (kbd "C-s")  'swiper)
(define-key global-map (kbd "s-s") 'query-replace)
(define-key global-map (kbd "C-h f")  'counsel-describe-function)
(define-key global-map (kbd "C-h v")  'counsel-describe-variable)
(define-key global-map (kbd "C-h o")  'counsel-describe-symbol)
(define-key global-map (kbd "C-h l")  'counsel-find-library)
;; --------------------CUDA
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
(evil-leader/set-key
  "p" 'projectile-command-map
  "ps" 'projectile-grep
  )
;; ------------------------------------------------------------code
(define-key global-map (kbd "C-M-l") 'indent-region-or-buffer)
(evil-leader/set-key ";" 'evilnc-comment-or-uncomment-lines)
;; ------------------------------------------------------------macros
(evil-leader/set-key
  "mn" 'name-last-kbd-macro
  "mo" 'macros-file
  "mi" 'insert-kbd-macro
  )
;; ------------------------------------------------------------org
(define-key org-mode-map (kbd "M-l") 'awesome-tab-forward-tab)
(define-key org-mode-map (kbd "M-h") 'awesome-tab-backward-tab)
(define-key org-mode-map (kbd "M-\\") 'awesome-tab-kill-other-buffers-in-current-group)
(define-key org-mode-map (kbd "<tab>") 'insert-two-spaces)
(evil-leader/set-key
  "ap" 'org-ctrl-c-ctrl-c
  "at" 'org-todo
  "ad" 'org-deadline
  "as" 'org-schedule
  "aa" 'org-agenda
  "ac" 'org-capture
  "ar" 'org-refile
  )
;; ------------------------------------------------------------shell
(evil-leader/set-key "'" 'shell)
;; ------------------------------------------------------------translate
(evil-leader/set-key
  "t" 'youdao-dictionary-search-at-point+
  "y" 'youdao-dictionary-search-at-point
  )
;; ------------------------------------------------------------vc
(define-key magit-mode-map (kbd "<escape>") 'magit-mode-bury-buffer)
(evil-leader/set-key "g" 'magit)
;; ------------------------------------------------------------scheme
(define-key global-map (kbd "<f9>") 'open-mit-scheme)

(provide 'init-key-maps)
