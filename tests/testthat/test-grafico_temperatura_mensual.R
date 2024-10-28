test_that("El grafico es generado correctamente con datos validos", {
  datos_prueba <- data.frame(
    id = rep(1:2, each = 6),
    fecha = rep(seq.Date(as.Date("2023-01-01"), by = "month", length.out = 6), 2),
    temperatura_abrigo_150cm = runif(12, min = 0, max = 30)
  )

  grafico <- grafico_temperatura_mensual(datos_prueba)
  expect_s3_class(grafico, "ggplot")  # Verifica que el objeto sea de clase ggplot
})

test_that("Error al faltar la columna 'temperatura_abrigo_150cm'", {
  datos_prueba <- data.frame(
    id = rep(1:2, each = 6),
    fecha = rep(seq.Date(as.Date("2023-01-01"), by = "month", length.out = 6), 2)
  )

  expect_error(grafico_temperatura_mensual(datos_prueba),
               "El data frame no contiene la variable 'temperatura_abrigo_150cm'")
})
