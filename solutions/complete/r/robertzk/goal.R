# Here's a fun solution that does not use closures
g <- function(x) {
  if (missing(x)) g
  else {
    base <- function(z) if (is.call(z)) Recall(z[[1]]) else deparse(z)
    depth <- function(z) if (is.call(z)) 1 + Recall(z[[1]]) else 0
    os <- depth(Find(function(y) base(y) == 'g', sys.calls())) - 1
    paste0(c('g', rep('o', os), x), collapse = '')
  }
}

print(g('al'))
print(g()('al'))
print(g()()('al'))
