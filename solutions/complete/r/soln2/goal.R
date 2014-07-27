g <- function(x){
  if (!exists(".o")) .o <- 0
  if (missing(x)){
    .o <<- .o + 1
    return(g)
  } else {
    x = paste0("g", paste(rep("o", .o), collapse = ""), "al")
    rm(.o, inherits = TRUE)
    return(x)
  }
}

print(g()('al'))
print(g()()('al'))
print(g()()()('al'))
