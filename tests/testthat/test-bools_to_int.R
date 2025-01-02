test_that("use", {
  expect_equal(0, bools_to_int(bools = FALSE))
  expect_equal(0, bools_to_int(bools = rep(FALSE, 10)))
  expect_equal(1, bools_to_int(bools = TRUE))
  expect_equal(2, bools_to_int(bools = c(TRUE, FALSE)))
  expect_equal(3, bools_to_int(bools = rep(TRUE, 2)))
  expect_equal(4, bools_to_int(bools = c(TRUE, FALSE, FALSE)))
})

test_that("abuse", {
  expect_error(bools_to_int(bools = c()))
  expect_error(bools_to_int(bools = NA))
  expect_error(bools_to_int(bools = NULL))
  expect_error(bools_to_int(bools = Inf))
  expect_error(bools_to_int(bools = c(NULL, NULL)))
  expect_error(bools_to_int(bools = c("nonsense")))
})
