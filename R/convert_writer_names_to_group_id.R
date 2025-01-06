#' Convert writers names to a group ID
#' @return a group ID
#' @examples
#' convert_writer_names_to_group_id("Alain Vande Putte")
#' @author Richèl J.C. Bilderbeek
#' @export
convert_writer_names_to_group_id <- function(writer_names) {
  all_writer_names <- get_writer_names()
  testthat::expect_true(all(writer_names %in% all_writer_names))
  testthat::expect_equal(unique(writer_names), writer_names)
  bools_to_int(all_writer_names %in% writer_names)
}
