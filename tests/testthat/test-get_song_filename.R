test_that("use", {
  testthat::expect_equal(
    get_song_filename("Heyah Mama"),
    "heyah_mama.txt"
  )
})
