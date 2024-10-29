library(withr)
library(mockery)

test_that("La función descarga datos correctamente para una estación válida", {
  id_estacion <- "NH0098"
  datos <- descargar_datos(id_estacion)
  expect_false(is.null(datos))
  expect_true(nrow(datos) > 0)
})


test_that("descargar_datos works when downloading a file", {
  id_estacion <- "NH0472"

  # Borrar el archivo si existe para forzar la descarga
  ruta <- paste0(tempdir(), "/", id_estacion, ".csv")
  if (file.exists(ruta)) file.remove(ruta)

  # Capturar los mensajes de cli durante la descarga
  expect_message(
    datos <- descargar_datos(id_estacion),
    "Descargando y leyendo el archivo de estación 'NH0472' en el directorio temporal."
  )

  expect_true(file.exists(ruta))
})
