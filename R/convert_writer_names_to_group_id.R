#' Convert writers names to a group ID
#' @param writer_names the names of the writers
#' @return a group ID
#' @examples
#' convert_writer_names_to_group_id("Alain Vande Putte") # 1024
#' convert_writer_names_to_group_id("Tracy Atkins") # 1
#' convert_writer_names_to_group_id(c("Alain Vande Putte", "Tracy Atkins")) # 1025
#' @author Richèl J.C. Bilderbeek
#' @export
convert_writer_names_to_group_id <- function(writer_names) {
  all_writer_names <- get_writer_names()
  testthat::expect_true(all(writer_names %in% all_writer_names))
  testthat::expect_equal(unique(writer_names), writer_names)
  bools_to_int(all_writer_names %in% writer_names)
}
