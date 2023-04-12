;; ----------------------------------------org-mode
(add-hook 'org-mode-hook (lambda()
                           ;; (org-indent-mode 1)
                           ;; (hungry-delete-mode 1)
                           ;; 手动添加
                           ;; (toc-org-mode 1)
                           ))
;; ----------------------------------------agenda
(add-hook 'org-agenda-mode-hook (lambda()
                                  (turn-on-evil-mode)
                                  (evil-motion-state)))
;; 定义 agenda 文件的位置
(setq org-agenda-files '("/mnt/webdav/org/inbox.org"))
(setq org-agenda-window-setup 'only-window)

;; ----------------------------------------state
;; --------------------state
;; ! : 切换到该状态时会自动添加时间戳
;; @ : 切换到该状态时要求输入文字说明
;; 如果同时设定@和!,使用@/!
(setq org-todo-keywords '((sequence "TODO(t)" "DOING(g)" "|" "DONE(d)")
                          (sequence  "WAITING(w@)" "PROJECT(p)"  "|" "CANCELED(c@)")))
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "yellow" :weight bold)
              ("DOING" :foreground "orange" :weight bold)
	            ("WAITING" :foreground "green" :weight bold)
	            ("DONE" :foreground "forest green" :weight bold)
              ("PROJECT" :foreground "grey" :weight bold)
	            ("CANCELED" :foreground "grey" :weight bold))))
;; --------------------summary
;; 大项目state的hook
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "PROJECT"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
;; --------------------tags
(setq org-tag-alist '(("@task" . ?t)
		                  ("@work" . ?w)
		                  ("@idea" . ?i)
		                  ("@info" . ?f)
		                  ("@learn" . ?l)
		                  ("@prepare" . ?p)
                      ("TOC" . ?c)))
;; --------------------properties
(setq   org-highest-priority ?A
        org-default-priority ?B
        org-lowest-priority ?C)
;; --------------------clock
;; If task state is turned into done, it will  insert "Closed [timestamp]".
(setq org-log-done 'time)
;; Change task state to DOING when clocking in
(setq org-clock-in-switch-to-state "DOING")
;; Change task state to STARTED when clocking in
(setq org-clock-out-switch-to-state "DONE")
;; ----------------------------------------refile
(setq org-refile-targets '(
			                     ;;修复bug,不可删除
			                     (nil :maxlevel . 1)
			                     ("/mnt/webdav/finish.org" :maxlevel . 1)
			                     ("/mnt/webdav/org/inbox.org" :maxlevel . 1)
			                     ))
;; ----------------------------------------capture
(setq org-capture-templates
      '(("c" "TODO"
         entry (file "/mnt/webdav/org/inbox.org")
         "* TODO %i%?\n SCHEDULED: %t" :empty-lines 0)))

;; ----------------------------------------org-agenda-custom-commands
(setq org-agenda-custom-commands
      ;; --------------------
      '(("o" "Wusd Personal Agenda"
         ((agenda "" ((org-agenda-span 1)
                      ;; 按优先级排序
                      ;; (org-agenda-sorting-strategy '(priority-down time-up))
                      (org-deadline-warning-days 2)))
          (tags-todo "+PRIORITY=\"A\"")
          (agenda "" ((org-agenda-span 7)
                      (org-deadline-warning-days 0))))
         )))

(fset 'sync-inbox
      (kmacro-lambda-form [?\s-o ?\C-x ?k ?i ?n ?b ?o ?x ?. ?o ?r ?g return ?\M-m ?! ?s ?y ?n ?c ?  ?/ ?m ?n ?t ?/ ?w ?e ?b ?d ?a ?v ?/ ?o ?r ?g ?/ ?i ?n ?b ?o ?x ?. ?o ?r ?g return] 0 "%d"))
(fset 'wusd/org-capture
      (kmacro-lambda-form [?\M-x ?o ?r ?g ?- ?c ?a ?p ?t ?u ?r ?e return ?c] 0 "%d"))
(fset 'wusd/org-agenda
      (kmacro-lambda-form [?\M-x ?o ?r ?g ?- ?a ?g ?e ?n ?d ?a return ?o] 0 "%d"))

(defun inbox-file()
  (interactive)
  (find-file "/mnt/webdav/org/inbox.org"))


(provide 'init-org)
