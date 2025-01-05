test_that("minimal use", {
  expect_equal(
    get_song_filename("Heyah Mama"),
    "heyah_mama.txt"
  )
  expect_equal(
    get_song_filename("De wereld van K3"),
    "de_wereld_van_k3.txt"
  )
  expect_equal(
    get_song_filename("10.000 luchtballonnen"),
    "10000_luchtballonnen.txt"
  )
  expect_equal(
    get_song_filename("Oya lélé"),
    "oya_lele.txt"
  )
})

test_that("song filenames should be well-formed", {
  song_titles <- get_released_songs()$song_title
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
