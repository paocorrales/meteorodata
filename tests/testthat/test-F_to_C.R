test_that("El cambio ha sido logrado", {
  expect_equal(F_to_C(90), 32.222222)
})

test_that("No se puede convertir caracteres", {
  expect_error(F_to_C('90'),"El argumento temp_fahrenheit debe ser numérico.")
})
