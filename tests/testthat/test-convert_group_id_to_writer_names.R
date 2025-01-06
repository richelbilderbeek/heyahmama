test_that("minimal use", {
  group_id <- 1
  expect_equal(
    convert_writer_names_to_group_id(
      convert_group_id_to_writer_names(
        group_id
      )
    ),
    group_id
  )
})
