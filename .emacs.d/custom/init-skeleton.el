;; .h protection header
(define-skeleton insert-protect-header
  "Inserts a define to protect the header file."
  ""
  '(setq str (file-name-sans-extension
          (file-name-nondirectory (buffer-file-name))))
  "\n"
  "#ifndef "(upcase str)"_H_\n"
  "# define "(upcase str)"_H_\n"
  "\n"
  "#endif /* !"(upcase str)"_H_ */\n")

;; C Makefile
(define-skeleton insert-cmakefile
  "Insert a default makefile."
  ""
  "\n"
  "CC	= 	gcc\n"
  "\n"
  "RM	= 	rm -f\n"
  "\n"
  "NAME	= 	a.out\n"
  "\n"
  "SRCS	= 	src/main.c \\\n"
  "\n"
  "OBJS	= 	$(SRCS:.c=.o)\n"
  "\n"
  "CFLAGS	+=	-W -Wall -Werror -pedantic\n"
  "\n"
  "CFLAGS	+=	-I./include/ -I./lib/my/include/\n"
  "\n"
  "LDFLAGS +=	-L./lib -lmy\n"
  "\n"
  "all: $(NAME)\n"
  "\n"
  "$(NAME): $(OBJS)\n"
  "	@$(CC) $(OBJS) -o $(NAME) $(LDFLAGS)\n"
  "\n"
  "libmy:\n"
  "	@$(MAKE) -C lib/my\n"
  "\n"
  "clean:\n"
  "	@$(RM) $(OBJS)\n"
  "\n"
  "fclean: clean\n"
  "	@$(RM) $(NAME)\n"
  "\n"
  "re: fclean all\n"
  "\n"
  ".PHONY: clean, re, all, fclean\n"
  )

;; CPP Makefile
(define-skeleton insert-cppmakefile
  "Insert a default makefile."
  ""
  "\n"
  "CXX		= 	g++\n\n"
  "RM		= 	rm -f\n\n"
  "NAME		= 	a.out\n\n"
  "SRCS		= 	src/main.cpp \\\n\n"
  "OBJS		= 	$(SRCS:.cpp=.o)\n\n"
  "CXXFLAGS	+=	-W -Wall -Werror -pedantic\n\n"
  "CXXFLAGS	+=	-I./include/\n\n"
  "all: $(NAME)\n\n"
  "$(NAME): $(OBJS)\n"
  "	@$(CXX) $(OBJS) -o $(NAME)\n\n"
  "clean:\n"
  "	@$(RM) $(OBJS)\n\n"
  "fclean: clean\n"
  "	@$(RM) $(NAME)\n\n"
  "re: fclean all\n\n"
  ".PHONY: clean, re, all, fclean\n"
  )

;;(add-to-list 'auto-mode-alist '("\\.h\\'" . load-fileH))
;;(add-to-list 'auto-mode-alist '("\\.c\\'" . load-fileC))
;;(add-to-list 'auto-mode-alist '("Makefile" . load-makefile))

(defun load-fileH ()
  "Load Header and add a main squeleton model"
  (interactive)
  (goto-char(point-min))
  (c-mode)
  (if  (< (buffer-size) 10)
      (progn
	(insert-protect-header)
	(std-file-header)
	(goto-char(point-max))
	(backward-char 8)
	))
  )

(defun load-fileC ()
  "Load Header and add a main squeleton model"
  (interactive)
  (goto-char(point-min))
  (c-mode)
  (if  (< (buffer-size) 10)
      (progn
	(newline)
	(std-file-header)
	(goto-char(point-max))
	))
  )

(defun load-makefile ()
  "Load Header and push a Makefile squeleton model"
  (interactive)
  (goto-char(point-min))
  (makefile-mode)
  (if  (< (buffer-size) 10)
      (progn
	;; (insert-cmakefile)
	(std-file-header)
	(goto-char(point-min))
	(forward-char 640)
	))
  )

;; protect header
(global-set-key "\C-cl" 'insert-protect-header)

(provide 'init-skeleton)
