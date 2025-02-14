test_that("minimal use", {
  expect_silent(get_writers())
  expect_true(tibble::is_tibble(get_writers()))
  expect_true("song_title" %in% names(get_writers()))
  expect_true("writer_name" %in% names(get_writers()))
})

test_that("all song titles match get_released_songs()", {
  writer_song_titles <- unique(get_writers()$song_title)
  song_titles <- unique(get_released_songs()$song_title)
  expect_true(
    all(writer_song_titles %in% song_titles)
  )
})
