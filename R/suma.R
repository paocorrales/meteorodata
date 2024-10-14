suma <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    return("ERROR!, deben ser numéricos")
  }
  if (x < 0 | y < 0) {
    return("ERROR! Sumo únicamente números positivos")
  }
  return(x + y)
}
