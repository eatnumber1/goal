(defmacro g [& args]
  (str "g"
       (-> (count (filter empty? args))
           (repeat "o")
           (clojure.string/join))
           (first (last args))))

(println ( g()()()("al") ) " " ( g("al") ) " " ( g()()("al") ) )
;=> goooal gal gooal
