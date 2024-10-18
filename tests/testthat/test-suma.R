test_that("la suma funciona", {
  expect_equal(object = suma(2,2), expected = 4)
})

test_that("no suma caracteres", {
  expect_error(object = suma(1,'1'),"ERROR!, deben ser numéricos")
})

