test_that("minimal use", {
  expect_true(length(get_song_lyrics("Heyah mama")) > 0)
})

test_that("abuse", {
  expect_error(length(get_song_lyrics("absent song")))
})

test_that("lyrics of all songs have no weird tokens", {
  for (song_title in get_released_songs()$song_title) {
    lyrics <- c()

    tryCatch(
      lyrics <- get_song_lyrics(song_title),
      error = function(msg) {
        message(
          paste0("'", song_title, "' does not have lyrics yet")
        )
      }
    )
    expect_equal(
      0,
      sum(stringr::str_detect(lyrics, pattern = "\\["))
    )
    expect_equal(
      0,
      sum(stringr::str_detect(lyrics, pattern = "([Cc]horus)|CHORUS"))
    )
    expect_equal(
      0,
      sum(stringr::str_detect(lyrics, pattern = "([Vv]erse)|VERSE"))
    )
  }

})
