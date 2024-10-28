#' Conversión de la temperatura en Centigrados a Fahrenheit
#'
#' La función `C_to_F()` toma un valor numérico de la temperatura en Centigrados y calcula la equivalencia en grados fahrenheit.
#'
#' Estos son detalles extras de la función.
#'
#' @param temp_centigrado un vector numérico de la temperatura en Centigrados
#'
#' @return
#' Un vector numérico de la temperatura en grados fahrenheit.
#'
#' @examples
#' C_to_F(23)
#'
#' @export
#'
C_to_F <- function(temp_centigrado) {

  if (!is.numeric(temp_centigrado)) {

    cli::cli_abort(c(
      "El argumento temp_centigrado debe ser numerico." ,
      "i" = "La variable ingresada es un {class(temp_centigrado)[1]}"
    ))
  }
  (temp_centigrado * 9/5) + 32
}


