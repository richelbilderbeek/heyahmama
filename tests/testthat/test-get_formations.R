test_that("use", {
  expect_silent(get_formations())
  expect_true(tibble::is_tibble(get_formations()))
  expect_true("formation" %in% names(get_formations()))
  expect_true("member_1" %in% names(get_formations()))
  expect_true("member_2" %in% names(get_formations()))
  expect_true("member_3" %in% names(get_formations()))
})
