#' Suma de dos numeros positivos
#'
#' La función `suma()` dos valores numéricos positivos y calcula la suma entre ambos números.
#'
#' Estos son detalles extras de la función.
#'
#' @param x un vector numérico positivo
#' @param y un vector numérico positivo
#'
#' @return
#' Un vector numérico con la suma de `x` e `y`.
#'
#' @examples
#' suma(10,10)
#' suma(5,14)
#'
#' @export
suma <- function(x, y) {
  if (!is.numeric(x) | !is.numeric(y)) {
    return("ERROR!, deben ser numéricos")
  }
  if (x < 0 | y < 0) {
    return("ERROR! Sumo únicamente números positivos")
  }
  return(x + y)
}
