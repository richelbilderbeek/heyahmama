test_that("use", {
  expect_silent(get_songs())
  expect_true(tibble::is_tibble(get_songs()))
  expect_true("cd_title" %in% names(get_songs()))
  expect_true("track_number" %in% names(get_songs()))
  expect_true("song_title" %in% names(get_songs()))
  expect_true("duration" %in% names(get_songs()))
})

test_that("data is clean", {
  songs <- get_songs()
  song_titles <- songs$song_title
  malformed_titles <- stringr::str_subset(
    string = song_titles,
    pattern = "^[\\(A-Za-z0-9].*[A-Za-z0-9!é?\\)]$",
    negate = TRUE
  )
  testthat::expect_equal(0, length(malformed_titles))
})
