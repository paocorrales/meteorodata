ids_estaciones <- c("NH0437", "NH0098", "NH0046", "NH0910", "NH0472")

preparar_datos_estaciones <- function(ids_estaciones) {
  lista_datos <- list()

  for (id_estacion in ids_estaciones) {
    cli::cli_inform("Procesando datos para la estación: {id_estacion}")

    # Descargar y leer los datos utilizando la función del paquete
    datos_estacion <- descargar_datos(id_estacion)

    lista_datos[[id_estacion]] <- datos_estacion
  }

  # Unir todos los datasets en un solo dataframe:
  NH_unidos <- dplyr::bind_rows(lista_datos, .id = "id_estacion")

  return(NH_unidos)
}

# Ejecutar la función para preparar y combinar los datos de las estaciones
datos_meteorologicos <- preparar_datos_estaciones(ids_estaciones)

# Guardar los datos procesados en el paquete
usethis::use_data(datos_meteorologicos, overwrite = TRUE)
