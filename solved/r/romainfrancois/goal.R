g <- function(arg, depth = 0){ 
  if(missing(arg)) {
    formals(g)[[2]] <- depth + 1
    g
  } else { 
    paste( "g", paste( rep("o", depth), collapse = "" ), arg, sep = "" )
  }
}

print(g('al'))
print(g()('al'))
print(g()()('al'))

