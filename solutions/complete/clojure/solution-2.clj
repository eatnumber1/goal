(defn re[& ins] 
  (map #(println (str "g" (apply str (repeat(-(count %) 2) "o")) "al") ) ins))

(re '(g()()()("al")) '(g("al")) '(g()()("al")))
