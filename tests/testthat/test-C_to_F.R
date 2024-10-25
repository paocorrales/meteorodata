test_that("El cambio ha sido logrado", {
  expect_equal(C_to_F(23), 73.4)
})

test_that("No se puede convertir caracteres", {
  expect_error(C_to_F('23'), "El argumento temp_centigrado debe ser numerico.")
})



