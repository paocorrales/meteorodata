#' Tabla de resumen para la/s estacion/es meteorologicas
#'
# Esta funcion recibe un dataframe que contiene informacion acerca de todas las
# 'estaciones meteorologicas y debemos especificarle sobre cual realizar la tabla
#'
#' @param data un dataframe que contiene la informacion de las estaciones meteorologicas
#' @param estaciones id correspondiente a la/s estacion/es que deseamos investigar
#'
#' @return una tabla con el resumen de ciertas variables
#'
#' @examples
#' # Supomemos que queremos obtener la tabla de resumen de NH0910 y NH0437:
#' tabla_resumen_temperatura(NH_unidos,c('NH0910','NH0437'))
#'
#'@export
tabla_resumen_temperatura <- function(data, estaciones) {

  estaciones_existentes <- unique(data$id)
  estaciones_no_existentes <- setdiff(estaciones, estaciones_existentes)

  if (length(estaciones_no_existentes) > 0) {
    cli::cli_abort(c("Las siguientes estaciones no existen:",
                     paste(estaciones_no_existentes, collapse = ", ")))
  }

  data |>
    filter(id %in% estaciones) |>
    group_by(id) |>
    summarise(
      observaciones_temperatura = sum(!is.na(temperatura_abrigo_150cm), na.rm = TRUE),
      proporcion_NA = sum(is.na(temperatura_abrigo_150cm)) / n(),
      temperatura_minima = min(temperatura_abrigo_150cm, na.rm = TRUE),
      temperatura_maxima = max(temperatura_abrigo_150cm, na.rm = TRUE),
      temperatura_promedio = mean(temperatura_abrigo_150cm, na.rm = TRUE),
      desviacion_estandar = sd(temperatura_abrigo_150cm, na.rm = TRUE),
    )
}

tabla_resumen_temperatura(NH_unidos,"NH0098")
