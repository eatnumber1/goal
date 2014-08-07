;; goal in elisp
 
;; emacs --script goal.el
 
(defmacro g (&rest al)
  `(concat "g"
           (apply 'concat
                  (mapcar (lambda (o)
                            (if (null o) "o"
                              (if (listp o) (car o)
                                "")))
                          ',al))))
 
;; test
(defmacro test-g (&rest s)
  `(mapc (lambda (s)
           (princ (format "%s\n" (eval s))))
         ',s)
  )
 
(test-g
 (g("al"))
 (g()("al"))
 (g()()("al"))
 (g()()()("al"))
 (g()()()()()()()("al"))
)
