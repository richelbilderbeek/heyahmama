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

test_that("check duration from Ushuaia CD 1", {
  songs <- dplyr::filter(get_songs(), cd_title == "Ushuaia", cd_number == 1)

  expect_equal(songs[songs$track_number == 1, ]$duration, readr::parse_time("3:40"))
  expect_equal(songs[songs$track_number == 2, ]$duration, readr::parse_time("3:01"))
  expect_equal(songs[songs$track_number == 3, ]$duration, readr::parse_time("3:17"))
  expect_equal(songs[songs$track_number == 4, ]$duration, readr::parse_time("3:20"))
  expect_equal(songs[songs$track_number == 5, ]$duration, readr::parse_time("3:20"))
  expect_equal(songs[songs$track_number == 6, ]$duration, readr::parse_time("3:16"))
  expect_equal(songs[songs$track_number == 7, ]$duration, readr::parse_time("2:54"))
  expect_equal(songs[songs$track_number == 8, ]$duration, readr::parse_time("3:09"))
  expect_equal(songs[songs$track_number == 9, ]$duration, readr::parse_time("3:18"))
  expect_equal(songs[songs$track_number == 10, ]$duration, readr::parse_time("3:44"))
  expect_equal(songs[songs$track_number == 11, ]$duration, readr::parse_time("3:23"))
  expect_equal(songs[songs$track_number == 12, ]$duration, readr::parse_time("3:19"))
})

test_that("check duration from Ushuaia CD 2", {
  songs <- dplyr::filter(get_songs(), cd_title == "Ushuaia", cd_number == 2)

  expect_equal(songs[songs$track_number == 1, ]$duration, readr::parse_time("3:35"))
  expect_equal(songs[songs$track_number == 2, ]$duration, readr::parse_time("2:46"))
  expect_equal(songs[songs$track_number == 3, ]$duration, readr::parse_time("3:41"))
  expect_equal(songs[songs$track_number == 4, ]$duration, readr::parse_time("3:30"))
  expect_equal(songs[songs$track_number == 5, ]$duration, readr::parse_time("3:14"))
  expect_equal(songs[songs$track_number == 6, ]$duration, readr::parse_time("3:29"))
  expect_equal(songs[songs$track_number == 7, ]$duration, readr::parse_time("3:23"))
  expect_equal(songs[songs$track_number == 8, ]$duration, readr::parse_time("3:00"))
  expect_equal(songs[songs$track_number == 9, ]$duration, readr::parse_time("3:21"))
  expect_equal(songs[songs$track_number == 10, ]$duration, readr::parse_time("2:32"))
  expect_equal(songs[songs$track_number == 11, ]$duration, readr::parse_time("3:48"))
  expect_equal(songs[songs$track_number == 12, ]$duration, readr::parse_time("3:07"))
})
