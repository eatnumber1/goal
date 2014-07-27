(defn goal-reader [goal]
 (clojure.string/join
  (for [part goal]
    (cond
     (symbol? part) (name part)
     (empty? part) "o"
     :else (first part)))))


;any number of parens
(goal-reader '(

  g()()()()()()("al")

))

;no parens
(goal-reader '(

  g("al")

))

(goal-reader '(

  g()("al")

))