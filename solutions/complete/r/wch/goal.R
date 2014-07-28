g <- function(x = return(g), p = 'g') {
  formals(g)$p <- paste0(p, 'o')
  paste0(p, x)
}

# Every time `g` is called, it makes a copy of `g` (since most R objects are
# copy-on-write) and sets the copy's default value for the `p` argument to the
# current `p` with another 'o' tacked on the end.
#
# If x is not passed into the function, its value is an unevaluated promise
# consisting of the expression `return(g)`. When the interpreter hits the
# `paste0(p, x)` line, it forces the evaluation of x, which immediately returns
# the modified copy of `g` (so the `paste0(p, x)` never completes).


g()
g()('al')
g()()('al')
g()()()('al')

# For the really good gools:
g()()()()()()()()()()()()()()()()()()()()()()()()()() -> `...`
`...`()()()()()()()()()()()()()()()()()()()()()()()()('al')

# Bonus: this solution doesn't increase the call stack depth, so you can use
# very large values of n:
n <- 4000
g() -> `...`
for (i in 1:n) `...`() -> `...`
`...`('al')
