#' R One Liner
g <- function(x, p = 'g'){if (missing(x)) function(x) g(x, paste0(p, 'o')) else paste0(p, x)}


print(g()('al'))
print(g()()('al'))
