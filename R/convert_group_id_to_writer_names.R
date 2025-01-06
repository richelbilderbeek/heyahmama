#' Convert a group ID to their writers' names
#' @return a vector of writers
#' @examples
#' convert_group_id_to_writer_names(0) # empty
#' convert_group_id_to_writer_names(1) # "Tracy Atkins"
#' convert_group_id_to_writer_names(2) # "Ronald Buersens"
#' convert_group_id_to_writer_names(3) # c("Ronald Buersens", "Tracy Atkins")
#' @author Richèl J.C. Bilderbeek
#' @export
convert_group_id_to_writer_names <- function(group_id) {
  testthat::expect_equal(length(group_id), 1)
  testthat::expect_gte(group_id, 0)
  all_writer_names <- get_writer_names()
  n_writers <- length(all_writer_names)
  max_value <- 2 ^ n_writers
  testthat::expect_lt(group_id, max_value)

  bools <- c(
    rep(FALSE, n_writers - length(int_to_bools(group_id))),
    int_to_bools(group_id)
  )
  testthat::expect_equal(length(bools), n_writers)

  all_writer_names[bools]
}
