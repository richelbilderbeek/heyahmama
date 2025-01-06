test_that("use", {
  t <- get_writers_groups()
  expect_true("song_title_to_group_id" %in% names(t))
  expect_true("group_id_to_writer_name" %in% names(t))
  expect_true("song_title" %in% names(t$songs_to_group_id))
  expect_true("group_id" %in% names(t$songs_to_group_id))
  expect_true("writer_name" %in% names(t$group_id_to_writer_names))
  expect_true("group_id" %in% names(t$group_id_to_writer_names))
})
