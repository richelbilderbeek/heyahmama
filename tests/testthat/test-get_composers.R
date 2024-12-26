test_that("multiplication works", {
  expect_silent(get_composers())
  expect_true(tibble::is_tibble(get_composers()))
  expect_true("song_title" %in% names(get_composers()))
  expect_true("composer" %in% names(get_composers()))
})
