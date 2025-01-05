test_that("use", {
  expect_silent(get_songs())
  expect_true(tibble::is_tibble(get_songs()))
  expect_true("cd_title" %in% names(get_songs()))
  expect_true("cd_number" %in% names(get_songs()))
  expect_true("track_number" %in% names(get_songs()))
  expect_true("song_title" %in% names(get_songs()))
  expect_true("duration" %in% names(get_songs()))
})

test_that("song titles have valid characters", {
  songs <- get_songs()
  song_titles <- songs$song_title
  malformed_titles <- stringr::str_subset(
    string = song_titles,
    pattern = "^[\\(A-Za-z0-9].*[A-Za-z0-9!é?\\)]$",
    negate = TRUE
  )
  testthat::expect_equal(0, length(malformed_titles))
})

test_that("all songs are on a CD", {
  songs_cd_titles <- unique(get_songs()$cd_title)
  cd_titles <- get_cds()$cd_title
  if (!all(songs_cd_titles %in% cd_titles)) {
    # Find out which songs_cd_titles are misformed
    mismatches <- !songs_cd_titles %in% cd_titles
    mismatched_titles <- songs_cd_titles[mismatches]
    warning(mismatched_titles)
  }

  expect_true(all(songs_cd_titles %in% cd_titles))
})
