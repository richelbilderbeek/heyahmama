test_that("use", {
  expect_silent(get_cds())
  expect_true(tibble::is_tibble(get_cds()))
  expect_true("cd_title" %in% names(get_cds()))
  expect_true("formation" %in% names(get_cds()))
  expect_true("year" %in% names(get_cds()))
})
