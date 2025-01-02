test_that("minimal use", {
  composer_names <- get_composer_names()
  expect_true(length(composer_names) > 10)
  expect_equal(sort(composer_names), composer_names)
  expect_equal(unique(composer_names), composer_names)
})
