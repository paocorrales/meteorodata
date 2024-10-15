lectura_estacion <- function(id_estacion, ruta) {

  estacion_url <- paste0("https://raw.githubusercontent.com/rse-r/intro-programacion/main/datos/", id_estacion ,".csv")

  if (file.exists(ruta)) {
    datos_estacion <- read.csv(ruta)
    cli::cli_inform("Lectura del archivo de estación '{id_estacion}'")
  } else {
    download.file(estacion_url, ruta)
    datos_estacion <- read.csv(ruta)
    cli::cli_inform("Descargando y leyendo el archivo de estación '{id_estacion}'")
  }

  return(datos_estacion)
}
