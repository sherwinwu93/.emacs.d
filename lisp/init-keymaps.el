(defun init-keymaps-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-keymaps.el"))
(setq-default general-non-normal-states '(insert replace hybrid iedit-insert))
(general-create-definer wusd/leader-def
  ;; 表示生效的state
  :states '(normal insert visual emacs motion)
  :keymaps 'override
  ;; states && !general-non-normal-states
  :prefix "SPC"
  ;; states && general-non-normal-states
  ;; :non-normal-prefix ""
  ;; states
  :global-prefix "M-SPC"
  ) 

(general-create-definer wusd/local-leader-def
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
(general-def 'override "C-." 'evil-repeat)
;; ----------------------------------------emacs
(wusd/leader-def "q" '(:wk "quit"))
(wusd/leader-def "qq" 'save-buffers-kill-terminal)
(wusd/leader-def "qr" 'restart-emacs)

;; ------------------------------------------------------------files
;; ----------------------------------------file
(wusd/leader-def "f" '(:wk "file"))
(wusd/leader-def "ff" 'counsel-find-file)
(wusd/leader-def "fs" 'save-buffer)
(wusd/leader-def "fr" 'recentf-open-files)
(wusd/leader-def "d" 'dired-jump)
;; --------------------dotfile
(wusd/leader-def "fe" '(:wk "dotfile"))
(wusd/leader-def "fed" 'init-keymaps-file)
(wusd/leader-def "fee" 'init-file)
(wusd/leader-def "fer" 'load-init-file)
;; ----------------------------------------buffer
(wusd/leader-def "b" '(:wk "buffer"))
(wusd/leader-def "bb" 'switch-to-buffer)
(wusd/leader-def "bk" 'kill-buffer)
(wusd/leader-def "bh" (lambda()
                        (interactive)
                        (dashboard-open)
                        (evil-emacs-state)))
;; ----------------------------------------window
(define-key global-map (kbd "s-d") 'delete-window)
(wusd/leader-def
  "w" '(:wk "window")
  "wo" 'other-window
  "<tab>" 'other-window
  "wd" 'delete-window
  "wm" 'toggle-windows-split
  "we" 'split-window-right-and-focus
  "ws" 'split-window-below-and-focus
  ;; 配合evil-repeat重复做使用
  "-" 'shrink-window
  "=" 'enlarge-window
  "[" 'shrink-window-horizontally
  "]" 'enlarge-window-horizontally
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3
  "4" 'select-window-4
  "5" 'select-window-5
  )

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
  "p" '(projectile-command-map :wk "project")
  "ps" 'projectile-grep)
;; ------------------------------------------------------------code
(define-key global-map (kbd "C-M-l") 'indent-region-or-buffer)
(wusd/leader-def ";" 'evilnc-comment-or-uncomment-lines)
(wusd/local-leader-def  with-editor-mode-map
  ","  'with-editor-finish
  "k"  'with-editor-cancel)
;; ------------------------------------------------------------macros
(define-key global-map (kbd "<f5>")  'name-last-kbd-macro)
(define-key global-map (kbd "<f6>")  'insert-kbd-macro)
;; ------------------------------------------------------------org
(define-key global-map (kbd "<f9>")  'wusd/org-agenda)
(define-key global-map (kbd "<f10>")  'wusd/org-capture)
(wusd/leader-def "o" 'wusd/org-agenda)
(wusd/local-leader-def :keymaps 'org-mode-map
  "c" 'org-capture
  "," 'org-ctrl-c-ctrl-c)
;; ----------------------------------------org-agenda
(general-def :states 'emacs :keymaps 'org-agenda-mode-map
  "j" 'org-agenda-next-line
  "k" 'org-agenda-previous-line)
(wusd/local-leader-def :keymaps 'org-agenda-mode-map
  "d"  '(:wk "date")
  "ds"  'org-agenda-schedule
  "dd"  'org-agenda-deadline
  "c"  'org-agenda-capture)

;; ----------------------------------------org-capture
(wusd/local-leader-def :keymaps 'org-capture-mode-map
  ","  'org-capture-finalize
  "k"  'org-capture-kill)

;; ------------------------------------------------------------shell
;; ------------------------------------------------------------translate
(define-key global-map (kbd "<f7>")  'youdao-dictionary-search-at-point)
(define-key global-map (kbd "<f8>")  'youdao-dictionary-search-at-point+)
(general-def 'override "s-t" 'wusd/add-pronunciation)

;; ------------------------------------------------------------vc
(wusd/leader-def "g" 'magit)
(general-def 'emacs magit-mode-map
  "C-k" 'magit-delete-thing
  "j" 'evil-next-line
  "k" 'evil-previous-line)
;; ------------------------------------------------------------scheme
;; ------------------------------------------------------------help
(define-key key-translation-map (kbd "<SPC>h") (kbd "C-h"))
(define-key global-map (kbd "<f11>")  'describe-mode)
(define-key global-map (kbd "<f12>")  'describe-key)
(define-key global-map (kbd "C-h f")  'counsel-describe-function)
(define-key global-map (kbd "C-h v")  'counsel-describe-variable)
(define-key global-map (kbd "C-h o")  'counsel-describe-symbol)
(define-key global-map (kbd "C-h l")  'counsel-find-library)

(provide 'init-keymaps)
