#' Get the K3 formations
#' @return a tibble with the K3 formations
#' @examples
#' get_formations()
#' @author Richèl J.C. Bilderbeek
#' @export
get_formations <- function() {
  readr::read_csv(get_heyahmama_path("formations.csv"), show_col_types = FALSE)
}
