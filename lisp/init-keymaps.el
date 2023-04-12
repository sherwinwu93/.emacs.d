(defun init-keymaps-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-keymaps.el"))
(general-create-definer wusd/leader-def
  :states '(normal insert visual emacs motion)
  :keymaps 'override
  :prefix "SPC"
  :global-prefix "M-SPC"
  :prefix-command 'tyrant-prefix-command
  :prefix-map 'tyrant-prefix-map)
(wusd/leader-def "q" '(:wk "quit"))

(wusd/leader-def "f" '(:wk "file"))
(wusd/leader-def "fe" '(:wk "dotfile"))
(wusd/leader-def "b" '(:wk "buffer"))
(wusd/leader-def "w" '(:wk "window"))

(wusd/leader-def "g" '(:wk "git"))
(wusd/leader-def "p" '(:wk "project"))

(general-create-definer wusd/mode-leader-def
  :states '(normal motion emacs)
  :prefix ",")


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
(general-define-key "<escape>" 'minibuffer-keyboard-quit)
;; ----------------------------------------navigation
(define-key my-mode-map (kbd "C-f") 'scroll-up-command)
(define-key my-mode-map (kbd "C-b") 'scroll-down-command)
(wusd/leader-def "jj" 'avy-goto-line)
(wusd/leader-def "jk" 'avy-goto-char-timer)
;; ----------------------------------------Command
(define-key global-map (kbd "s-e") 'wusd/eval-last-sexp)
;; ----------------------------------------emacs
(wusd/leader-def "qq" 'save-buffers-kill-terminal)
(wusd/leader-def "qr" 'restart-emacs)

;; ------------------------------------------------------------files
;; ----------------------------------------file
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
(wusd/leader-def "bh" 'dashboard-open)
;; ----------------------------------------window
(wusd/leader-def "wo" 'other-window)
(wusd/leader-def "<tab>" 'other-window)
(define-key global-map (kbd "s-d") 'delete-window)
(wusd/leader-def "wd" 'delete-window)
(wusd/leader-def "wm" 'delete-other-windows)
(wusd/leader-def "we" 'split-window-right-and-focus)
(wusd/leader-def "ws" 'split-window-below-and-focus)
;; 配合evil-repeat重复做使用
(wusd/leader-def "-" 'shrink-window)
(wusd/leader-def "=" 'enlarge-window)
(wusd/leader-def "[" 'shrink-window-horizontally)
(wusd/leader-def "]" 'enlarge-window-horizontally)
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
(wusd/mode-leader-def  with-editor-mode-map ","  'with-editor-finish)
;; ------------------------------------------------------------macros
(define-key global-map (kbd "<f5>")  'name-last-kbd-macro)
(define-key global-map (kbd "<f6>")  'insert-kbd-macro)
;; ------------------------------------------------------------org
(define-key global-map (kbd "<f9>")  'wusd/org-agenda)
(define-key global-map (kbd "<f10>")  'wusd/org-capture)
(wusd/mode-leader-def :keymaps 'org-mode-map "c" 'org-capture)
;; ----------------------------------------org-agenda
(general-def 'emacs org-agenda-mode-map "j" 'org-agenda-next-line)
(general-def 'emacs org-agenda-mode-map "k" 'org-agenda-previous-line)
(wusd/mode-leader-def org-agenda-mode-map "d"  '(:wk "date"))
(wusd/mode-leader-def org-agenda-mode-map "ds"  'org-agenda-schedule)
(wusd/mode-leader-def org-agenda-mode-map "dd"  'org-agenda-deadline)
(wusd/mode-leader-def org-agenda-mode-map "c"  'org-agenda-capture)

(wusd/mode-leader-def org-capture-mode-map ","  'org-capture-finalize)
(wusd/mode-leader-def org-capture-mode-map "c"  'org-capture-finalize)
(wusd/mode-leader-def org-capture-mode-map "k"  'org-capture-kill)

;; ------------------------------------------------------------shell
;; ------------------------------------------------------------translate
(define-key global-map (kbd "<f7>")  'youdao-dictionary-search-at-point)
(define-key global-map (kbd "<f8>")  'youdao-dictionary-search-at-point+)
;; ------------------------------------------------------------vc
(wusd/leader-def "g" 'magit)
(general-def 'emacs magit-mode-map "j" 'evil-next-line)
(general-def 'emacs magit-mode-map "k" 'evil-previous-line)
;; ------------------------------------------------------------scheme
;; ------------------------------------------------------------help
(define-key global-map (kbd "<f11>")  'describe-mode)
(define-key global-map (kbd "<f12>")  'describe-key)
(define-key global-map (kbd "C-h f")  'counsel-describe-function)
(define-key global-map (kbd "C-h v")  'counsel-describe-variable)
(define-key global-map (kbd "C-h o")  'counsel-describe-symbol)
(define-key global-map (kbd "C-h l")  'counsel-find-library)

(provide 'init-keymaps)
