test_that("functions handles NAs", {
  expect_true(is.na(n_int_a(without = NA, with_nbs = NA)))
})

test_that("functions handles NAs", {
  expect_equal(n_int_a(without = 0, with_nbs = 0),  NaN)
})


test_that("give 0", {
  expect_equal(n_int_a(without = c(3), with_nbs = c(3)), 0)
})
