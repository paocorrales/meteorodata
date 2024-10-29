#' Descarga de datos de distintas estaciones
#'
#' La funcion `descargar_datos()` toma 2 parametros y permite la lectura y/o
#'    descarga del dataset de la estacion que se solicite.
#'
#' Estaciones Disponibles:
#' - NH0437
#' - NH0098
#' - NH0046
#' - NH0910
#' - NH0472
#'
#'
#' @param id_estacion un string conformado por numeros y letras
#'
#' @return
#' Devuelve la informacion contenida en el dataset descargado
#'
#' @examples
#' data <- descargar_datos("NH0098")
#' @export
descargar_datos <- function(id_estacion) {
  estacion_url <- paste0("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/", id_estacion, ".csv")
  ruta <- paste0(tempdir(), "/", id_estacion, ".csv")

  if (file.exists(ruta)) {
    datos_estacion <- utils::read.csv(ruta)
    cli::cli_inform("Lectura del archivo de estación '{id_estacion}' desde el directorio temporal.")
  } else {
    response <- tryCatch({
      utils::download.file(estacion_url, ruta)
      datos_estacion <- utils::read.csv(ruta)
      cli::cli_inform("Descargando y leyendo el archivo de estación '{id_estacion}' en el directorio temporal.")
    }, error = function(e) {
      stop(paste("Error al descargar los datos:", e$message))
    })
  }

  return(datos_estacion)
}




