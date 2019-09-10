
cat0 <- function(...) {
  cat(..., "\n", sep = "")
}

int_greater_zero <- function(x) {
  if (!(x > 0 && length(x) == 1 && is.numeric(x) && floor(x) == x)) {
    return(FALSE)
  }
  return(TRUE)
}
