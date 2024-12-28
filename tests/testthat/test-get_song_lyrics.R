test_that("minimal use", {
  expect_true(length(get_song_lyrics("Heyah mama")) > 0)
})

test_that("abuse", {
  expect_error(length(get_song_lyrics("absent song")))
})

test_that("compare to genius.com", {
  # songs <- geniusr::search_song(song_title)
  # geniusr::get_lyrics_url("https://genius.com/K3-heyah-mama-lyrics")
  # geniusr::get_lyrics_search(
  #   artist_name = "K3",
  #   song_title = song_title
  # )
})
