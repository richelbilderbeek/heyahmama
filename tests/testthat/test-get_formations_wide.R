test_that("use", {
  expect_silent(get_formations_wide())
  expect_true(tibble::is_tibble(get_formations_wide()))
  expect_true("formation" %in% names(get_formations_wide()))
  expect_true("member_1" %in% names(get_formations_wide()))
  expect_true("member_2" %in% names(get_formations_wide()))
  expect_true("member_3" %in% names(get_formations_wide()))
})
