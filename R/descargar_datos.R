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
#' @param ruta ubicación del dataset en nuestro proyecto
#'
#' @return
#' Devuelve la informacion contenida en el dataset descargado
#'
#' @examples
#' data <- descargar_datos("NH0098", "data_raw/NH0098.csv")
#' @export
descargar_datos <- function(id_estacion, ruta) {

  estacion_url <- paste0("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/", id_estacion ,".csv")

  if (file.exists(ruta)) {
    datos_estacion <- read.csv(ruta)
    cli::cli_inform("Lectura del archivo de estacion '{id_estacion}'")
  } else {
    download.file(estacion_url, ruta)
    datos_estacion <- read.csv(ruta)
    cli::cli_inform("Descargando y leyendo el archivo de estacion '{id_estacion}'")
  }

  return(datos_estacion)
}
