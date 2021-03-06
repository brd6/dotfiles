;; utf-8
(set-language-environment "UTF-8")

;; Affiche les n° de ligne & colonne
(column-number-mode t)
(line-number-mode t)
(global-linum-mode t)

;; Affiche l'heure
(display-time-mode t)
(setq display-time-24hr-format t)
(setq displat-time-day-and-date t)

;; Desactivation du big
(setq ring-bell-function 'ignore)

;; Desactivation du splashscreen
(setq inhibit-splash-screen t)

;; Desactivation du barre de menu dans le terminal
(defun set-frame-menu-bar-lines (&optional frame)
  (let ((want-menu (display-graphic-p frame)))
    (set-frame-parameter frame 'menu-bar-lines (if want-menu 1 0))))
(add-hook 'after-make-frame-functions 'set-frame-menu-bar-lines)
(add-hook 'after-init-hook 'set-frame-menu-bar-lines)

;; Suppression des espaces en fin de ligne a l'enregistrement
(add-hook 'c++-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
(add-hook   'c-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))

; Laisser le curseur en place lors d'un defilement par pages.
(setq scroll-preserve-screen-position t)

; Complete automatiquement dans le mini-buffer
(icomplete-mode t)

; Supprime les fichiers temporaire (~)
(setq make-backup-files nil)

;; Complétion automatique
(abbrev-mode t)

;; Colorisation syntaxique maximale dans tous les modes
(require 'font-lock)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq font-lock-maximum-size nil)

;; Nice Linum
(dolist (hook '(python-mode-hook
		c-mode-common-hook
		php-mode-hook
		sh-mode-hook
		emacs-list-mode-hook))
  (add-hook hook (lambda () (linum-mode t) (setq linum-format "%3d |"))))
(setq linum-format "%3d |")
;

;; Ask y/n instead yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Featured switch-to-buffer
(iswitchb-mode t)

;; Pour changer facilement de buffer
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;; parentheses
(show-paren-mode)

;; molette souris
(mouse-wheel-mode t)

;; colonnes
(setq column-number-mode t)

;; surbrillance de la region
(setq transient-mark-mode t)

;; affiche les espaces inutile
(setq-default show-trailing-whitespace t)

;; garder l'historique du buffer
(savehist-mode 1)

; battery state
;;(display-battery-mode)
;;(setq display-time-next-load-average)

;; Linum-mode
(global-set-key (kbd "<f6>") 'linum-mode)

;;couleur en mode shell
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)

;; Whitespaces
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)

;; Show tabs and too long lines
(custom-set-faces
 '(my-tab-face ((((class color)) (:foreground "black" :weight bold :underline t))) t)
; '(my-trailing-space-face ((((class color)) (:background "gray10"))) t)
 '(my-loong-line-face ((((class color)) (:background "yellow"))) t))

(defun cc-mode-add-keywords (mode)
  (font-lock-add-keywords
   mode
   '(
     ("\t+" (0 'my-tab-face append))
     ("^.\\{81\\}\\(.+\\)$" (1 'my-loong-line-face append))))
  )

;; GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
  )

(cc-mode-add-keywords 'c-mode)
(cc-mode-add-keywords 'php-mode)
(cc-mode-add-keywords 'sh-mode)
(cc-mode-add-keywords 'python-mode)
(cc-mode-add-keywords 'perl-mode)
(cc-mode-add-keywords 'c++-mode)
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; auto complete
;(ac-config-default)

(provide 'init-default)
