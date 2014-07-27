(define-syntax g
  (syntax-rules ()
    ((_ as ...)
     (string-append "g" (g1 as ...)))))

(define-syntax g1
  (syntax-rules ()
    ((_ ()  as ...)
     (string-append "o" (g1 as ...)))
    ((_ (end))
     end)))

(display (g()("al"))) (newline)
