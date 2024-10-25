test_that("La función maneja correctamente estaciones inexistentes", {
  expect_error(
    tabla_resumen_temperatura(NH_unidos,c("NH0910", "NH05437")))})
