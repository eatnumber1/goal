g <- function(x, o = 0){
  if (missing(x)) 
    function(x){g(x, o + 1)}
  else
    paste(c('g', rep('o', o), 'al'), collapse = '')
}

print(g()('al'))
print(g()()('al'))
