test_that("use", {
  expect_silent(get_songs())
  expect_true(tibble::is_tibble(get_songs()))
  expect_true("cd_title" %in% names(get_songs()))
  expect_true("track_number" %in% names(get_songs()))
  expect_true("song_title" %in% names(get_songs()))
})
