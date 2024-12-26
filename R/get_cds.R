#' Get the K3 CDs
#' @return a tibble with the K3 CDs
#' @examples
#' get_cds()
#' @author Richèl J.C. Bilderbeek
#' @export
get_cds <- function() {
  readr::read_csv(get_heyahmama_path("cds.csv"), show_col_types = FALSE)
}
