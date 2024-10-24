#' Gráfico del promedio mensual de la temperatura de abrigo
#'
#' Esta función recibe un data frame con datos de una o más estaciones y
#' devuelve un gráfico con el promedio mensual de la temperatura de abrigo
#' a 150 cm.
#'
#' @param datos un data frame con los datos de las estaciones.
#' @param colores un vector de colores para utilizar en el gráfico.
#' @param titulo un string con el título del gráfico. Si no se define, el título por defecto será "Temperatura".
#'
#' @return Un gráfico con el promedio mensual de la temperatura.
#'
#' @examples
#' # Suponiendo que 'data' es un data frame con las estaciones NH0098 y NH0437:
#' grafico_temperatura_mensual(data, colores = c("blue", "red"), titulo = "Promedio Mensual de Temperatura")
#' @export
grafico_temperatura_mensual <- function(datos, colores = c("blue", "red", "green"), titulo = "Temperatura") {

  library(dplyr)
  library(ggplot2)
  # Verificar que la variable 'temperatura_abrigo_150cm' esté en el dataset
  if (!"temperatura_abrigo_150cm" %in% colnames(datos)) {
    stop("El data frame no contiene la variable 'temperatura_abrigo_150cm'")
  }

  # Verificar que la columna 'fecha' exista para poder agrupar por mes
  if (!"fecha" %in% colnames(datos)) {
    stop("El data frame no contiene la columna 'fecha'.")
  }

  # Verificar que la columna 'id' exista para identificar la estación
  if (!"id" %in% colnames(datos)) {
    stop("El data frame no contiene la columna 'id' para identificar la estación.")
  }

  # Asegurarse de que la columna 'fecha' sea de tipo Date
  if (!inherits(datos$fecha, "Date")) {
    datos$fecha <- as.Date(datos$fecha)
  }

  # Extraer el año y el mes de la columna 'fecha'
  datos$mes <- format(datos$fecha, "%Y-%m")  # Formato Año-Mes

  # Calcular el promedio mensual de la temperatura
  promedio_mensual <- datos |>
    group_by(mes) |>
    summarise(promedio_temp = mean(temperatura_abrigo_150cm, na.rm = TRUE)) |>
    ungroup()

  # Crear el subtítulo con el nombre de la estación o estaciones
  estaciones_unicas <- unique(datos$id)
  subtitulo <- paste("Datos de la(s) estación(es):", paste(estaciones_unicas, collapse = ", "))

  # Generar el gráfico
  grafico <- ggplot(promedio_mensual, aes(x = mes, y = promedio_temp)) +
    geom_line(color = colores[1], size = 1.2) +  # Color de la línea principal
    geom_point(color = colores[2], size = 3) +   # Color de los puntos
    labs(
      title = titulo,
      subtitle = subtitulo,  # Agregar el subtítulo
      x = "Mes",
      y = "Promedio Temperatura (°C)"
    ) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotar los textos del eje x para mejor legibilidad

  return(grafico)
}
