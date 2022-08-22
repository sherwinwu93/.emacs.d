
;; ----------------------------------------package-archives
(require 'package)
(package-initialize)
;;(setq package-archives '(
;;			 ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;			 ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")
;;			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
;;			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
;;			 ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
;;			 ;;("nongnu" . "http://elpa.zilongshanren.com/nongnu/")
;;			 ))
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "http://mirrors.ustc.edu.cn/elpa/nongnu/")))			 
;;(setq package-archives '(("melpa"        . "https://melpa.org/packages/")
;;                         ("melpa-stable" . "https://stable.melpa.org/packages/")
;;                         ("org"          . "https://orgmode.org/elpa/")
;;                         ("gnu"          . "https://elpa.gnu.org/packages/")
;;                         ("nongnu"       . "https://elpa.nongnu.org/nongnu/")))			 
	 
			 
;;; 这个配置一定要配置在 use-package 的初始化之前，否则无法正常安装
(assq-delete-all 'org package--builtins)
(assq-delete-all 'org package--builtin-versions)

;; ----------------------------------------use-package
;; 如果 use-package 没安装
(unless (package-installed-p 'use-package)
  ;; 更新本地缓存
  (package-refresh-contents)
  ;; 之后安装它。use-package 应该是你配置中唯一一个需要这样安装的包。
  (package-install 'use-package))

(require 'use-package)
;; 让 use-package 永远按需安装软件包
(setq use-package-always-ensure t)

(provide 'init-packages)
