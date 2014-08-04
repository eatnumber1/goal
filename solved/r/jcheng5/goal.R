makeClosure <- function(initValue) {
  function(value) {
    if (missing(value))
      makeClosure(paste0(initValue, "o"))
    else
      paste0(initValue, value)
  }
}
g <- makeClosure("g")

print(g('al'))
print(g()('al'))
print(g()()('al'))

