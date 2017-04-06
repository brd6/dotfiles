;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "std.el")
(load "std_comment.el")
;;;(load "tuareg-site-file.el")
(if (file-exists-p "~/.myemacs") 
    (load-file "~/.myemacs"))

 (put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("40c66989886b3f05b0c4f80952f128c6c4600f85b1f0996caa1fa1479e20c082" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "9ab634dcc9131f79016c96c4955298409649f6538908c743a8a9d2c6bc8321ef" default)))
 '(ede-project-directories (quote ("/home/bongol_b/tmp/dante/astar" "/home/bongol_b"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(my-loong-line-face ((((class color)) (:background "yellow"))) t)
 '(my-tab-face ((((class color)) (:foreground "black" :weight bold :underline t))) t))
