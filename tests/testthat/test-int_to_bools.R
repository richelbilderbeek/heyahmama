test_that("use", {
  expect_equal(int_to_bools(0), c(FALSE))
  expect_equal(int_to_bools(1), c(TRUE))
  expect_equal(int_to_bools(2), c(TRUE, FALSE))
  expect_equal(int_to_bools(3), c(TRUE, TRUE))
  expect_equal(int_to_bools(4), c(TRUE, FALSE, FALSE))
})
