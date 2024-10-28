#' Grafico del promedio mensual de la temperatura de abrigo
#'
#' Esta funcion recibe un data frame con datos de una o mas estaciones y
#' devuelve un grafico con el promedio mensual de la temperatura de abrigo
#' a 150 cm.
#'
#' @param datos el data frame que contiene la informacion de todas las estaciones meteorologicas.
#' @param colores un vector de colores para utilizar en el grafico.
#' @param titulo un string con el titulo del grafico. Si no se define, el titulo por defecto sera "Temperatura".
#'
#' @return Un grafico con el promedio mensual de la temperatura.
#'
#' @examples
#' grafico_temperatura_mensual(NH_unidos)
#' @export
grafico_temperatura_mensual <- function(datos, colores = c("blue", "red", "green"), titulo = "Temperatura") {
  # Verificar columnas necesarias
  if (!"temperatura_abrigo_150cm" %in% colnames(datos)) {
    stop("El data frame no contiene la variable 'temperatura_abrigo_150cm'")
  }

  if (!"fecha" %in% colnames(datos)) {
    stop("El data frame no contiene la columna 'fecha'.")
  }

  if (!"id" %in% colnames(datos)) {
    stop("El data frame no contiene la columna 'id' para identificar la estacion.")
  }

  # Convertir la columna 'fecha' a tipo Date si no lo es
  if (!inherits(datos$fecha, "Date")) {
    datos$fecha <- as.Date(datos$fecha)
  }

  # Extraer el mes de la fecha
  datos$mes <- lubridate::month(datos$fecha)

  # Calcular la temperatura media mensual agrupada por id y mes
  promedio_mensual <- datos |>
    dplyr::group_by(id, mes) |>
    dplyr::summarise(temperatura_media = mean(temperatura_abrigo_150cm, na.rm = TRUE), .groups = 'drop')

  # Verificar si hay datos para graficar
  if (nrow(promedio_mensual) == 0) {
    stop("No hay datos disponibles para graficar.")
  }

  # Crear el grafico
  grafico <- ggplot2::ggplot(promedio_mensual, ggplot2::aes(x = factor(mes), y = temperatura_media, group = id, color = id)) +
    ggplot2::geom_line(linewidth = 1.2) +
    ggplot2::geom_point(size = 3) +
    ggplot2::labs(
      title = titulo,
      x = "Mes",
      y = "Temperatura Media (C)"
    ) +
    ggplot2::scale_x_discrete(labels = month.name) +  # Etiquetas de los meses
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, hjust = 1))

  return(grafico)
}
