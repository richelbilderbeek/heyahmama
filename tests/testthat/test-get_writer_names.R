test_that("minimal use", {
  writer_names <- get_writer_names()
  expect_true(length(writer_names) > 10)
  expect_equal(sort(writer_names), writer_names)
  expect_equal(unique(writer_names), writer_names)
})
