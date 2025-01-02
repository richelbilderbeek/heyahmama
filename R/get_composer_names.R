#' Get the name of all composers
#' @return an vector of all composer names,
#'   ordered alphabetically
#' @examples
#' get_composer_names()
#' @author Richèl J.C. Bilderbeek
#' @export
get_composer_names <- function() {
  sort(unique(get_composers()$composer))
}
