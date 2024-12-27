test_that("use", {
  expect_silent(get_heyahmama_path("formations.csv"))
  expect_error(get_heyahmama_path("absent_file"))
})
