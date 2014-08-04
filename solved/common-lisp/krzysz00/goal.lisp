(defun g-reader (stream char)
  (declare (ignore char))
  (let ((string "g"))
    (loop named read
       for expr = (read stream t nil t)
       while (listp expr)
       do
         (cond
           ((null expr) (setf string (concatenate 'string string "o")))
           ((string= (car expr) "al")
            (setf string (concatenate 'string string (car expr)))
            (return-from read))
           (t (error "Invalid soccer chant"))))
    string))

(defun enable-g-reader ()
  (set-macro-character #\g #'g-reader))

(enable-g-reader)
(print (list g("al") g()("al") g()()("al")))
