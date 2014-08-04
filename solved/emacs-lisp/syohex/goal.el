;; % emacs --script goal.el
(defun g (&rest args)
  (concat "g" (g1 args)))

(defun g1 (args)
  (if (null (cdr args))
      (car args)
    (concat "o" (g1 (cdr args)))))

(princ (g()"al")) ;; goal
(princ "\n")

(princ (g"al")) ;; gal
(princ "\n")

(princ (g()()()()()()()()()()"al")) ;; gooooooooooal
(princ "\n")
