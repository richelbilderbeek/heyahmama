#' Get the name of all writers
#' @return an vector of all writer names,
#'   ordered alphabetically
#' @examples
#' get_writer_names()
#' @author Richèl J.C. Bilderbeek
#' @export
get_writer_names <- function() {
  writers <- get_writers()
  testthat::expect_true("writer_name" %in% names(writers))
  sort(unique(get_writers()$writer_name))
}
