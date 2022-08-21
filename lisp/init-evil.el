(use-package evil)
(use-package evil-leader)
(use-package window-numbering)
(use-package evil-surround)
(use-package evil-nerd-commenter)
(use-package which-key)
(evil-leader/set-key
  "i" 'string-insert-rectangle
  ":" 'counsel-M-x
  )
;; 激活evil的leaderKey
(global-evil-leader-mode)
;; 开启evil模式
(evil-mode 1)

(evil-leader/set-leader "<SPC>")

;; 清空evil insert模式的map,使用默认
(setcdr evil-insert-state-map nil)
;; escape
(define-key evil-normal-state-map (kbd "<escape>") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "<escape>") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "<escape>") 'evil-normal-state)
(define-key evil-motion-state-map (kbd "<escape>") 'evil-normal-state)
(define-key evil-operator-state-map (kbd "<escape>") 'evil-normal-state)


(defun evil-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-evil.el"))

(provide 'init-evil)

;; {{ specify major mode uses Evil (vim) NORMAL state or EMACS original state.
;; You may delete this setup to use Evil NORMAL state always.
;; (dolist (p '((minibuffer-inactive-mode . emacs)
;;              (calendar-mode . emacs)
;;              (special-mode . emacs)
;;              (grep-mode . emacs)
;;              (Info-mode . emacs)
;;              (term-mode . emacs)
;;              (sdcv-mode . emacs)
;;              (org-mode . normal)
;;              (anaconda-nav-mode . emacs)
;;              (log-edit-mode . emacs)
;;              (vc-log-edit-mode . emacs)
;;              (magit-log-edit-mode . emacs)
;;              (erc-mode . emacs)
;;              (neotree-mode . emacs)
;;              (w3m-mode . emacs)
;;              (gud-mode . emacs)
;;              (help-mode . emacs)
;;              (eshell-mode . emacs)
;;              (shell-mode . emacs)
;;              (xref--xref-buffer-mode . emacs)
;;              (message-mode . emacs)
;;              (epa-key-list-mode . emacs)
;;              (fundamental-mode . normal)
;;              (weibo-timeline-mode . emacs)
;;              (weibo-post-mode . emacs)
;;              (woman-mode . emacs)
;;              (sr-mode . emacs)
;;              (profiler-report-mode . emacs)
;;              (dired-mode . emacs)
;;              (compilation-mode . emacs)
;;              (speedbar-mode . emacs)
;;              (ivy-occur-mode . emacs)
;;              (ffip-file-mode . emacs)
;;              (ivy-occur-grep-mode . normal)
;;              (messages-buffer-mode . normal)
;;              (js2-error-buffer-mode . emacs)))
;;   (evil-set-initial-state (car p) (cdr p)))
;; }}
;; evil leaderKey
