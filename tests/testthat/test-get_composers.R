test_that("minimal use", {
  expect_silent(get_composers())
  expect_true(tibble::is_tibble(get_composers()))
  expect_true("song_title" %in% names(get_composers()))
  expect_true("composer" %in% names(get_composers()))
})

test_that("all song titles match get_songs()", {
  composer_song_titles <- unique(get_composers()$song_title)
  song_titles <- unique(get_songs()$song_title)
  expect_true(
    all(composer_song_titles %in% song_titles)
  )
})
