#' Get the name of all writers
#' @return an vector of all writer names,
#'   ordered alphabetically
#' @examples
#' get_writer_names()
#' @author Richèl J.C. Bilderbeek
#' @export
get_writer_names <- function() {
  sort(unique(get_writers()$writer))
}
