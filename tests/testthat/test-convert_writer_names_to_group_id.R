test_that("use", {
  expect_equal(convert_writer_names_to_group_id(c()), 0)
  expect_equal(convert_writer_names_to_group_id(get_writer_names()), 2047)

  rev_names <- rev(get_writer_names())
  expect_equal(convert_writer_names_to_group_id(rev_names[1]), 1)
  expect_equal(convert_writer_names_to_group_id(rev_names[2]), 2)
  expect_equal(convert_writer_names_to_group_id(rev_names[3]), 4)
  expect_equal(convert_writer_names_to_group_id(rev_names[4]), 8)
  expect_equal(convert_writer_names_to_group_id(rev_names[5]), 16)
  expect_equal(convert_writer_names_to_group_id(rev_names[6]), 32)
  expect_equal(convert_writer_names_to_group_id(rev_names[7]), 64)
})

test_that("abuse", {
  expect_error(convert_writer_names_to_group_id(NA))
  expect_error(convert_writer_names_to_group_id(Inf))
  expect_error(convert_writer_names_to_group_id("nonsense"))
})
