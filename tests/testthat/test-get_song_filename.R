test_that("minimal use", {
  testthat::expect_equal(
    get_song_filename("Heyah Mama"),
    "heyah_mama.txt"
  )
})

test_that("song filenames should be well-formed", {
  song_titles <- get_songs()$song_title
  get_song_filename(song_titles[2])

  song_filenames <- as.character(
    Vectorize(get_song_filename)(song_titles)
  )
  expect_equal(
    0,
    length(
      stringr::str_subset(
        string = song_filenames,
        pattern = "^[a-z1-9].*\\.txt",
        negate = TRUE
      )
    )
  )

})
