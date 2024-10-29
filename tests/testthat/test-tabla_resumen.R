test_that("La función maneja correctamente estaciones inexistentes", {
  expect_error(
    tabla_resumen_temperatura(NH_unidos,c("NH0910", "NH05437")))})

test_that("La función devuelve un data frame cuando todas las estaciones existen", {
  resultado <- tabla_resumen_temperatura(NH_unidos, c("NH0910", "NH0437"))
  expect_s3_class(resultado, "data.frame")
  expect_named(resultado, c("id", "observaciones_temperatura", "proporcion_NA",
                            "temperatura_minima", "temperatura_maxima",
                            "temperatura_promedio", "desviacion_estandar"))
})

test_that("Filtrado de estaciones según el parámetro 'estaciones'", {
  resultado <- tabla_resumen_temperatura(NH_unidos, c("NH0910", "NH0437"))
  estaciones_resultado <- unique(resultado$id)
  expect_true(all(estaciones_resultado %in% c("NH0910", "NH0437")))
  expect_equal(length(estaciones_resultado), 2)
})

